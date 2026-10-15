#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/.."

# wait for Docker daemon
until docker info >/dev/null 2>&1; do sleep 1; done

# fix: iptables-legacy blocks docker compose network
sudo iptables-legacy -P FORWARD ACCEPT 2>/dev/null || true

docker compose down
docker compose up -d
