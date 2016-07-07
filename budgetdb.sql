--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: account_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE account_type AS ENUM (
    'checking',
    'savings'
);


ALTER TYPE account_type OWNER TO postgres;

--
-- Name: pay_schedule; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE pay_schedule AS ENUM (
    'biannually',
    'annually',
    'monthly',
    'bimonthly',
    'biweekly',
    'weekly',
    'daily',
    'hourly'
);


ALTER TYPE pay_schedule OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE accounts (
    account_id integer NOT NULL,
    nickname character varying(250),
    account_type account_type,
    balance numeric(15,2),
    created_date timestamp without time zone DEFAULT now()
);


ALTER TABLE accounts OWNER TO postgres;

--
-- Name: accounts_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE accounts_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accounts_account_id_seq OWNER TO postgres;

--
-- Name: accounts_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE accounts_account_id_seq OWNED BY accounts.account_id;


--
-- Name: bills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bills (
    bill_id integer NOT NULL,
    nickname character varying(250),
    recurrences integer,
    pay_schedule pay_schedule,
    amount_per_statement numeric(15,2),
    recurring_date timestamp without time zone,
    created_date timestamp without time zone DEFAULT now()
);


ALTER TABLE bills OWNER TO postgres;

--
-- Name: bills_bill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bills_bill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bills_bill_id_seq OWNER TO postgres;

--
-- Name: bills_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bills_bill_id_seq OWNED BY bills.bill_id;


--
-- Name: incomes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE incomes (
    income_id integer NOT NULL,
    nickname character varying(250),
    recurrences integer,
    pay_schedule pay_schedule,
    amount_per_paycheck numeric(15,2),
    recurring_date timestamp without time zone,
    created_date timestamp without time zone DEFAULT now()
);


ALTER TABLE incomes OWNER TO postgres;

--
-- Name: incomes_income_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE incomes_income_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE incomes_income_id_seq OWNER TO postgres;

--
-- Name: incomes_income_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE incomes_income_id_seq OWNED BY incomes.income_id;


--
-- Name: account_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts ALTER COLUMN account_id SET DEFAULT nextval('accounts_account_id_seq'::regclass);


--
-- Name: bill_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bills ALTER COLUMN bill_id SET DEFAULT nextval('bills_bill_id_seq'::regclass);


--
-- Name: income_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incomes ALTER COLUMN income_id SET DEFAULT nextval('incomes_income_id_seq'::regclass);


--
-- Name: accounts_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('accounts_account_id_seq', 2, true);


--
-- Name: bills_bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bills_bill_id_seq', 1, false);


--
-- Name: incomes_income_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('incomes_income_id_seq', 2, true);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (account_id);


--
-- Name: bills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (bill_id);


--
-- Name: incomes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY incomes
    ADD CONSTRAINT incomes_pkey PRIMARY KEY (income_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

