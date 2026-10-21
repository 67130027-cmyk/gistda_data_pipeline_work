import json
import requests
from airflow import DAG
from airflow.models import Variable
from airflow.operators.empty import EmptyOperator
from airflow.operators.python import PythonOperator
from airflow.providers.postgres.hooks.postgres import PostgresHook
from airflow.utils import timezone


def _get_weather_data():
    API_KEY = Variable.get("weather_api_key")

    payload = {
        "q": "bangkok",
        "appid": API_KEY,
        "units": "metric",
    }
    url = "https://api.openweathermap.org/data/2.5/weather"
    response = requests.get(url, params=payload)
    response.raise_for_status()
    print(response.url)

    data = response.json()
    print(data)

    with open("/opt/airflow/dags/data.json", "w") as f:
        json.dump(data, f)


def _create_weather_table():
    pg_hook = PostgresHook(postgres_conn_id="weather_postgres_conn")
    sql = """
        CREATE TABLE IF NOT EXISTS weathers (
            dt BIGINT NOT NULL,
            temp FLOAT NOT NULL
        )
    """
    pg_hook.run(sql)

def _load_data_to_postgres():
    pg_hook = PostgresHook(
        postgres_conn_id="weather_postgres_conn",
        schema="postgres"
    )
    connection = pg_hook.get_conn()
    cursor = connection.cursor()

    with open(f"/opt/airflow/dags/data.json", "r") as f:
        data = json.load(f)

    temp = data["main"]["temp"]
    dt = data["dt"]
    sql = f"""
        INSERT INTO weathers (dt, temp) VALUES ({dt}, {temp})
    """
    cursor.execute(sql)
    connection.commit()


with DAG(
    "weather_api_dag",
    schedule="0 */3 * * *",
    start_date=timezone.datetime(2026, 10, 7),
    catchup=False,
    tags=["Gistda"],
):
    start = EmptyOperator(task_id="start")

    get_weather_data = PythonOperator(
        task_id="get_weather_data",
        python_callable=_get_weather_data,
    )
    create_weather_table = PythonOperator(
        task_id="create_weather_table",
        python_callable=_create_weather_table,
    )

    load_data_to_postgres = PythonOperator(
        task_id="load_data_to_postgres",
        python_callable=_load_data_to_postgres,
    )
    end = EmptyOperator(task_id="end")

    start >> get_weather_data >> create_weather_table >> load_data_to_postgres >> end