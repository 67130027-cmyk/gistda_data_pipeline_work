--
-- PostgreSQL database cluster dump
--

\restrict xfF2Ss3waCdLr6nTVo8uneqGE05bzkLiI8Bj8GuNtys2fXRBfata68r6qXaB57o

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:tDW4SEhyJKBixoIkWOEgDg==$oRpOfCdH2s5lvYQy55Sl98DB7tgOnB50+a06QN31icU=:Yx2y9z0XM54Po4mv1XBXvIFVBGC8hwCvM10B5fx09EE=';

--
-- User Configurations
--








\unrestrict xfF2Ss3waCdLr6nTVo8uneqGE05bzkLiI8Bj8GuNtys2fXRBfata68r6qXaB57o

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict pDz7imO0V2SEilNJBs6Pfa26hscOhxduhQoSkEn7IYgSdyFg4VyxorXNe6BLfGA

-- Dumped from database version 16.15 (Debian 16.15-1.pgdg13+2)
-- Dumped by pg_dump version 16.15 (Debian 16.15-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict pDz7imO0V2SEilNJBs6Pfa26hscOhxduhQoSkEn7IYgSdyFg4VyxorXNe6BLfGA

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict lMEZ4czz1qFVeMgXMTVKvgkgo3VFu8ykwh4951jrJCrvLlQwj3Swyj5CV036Hna

-- Dumped from database version 16.15 (Debian 16.15-1.pgdg13+2)
-- Dumped by pg_dump version 16.15 (Debian 16.15-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict lMEZ4czz1qFVeMgXMTVKvgkgo3VFu8ykwh4951jrJCrvLlQwj3Swyj5CV036Hna

--
-- PostgreSQL database cluster dump complete
--

