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

SET default_tablespace = '';

SET default_table_access_method = heap;

-- Creation of product table
CREATE TABLE IF NOT EXISTS public.kafka (
  number_id bigint NOT NULL,
  name_id varchar(250) NOT NULL,
  description varchar(250) NOT NULL,
  rating double precision DEFAULT 0.0 NOT NULL,
  brand varchar(250) NOT NULL
  );

-- Creation of sequence for number_id

CREATE SEQUENCE public.number_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Asign sequence to number_id column to update automatically as primary key

ALTER SEQUENCE public.number_id_seq OWNED BY public.kafka.number_id;

ALTER TABLE ONLY public.kafka ALTER COLUMN number_id SET DEFAULT nextval('public.number_id_seq'::regclass);

ALTER TABLE ONLY public.kafka
    ADD CONSTRAINT numberid_pkey PRIMARY KEY (number_id);