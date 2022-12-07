--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)

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

--
-- Name: agents; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.agents (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    patronymic character varying(255),
    enclosure character varying(255) NOT NULL,
    address character varying(500) NOT NULL,
    is_default boolean NOT NULL,
    group_id integer NOT NULL,
    passport_series integer,
    passport_number integer,
    user_id integer
);


ALTER TABLE public.agents OWNER TO jamil;

--
-- Name: agents_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.agents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agents_id_seq OWNER TO jamil;

--
-- Name: agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.agents_id_seq OWNED BY public.agents.id;


--
-- Name: bailiffs; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.bailiffs (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(500) NOT NULL
);


ALTER TABLE public.bailiffs OWNER TO jamil;

--
-- Name: bailiffs_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.bailiffs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bailiffs_id_seq OWNER TO jamil;

--
-- Name: bailiffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.bailiffs_id_seq OWNED BY public.bailiffs.id;


--
-- Name: bank_requisites; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.bank_requisites (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    bik numeric(10,0) NOT NULL
);


ALTER TABLE public.bank_requisites OWNER TO jamil;

--
-- Name: bank_requisites_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.bank_requisites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_requisites_id_seq OWNER TO jamil;

--
-- Name: bank_requisites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.bank_requisites_id_seq OWNED BY public.bank_requisites.id;


--
-- Name: cessions; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.cessions (
    id integer NOT NULL,
    sum numeric(20,2),
    number character varying(255),
    text text,
    assignee_id integer NOT NULL,
    assignor_id integer NOT NULL,
    cession_group_id integer NOT NULL,
    group_id integer NOT NULL,
    transfer_date date NOT NULL
);


ALTER TABLE public.cessions OWNER TO jamil;

--
-- Name: cessionsInfo_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public."cessionsInfo_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."cessionsInfo_id_seq" OWNER TO jamil;

--
-- Name: cessionsInfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public."cessionsInfo_id_seq" OWNED BY public.cessions.id;


--
-- Name: cessions_groups; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.cessions_groups (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    cessions_amount integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.cessions_groups OWNER TO jamil;

--
-- Name: cessions_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.cessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cessions_id_seq OWNER TO jamil;

--
-- Name: cessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.cessions_id_seq OWNED BY public.cessions_groups.id;


--
-- Name: contract_types; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.contract_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.contract_types OWNER TO jamil;

--
-- Name: contract_types_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.contract_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contract_types_id_seq OWNER TO jamil;

--
-- Name: contract_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.contract_types_id_seq OWNED BY public.contract_types.id;


--
-- Name: contracts; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.contracts (
    id integer NOT NULL,
    number character varying(255),
    sum_issue numeric(10,2) NOT NULL,
    date_issue date NOT NULL,
    due_date date,
    percent numeric(5,2) NOT NULL,
    penalty numeric(5,2) NOT NULL,
    status_changed date,
    contract_status_id integer NOT NULL,
    group_id integer NOT NULL,
    debtor_id integer NOT NULL,
    cession_group_id integer,
    creditor_id integer NOT NULL,
    type_id integer NOT NULL
);


ALTER TABLE public.contracts OWNER TO jamil;

--
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.contracts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contracts_id_seq OWNER TO jamil;

--
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.contracts_id_seq OWNED BY public.contracts.id;


--
-- Name: contracts_statuses; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.contracts_statuses (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.contracts_statuses OWNER TO jamil;

--
-- Name: contracts_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.contracts_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contracts_statuses_id_seq OWNER TO jamil;

--
-- Name: contracts_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.contracts_statuses_id_seq OWNED BY public.contracts_statuses.id;


--
-- Name: court_claims; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.court_claims (
    id integer NOT NULL,
    sum numeric(10,2) NOT NULL,
    main numeric(10,2) NOT NULL,
    percents numeric(10,2) NOT NULL,
    penalties numeric(10,2) NOT NULL,
    fee numeric(10,2) NOT NULL,
    sending_date date NOT NULL,
    status_date date NOT NULL,
    status_id integer NOT NULL,
    type_id integer NOT NULL,
    court_id integer NOT NULL,
    contract_id integer NOT NULL,
    agent_id integer NOT NULL
);


ALTER TABLE public.court_claims OWNER TO jamil;

--
-- Name: court_claims_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.court_claims_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.court_claims_id_seq OWNER TO jamil;

--
-- Name: court_claims_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.court_claims_id_seq OWNED BY public.court_claims.id;


--
-- Name: court_claims_statuses; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.court_claims_statuses (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.court_claims_statuses OWNER TO jamil;

--
-- Name: court_claims_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.court_claims_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.court_claims_statuses_id_seq OWNER TO jamil;

--
-- Name: court_claims_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.court_claims_statuses_id_seq OWNED BY public.court_claims_statuses.id;


--
-- Name: court_claims_types; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.court_claims_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.court_claims_types OWNER TO jamil;

--
-- Name: court_claims_types_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.court_claims_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.court_claims_types_id_seq OWNER TO jamil;

--
-- Name: court_claims_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.court_claims_types_id_seq OWNED BY public.court_claims_types.id;


--
-- Name: court_levels; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.court_levels (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.court_levels OWNER TO jamil;

--
-- Name: court_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.court_levels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.court_levels_id_seq OWNER TO jamil;

--
-- Name: court_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.court_levels_id_seq OWNED BY public.court_levels.id;


--
-- Name: courts; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.courts (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(500) NOT NULL,
    court_level_id integer NOT NULL
);


ALTER TABLE public.courts OWNER TO jamil;

--
-- Name: courts_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.courts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courts_id_seq OWNER TO jamil;

--
-- Name: courts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.courts_id_seq OWNED BY public.courts.id;


--
-- Name: creditor_types; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.creditor_types (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.creditor_types OWNER TO jamil;

--
-- Name: creditor_types_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.creditor_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creditor_types_id_seq OWNER TO jamil;

--
-- Name: creditor_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.creditor_types_id_seq OWNED BY public.creditor_types.id;


--
-- Name: creditors; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.creditors (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    court_identifier character varying(11) NOT NULL,
    address character varying(500) NOT NULL,
    group_id integer NOT NULL,
    creditor_type_id integer
);


ALTER TABLE public.creditors OWNER TO jamil;

--
-- Name: creditors_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.creditors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creditors_id_seq OWNER TO jamil;

--
-- Name: creditors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.creditors_id_seq OWNED BY public.creditors.id;


--
-- Name: debtors; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.debtors (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    surname character varying(100) NOT NULL,
    patronymic character varying(100),
    birth_date date,
    birth_place character varying(255),
    address character varying(500)
);


ALTER TABLE public.debtors OWNER TO jamil;

--
-- Name: debtors_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.debtors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.debtors_id_seq OWNER TO jamil;

--
-- Name: debtors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.debtors_id_seq OWNED BY public.debtors.id;


--
-- Name: executive_doc_types; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.executive_doc_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.executive_doc_types OWNER TO jamil;

--
-- Name: executive_doc_types_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.executive_doc_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.executive_doc_types_id_seq OWNER TO jamil;

--
-- Name: executive_doc_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.executive_doc_types_id_seq OWNED BY public.executive_doc_types.id;


--
-- Name: executive_docs; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.executive_docs (
    id integer NOT NULL,
    number character varying(255) NOT NULL,
    date_issue date NOT NULL,
    resolution_number character varying(255),
    resolution_date date,
    main numeric(10,2) NOT NULL,
    percents numeric(10,2) NOT NULL,
    penalties numeric(10,2) NOT NULL,
    fee numeric(10,2) NOT NULL,
    sum numeric(10,2) NOT NULL,
    type_id integer NOT NULL,
    contract_id integer NOT NULL,
    bailiff_id integer NOT NULL,
    agent_id integer NOT NULL
);


ALTER TABLE public.executive_docs OWNER TO jamil;

--
-- Name: executive_docs_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.executive_docs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.executive_docs_id_seq OWNER TO jamil;

--
-- Name: executive_docs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.executive_docs_id_seq OWNED BY public.executive_docs.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.groups OWNER TO jamil;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO jamil;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: passport_types; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.passport_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.passport_types OWNER TO jamil;

--
-- Name: passport_types_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.passport_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.passport_types_id_seq OWNER TO jamil;

--
-- Name: passport_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.passport_types_id_seq OWNED BY public.passport_types.id;


--
-- Name: passports; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.passports (
    id integer NOT NULL,
    series character varying(5) NOT NULL,
    number character varying(20) NOT NULL,
    issued_by character varying(255) NOT NULL,
    issued_date date NOT NULL,
    gov_unit_code character varying(255) NOT NULL,
    type_id integer NOT NULL,
    debtor_id integer NOT NULL
);


ALTER TABLE public.passports OWNER TO jamil;

--
-- Name: passports_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.passports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.passports_id_seq OWNER TO jamil;

--
-- Name: passports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.passports_id_seq OWNED BY public.passports.id;


--
-- Name: requisites; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.requisites (
    id integer NOT NULL,
    checking_account numeric(20,0),
    correspondent_account numeric(20,0),
    bank_requisites_id integer NOT NULL,
    creditor_id integer NOT NULL,
    is_default boolean NOT NULL
);


ALTER TABLE public.requisites OWNER TO jamil;

--
-- Name: requisites_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.requisites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requisites_id_seq OWNER TO jamil;

--
-- Name: requisites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.requisites_id_seq OWNED BY public.requisites.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: jamil
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    is_online boolean DEFAULT false NOT NULL,
    phone_number character varying(255),
    img character varying(255),
    group_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO jamil;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jamil
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO jamil;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jamil
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: agents id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.agents ALTER COLUMN id SET DEFAULT nextval('public.agents_id_seq'::regclass);


--
-- Name: bailiffs id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.bailiffs ALTER COLUMN id SET DEFAULT nextval('public.bailiffs_id_seq'::regclass);


--
-- Name: bank_requisites id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.bank_requisites ALTER COLUMN id SET DEFAULT nextval('public.bank_requisites_id_seq'::regclass);


--
-- Name: cessions id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.cessions ALTER COLUMN id SET DEFAULT nextval('public."cessionsInfo_id_seq"'::regclass);


--
-- Name: cessions_groups id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.cessions_groups ALTER COLUMN id SET DEFAULT nextval('public.cessions_id_seq'::regclass);


--
-- Name: contract_types id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.contract_types ALTER COLUMN id SET DEFAULT nextval('public.contract_types_id_seq'::regclass);


--
-- Name: contracts id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.contracts ALTER COLUMN id SET DEFAULT nextval('public.contracts_id_seq'::regclass);


--
-- Name: contracts_statuses id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.contracts_statuses ALTER COLUMN id SET DEFAULT nextval('public.contracts_statuses_id_seq'::regclass);


--
-- Name: court_claims id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_claims ALTER COLUMN id SET DEFAULT nextval('public.court_claims_id_seq'::regclass);


--
-- Name: court_claims_statuses id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_claims_statuses ALTER COLUMN id SET DEFAULT nextval('public.court_claims_statuses_id_seq'::regclass);


--
-- Name: court_claims_types id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_claims_types ALTER COLUMN id SET DEFAULT nextval('public.court_claims_types_id_seq'::regclass);


--
-- Name: court_levels id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_levels ALTER COLUMN id SET DEFAULT nextval('public.court_levels_id_seq'::regclass);


--
-- Name: courts id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.courts ALTER COLUMN id SET DEFAULT nextval('public.courts_id_seq'::regclass);


--
-- Name: creditor_types id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.creditor_types ALTER COLUMN id SET DEFAULT nextval('public.creditor_types_id_seq'::regclass);


--
-- Name: creditors id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.creditors ALTER COLUMN id SET DEFAULT nextval('public.creditors_id_seq'::regclass);


--
-- Name: debtors id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.debtors ALTER COLUMN id SET DEFAULT nextval('public.debtors_id_seq'::regclass);


--
-- Name: executive_doc_types id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.executive_doc_types ALTER COLUMN id SET DEFAULT nextval('public.executive_doc_types_id_seq'::regclass);


--
-- Name: executive_docs id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.executive_docs ALTER COLUMN id SET DEFAULT nextval('public.executive_docs_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: passport_types id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.passport_types ALTER COLUMN id SET DEFAULT nextval('public.passport_types_id_seq'::regclass);


--
-- Name: passports id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.passports ALTER COLUMN id SET DEFAULT nextval('public.passports_id_seq'::regclass);


--
-- Name: requisites id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.requisites ALTER COLUMN id SET DEFAULT nextval('public.requisites_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: agents; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.agents (id, name, surname, patronymic, enclosure, address, is_default, group_id, passport_series, passport_number, user_id) FROM stdin;
1	Ann	Powers	Perry	выписка	3928 Tortor, St.	f	40	3321	220301	189
2	Oscar	Chapman	Cortez	доверенность	Ap #372-6784 At Ave	f	38	3112	221237	180
3	Fletcher	Hensley	Phillips	выписка	9806 Urna Street	f	43	2557	224929	164
4	Stacy	Hardy	Bauer	доверенность	701-362 Nulla Avenue	f	31	3748	220324	129
5	Orli	Mercado	Waters	выписка	P.O. Box 975, 8787 Mus. Rd.	f	10	1828	222702	140
6	Jarrod	Macdonald	Bullock	выписка	8006 Mauris, Rd.	t	11	6	222711	195
7	Merrill	Stout	Mcmahon	доверенность	Ap #660-6016 Ornare, Rd.	t	33	2527	222924	72
8	Candace	Norton	Rosa	доверенность	735-2911 Sem Rd.	t	47	3522	223043	173
9	Hermione	Flowers	Carter	выписка	676-4318 Posuere Rd.	t	18	5045	225112	160
10	Caesar	Lloyd	Roach	доверенность	Ap #169-7423 Eu Avenue	t	8	5839	220229	129
11	Penelope	Webster	Wilder	доверенность	320-9060 Libero Rd.	t	38	1239	225041	6
12	Mira	Branch	George	доверенность	456-1932 Sed, St.	t	23	3508	224653	89
13	Byron	Walker	Mcdonald	выписка	598-9510 Eget Rd.	t	25	4858	220320	60
14	Peter	Hodge	Jensen	выписка	Ap #564-2757 Dui St.	t	35	901	222203	39
15	Kristen	Jackson	Macdonald	доверенность	P.O. Box 768, 196 Mauris Avenue	f	30	4140	225024	104
16	Judah	Burch	Matthews	выписка	Ap #870-4120 Ultrices. St.	t	27	337	221332	199
17	Tasha	Swanson	Whitehead	доверенность	450-1551 Eu Road	f	18	810	220313	77
18	Minerva	Stephenson	Cooley	доверенность	710-1015 Vivamus St.	f	47	550	224754	184
19	Lael	Noble	Watts	доверенность	Ap #599-2001 Risus. Road	f	39	5801	224847	66
20	Jeremy	Cox	Spence	доверенность	Ap #486-5557 Lorem Rd.	t	20	3341	225102	45
21	Cruz	Snider	Blair	выписка	Ap #559-9644 Nisl. Av.	t	23	5727	223553	103
22	Jessamine	Guthrie	Bush	выписка	671-4519 Egestas Ave	t	39	3437	224727	160
23	Sharon	Best	Stevenson	выписка	5125 Pede. Rd.	f	36	2925	225640	111
24	Reese	Campbell	Mccray	доверенность	P.O. Box 632, 6101 Mauris, Av.	f	21	2643	225855	188
25	Victoria	Luna	Bush	доверенность	9883 Eros Rd.	f	17	2927	220645	138
26	Justine	Faulkner	Arnold	доверенность	138-3352 Metus Street	f	48	1712	220900	110
27	Macon	Ewing	Lowery	выписка	247-3886 Odio St.	t	44	2327	225252	69
28	Ginger	Macias	Blevins	доверенность	P.O. Box 646, 5121 Arcu Ave	f	24	457	225214	146
29	Shad	Dorsey	Hewitt	выписка	9854 Proin St.	f	46	4551	222454	165
30	Clark	Buck	Hood	выписка	Ap #609-7783 Sit Rd.	f	45	3823	222008	145
31	Armand	Monroe	Lynn	выписка	862-5679 Etiam St.	t	32	3911	221508	193
32	Moses	Collins	Travis	доверенность	P.O. Box 402, 1339 Sed Rd.	f	27	1935	225213	199
33	Shana	Phelps	Pitts	доверенность	513 Donec Rd.	t	50	3458	225710	190
34	Karly	Raymond	Hays	выписка	P.O. Box 841, 1492 Aliquam Ave	t	30	232	225707	51
35	Beck	Bradford	Abbott	доверенность	467-9822 Nulla Avenue	t	6	4712	220320	46
36	Flavia	Alford	Mcdowell	доверенность	P.O. Box 543, 223 In St.	t	47	4909	220611	31
37	Phillip	Garner	Mullen	выписка	P.O. Box 352, 6806 Accumsan Ave	f	49	5828	223459	66
38	Chadwick	Crosby	Merritt	доверенность	984-7605 Dictum Road	f	12	4911	224038	69
39	Dominic	Wiley	Garner	доверенность	482-3066 Justo. Rd.	t	5	5829	224134	144
40	Emmanuel	Buckley	Nelson	доверенность	750-7276 Suscipit Road	t	19	5031	220655	81
41	Ann	Carrillo	Maynard	выписка	Ap #978-6850 Lobortis, Rd.	f	3	838	221156	68
42	Alexander	Haynes	Blair	выписка	P.O. Box 274, 571 Nisi. Ave	t	41	4507	225302	91
43	Ian	Slater	Shaffer	доверенность	121-2782 Natoque Rd.	f	37	4642	220435	172
44	Carl	Mcclain	Carter	доверенность	552-4667 Sem Rd.	f	22	4957	224511	12
45	Ivan	Young	Olson	доверенность	P.O. Box 555, 7530 Leo. St.	t	30	3345	223713	195
46	Tallulah	Hodges	Clements	доверенность	Ap #149-9727 Eu Road	t	45	5104	221718	137
47	Lysandra	Gregory	Gilbert	доверенность	P.O. Box 179, 7961 Tincidunt Street	f	22	4948	225227	75
48	Indigo	Barnes	Foreman	выписка	Ap #156-5760 Vestibulum Road	f	38	1349	221440	45
49	Brennan	Trujillo	Summers	выписка	913-6280 Vel Rd.	f	42	1842	221919	92
50	Oleg	Dyer	Wolf	выписка	457-8988 Phasellus Avenue	t	11	2843	220649	135
51	Mollie	Stokes	Olsen	доверенность	Ap #956-8626 Vitae, St.	f	8	449	225109	47
52	Madeson	Fitzpatrick	David	выписка	6166 Sed Road	t	10	625	222642	40
53	Ferris	Rosales	Schneider	выписка	342-3226 Etiam Ave	t	21	631	223124	114
54	Roary	Roth	Burnett	доверенность	Ap #272-7961 Mi Rd.	t	11	3522	224435	79
55	Kermit	Porter	Martin	выписка	Ap #358-2694 Nisl Ave	t	38	4315	221013	172
56	Todd	Gonzalez	Bernard	выписка	599-2426 Arcu Road	f	44	3645	222856	125
57	Moana	Mccullough	Mercer	выписка	394-9408 Auctor. Avenue	f	17	4845	224552	198
58	Ariana	Anderson	Baxter	доверенность	P.O. Box 939, 3196 Lobortis Ave	f	37	1541	221108	15
59	Fletcher	Good	Frye	выписка	Ap #760-7913 Pellentesque. Street	t	25	5540	223119	104
60	Celeste	Decker	Larsen	доверенность	Ap #425-5370 Arcu. Avenue	f	20	4435	225637	31
61	Tatyana	Klein	Anthony	выписка	P.O. Box 624, 3722 Ipsum Ave	f	29	3705	221656	173
62	Dorothy	Hudson	Craft	доверенность	778-1968 Non Rd.	f	49	1027	223600	23
63	Troy	Nichols	Alston	выписка	P.O. Box 484, 3720 Sed Rd.	f	42	2232	224845	85
64	Shad	Patterson	Cabrera	выписка	470-1112 Natoque Ave	f	32	2246	225247	99
65	Deborah	Alston	Osborne	выписка	746-7016 At Rd.	f	3	4640	223419	71
66	Paula	Martin	Martinez	выписка	Ap #439-4519 Ac St.	f	43	3618	221349	32
67	Scarlet	Chang	Tyler	доверенность	Ap #213-1065 Velit. Av.	f	24	5720	222729	111
68	Reagan	Dennis	Dean	доверенность	P.O. Box 861, 6872 Magnis Av.	f	11	3151	220657	121
69	Rina	James	Levy	выписка	137-234 Dapibus Rd.	f	13	3437	223359	23
70	Gregory	Pitts	Cooper	выписка	3814 Nec, Ave	f	38	907	222452	136
71	Venus	Clarke	Hill	доверенность	2862 Sodales Road	t	22	4737	220634	156
72	Price	Valenzuela	Vang	доверенность	1870 Cum Rd.	t	30	5503	222714	130
73	Cara	Wolfe	Durham	выписка	720-4305 Elit, Rd.	f	30	708	221601	85
74	Harding	Robertson	Trevino	выписка	Ap #697-178 Amet St.	t	24	2539	221138	174
75	Cody	Logan	Mejia	доверенность	Ap #734-8582 Augue St.	f	38	2115	223113	21
76	Vivian	Dean	Goodwin	доверенность	Ap #575-2595 Sit Ave	t	22	5438	224535	152
77	Melvin	Townsend	Evans	выписка	717-2074 Proin St.	t	13	1731	220631	184
78	Delilah	Clark	Pace	выписка	P.O. Box 830, 173 Molestie Ave	f	20	5402	223106	172
79	April	Spears	Buck	выписка	887-3337 Ut Rd.	t	26	5737	220849	137
80	Graiden	Campbell	Hughes	выписка	P.O. Box 648, 3324 Dui St.	t	31	630	224411	82
81	Aladdin	Bond	Hood	выписка	Ap #227-2711 In, Street	t	47	2322	221648	199
82	Skyler	Nash	Parks	доверенность	Ap #171-206 Mollis St.	t	17	5307	221837	2
83	Myra	Stokes	Kerr	выписка	P.O. Box 420, 8342 Ac Street	t	45	51	223908	49
84	Mallory	Strickland	Wilson	доверенность	3629 A, Rd.	t	25	3143	223818	168
85	Holmes	Meyer	Gutierrez	выписка	Ap #335-644 Diam. St.	f	22	2559	222758	135
86	Delilah	Boyer	Leach	выписка	Ap #598-7666 Auctor, Rd.	f	30	113	224021	5
87	Chastity	Wiggins	Peterson	выписка	412-7917 Sit St.	t	16	55	223702	4
88	James	Santos	Reilly	выписка	6736 Gravida St.	f	47	1619	223535	122
89	Jacqueline	Holcomb	Cortez	выписка	Ap #737-4752 Vel Road	t	24	2238	224133	167
90	Hyatt	Perez	Oneal	выписка	Ap #350-1811 Lectus Ave	t	12	4537	223334	5
91	Thane	Mccoy	Nixon	выписка	344-4897 Tincidunt St.	t	29	151	223131	23
92	Victor	Justice	Bolton	доверенность	214-144 Sed St.	f	19	2242	220708	140
93	Susan	Reese	Perkins	выписка	850-5499 Sit Rd.	t	18	704	223823	43
94	Orlando	Jennings	Tyler	выписка	104-7099 Nunc Road	t	28	5533	221700	158
95	Ferdinand	Spence	Knapp	доверенность	114-3332 Consectetuer St.	f	4	1531	221149	166
96	Hall	Crawford	Hampton	выписка	876-1195 Nec Avenue	f	37	1645	224917	139
97	Alisa	Mendoza	Stevenson	выписка	4916 Placerat. Rd.	t	30	5853	221421	65
98	Tashya	Leon	King	выписка	168-6932 Neque Avenue	t	12	715	225813	161
99	Kirby	Malone	Downs	доверенность	P.O. Box 986, 3226 Vel Ave	f	32	2510	221305	86
100	Laith	Gallegos	Raymond	выписка	Ap #763-9026 Imperdiet Street	t	25	4706	222310	165
101	MacKenzie	Logan	Larsen	доверенность	105-9299 Adipiscing St.	t	29	2450	220925	35
102	Shellie	Oneal	Henderson	выписка	661-8594 Ipsum. Avenue	f	26	3928	223246	143
103	Zeus	Buckley	Alvarado	доверенность	Ap #563-1965 Tempus, Av.	f	9	3124	222633	29
104	Nash	Barrera	Walters	выписка	P.O. Box 705, 5154 Non, Street	f	4	4208	222049	106
105	Nerea	Burnett	Banks	выписка	718-7559 Dolor, Av.	f	10	2118	221425	126
106	Dieter	Hart	Lester	выписка	Ap #122-6573 Risus Rd.	t	25	3546	224708	67
107	Peter	Hurst	Fuller	выписка	260 Nulla. Rd.	f	9	4017	220224	106
108	Vielka	Lee	Erickson	выписка	P.O. Box 353, 563 In Street	f	49	3438	224913	41
109	Ariana	Cooke	Howard	выписка	725-1053 Cursus. St.	f	16	4952	224412	151
110	Ulric	Mccray	Velasquez	выписка	Ap #759-1635 Viverra. Street	f	33	2940	223250	160
111	Charlotte	Richards	Oneil	выписка	P.O. Box 706, 9358 Magna Road	f	11	1306	220036	39
112	Jolie	Mack	Grimes	доверенность	626-102 Posuere Rd.	f	33	640	223510	117
113	Jana	Woodard	Elliott	доверенность	851-4446 Lorem St.	f	43	2808	224838	111
114	Noelani	Delacruz	Case	выписка	Ap #309-2687 Iaculis St.	f	27	3757	223702	7
115	Bruce	Glover	Fitzgerald	доверенность	P.O. Box 948, 1336 Iaculis Av.	t	42	414	224449	76
116	Cynthia	Washington	Ratliff	доверенность	Ap #141-1597 Ornare, Rd.	f	32	1235	220508	155
117	Lacy	Nolan	Figueroa	доверенность	Ap #356-2397 Convallis Rd.	f	20	4423	222606	94
118	Keiko	Grant	Rush	выписка	P.O. Box 567, 969 Purus Ave	t	2	1101	221040	40
119	Ariel	Humphrey	Welch	доверенность	Ap #474-3116 Orci Road	t	32	4638	225021	19
120	Lacota	Doyle	Cleveland	выписка	471-6136 Lorem Rd.	f	16	1824	220204	177
121	Kamal	Walton	Meadows	доверенность	P.O. Box 252, 1282 Hendrerit St.	t	28	3838	222302	132
122	Leslie	Logan	Cleveland	доверенность	858-5777 Vestibulum. St.	t	29	1246	224013	32
123	Luke	Dunn	Nguyen	доверенность	P.O. Box 546, 4512 Nunc Street	t	8	5945	223822	185
124	Lionel	Mcdaniel	Sellers	выписка	Ap #416-7541 Cursus Av.	f	40	4517	220546	164
125	September	Bonner	West	выписка	Ap #657-8843 Dictum Street	t	25	5003	222434	24
126	Lacey	Hopper	Levine	выписка	Ap #325-3823 Sed Street	f	49	1017	221445	113
127	John	Gilliam	Waller	доверенность	4235 Arcu St.	f	19	309	220650	30
128	Ariel	Burns	Valdez	доверенность	193-1649 Vivamus St.	f	17	1524	221217	172
129	Francesca	Snider	Hess	доверенность	9761 Nulla. St.	t	29	4017	224708	56
130	Stephen	Estrada	Bass	доверенность	627-8107 Massa Avenue	f	21	4054	225726	41
131	Joseph	Foster	Stanton	доверенность	P.O. Box 286, 5745 Tempor Road	t	38	5427	221904	68
132	Susan	Cotton	Guy	выписка	Ap #451-6999 Dui. Avenue	t	4	1746	223907	55
133	Ryan	Ayala	Turner	доверенность	Ap #567-9651 Metus. Rd.	f	20	1652	224910	67
134	Jennifer	Valencia	Whitney	доверенность	P.O. Box 107, 7674 Egestas Street	f	5	2329	225226	51
135	Hope	Crane	Willis	доверенность	Ap #862-8998 Eu St.	f	1	3344	221303	38
136	Hadley	Meyer	Black	выписка	445-6402 Eget Road	t	2	449	224620	59
137	Karen	Durham	Aguilar	выписка	725-3614 Et Street	f	36	1553	223704	15
138	Farrah	Thomas	Cain	выписка	7160 Mauris Street	f	42	2223	221700	127
139	Julian	Medina	Joyce	доверенность	Ap #762-9611 Ornare St.	t	40	2947	223319	133
140	Bo	Mccarthy	Levine	доверенность	P.O. Box 229, 1229 Sed Ave	f	36	4005	222103	64
141	Harriet	Phillips	Buckley	выписка	508-6808 Mollis Av.	f	37	544	221153	150
142	Rhea	Ewing	Kelley	выписка	6956 Faucibus Road	f	16	953	220357	39
143	Erasmus	Neal	Strong	доверенность	P.O. Box 527, 5741 Fusce Avenue	f	23	1247	225646	198
144	Kai	Watson	Richard	доверенность	7662 Id Rd.	f	44	1034	225901	127
145	Hunter	Camacho	Baxter	выписка	Ap #600-3153 Et Av.	f	46	5604	221918	147
146	Farrah	Combs	Bolton	доверенность	2884 Eget Rd.	t	24	4530	222158	114
147	Brenna	Hayes	Hahn	выписка	Ap #844-1535 Tellus. St.	f	13	2044	221323	60
148	Preston	Mcpherson	Mitchell	выписка	5455 Mollis. Avenue	f	39	5415	224154	140
149	Nola	Nguyen	Herman	выписка	Ap #356-633 Metus Road	t	14	2107	220054	52
150	Lionel	Wilkinson	Simmons	доверенность	286-1192 Feugiat Av.	f	6	5249	222732	75
151	Patrick	Gould	Thornton	доверенность	913-9029 Ut Ave	t	32	5050	225352	115
152	Lucy	Melton	Goff	выписка	398-5834 Pharetra. Street	t	23	1611	221650	29
153	Stephen	Meadows	Farrell	доверенность	P.O. Box 316, 3694 Sit Street	t	31	1228	223355	193
154	Coby	Combs	Stone	выписка	Ap #731-3211 Mauris Rd.	t	34	3016	225246	196
155	Dean	Baldwin	Gallagher	выписка	Ap #184-3627 Vivamus Avenue	f	11	856	225404	54
156	Xandra	Ellison	Schwartz	выписка	P.O. Box 931, 4040 Senectus Av.	t	15	5223	225023	87
157	Omar	Salazar	Dillon	выписка	P.O. Box 801, 804 Ornare St.	t	10	2943	223555	63
158	Whitney	Roach	Hines	доверенность	888-1533 Congue, St.	t	5	5216	224337	122
159	Autumn	Franco	Richard	выписка	Ap #470-2084 Egestas St.	f	41	3129	221541	88
160	Rudyard	Oneil	Witt	доверенность	171-4691 Tempor St.	t	22	1642	223051	39
161	Dillon	Navarro	Sparks	доверенность	5197 Suscipit Rd.	f	26	2015	222700	87
162	Caesar	Delacruz	Harvey	выписка	P.O. Box 474, 434 Lectus Av.	t	13	4815	220747	60
163	Elijah	Greer	Galloway	выписка	P.O. Box 724, 6299 Netus Rd.	f	16	3825	221306	16
164	Burton	Mcintyre	Wyatt	доверенность	821-1717 Lobortis Road	f	44	1707	221323	147
165	Nerea	Mayer	Shaw	доверенность	Ap #963-4674 Venenatis St.	f	4	2324	221224	99
166	Chastity	Rollins	Carroll	выписка	443-7913 Iaculis St.	f	9	1854	224027	10
167	Ira	Carpenter	Reid	доверенность	P.O. Box 578, 1681 Tincidunt, Rd.	f	4	1752	222757	9
168	Ignacia	Head	Burt	выписка	592-7283 Nisi Av.	t	30	5750	223141	172
169	Shad	Erickson	Miles	доверенность	9705 Scelerisque St.	f	2	3636	225039	49
170	Quamar	Smith	Browning	доверенность	P.O. Box 618, 7818 Pellentesque St.	f	13	554	225534	124
171	Halee	Barton	Pruitt	доверенность	288-7490 Eleifend, Rd.	f	41	2703	224712	28
172	Bruno	Hopper	Holt	выписка	Ap #130-3611 Sed Av.	f	43	343	223000	129
173	Germaine	Dorsey	Mckinney	доверенность	429-9634 Odio Av.	f	2	2556	225315	195
174	Elton	Randolph	Gates	доверенность	P.O. Box 248, 6462 Libero. St.	t	39	3117	220810	98
175	Haviva	Parrish	Mooney	доверенность	P.O. Box 271, 7440 Vel Road	t	47	4244	222212	27
176	Xanthus	Foreman	Wright	выписка	Ap #368-9939 Vitae St.	t	23	1711	224939	1
177	Dahlia	Calhoun	Soto	выписка	Ap #894-9651 Nunc Ave	f	12	643	225817	106
178	Maris	Silva	Meyers	доверенность	P.O. Box 352, 316 Dictum Ave	f	49	10	221512	154
179	Preston	Nguyen	Fletcher	выписка	863-4950 Nec Road	t	25	5045	223514	141
180	Eugenia	Moon	Salinas	выписка	Ap #118-4740 Lectus Street	f	11	2625	224101	4
181	Morgan	Valenzuela	Wiggins	выписка	156-4652 Etiam Street	t	38	5233	225608	37
182	Craig	Downs	Mcmillan	доверенность	P.O. Box 511, 9789 A, Ave	t	46	4235	222345	155
183	Hillary	Cantrell	Austin	выписка	Ap #414-5891 Enim Ave	f	46	2921	221216	167
184	Rama	Horne	Gamble	доверенность	9435 Donec Road	t	11	5320	222339	133
185	Dieter	Clayton	Mccormick	выписка	Ap #216-1572 Vivamus Road	f	16	2919	225346	29
186	Aristotle	Hendrix	O'connor	выписка	Ap #458-5748 Mauris Road	t	11	2011	220237	177
187	Arthur	Mack	Dawson	доверенность	8108 Sit Av.	t	33	5230	221358	56
188	Jordan	Duncan	Cohen	доверенность	Ap #907-8108 Rutrum, Av.	t	42	1256	222028	160
189	Vera	Greer	Guy	доверенность	Ap #502-1441 Non, Street	f	8	4350	223439	3
190	Justine	Copeland	Lyons	доверенность	978-4151 Semper Street	f	2	5628	224050	129
191	Eric	Cantrell	Howe	выписка	Ap #666-4694 Bibendum Avenue	f	9	5331	220908	128
192	Giselle	Copeland	Ross	доверенность	312-2130 Mauris Street	f	48	4717	225516	128
193	Roary	Christensen	Gaines	доверенность	759-9886 Pede. Ave	t	36	5057	223808	71
194	Erasmus	Potter	Leon	выписка	960-6289 Maecenas Rd.	t	44	5235	220233	99
195	Lacota	Caldwell	Gill	выписка	4454 Sed Road	t	32	3716	223055	70
196	Julie	Cannon	Morgan	выписка	3022 Phasellus Rd.	f	24	3348	220708	158
197	Deanna	Garrison	Becker	выписка	529-9165 Et Av.	f	12	2137	223848	146
198	Brooke	Holloway	Olsen	доверенность	6630 Sollicitudin St.	t	36	3926	220211	82
199	Jonah	Dunn	Farrell	выписка	Ap #869-6857 Odio. Street	t	46	1214	223451	59
200	Piper	Keller	Sherman	выписка	646-6051 Neque Avenue	t	34	5603	225205	30
\.


--
-- Data for Name: bailiffs; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.bailiffs (id, name, address) FROM stdin;
1	Et Pede Nunc Industries	Ap #310-343 Ullamcorper, St.
2	Ut Tincidunt Orci Incorporated	Ap #319-4724 Imperdiet Avenue
3	Nibh Corporation	P.O. Box 545, 1781 Diam. Ave
4	Massa Suspendisse PC	731-6968 Sed Rd.
5	Et Associates	Ap #392-5987 Molestie Road
6	Amet Dapibus Id Industries	Ap #831-3851 Elit. St.
7	In Tempus Ltd	Ap #220-7450 Quam Rd.
8	Fermentum Arcu Inc.	8732 Dis St.
9	Natoque Penatibus Corp.	522-1610 Non, Avenue
10	Facilisis Vitae Industries	P.O. Box 414, 5529 Egestas Street
11	Id Sapien LLC	Ap #220-576 Parturient Avenue
12	Auctor Vitae Aliquet Institute	Ap #427-5369 Scelerisque Rd.
13	Turpis Egestas Industries	P.O. Box 244, 5170 Dolor, St.
14	Nam Associates	Ap #972-7619 Fermentum St.
15	Aliquam PC	Ap #939-2747 Eu Rd.
16	Eros Proin Ultrices Ltd	P.O. Box 958, 405 Eu Rd.
17	At Risus Institute	Ap #461-6489 Sed Avenue
18	Sociis Natoque Company	Ap #287-609 Luctus Street
19	Odio A Purus Consulting	683-8808 Ante Rd.
20	Urna Nec Corp.	Ap #137-2898 Sapien. St.
21	Tempor Augue Limited	400-5122 Nulla. Street
22	Ut Erat Associates	Ap #230-1578 Blandit Rd.
23	Vehicula Corp.	Ap #297-3468 Ut Ave
24	Mus Aenean Ltd	1736 Vehicula. Av.
25	Ut Erat Sed Limited	311-4609 Et Street
26	Enim Nec Foundation	3410 Interdum St.
27	Class Aptent LLP	629-4133 Non Road
28	Porttitor Scelerisque Neque Incorporated	445-4541 Sed Street
29	Leo Morbi LLC	8938 Lacus. Avenue
30	Nunc Corp.	Ap #306-8802 Fringilla Rd.
31	Lorem Donec LLC	Ap #772-5503 Volutpat Rd.
32	Sodales Elit Corp.	7218 Adipiscing Av.
33	Felis Inc.	640-1725 Velit Road
34	Nisi Aenean Corporation	Ap #415-3056 Mauris, Avenue
35	Maecenas Corporation	3494 Lectus, Ave
36	Molestie Orci Tincidunt Industries	Ap #711-1401 Et St.
37	Hymenaeos Mauris LLP	853-1212 Non, Av.
38	Neque Nullam Limited	Ap #584-3097 Quis Avenue
39	Tincidunt Aliquam Arcu Industries	594-6758 Vitae Rd.
40	Libero Donec LLC	Ap #798-8356 Eu St.
41	Nunc Pulvinar Arcu LLP	686-7382 Nulla Ave
42	Est Arcu Industries	P.O. Box 625, 3798 Parturient Avenue
43	Donec LLC	544-4612 Mauris Road
44	Amet Metus Corp.	P.O. Box 955, 2160 Erat, Av.
45	Sociis Natoque Penatibus Foundation	477-7523 Malesuada Road
46	Vehicula Pellentesque Ltd	P.O. Box 650, 2926 Ante Rd.
47	Nulla Tincidunt Neque Corp.	2214 Nisi St.
48	Sed Nulla Industries	Ap #580-8476 Neque St.
49	Luctus Curabitur Egestas Industries	5276 Nunc Rd.
50	Auctor Nunc Nulla Inc.	338-3557 Scelerisque St.
\.


--
-- Data for Name: bank_requisites; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.bank_requisites (id, name, bik) FROM stdin;
1	Neque Industries	201117225
2	Volutpat Associates	2022341412
3	Lacus Pede Limited	1973014011
4	Mollis Associates	197255067
5	Sapien Imperdiet Inc.	202008189
6	Interdum Libero Corporation	198514025
7	Sollicitudin Commodo Institute	195606387
8	Id Mollis LLC	1969184612
9	Magnis PC	191139551
10	Sit Corp.	196245515
11	Commodo PC	200040546
12	Est Congue A Foundation	191659301
13	Lorem Ipsum Corporation	1949255312
14	Tellus Lorem LLP	192730247
15	Ipsum Curabitur Consequat Limited	197603388
16	In Consectetuer LLP	2007093111
17	Vestibulum Massa Rutrum Foundation	192321223
18	Aliquam Vulputate Industries	192138395
19	Quisque Imperdiet Limited	1927094410
20	Pede PC	195550488
21	Magnis Dis Incorporated	2002445611
22	Rhoncus Proin Nisl Institute	192031392
23	Luctus Ut LLC	198707282
24	Sed Facilisis Corporation	199606292
25	Bibendum Consulting	1975592211
26	Orci Consectetuer Euismod Corporation	1924311610
27	At Pretium Corporation	194207381
28	Elit Pretium Consulting	200657474
29	In Faucibus Corporation	201555566
30	Blandit Enim Incorporated	194849012
31	Nec Incorporated	1945213511
32	Eros Turpis Limited	1936264312
33	Libero Proin Mi LLP	196025528
34	Aliquet Lobortis PC	200125194
35	Elit Erat Corporation	196312294
36	Metus Aenean Corp.	2012274911
37	Magnis Dis Industries	197708513
38	Duis Risus Ltd	194828074
39	Sed Eu Eros Limited	202150021
40	Luctus Vulputate Foundation	193747447
41	Tempus Scelerisque Ltd	193108348
42	Lacus Vestibulum Lorem PC	198519239
43	Ligula Corporation	195414294
44	Vehicula Limited	195055474
45	Lorem Lorem LLC	194734167
46	Lacus Cras Limited	190605196
47	Odio LLP	197556206
48	Vitae Posuere Industries	193256456
49	Auctor Industries	196318552
50	Et Inc.	1922523511
\.


--
-- Data for Name: cessions; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.cessions (id, sum, number, text, assignee_id, assignor_id, cession_group_id, group_id, transfer_date) FROM stdin;
1	674108409.00	933	Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce	172	109	27	7	2008-02-11
2	211343746.00	978	sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare	38	135	36	21	2011-08-27
3	852218379.00	877	massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu,	84	28	34	25	1998-05-28
4	496138136.00	977	gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi	62	24	27	4	2006-01-20
5	345575788.00	936	ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum	26	70	7	24	2020-02-21
6	361616321.00	406	quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas	94	33	34	6	2009-06-18
7	762049219.00	270	Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam	63	60	38	3	1997-07-06
8	118854760.00	993	amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras	113	19	24	23	1995-10-07
9	700855469.00	757	nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus.	19	101	28	24	2012-07-23
10	653004405.00	43	pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur	173	88	29	14	2016-09-14
11	484269775.00	960	lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet,	16	128	33	11	2003-11-08
12	614771504.00	673	ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et,	150	149	32	24	2019-12-22
13	681234427.00	209	Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac	182	69	10	5	2015-07-19
14	50818218.00	674	blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper	43	6	20	22	2005-07-19
15	111158696.00	278	dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus	157	126	39	18	2016-05-29
16	230404075.00	561	tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer	171	65	5	15	2019-04-23
17	390615926.00	30	condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales	76	151	25	24	2000-04-26
18	161839161.00	412	ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet	118	14	6	23	2004-01-07
19	234031292.00	961	quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit	110	142	6	17	2008-12-10
20	811810766.00	849	consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate	161	168	35	23	2003-04-27
21	985319828.00	940	Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec	73	20	30	10	2001-06-03
22	721005963.00	146	nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus	53	15	17	6	2009-08-02
23	414204384.00	474	sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero	10	81	25	24	2019-05-21
24	116995150.00	662	Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id	105	42	30	8	2004-04-28
25	712247765.00	621	et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque	169	123	24	15	2003-10-04
26	433982657.00	320	tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede,	90	44	10	19	2016-02-05
27	101692869.00	309	urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque	7	180	4	6	2004-12-28
28	830713028.00	277	sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante	142	154	14	20	2018-01-23
29	943025403.00	767	Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna.	33	95	37	8	2007-01-06
30	931217109.00	430	commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus	57	167	23	7	2001-07-08
31	790863204.00	835	Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse	133	165	40	7	2000-09-16
32	204735037.00	105	vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi.	42	126	22	9	1999-09-16
33	93896492.00	803	tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur	118	157	30	10	2016-03-08
34	702978175.00	777	et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus.	39	16	9	13	2018-12-03
35	65863296.00	460	nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat	155	75	40	9	2012-03-22
36	322878953.00	536	lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci	138	13	39	7	2020-01-31
37	149086666.00	635	metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam	89	38	29	19	1997-09-13
38	47270234.00	999	nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc	147	159	24	18	2019-03-28
39	68267250.00	964	in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor	163	50	31	6	1999-10-28
40	384900642.00	542	arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit	38	132	38	23	2016-09-15
41	607659285.00	593	luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet	54	152	35	7	2008-07-10
42	384543241.00	181	dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien	115	39	19	2	1999-05-07
43	366485732.00	973	ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac	6	155	10	12	2007-11-17
44	16709960.00	128	congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat	155	110	34	12	1997-06-14
45	904844197.00	115	lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula	56	87	20	19	2011-05-17
46	654950750.00	467	fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet,	45	42	8	8	2008-07-18
47	478714481.00	417	Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie	36	110	4	8	2001-12-07
48	350355036.00	709	vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus	144	148	30	13	2009-02-01
49	748814704.00	819	mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing	50	66	22	16	2020-12-04
50	396314079.00	456	erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames	81	15	25	3	2003-09-23
51	595595850.00	712	ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt	84	129	21	14	2018-04-14
52	316024585.00	963	Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per	185	199	9	15	2000-02-23
53	423047997.00	761	diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper	7	6	9	9	2002-08-01
54	880346241.00	137	turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,	5	8	12	19	2011-05-26
55	933964618.00	462	ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim	134	80	30	14	2007-11-25
56	709369600.00	243	nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi	81	151	13	24	2018-07-31
57	256978390.00	175	Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et,	101	130	8	8	2016-02-16
58	744005898.00	16	condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris	82	136	6	4	2022-03-19
59	311021382.00	46	molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et	57	143	17	3	2018-07-19
60	335433382.00	354	litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis	67	70	14	14	2016-06-14
61	120149233.00	393	Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum.	6	111	34	15	1994-12-10
62	765094583.00	603	tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas	147	150	11	9	1996-08-09
63	860358216.00	933	In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus	177	28	35	16	2011-01-14
64	180353203.00	554	neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius	113	124	8	18	2006-02-04
65	818739837.00	826	pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi	63	42	27	9	2015-10-13
66	56340094.00	97	Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae,	153	134	31	19	2018-07-27
67	433311357.00	956	lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante	50	162	33	23	2014-05-02
68	72755952.00	381	odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut,	156	157	14	15	2017-03-25
69	603727740.00	725	eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum.	118	64	24	1	1996-12-18
70	180034845.00	719	sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac	181	126	3	20	2021-12-19
71	464256849.00	772	mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed	61	167	37	15	2018-06-19
72	58154159.00	310	Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus	10	113	22	20	2001-05-13
73	903873878.00	354	iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque	146	163	39	12	2016-02-27
74	556667216.00	657	a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl	88	94	10	10	2018-08-11
75	790148337.00	716	sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit	80	184	28	5	1995-10-31
76	608768471.00	623	felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient	92	165	39	7	2000-06-10
77	290099020.00	947	velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et	83	40	8	21	2021-04-21
78	273850284.00	223	eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada	169	187	26	15	1996-11-30
79	419073268.00	375	mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed	175	92	39	25	2005-06-03
80	195936467.00	874	mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper.	168	116	19	1	2006-11-12
81	775624006.00	534	diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce	170	165	26	12	2007-10-05
82	256068298.00	478	tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum.	64	49	12	22	2005-04-02
83	54093076.00	400	in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit	124	4	9	16	2004-10-02
84	965667772.00	663	erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis	24	168	23	15	2001-10-22
85	177618770.00	453	ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes,	36	89	15	24	1997-04-24
86	672295932.00	964	malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies	137	134	3	14	2004-03-04
87	989518818.00	778	Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec	15	30	8	25	1996-07-10
88	977354907.00	118	lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas	48	134	9	24	2007-05-08
89	813743724.00	167	est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing	144	21	7	6	2001-09-17
90	925466536.00	312	non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis	196	132	27	2	2001-08-04
91	497887594.00	88	leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing	145	8	17	15	2007-06-09
92	747804555.00	337	malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula	35	34	36	11	2021-01-07
93	781658918.00	200	a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus	178	28	26	4	2001-11-26
94	131915406.00	508	ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo.	189	114	5	23	2005-04-06
95	502096706.00	579	Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo	10	172	5	5	2001-12-20
96	435720839.00	187	odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet,	28	7	39	3	2015-10-31
97	828589073.00	794	fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie.	112	190	4	14	2006-04-04
98	494466534.00	947	mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque	20	8	18	16	2003-09-15
99	306511477.00	933	risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus	168	51	40	16	2016-10-24
100	105191289.00	692	Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem	107	17	25	14	2009-10-09
101	947008242.00	794	justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent	174	167	32	22	2013-05-09
102	333114325.00	190	eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec	170	199	10	20	2000-05-09
103	445916356.00	31	Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum	72	92	22	19	1998-01-29
104	24873533.00	123	vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum	66	98	35	18	1998-04-22
105	917973362.00	634	justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent	34	82	14	16	2003-06-26
106	640155486.00	886	lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit	125	169	5	15	1998-01-01
107	441745870.00	132	nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod	163	156	11	6	2021-07-25
108	276622207.00	796	metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in,	197	165	29	22	2013-05-27
109	794204906.00	498	Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean	17	61	31	20	1999-06-09
110	186667940.00	827	purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in	191	127	1	11	2002-10-15
111	538322318.00	8	malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis.	106	137	31	24	2007-03-21
112	209762694.00	610	elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin	183	37	16	2	2012-06-11
113	918934406.00	30	pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit	118	35	17	2	2007-07-07
114	990970800.00	439	quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel,	1	54	20	15	2014-09-07
115	503616981.00	236	quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada	101	184	17	4	2014-12-20
116	382000587.00	839	justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non,	78	195	27	21	2020-01-26
117	466020112.00	767	dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl.	98	114	33	21	2011-05-07
118	642467580.00	617	lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et,	164	40	14	23	1997-03-05
119	140215231.00	781	ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet,	78	16	7	18	2000-07-23
120	596367006.00	455	sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci.	34	84	17	16	2015-08-18
121	44781207.00	355	Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et,	143	99	2	22	2002-07-14
122	888387806.00	580	lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque	191	23	35	9	2022-06-16
123	890068222.00	418	ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam	72	152	12	6	2009-01-27
124	821231087.00	856	fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet,	90	169	19	4	1999-09-28
125	420751123.00	408	hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu	7	22	2	13	1997-07-06
126	892153337.00	462	purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel	37	192	8	11	2002-10-08
127	167021089.00	354	mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer,	61	32	19	14	1996-02-10
128	22389649.00	942	scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut	176	34	18	19	2019-02-03
129	744625890.00	434	Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis,	170	171	26	6	2000-05-01
130	902448830.00	680	id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla	51	47	9	21	2009-09-18
131	242319689.00	366	ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis	142	163	35	16	2002-01-12
132	44227892.00	471	dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis	105	119	12	12	2019-11-23
133	389270822.00	76	lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero	45	133	13	23	2001-04-01
134	16464548.00	667	est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing	41	11	19	23	2016-04-14
135	32060456.00	161	gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend	154	143	19	16	2000-02-25
136	897099381.00	174	volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit.	119	33	38	18	2018-02-04
137	755115572.00	212	nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero	200	79	1	13	2016-08-06
138	528361556.00	714	enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui.	119	78	4	2	1995-04-08
139	444351367.00	883	In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros	6	52	11	1	2004-12-09
140	231640874.00	869	in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut,	127	189	33	2	2019-05-14
141	1031021.00	861	gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna	5	26	3	24	2019-08-06
142	508041439.00	772	vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi.	35	188	5	16	1999-06-04
143	582744381.00	487	Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna	136	44	18	4	2013-05-19
144	263718273.00	901	ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna.	13	119	12	14	2003-05-28
145	846246491.00	219	quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl.	99	169	31	15	2005-04-17
146	241536431.00	65	lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem	187	200	19	11	1999-04-04
147	850149248.00	985	fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie.	116	178	29	18	2004-03-07
148	768890236.00	899	est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue	184	130	24	2	1997-01-28
149	311717490.00	66	turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,	4	84	34	3	1998-09-21
150	388593989.00	424	scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices	101	95	39	2	2006-12-03
\.


--
-- Data for Name: cessions_groups; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.cessions_groups (id, name, cessions_amount, group_id) FROM stdin;
1	diam vel	1	9
2	Pellentesque habitant morbi tristique senectus et netus et	6	4
3	magnis dis parturient montes, nascetur ridiculus mus. Donec	6	4
4	risus varius orci,	5	23
5	odio a purus. Duis elementum, dui	4	6
6	penatibus et magnis dis parturient montes,	10	1
7	libero at auctor ullamcorper, nisl arcu	3	5
8	Nulla semper tellus id nunc interdum feugiat.	5	15
9	est, vitae sodales nisi magna	5	18
10	arcu iaculis enim, sit amet ornare	9	22
11	eget lacus. Mauris non	7	4
12	in consequat enim diam vel arcu. Curabitur	7	5
13	Mauris quis turpis	6	24
14	sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris	2	21
15	et magnis	7	22
16	sollicitudin commodo	4	14
17	et magnis dis parturient	7	11
18	Cras vehicula aliquet	4	25
19	molestie	8	22
20	libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus	6	17
21	gravida sagittis. Duis gravida. Praesent eu nulla	9	20
22	in, hendrerit consectetuer, cursus et, magna. Praesent	6	5
23	Donec tempus, lorem fringilla ornare placerat,	2	18
24	nulla magna, malesuada vel, convallis	4	17
25	pede, nonummy	2	16
26	Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus.	8	24
27	malesuada augue	8	12
28	Sed dictum. Proin eget odio. Aliquam	9	2
29	rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi	8	9
30	leo elementum sem, vitae	7	18
31	venenatis a, magna. Lorem ipsum dolor sit	8	20
32	tempor arcu. Vestibulum ut eros non enim commodo hendrerit.	2	22
33	elit fermentum risus, at	8	22
34	Sed et libero.	6	8
35	elit, pharetra ut, pharetra sed,	4	17
36	sit amet massa. Quisque porttitor	6	2
37	nunc sed pede. Cum sociis natoque penatibus et magnis dis	4	14
38	dolor sit amet, consectetuer	7	24
39	lorem, auctor quis, tristique ac, eleifend vitae,	4	17
40	diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae,	4	13
\.


--
-- Data for Name: contract_types; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.contract_types (id, name) FROM stdin;
1	займ
2	кредит
\.


--
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.contracts (id, number, sum_issue, date_issue, due_date, percent, penalty, status_changed, contract_status_id, group_id, debtor_id, cession_group_id, creditor_id, type_id) FROM stdin;
1	9986	61427.00	2004-12-25	2020-01-16	17.00	94.00	2022-11-07	3	8	129	36	32	1
2	1051	96805.00	2004-08-25	2014-07-01	39.00	4.00	2017-06-23	6	23	172	18	103	1
3	2598	81293.00	2010-12-08	2015-02-26	17.00	49.00	2020-06-14	4	7	139	38	146	2
4	4207	24849.00	2004-08-21	2014-07-27	32.00	11.00	2019-05-03	5	14	150	1	173	2
5	6945	40013.00	2003-05-15	2020-03-01	64.00	85.00	2018-04-06	12	5	162	26	81	1
6	7084	12122.00	2010-08-25	2022-09-18	91.00	17.00	2020-12-16	3	23	101	26	151	2
7	1555	62265.00	2011-07-20	2013-02-01	10.00	91.00	2013-02-02	1	18	110	6	137	2
8	1298	36029.00	2003-04-29	2013-04-06	9.00	35.00	2016-06-06	12	11	44	10	8	1
9	3726	36405.00	2011-06-21	2015-08-06	57.00	10.00	2011-03-15	2	19	5	33	78	1
10	6886	49555.00	2008-04-12	2017-04-25	6.00	72.00	2010-12-23	2	24	197	12	2	2
11	8009	11454.00	2003-12-17	2021-11-26	87.00	98.00	2019-03-05	2	12	61	9	67	2
12	8299	73700.00	2012-09-21	2018-01-15	100.00	93.00	2017-12-14	4	5	169	16	159	1
13	2011	6884.00	2010-03-19	2017-05-12	78.00	87.00	2019-07-03	5	13	114	23	109	2
14	7801	19510.00	2005-12-22	2017-06-15	11.00	66.00	2016-04-08	10	2	67	25	188	1
15	4317	95235.00	2010-09-07	2019-07-05	33.00	18.00	2015-03-28	3	12	148	23	92	2
16	5374	68004.00	2003-11-08	2018-12-01	54.00	2.00	2019-05-26	7	7	186	24	197	2
17	912	53196.00	2005-01-05	2018-04-09	26.00	24.00	2014-12-31	1	23	77	27	24	2
18	8273	71715.00	2007-10-24	2018-06-20	51.00	99.00	2015-08-18	7	17	47	27	64	1
19	8060	84963.00	2008-10-13	2013-01-28	2.00	6.00	2016-10-16	3	5	153	26	55	1
20	2546	22922.00	2004-12-29	2013-05-12	77.00	74.00	2012-10-01	7	19	35	15	57	1
21	6104	36868.00	2009-09-30	2020-04-28	84.00	97.00	2022-04-07	10	25	8	2	38	1
22	6239	90222.00	2010-09-12	2014-06-03	75.00	68.00	2017-10-05	7	11	168	13	161	1
23	5564	84749.00	2012-01-15	2018-01-30	66.00	11.00	2017-05-07	13	24	166	19	166	1
24	673	62429.00	2011-10-22	2013-05-29	63.00	41.00	2017-03-12	4	23	21	14	120	1
25	7311	33944.00	2009-05-05	2015-09-18	12.00	82.00	2014-12-02	11	9	78	4	1	1
26	407	28322.00	2002-11-14	2019-10-15	51.00	76.00	2019-07-27	3	21	79	34	123	2
27	1848	42020.00	2007-09-11	2015-10-20	47.00	69.00	2012-08-05	13	19	121	30	61	2
28	2953	59843.00	2006-03-15	2020-09-26	20.00	69.00	2012-12-09	9	18	114	2	165	2
29	3102	38435.00	2009-04-26	2018-12-07	8.00	66.00	2012-08-21	9	25	173	23	189	2
30	3835	90042.00	2011-03-04	2014-04-06	14.00	94.00	2013-12-31	5	10	165	18	171	1
31	4299	75774.00	2009-08-14	2017-11-18	12.00	57.00	2014-04-03	11	20	88	22	166	2
32	7352	973.00	2004-09-26	2015-10-11	13.00	5.00	2017-04-04	10	24	80	6	129	2
33	2915	55118.00	2008-04-14	2013-06-13	2.00	65.00	2019-07-09	7	11	68	19	95	1
34	4959	28422.00	2010-06-29	2021-02-01	99.00	83.00	2018-12-15	1	3	44	6	41	1
35	4850	80629.00	2010-04-21	2014-08-02	71.00	68.00	2021-09-04	5	20	149	5	71	1
36	6263	58571.00	2009-07-12	2020-01-31	51.00	41.00	2022-09-16	13	5	79	27	151	1
37	5666	81442.00	2003-02-03	2022-03-12	86.00	78.00	2022-02-05	2	10	108	23	38	1
38	9175	73076.00	2003-11-14	2017-12-15	82.00	47.00	2022-03-25	6	23	67	16	117	2
39	4311	56534.00	2007-03-10	2021-07-20	47.00	11.00	2014-02-13	2	24	56	17	141	1
40	3857	2269.00	2006-04-06	2022-06-11	48.00	18.00	2015-03-09	4	2	26	6	52	2
41	2872	61684.00	2007-02-26	2015-12-10	44.00	16.00	2016-03-11	4	16	79	23	170	1
42	6169	37177.00	2010-06-12	2014-03-08	65.00	90.00	2022-02-18	2	15	170	35	153	1
43	9764	72247.00	2006-10-30	2015-03-09	75.00	98.00	2012-01-06	9	6	75	23	98	2
44	1164	52226.00	2006-12-21	2017-02-11	50.00	73.00	2017-05-16	7	16	57	23	141	1
45	2646	99716.00	2008-02-21	2018-02-02	28.00	74.00	2016-04-09	12	11	195	28	153	1
46	9498	29516.00	2005-11-18	2013-11-27	18.00	90.00	2013-08-20	3	21	177	2	167	2
47	4622	85171.00	2011-03-28	2013-12-21	89.00	52.00	2017-12-03	8	15	14	6	74	1
48	2802	53449.00	2011-11-07	2017-09-05	67.00	78.00	2015-04-23	11	23	24	3	154	1
49	605	77680.00	2007-04-19	2014-05-11	52.00	22.00	2022-01-17	7	5	151	36	69	2
50	8382	51664.00	2011-04-23	2017-02-28	99.00	67.00	2020-11-28	6	15	13	22	82	1
51	1876	10957.00	2006-02-15	2021-03-17	22.00	3.00	2016-06-03	6	11	98	18	50	2
52	2767	90523.00	2004-07-20	2022-03-14	55.00	64.00	2011-05-29	6	6	82	33	164	1
53	4012	55757.00	2012-03-28	2022-04-26	78.00	36.00	2017-02-13	12	4	175	13	150	1
54	1956	19834.00	2009-08-11	2018-09-23	25.00	31.00	2011-08-23	3	11	173	18	131	2
55	7922	60575.00	2008-08-05	2019-12-19	76.00	62.00	2020-07-22	4	6	21	10	101	2
56	6089	19720.00	2010-08-14	2020-09-27	7.00	30.00	2017-03-13	9	7	66	5	84	1
57	6199	64695.00	2005-03-04	2016-02-22	19.00	44.00	2013-12-21	9	21	8	9	171	1
58	8162	13821.00	2011-08-19	2021-08-19	74.00	32.00	2021-08-17	10	22	149	23	36	2
59	373	22920.00	2007-10-27	2015-09-24	12.00	75.00	2017-10-26	6	2	138	25	105	2
60	189	8765.00	2005-11-20	2014-10-10	55.00	69.00	2012-02-12	9	11	51	9	5	1
61	7863	47088.00	2010-09-08	2021-09-27	57.00	29.00	2019-07-30	7	21	161	19	196	1
62	5293	97177.00	2012-05-09	2016-01-22	89.00	50.00	2014-02-02	5	6	14	37	14	2
63	8143	88957.00	2010-10-07	2019-06-09	68.00	36.00	2014-12-06	11	3	61	39	60	1
64	4503	29302.00	2007-08-25	2015-04-12	54.00	83.00	2011-10-27	11	16	174	18	34	2
65	3993	65302.00	2007-08-09	2016-06-10	93.00	6.00	2017-04-15	6	19	188	38	82	1
66	3692	81971.00	2007-04-02	2016-05-15	87.00	86.00	2016-09-10	9	20	79	20	164	1
67	4809	7782.00	2011-04-22	2019-10-25	37.00	24.00	2021-02-10	4	23	57	3	98	1
68	3385	32905.00	2005-04-21	2014-05-05	86.00	91.00	2011-07-06	8	10	144	14	1	2
69	3971	21724.00	2012-07-06	2019-04-19	50.00	25.00	2015-04-18	7	11	107	8	133	1
70	21	16594.00	2004-11-12	2018-10-23	20.00	69.00	2014-01-28	6	9	98	26	42	2
71	3621	9443.00	2005-03-30	2019-03-05	22.00	38.00	2013-11-23	3	9	70	16	93	2
72	9627	59385.00	2008-03-09	2014-08-24	77.00	42.00	2013-05-23	2	14	37	23	160	2
73	7393	87201.00	2003-09-29	2022-03-24	44.00	34.00	2013-09-13	10	23	79	31	10	2
74	8318	7343.00	2010-06-03	2018-08-27	73.00	74.00	2022-10-29	12	24	122	33	42	2
75	7276	90732.00	2005-10-02	2019-09-21	54.00	26.00	2013-06-15	8	10	63	20	153	1
76	6595	71991.00	2009-02-26	2015-09-08	19.00	68.00	2014-01-14	3	9	132	4	37	1
77	898	41280.00	2004-04-11	2016-08-10	88.00	98.00	2019-09-15	10	19	125	14	125	2
78	6503	83679.00	2006-07-03	2022-02-24	47.00	67.00	2016-03-09	4	10	152	23	145	1
79	2999	13983.00	2008-03-02	2018-10-30	56.00	25.00	2021-03-04	10	14	74	15	12	1
80	3749	89557.00	2005-02-11	2019-07-03	4.00	44.00	2022-07-30	11	8	118	38	184	2
81	4742	14036.00	2012-07-25	2022-02-14	27.00	19.00	2020-02-17	10	5	180	23	148	2
82	2322	36792.00	2007-05-11	2012-11-19	2.00	60.00	2011-04-18	12	23	99	3	67	2
83	5871	56031.00	2004-08-18	2020-07-06	18.00	15.00	2017-10-02	12	23	79	33	86	1
84	3557	78268.00	2003-11-21	2021-07-28	96.00	76.00	2012-12-12	4	5	93	25	20	2
85	899	93367.00	2004-07-27	2014-10-01	88.00	31.00	2016-09-29	8	19	16	37	23	2
86	3967	8350.00	2003-12-02	2013-04-13	37.00	95.00	2019-08-15	2	25	8	9	149	1
87	1397	27683.00	2005-10-10	2015-08-01	57.00	43.00	2022-06-28	3	8	146	9	104	2
88	5347	15797.00	2009-03-05	2022-11-02	74.00	50.00	2015-04-17	8	18	111	13	191	2
89	337	13447.00	2004-03-21	2015-09-06	81.00	22.00	2015-08-11	7	4	114	12	58	1
90	7060	27238.00	2012-07-31	2018-05-26	90.00	75.00	2012-07-22	8	8	192	11	8	1
91	8920	8792.00	2010-01-09	2017-11-03	98.00	77.00	2015-12-12	12	23	81	13	156	2
92	5015	89678.00	2005-08-17	2016-09-27	33.00	4.00	2017-06-04	12	17	6	35	158	1
93	6811	28925.00	2010-02-14	2020-05-07	75.00	75.00	2014-07-27	5	2	185	25	20	2
94	9319	84036.00	2011-10-03	2022-06-08	32.00	15.00	2018-01-13	5	24	64	18	115	1
95	1641	10271.00	2008-03-26	2020-07-06	24.00	48.00	2019-02-07	4	12	198	3	81	1
96	3383	2654.00	2010-10-21	2021-10-05	53.00	35.00	2021-04-20	2	3	51	25	13	1
97	6772	19982.00	2006-11-28	2020-05-18	46.00	34.00	2011-07-28	4	19	45	14	42	2
98	3503	92953.00	2009-05-10	2017-07-14	62.00	100.00	2011-10-06	2	8	154	17	19	2
99	8642	85046.00	2011-02-06	2016-11-20	11.00	26.00	2011-05-18	12	18	16	12	84	1
100	9891	84405.00	2006-03-30	2016-10-03	85.00	11.00	2022-05-29	4	8	144	14	164	2
101	7384	52337.00	2003-02-14	2020-11-03	32.00	51.00	2019-06-24	12	16	115	12	44	2
102	799	68671.00	2005-12-08	2015-02-07	54.00	94.00	2016-03-21	6	15	171	17	69	2
103	9158	96685.00	2004-06-13	2017-11-15	39.00	88.00	2021-04-10	11	14	187	29	181	2
104	557	25254.00	2003-11-12	2020-11-20	18.00	7.00	2013-08-15	12	25	60	40	17	2
105	8366	29089.00	2012-03-17	2017-05-04	81.00	51.00	2017-05-11	13	18	94	20	37	1
106	1719	50573.00	2009-09-24	2021-04-28	49.00	44.00	2014-04-17	5	6	142	6	82	1
107	3710	8925.00	2009-12-20	2021-09-17	19.00	78.00	2017-05-20	8	4	177	15	90	2
108	4712	22099.00	2004-03-27	2015-02-28	63.00	25.00	2017-02-05	2	20	69	23	29	2
109	719	62467.00	2012-09-19	2016-05-16	88.00	44.00	2018-07-24	10	17	60	39	42	1
110	5	28545.00	2010-12-04	2019-08-31	22.00	10.00	2022-10-18	11	4	164	12	162	2
111	1503	76324.00	2007-04-24	2017-04-02	75.00	3.00	2021-04-09	13	5	82	7	192	1
112	264	39545.00	2005-09-15	2019-03-21	11.00	27.00	2014-10-29	10	24	71	11	124	1
113	2032	84114.00	2010-01-31	2013-02-26	75.00	12.00	2016-05-27	11	4	174	3	51	1
114	3039	78514.00	2009-03-23	2015-04-26	25.00	20.00	2013-08-30	9	3	95	24	134	2
115	2393	19558.00	2011-04-01	2013-10-12	32.00	84.00	2012-02-08	5	19	171	19	62	2
116	5771	50474.00	2011-12-09	2019-02-16	67.00	72.00	2017-04-24	4	5	46	2	5	2
117	3393	18677.00	2002-12-25	2013-07-17	34.00	95.00	2016-05-06	10	14	84	3	19	1
118	1028	94908.00	2007-03-15	2020-02-02	32.00	93.00	2011-07-25	9	12	103	6	59	1
119	6958	2529.00	2012-02-14	2020-06-13	57.00	27.00	2019-03-21	12	8	156	9	106	1
120	6872	96649.00	2008-05-07	2018-01-15	28.00	97.00	2016-07-17	6	23	98	28	107	2
121	4744	45760.00	2012-01-26	2021-04-06	64.00	45.00	2021-11-16	11	14	168	22	143	1
122	3129	85769.00	2012-03-06	2018-11-08	61.00	49.00	2013-09-07	7	8	86	30	173	2
123	8645	42541.00	2005-03-24	2022-10-19	7.00	62.00	2013-01-17	3	7	3	30	61	1
124	5603	65476.00	2011-05-06	2019-07-11	72.00	43.00	2016-03-09	13	16	79	26	191	2
125	8474	90778.00	2004-03-13	2022-01-29	61.00	83.00	2019-06-26	8	5	126	11	109	2
126	4209	7606.00	2012-07-31	2020-11-02	93.00	14.00	2019-01-09	2	21	90	7	9	1
127	9172	22266.00	2004-10-18	2013-06-21	86.00	55.00	2021-09-22	6	20	176	32	129	2
128	3938	19108.00	2007-04-16	2017-04-01	65.00	97.00	2017-12-26	5	17	90	16	143	1
129	5650	63733.00	2008-10-20	2019-09-26	97.00	40.00	2022-03-28	9	24	18	37	98	1
130	8990	43588.00	2008-11-16	2018-10-05	43.00	85.00	2012-01-26	12	24	28	24	133	2
131	8139	90042.00	2004-05-23	2018-02-14	82.00	55.00	2018-08-22	5	12	117	12	194	1
132	9920	50022.00	2009-10-15	2014-07-31	5.00	88.00	2021-05-29	7	14	135	27	200	1
133	7874	88225.00	2007-05-23	2021-06-15	37.00	14.00	2021-09-22	10	16	82	17	134	1
134	4765	91201.00	2006-05-31	2015-10-21	80.00	51.00	2014-12-09	8	19	155	23	4	1
135	2407	40914.00	2012-09-20	2016-02-14	6.00	46.00	2012-04-14	11	8	145	34	157	2
136	7143	56302.00	2011-04-20	2012-11-05	52.00	30.00	2018-11-02	9	21	186	30	48	2
137	5612	13229.00	2007-10-31	2020-01-25	21.00	20.00	2016-06-19	11	23	79	16	24	1
138	8714	12091.00	2007-05-07	2019-06-10	38.00	33.00	2016-09-08	4	12	112	37	33	1
139	8021	16389.00	2006-01-15	2013-08-01	76.00	75.00	2019-12-10	11	17	197	16	106	2
140	7656	14270.00	2009-01-31	2014-02-14	66.00	27.00	2016-02-12	2	23	130	2	60	2
141	6821	38369.00	2011-05-14	2014-02-24	22.00	80.00	2021-10-14	12	23	77	8	135	1
142	4842	2673.00	2003-06-07	2020-10-15	25.00	76.00	2012-02-09	3	20	104	6	127	1
143	5098	69976.00	2010-02-19	2015-11-30	73.00	82.00	2020-06-07	10	14	78	2	80	1
144	815	24751.00	2009-04-27	2013-05-02	11.00	96.00	2020-01-29	9	17	99	34	156	2
145	3485	10203.00	2003-02-15	2014-09-21	63.00	62.00	2011-03-04	12	15	32	32	86	2
146	2902	35938.00	2007-08-12	2019-01-29	65.00	98.00	2015-05-29	2	22	33	39	154	1
147	3680	46316.00	2007-01-22	2015-04-03	63.00	45.00	2020-01-26	7	19	110	38	32	2
148	5605	69493.00	2012-07-14	2012-12-04	7.00	87.00	2019-03-04	7	21	147	6	81	2
149	8395	36787.00	2007-04-20	2015-09-27	73.00	73.00	2018-05-29	6	17	200	19	106	2
150	2109	11306.00	2007-12-07	2020-12-29	59.00	30.00	2020-09-10	9	19	8	11	71	2
151	8623	63014.00	2012-05-29	2014-04-20	90.00	22.00	2021-12-11	2	17	156	6	52	1
152	3964	25323.00	2011-03-27	2018-04-18	34.00	61.00	2011-10-18	3	18	20	21	172	1
153	1973	96939.00	2008-10-21	2017-12-12	87.00	59.00	2022-02-11	12	6	114	10	117	1
154	7612	40361.00	2005-08-10	2022-03-18	2.00	42.00	2021-09-18	13	20	94	34	3	2
155	130	66972.00	2011-12-27	2019-05-18	98.00	98.00	2013-11-19	6	19	131	27	68	2
156	6773	3102.00	2008-03-15	2017-09-09	73.00	26.00	2022-02-21	10	11	5	2	30	2
157	1131	9066.00	2011-03-22	2015-03-09	26.00	57.00	2011-06-30	12	2	155	28	56	1
158	6614	3202.00	2010-12-26	2020-08-19	55.00	31.00	2015-07-15	9	18	2	17	177	1
159	6731	63775.00	2003-03-21	2016-04-17	56.00	57.00	2016-04-16	11	8	165	35	148	1
160	106	78155.00	2009-07-14	2022-07-14	37.00	22.00	2016-07-18	6	5	63	31	93	1
161	3457	48309.00	2005-11-28	2016-12-04	12.00	90.00	2020-02-29	2	2	31	6	95	1
162	490	53859.00	2006-09-15	2018-11-07	18.00	9.00	2012-09-09	10	8	95	13	37	2
163	7504	42487.00	2005-09-09	2016-11-18	18.00	50.00	2022-01-29	3	9	5	6	63	1
164	4974	29340.00	2003-02-16	2013-06-09	69.00	64.00	2016-01-11	5	12	99	19	123	2
165	3570	45248.00	2003-03-14	2021-03-20	7.00	75.00	2018-02-14	8	12	149	17	38	1
166	9967	86248.00	2004-11-24	2014-02-26	71.00	95.00	2013-08-22	7	18	102	29	98	1
167	5986	62785.00	2010-04-02	2022-09-27	39.00	11.00	2012-04-21	10	21	127	8	173	1
168	2926	656.00	2004-06-01	2020-04-07	34.00	10.00	2015-10-09	6	16	129	2	135	2
169	5848	46774.00	2012-06-07	2019-08-03	12.00	7.00	2011-06-08	2	11	114	35	20	1
170	7196	71076.00	2008-08-14	2020-06-28	60.00	45.00	2011-06-25	4	24	39	6	79	2
171	1068	16164.00	2012-10-16	2016-01-27	7.00	85.00	2021-03-06	6	22	101	3	117	1
172	9319	71611.00	2007-05-05	2016-12-23	97.00	99.00	2014-08-09	11	9	165	10	73	2
173	2546	18982.00	2010-12-10	2021-05-08	79.00	12.00	2014-01-20	10	6	86	21	60	1
174	6599	70229.00	2007-05-14	2016-12-14	45.00	72.00	2015-12-02	5	24	99	9	175	2
175	3588	96761.00	2008-07-03	2018-11-11	32.00	95.00	2020-11-28	3	22	96	40	78	1
176	7601	8467.00	2003-02-14	2020-11-07	15.00	80.00	2016-08-01	6	18	158	2	119	2
177	7307	37995.00	2009-02-03	2016-02-25	28.00	37.00	2022-07-23	4	13	29	36	77	1
178	4540	94653.00	2006-07-23	2018-01-13	87.00	56.00	2021-12-20	4	24	173	26	25	2
179	5337	94321.00	2002-12-11	2018-01-28	40.00	23.00	2020-01-03	3	14	79	30	70	1
180	514	21962.00	2003-08-13	2013-10-14	43.00	11.00	2013-09-26	10	13	37	33	128	1
181	3040	35425.00	2006-10-07	2013-05-26	93.00	98.00	2017-06-30	11	25	158	27	169	1
182	1446	50284.00	2008-04-06	2016-07-06	11.00	97.00	2017-12-09	12	2	9	12	26	2
183	7495	37130.00	2009-08-23	2018-10-28	88.00	58.00	2012-07-26	3	15	67	38	139	1
184	8541	93346.00	2011-09-07	2022-08-09	95.00	7.00	2015-11-08	3	6	82	30	66	1
185	8567	63385.00	2004-06-01	2016-04-08	53.00	80.00	2016-01-15	13	15	125	8	91	2
186	8360	6072.00	2009-10-23	2017-03-25	30.00	46.00	2021-07-05	3	2	172	35	47	2
187	5684	720.00	2010-11-25	2015-02-02	22.00	54.00	2017-02-07	9	19	32	33	140	1
188	9166	79788.00	2007-08-23	2016-06-24	70.00	62.00	2020-10-27	10	24	143	32	113	2
189	3726	443.00	2009-11-18	2017-07-08	78.00	86.00	2011-10-08	8	24	110	13	93	2
190	3774	47578.00	2005-08-21	2019-05-03	8.00	25.00	2015-03-11	7	18	101	34	110	2
191	4379	41850.00	2004-01-10	2019-05-06	3.00	25.00	2013-03-08	3	15	147	40	85	2
192	5213	79776.00	2007-11-16	2019-05-04	61.00	6.00	2015-06-25	3	20	8	26	28	1
193	9894	58497.00	2009-02-24	2022-07-20	69.00	95.00	2016-12-14	8	15	189	39	184	1
194	4068	98593.00	2006-09-25	2013-09-24	75.00	8.00	2016-12-20	2	21	76	17	105	2
195	6988	59957.00	2007-10-05	2014-07-31	3.00	43.00	2017-02-27	7	10	102	4	160	2
196	7741	25505.00	2012-09-24	2015-09-03	3.00	97.00	2017-11-12	12	3	133	1	145	2
197	9306	19502.00	2006-09-03	2016-02-26	38.00	90.00	2017-07-13	6	3	52	29	62	2
198	9219	83395.00	2005-05-18	2016-09-18	100.00	74.00	2018-04-22	7	6	124	11	196	1
199	8927	32079.00	2005-02-04	2014-01-29	60.00	24.00	2019-01-14	4	17	115	20	48	2
200	3549	32933.00	2004-02-11	2012-12-07	100.00	15.00	2011-04-23	3	6	89	11	106	1
201	5749	43365.00	2008-12-30	2012-11-20	17.00	31.00	2019-02-21	10	16	120	18	178	2
202	9652	91512.00	2005-11-08	2017-07-10	59.00	25.00	2020-06-16	3	20	158	31	140	2
203	5233	77348.00	2006-01-13	2018-01-23	47.00	93.00	2021-01-13	9	17	18	6	77	2
204	3676	15843.00	2005-02-14	2017-02-27	36.00	36.00	2014-08-12	7	18	94	8	13	1
205	7177	5020.00	2009-12-22	2017-08-17	1.00	74.00	2017-02-11	11	4	155	20	109	1
206	3856	55110.00	2007-02-25	2019-04-22	98.00	48.00	2022-03-04	11	6	141	5	172	2
207	1289	60577.00	2011-06-08	2013-09-11	47.00	84.00	2018-07-16	4	22	41	33	105	1
208	2346	93542.00	2005-03-02	2022-04-05	56.00	19.00	2021-03-24	1	1	23	4	4	2
209	7002	27799.00	2003-07-31	2014-08-10	74.00	67.00	2019-12-06	5	10	105	4	26	2
210	6645	48508.00	2011-07-17	2019-05-15	48.00	13.00	2021-04-28	10	6	115	3	63	1
211	4078	31264.00	2006-04-22	2013-04-06	48.00	24.00	2019-03-15	4	2	59	20	142	2
212	9502	53869.00	2009-12-20	2017-09-20	81.00	33.00	2020-09-09	3	24	151	22	155	2
213	7952	46045.00	2002-12-17	2022-03-27	59.00	36.00	2020-12-02	9	12	124	4	56	1
214	5329	1643.00	2006-09-29	2013-03-20	88.00	37.00	2018-07-22	10	17	59	39	11	1
215	736	2715.00	2008-09-07	2014-03-01	64.00	34.00	2014-12-31	5	18	190	5	123	1
216	3716	79537.00	2009-11-28	2018-03-08	20.00	71.00	2015-08-14	2	23	21	14	149	1
217	5126	63317.00	2012-03-20	2014-05-21	67.00	44.00	2015-10-08	7	13	49	2	180	1
218	4206	57563.00	2009-02-23	2013-12-13	34.00	83.00	2014-02-26	9	15	150	27	67	2
219	4715	67446.00	2003-06-07	2020-09-19	6.00	97.00	2013-01-05	4	14	27	35	24	2
220	925	94883.00	2011-03-22	2022-10-09	46.00	42.00	2015-06-12	9	24	147	29	158	1
221	3227	41453.00	2011-05-08	2013-01-22	75.00	15.00	2021-01-26	11	16	60	33	70	1
222	4082	75943.00	2006-08-26	2017-10-06	36.00	26.00	2013-07-11	12	25	100	22	63	1
223	8747	88105.00	2012-05-02	2020-06-10	14.00	58.00	2017-01-12	1	10	125	12	110	2
224	4716	44226.00	2005-08-04	2014-02-19	88.00	47.00	2021-07-07	12	19	85	8	64	2
225	9049	90999.00	2011-07-11	2016-01-11	32.00	99.00	2020-11-27	3	18	132	34	45	1
226	2543	68001.00	2011-04-08	2016-02-17	3.00	96.00	2015-06-09	10	18	76	4	27	2
227	5643	80711.00	2011-01-27	2019-08-10	37.00	4.00	2018-01-23	6	7	36	13	170	2
228	102	78687.00	2011-01-21	2017-12-11	92.00	44.00	2016-04-24	4	5	181	38	81	2
229	8174	2898.00	2006-06-05	2016-10-23	12.00	56.00	2020-03-04	4	19	138	3	88	1
230	6395	34959.00	2004-04-16	2019-07-05	31.00	4.00	2014-08-08	7	12	175	6	153	1
231	4721	13975.00	2011-07-30	2014-07-23	42.00	96.00	2020-05-20	12	2	100	37	64	2
232	9206	10503.00	2007-12-31	2014-04-12	59.00	63.00	2016-07-09	12	14	7	38	39	2
233	9910	9081.00	2005-01-04	2019-11-14	20.00	82.00	2015-10-26	5	3	171	19	106	1
234	7389	34310.00	2009-05-15	2015-10-20	69.00	82.00	2011-06-29	2	12	110	10	103	2
235	1136	15322.00	2012-07-27	2018-02-24	34.00	3.00	2012-09-24	10	17	158	37	194	1
236	3869	88652.00	2006-06-28	2016-07-19	64.00	2.00	2014-01-18	12	7	115	11	28	2
237	4710	68086.00	2009-06-04	2013-07-11	31.00	13.00	2013-05-09	10	5	128	30	164	1
238	6193	21876.00	2009-10-13	2021-05-04	97.00	21.00	2021-04-28	12	14	25	34	15	1
239	3250	62176.00	2004-07-15	2020-04-28	56.00	90.00	2016-12-02	12	2	127	11	43	1
240	5767	74844.00	2005-04-28	2017-07-22	40.00	36.00	2019-04-14	1	14	138	5	166	2
241	2209	8490.00	2012-07-01	2020-05-02	34.00	17.00	2019-02-05	4	22	137	4	184	2
242	6896	64709.00	2006-08-03	2018-07-03	23.00	12.00	2019-04-28	3	16	43	22	158	1
243	7779	64906.00	2006-11-07	2016-07-17	93.00	57.00	2019-07-28	4	18	153	37	56	2
244	1179	65729.00	2012-02-26	2016-06-08	62.00	4.00	2018-11-01	9	7	108	6	126	2
245	7964	56749.00	2006-11-26	2020-03-25	100.00	43.00	2014-01-30	2	12	86	2	10	1
246	1008	92529.00	2005-10-31	2018-08-09	98.00	43.00	2017-04-06	12	13	135	2	179	2
247	9570	37988.00	2011-02-15	2015-03-16	36.00	83.00	2021-12-28	10	2	24	18	35	1
248	287	15754.00	2008-12-13	2020-02-08	36.00	42.00	2021-10-28	8	9	126	6	103	2
249	9109	65973.00	2011-11-14	2015-12-05	37.00	34.00	2016-02-02	1	5	194	16	162	2
250	1048	78853.00	2012-02-26	2014-02-27	99.00	95.00	2011-07-02	4	11	138	7	4	1
251	6008	5123.00	2005-10-28	2021-03-21	37.00	71.00	2019-06-05	3	6	17	2	126	2
252	8484	41835.00	2011-02-19	2019-11-03	14.00	63.00	2018-05-31	13	12	79	23	17	2
253	2	13905.00	2005-12-24	2020-04-01	3.00	43.00	2012-06-06	6	24	137	18	12	2
254	2375	183.00	2003-10-05	2013-08-12	61.00	31.00	2013-09-05	4	14	185	38	178	2
255	3545	4164.00	2004-11-18	2015-09-25	7.00	46.00	2019-11-16	2	7	59	16	177	2
256	3650	70189.00	2008-04-28	2016-05-20	22.00	72.00	2016-01-11	8	20	10	27	27	1
257	1719	54284.00	2005-05-14	2020-07-30	44.00	69.00	2022-01-28	8	19	72	1	48	1
258	1952	75969.00	2004-12-31	2015-11-22	64.00	91.00	2020-12-04	7	17	130	24	186	2
259	8277	66581.00	2011-04-27	2022-02-01	62.00	100.00	2016-03-08	12	2	89	3	142	2
260	7982	43205.00	2008-11-13	2021-02-02	37.00	25.00	2020-07-10	2	19	4	13	44	2
261	2277	48752.00	2007-04-25	2018-06-19	69.00	20.00	2019-04-21	1	7	83	31	87	2
262	6825	2625.00	2012-04-19	2013-04-01	39.00	81.00	2020-06-12	10	6	197	14	37	2
263	3443	61517.00	2007-07-10	2020-09-26	86.00	92.00	2016-11-03	12	5	200	17	108	1
264	3156	36185.00	2002-11-16	2017-12-08	79.00	43.00	2021-02-01	2	24	16	20	121	1
265	4437	98167.00	2009-11-24	2021-11-15	82.00	37.00	2022-07-07	6	19	190	19	131	1
266	4434	61163.00	2012-04-12	2013-05-14	7.00	88.00	2021-07-29	8	9	117	11	66	2
267	2337	82060.00	2006-06-23	2016-04-09	79.00	44.00	2011-03-14	6	17	187	3	127	1
268	2038	60583.00	2012-10-25	2016-08-22	77.00	97.00	2016-05-01	2	6	91	12	65	1
269	6182	59755.00	2007-03-15	2018-07-13	83.00	83.00	2022-01-11	4	5	197	28	161	1
270	4769	17535.00	2006-01-24	2015-06-08	25.00	35.00	2013-02-23	9	22	181	11	160	1
271	6386	15463.00	2004-10-14	2018-08-09	70.00	60.00	2017-01-28	7	20	194	33	102	2
272	2971	51308.00	2003-04-06	2013-06-27	86.00	11.00	2019-03-14	11	20	71	28	40	2
273	6082	31946.00	2003-10-01	2015-01-30	38.00	38.00	2013-12-05	5	12	95	4	115	2
274	1933	70675.00	2012-03-14	2016-04-04	2.00	31.00	2015-05-29	8	5	134	29	46	1
275	5737	47089.00	2008-09-05	2015-12-03	85.00	57.00	2014-12-21	10	9	81	17	45	1
276	1337	11995.00	2009-05-26	2018-11-01	84.00	83.00	2014-05-31	10	25	74	18	86	2
277	3911	24284.00	2007-01-24	2021-03-09	35.00	32.00	2014-11-08	6	5	84	38	140	2
278	9650	18506.00	2010-04-21	2014-03-15	73.00	18.00	2013-12-04	10	3	62	30	36	2
279	9537	31570.00	2012-08-31	2020-09-23	69.00	86.00	2022-05-18	2	6	88	3	110	2
280	3055	95579.00	2007-01-07	2017-09-10	4.00	79.00	2017-02-26	13	17	9	27	180	1
281	6825	63967.00	2006-10-12	2020-03-29	19.00	64.00	2012-01-03	6	13	115	17	51	2
282	9096	73433.00	2010-02-22	2014-04-21	6.00	51.00	2013-05-12	8	22	4	14	91	2
283	7983	27900.00	2004-07-05	2016-09-05	46.00	34.00	2018-06-07	6	15	77	13	138	1
284	4496	89425.00	2011-11-14	2020-11-28	38.00	94.00	2012-08-22	12	21	4	18	35	1
285	1332	20274.00	2007-10-27	2019-09-07	90.00	40.00	2017-11-09	2	10	7	23	116	1
286	1615	2746.00	2005-12-27	2019-10-30	48.00	42.00	2014-11-26	10	7	60	7	94	2
287	1791	43531.00	2010-01-12	2022-09-11	55.00	73.00	2012-03-03	12	4	140	30	76	2
288	56	81970.00	2009-10-03	2017-05-23	45.00	35.00	2019-07-18	6	24	26	25	188	2
289	4914	62879.00	2008-03-21	2020-03-01	12.00	94.00	2013-02-26	3	12	56	16	101	1
290	3530	87901.00	2012-03-08	2013-04-18	35.00	10.00	2014-06-27	12	9	178	36	139	2
291	2233	82754.00	2003-05-19	2019-09-03	11.00	87.00	2012-01-07	10	10	119	27	141	1
292	7718	49154.00	2011-02-28	2020-10-09	14.00	90.00	2020-04-23	10	13	84	5	161	2
293	359	7332.00	2010-10-15	2021-02-13	82.00	20.00	2022-08-25	5	21	88	12	43	2
294	9792	14350.00	2007-08-28	2018-10-21	81.00	81.00	2011-08-09	12	5	161	12	63	2
295	162	25893.00	2009-04-12	2013-05-13	33.00	73.00	2016-07-11	2	14	11	23	51	1
296	3104	2800.00	2011-06-24	2021-10-31	47.00	17.00	2018-10-21	13	14	61	37	137	2
297	6118	63116.00	2006-10-27	2020-07-29	39.00	8.00	2011-01-10	8	20	23	8	136	1
298	9674	35328.00	2012-03-26	2020-03-28	63.00	86.00	2014-03-31	10	15	73	7	8	1
299	2111	71449.00	2005-04-19	2019-09-18	56.00	8.00	2020-06-20	11	19	145	31	148	1
300	2194	13033.00	2003-04-02	2013-04-10	52.00	62.00	2022-09-21	5	17	67	8	40	1
301	5256	42754.00	2011-11-04	2017-05-08	18.00	97.00	2020-09-25	3	17	88	14	184	2
302	2855	10849.00	2008-11-30	2018-07-18	14.00	64.00	2012-06-16	13	24	26	16	118	1
303	6244	19822.00	2012-07-16	2017-09-26	2.00	83.00	2022-09-16	3	23	160	8	27	1
304	8779	86140.00	2005-10-25	2013-01-16	34.00	94.00	2012-12-10	2	15	86	24	195	1
305	7520	97731.00	2007-04-08	2015-09-25	69.00	76.00	2021-09-12	3	3	59	18	174	2
306	2993	21955.00	2007-07-08	2013-09-09	90.00	43.00	2022-01-06	8	13	176	8	108	2
307	7855	58389.00	2009-12-18	2017-12-23	34.00	31.00	2022-06-19	7	17	197	23	135	1
308	2274	84670.00	2010-04-06	2022-01-28	90.00	30.00	2012-10-15	5	15	174	11	156	2
309	8042	47291.00	2008-08-21	2017-06-30	89.00	59.00	2013-07-28	11	14	7	13	48	1
310	2505	97880.00	2003-06-13	2020-12-09	1.00	67.00	2021-03-23	5	23	139	34	42	2
311	4414	96243.00	2003-11-30	2020-09-02	65.00	5.00	2015-01-01	12	24	122	3	44	1
312	9457	9863.00	2006-10-21	2021-01-05	46.00	18.00	2015-07-07	7	12	157	23	37	1
313	8009	16140.00	2004-06-29	2013-03-08	54.00	82.00	2016-01-23	9	19	136	7	179	2
314	1124	69970.00	2003-07-23	2015-05-25	59.00	87.00	2012-04-13	4	4	77	15	31	1
315	2394	51839.00	2006-06-16	2022-11-11	54.00	61.00	2016-12-13	3	10	20	35	99	1
316	3943	56061.00	2004-11-28	2019-06-18	1.00	34.00	2016-07-29	2	3	153	23	144	1
317	3005	30185.00	2011-01-07	2016-12-22	45.00	53.00	2020-01-25	6	17	120	2	111	2
318	6574	29926.00	2007-06-17	2015-01-14	27.00	45.00	2012-03-04	12	18	117	35	117	1
319	7772	78968.00	2007-09-10	2020-08-26	5.00	3.00	2015-02-15	7	3	27	6	96	2
320	8005	67652.00	2005-09-17	2017-09-02	16.00	64.00	2019-11-13	6	10	167	15	138	1
321	2140	48077.00	2006-04-07	2018-07-21	72.00	89.00	2015-07-24	4	5	31	18	132	1
322	1673	93809.00	2011-03-09	2022-11-06	90.00	44.00	2019-09-17	6	15	145	32	1	2
323	3541	12299.00	2009-11-19	2013-07-23	16.00	4.00	2014-09-05	8	16	102	32	171	1
324	6177	38024.00	2009-11-15	2013-03-09	56.00	47.00	2020-01-03	10	9	166	35	3	2
325	5111	7988.00	2003-08-31	2015-04-05	21.00	20.00	2016-07-29	8	19	15	12	177	1
326	8256	18780.00	2006-09-23	2020-12-03	23.00	14.00	2016-10-14	5	4	147	18	27	2
327	4044	12925.00	2007-10-14	2016-05-03	58.00	74.00	2018-09-27	7	5	112	39	42	1
328	4562	50313.00	2011-08-27	2013-01-21	6.00	27.00	2022-07-29	8	18	64	30	11	2
329	4412	78625.00	2003-05-11	2020-01-09	67.00	97.00	2012-01-01	11	6	75	25	131	2
330	6429	76961.00	2005-10-06	2015-11-15	16.00	92.00	2012-06-09	9	20	175	7	85	2
331	2914	43210.00	2004-09-09	2022-08-30	20.00	85.00	2017-05-31	5	16	96	7	172	1
332	1115	80722.00	2009-06-18	2022-08-14	87.00	71.00	2014-01-15	11	5	194	29	197	1
333	7962	43661.00	2005-03-20	2018-10-19	96.00	13.00	2019-10-30	6	6	188	8	38	1
334	4310	81000.00	2003-01-08	2021-11-30	35.00	31.00	2014-08-09	5	23	45	33	60	2
335	7985	31757.00	2003-07-29	2020-04-26	71.00	94.00	2014-04-03	4	10	21	21	185	1
336	7684	33996.00	2009-05-04	2018-01-15	55.00	3.00	2014-12-14	13	17	94	39	73	1
337	280	87706.00	2010-10-31	2012-12-30	26.00	10.00	2014-12-10	11	25	75	33	87	1
338	4591	81152.00	2012-06-13	2019-02-03	53.00	67.00	2018-11-05	4	17	175	23	32	1
339	2967	15241.00	2006-04-25	2018-03-31	99.00	69.00	2015-01-01	12	4	129	31	68	1
340	569	12436.00	2006-02-26	2016-05-11	14.00	50.00	2017-06-24	5	14	134	9	161	1
341	7194	58318.00	2006-08-30	2021-05-13	26.00	25.00	2011-09-23	3	4	159	32	132	1
342	2377	86648.00	2007-01-15	2015-12-02	11.00	17.00	2014-06-02	6	12	187	34	167	1
343	3859	35355.00	2006-10-24	2021-01-14	87.00	68.00	2013-04-09	11	9	179	34	176	2
344	406	75702.00	2005-03-01	2022-10-27	38.00	20.00	2020-04-09	5	4	129	36	19	2
345	5973	61924.00	2003-01-17	2015-03-29	25.00	51.00	2015-06-12	2	8	63	33	100	1
346	5608	84013.00	2010-03-08	2018-03-11	17.00	29.00	2016-06-07	5	18	75	3	97	1
347	2499	51711.00	2010-05-12	2018-08-21	59.00	4.00	2021-02-14	9	2	157	22	136	2
348	1050	7975.00	2006-01-22	2014-02-20	86.00	31.00	2013-09-19	3	5	154	20	85	2
349	6642	9594.00	2008-06-18	2015-01-28	92.00	42.00	2022-06-18	6	6	113	15	4	1
350	1329	33168.00	2009-11-22	2013-04-25	96.00	73.00	2021-12-20	6	13	67	20	140	2
351	3165	77749.00	2009-07-12	2016-02-06	92.00	89.00	2022-06-06	9	5	16	35	30	1
352	1946	58454.00	2012-05-09	2013-01-24	79.00	84.00	2011-04-12	11	12	22	38	51	2
353	5747	17558.00	2008-12-06	2016-12-13	51.00	57.00	2021-02-26	4	11	57	20	153	1
354	7445	80149.00	2008-08-02	2013-08-14	77.00	4.00	2011-11-15	12	19	39	26	72	2
355	9081	2802.00	2002-12-08	2020-04-28	51.00	42.00	2016-04-12	4	7	188	26	162	2
356	8644	59152.00	2008-11-23	2019-08-07	32.00	36.00	2019-07-14	11	17	77	25	55	2
357	5025	47445.00	2010-03-19	2020-07-14	37.00	71.00	2021-03-18	8	8	130	16	66	2
358	3014	96555.00	2005-02-24	2018-04-02	3.00	22.00	2019-10-25	10	19	132	6	94	2
359	4155	23726.00	2006-12-26	2018-05-24	63.00	17.00	2020-12-26	5	9	38	9	24	2
360	414	95008.00	2004-03-16	2019-09-19	45.00	14.00	2021-05-31	1	17	74	5	143	1
361	1974	12351.00	2008-04-11	2013-07-06	92.00	13.00	2022-02-05	6	9	86	3	177	1
362	4562	54687.00	2010-01-31	2021-06-02	4.00	8.00	2014-05-14	12	1	17	12	193	1
363	1228	93719.00	2004-03-20	2022-08-24	53.00	25.00	2021-08-21	12	13	176	18	2	2
364	8905	28955.00	2011-09-30	2014-09-21	63.00	37.00	2021-10-15	9	20	132	1	175	1
365	8322	55007.00	2012-06-13	2014-12-02	39.00	68.00	2020-08-20	9	9	149	9	107	1
366	3488	16882.00	2011-03-18	2019-07-07	69.00	24.00	2016-07-24	13	15	156	18	95	1
367	2823	68309.00	2006-07-21	2016-05-13	10.00	63.00	2012-01-04	6	18	28	19	164	2
368	6736	15255.00	2003-09-01	2017-11-01	83.00	93.00	2017-07-29	8	25	167	12	147	1
369	7195	85731.00	2003-12-18	2021-04-02	54.00	74.00	2016-01-27	10	19	156	8	198	2
370	1665	67645.00	2004-11-02	2022-06-29	68.00	97.00	2020-04-19	1	17	17	11	8	2
371	639	27109.00	2012-10-28	2021-11-11	75.00	32.00	2013-05-13	3	23	139	14	95	2
372	5704	90823.00	2005-07-31	2016-06-15	98.00	69.00	2020-06-12	2	9	71	25	158	1
373	8981	60644.00	2006-03-14	2019-08-27	6.00	95.00	2011-07-17	7	2	118	8	141	2
374	7062	71674.00	2004-06-20	2021-05-03	8.00	27.00	2012-08-03	5	11	104	24	98	2
375	1381	93603.00	2003-11-21	2021-06-13	74.00	81.00	2020-05-19	6	25	41	38	154	2
376	6762	2352.00	2009-06-21	2018-09-04	10.00	69.00	2020-04-25	11	19	51	32	139	1
377	9159	18049.00	2005-04-07	2017-12-25	24.00	57.00	2011-07-15	10	24	174	31	146	1
378	9064	86321.00	2004-03-02	2020-04-08	26.00	76.00	2021-10-27	1	13	186	6	157	1
379	9353	91508.00	2003-08-18	2021-11-23	70.00	97.00	2013-03-18	9	17	33	9	87	1
380	7184	1191.00	2008-12-25	2022-01-23	34.00	28.00	2017-07-03	7	11	138	20	107	2
381	5355	58757.00	2009-02-23	2016-06-16	42.00	22.00	2012-06-24	6	23	76	20	52	1
382	2163	70713.00	2011-11-02	2013-09-02	17.00	80.00	2019-05-20	12	13	161	16	159	1
383	2558	37398.00	2012-10-15	2021-11-15	3.00	22.00	2017-03-20	12	12	107	20	113	2
384	618	36324.00	2006-12-29	2017-08-13	58.00	47.00	2012-04-25	6	2	94	21	135	2
385	150	93555.00	2010-10-26	2016-09-24	24.00	5.00	2021-10-01	6	17	101	13	16	2
386	6879	32955.00	2011-07-23	2020-07-01	35.00	65.00	2016-02-12	5	7	126	25	3	2
387	8850	76643.00	2008-05-28	2014-09-29	17.00	43.00	2018-09-13	9	17	22	27	161	1
388	4765	95328.00	2009-10-01	2014-07-06	89.00	41.00	2021-12-18	7	13	169	34	2	1
389	4967	70512.00	2010-02-12	2018-10-07	40.00	80.00	2018-04-14	9	22	69	11	147	2
390	1096	10350.00	2004-05-01	2014-11-22	52.00	77.00	2017-09-23	9	8	40	18	169	1
391	1361	37136.00	2011-11-05	2013-12-29	89.00	49.00	2012-01-16	5	24	80	9	138	1
392	2834	67542.00	2011-07-07	2018-05-06	98.00	55.00	2017-02-12	3	16	9	33	125	1
393	9953	24170.00	2006-11-18	2020-12-25	99.00	15.00	2018-12-21	12	15	163	14	145	2
394	3731	64896.00	2006-03-11	2020-04-16	30.00	61.00	2021-06-06	10	8	198	27	65	1
395	6419	4853.00	2010-08-26	2014-01-04	33.00	31.00	2015-09-02	7	24	181	39	175	1
396	2954	75480.00	2003-09-28	2013-09-23	44.00	81.00	2022-05-10	7	13	189	31	57	1
397	5320	13048.00	2012-09-29	2022-01-30	47.00	53.00	2017-11-11	10	19	115	13	179	2
398	1137	38164.00	2008-02-19	2020-05-29	35.00	90.00	2015-01-09	5	11	80	20	23	2
399	8525	45990.00	2007-04-07	2020-12-14	31.00	81.00	2015-06-03	10	11	30	27	170	2
400	3119	5849.00	2008-06-27	2021-06-20	3.00	75.00	2013-07-14	5	2	67	1	177	1
\.


--
-- Data for Name: contracts_statuses; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.contracts_statuses (id, name) FROM stdin;
1	не готов
2	ожидание файлов
3	ожидание отправки СП
4	Суд. приказ отправлен
5	Суд.приказ получен
6	Суд. приказ отменен
7	Иск отправлен
8	Вынесено решение
9	Решение получено
10	Исполнительный лист получен
11	Исп. документ отправлен СПИ
12	ИП возбуждено
13	ИП окончено
\.


--
-- Data for Name: court_claims; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.court_claims (id, sum, main, percents, penalties, fee, sending_date, status_date, status_id, type_id, court_id, contract_id, agent_id) FROM stdin;
1	341031.00	37822.00	20963.00	39998.00	8860.00	2012-04-15	2020-11-03	2	2	25	28	86
2	486050.00	1562.00	12698.00	13518.00	1553.00	2020-05-17	2014-02-14	2	1	53	32	159
3	45501.00	32900.00	81590.00	45247.00	1374.00	2012-01-24	2013-09-21	6	1	35	235	42
4	334578.00	21958.00	39218.00	67688.00	8606.00	2017-04-26	2016-01-19	3	1	30	312	23
5	221257.00	90764.00	92357.00	39594.00	7631.00	2022-05-01	2016-04-19	4	2	26	259	110
6	107981.00	42147.00	63515.00	70377.00	2293.00	2020-01-28	2015-12-27	2	1	42	309	171
7	433191.00	61784.00	69871.00	51561.00	8404.00	2018-08-03	2010-06-07	3	1	22	295	73
8	442593.00	20021.00	90628.00	49283.00	2631.00	2018-10-29	2014-10-18	5	1	34	145	38
9	356214.00	28645.00	34029.00	89013.00	1911.00	2021-07-06	2012-09-10	4	2	37	309	164
10	278110.00	73858.00	48172.00	45060.00	8674.00	2014-08-24	2011-07-04	4	2	18	393	194
11	7877.00	50734.00	28406.00	22277.00	8904.00	2018-12-27	2020-06-19	2	2	45	107	86
12	61554.00	28878.00	43025.00	13976.00	229.00	2012-12-20	2015-06-15	2	1	18	259	149
13	163614.00	99778.00	44676.00	47915.00	9699.00	2014-05-18	2011-05-17	3	2	13	210	172
14	21942.00	84690.00	64934.00	37541.00	1132.00	2015-03-13	2018-09-07	4	1	56	35	184
15	243082.00	22395.00	17442.00	25987.00	3397.00	2011-08-05	2019-12-10	4	1	34	160	150
16	350341.00	6542.00	91838.00	82050.00	5505.00	2014-07-04	2020-04-29	6	1	28	80	55
17	181960.00	90032.00	36370.00	26383.00	5707.00	2015-10-27	2012-08-12	2	1	41	373	101
18	100993.00	12308.00	9869.00	89625.00	9252.00	2017-10-21	2015-04-14	2	2	8	241	193
19	6427.00	53464.00	89177.00	9142.00	8398.00	2018-05-01	2017-03-21	3	1	43	222	120
20	443241.00	57101.00	14223.00	48529.00	5706.00	2022-04-27	2017-08-11	2	1	56	297	10
21	433675.00	26316.00	71772.00	79511.00	606.00	2012-03-13	2014-10-27	6	2	49	31	182
22	17919.00	33704.00	13180.00	80077.00	7664.00	2016-04-10	2017-08-23	3	2	20	27	18
23	496706.00	91261.00	69154.00	38460.00	6403.00	2014-03-28	2019-03-19	6	1	36	315	28
24	471443.00	66139.00	59927.00	51401.00	5104.00	2013-09-09	2012-05-06	3	1	12	6	139
25	83982.00	52323.00	558.00	55822.00	2665.00	2021-02-13	2018-09-27	4	2	39	208	97
26	442269.00	53039.00	6037.00	25680.00	1662.00	2014-10-30	2014-11-24	4	2	50	106	172
27	304836.00	77909.00	22148.00	35685.00	3652.00	2014-03-09	2019-03-03	5	1	54	372	129
28	65775.00	81643.00	48891.00	9490.00	2569.00	2018-07-06	2014-08-23	5	2	9	347	67
29	437322.00	50276.00	89107.00	93285.00	2987.00	2016-01-21	2012-06-14	4	2	6	106	43
30	412005.00	42256.00	81767.00	49549.00	8539.00	2012-01-25	2021-11-08	5	2	22	81	146
31	462296.00	61214.00	44342.00	79168.00	8025.00	2014-07-13	2018-08-09	4	1	2	42	200
32	315127.00	15974.00	6147.00	91339.00	3363.00	2019-07-18	2017-08-12	4	1	58	186	78
33	53130.00	94138.00	53711.00	24687.00	8362.00	2019-01-19	2015-12-02	4	2	25	87	144
34	7183.00	20814.00	89903.00	78271.00	5367.00	2012-10-31	2020-10-20	5	2	14	22	7
35	29381.00	36296.00	41187.00	6522.00	6418.00	2012-04-20	2020-06-26	6	1	15	146	80
36	440708.00	35180.00	41657.00	65760.00	6797.00	2016-09-24	2020-07-11	2	1	16	26	85
37	330124.00	70370.00	60793.00	79086.00	9764.00	2014-08-05	2020-06-25	6	1	44	281	24
38	228126.00	14793.00	78936.00	81559.00	6867.00	2012-02-29	2018-08-15	3	2	25	116	78
39	333810.00	83745.00	54245.00	43973.00	9956.00	2020-01-22	2016-05-04	1	1	37	244	199
40	349315.00	70631.00	18957.00	7247.00	3471.00	2011-10-20	2020-08-05	4	1	16	384	17
41	55865.00	87981.00	23149.00	4855.00	4970.00	2015-06-16	2021-10-04	6	1	55	241	36
42	488822.00	93153.00	14060.00	20315.00	7189.00	2020-08-20	2021-01-24	4	2	2	243	28
43	496306.00	482.00	94831.00	72189.00	2574.00	2013-06-05	2017-10-08	6	1	33	155	191
44	165726.00	18814.00	96424.00	92645.00	6147.00	2019-09-29	2011-01-11	4	1	30	342	132
45	454477.00	34919.00	10061.00	16499.00	7859.00	2021-05-20	2018-12-10	2	2	6	240	170
46	371438.00	17131.00	55059.00	35171.00	1699.00	2013-08-10	2020-10-24	4	1	8	271	164
47	153808.00	79164.00	58092.00	67316.00	503.00	2014-10-01	2015-11-06	1	2	60	142	83
48	321708.00	45091.00	93906.00	42399.00	3405.00	2020-09-02	2010-11-14	6	2	43	273	135
49	229844.00	68902.00	92238.00	70509.00	8933.00	2017-05-22	2015-03-29	1	2	37	129	168
50	292451.00	37729.00	98589.00	27255.00	2854.00	2022-10-23	2021-12-22	5	2	20	6	82
51	458795.00	91490.00	21697.00	44154.00	8744.00	2013-09-14	2021-09-27	3	1	11	315	170
52	49805.00	94760.00	30988.00	5622.00	6615.00	2017-08-03	2020-02-10	5	1	17	398	54
53	154595.00	33745.00	63127.00	58296.00	9595.00	2022-09-28	2022-06-26	4	1	9	170	12
54	319245.00	9985.00	49109.00	19204.00	6410.00	2012-10-23	2015-08-27	5	1	1	335	80
55	292699.00	17353.00	12810.00	71083.00	7365.00	2017-05-26	2016-03-20	3	2	3	327	143
56	113937.00	80245.00	15249.00	56948.00	9377.00	2011-06-05	2011-11-03	3	1	31	221	14
57	427011.00	53087.00	44898.00	23871.00	3075.00	2012-10-22	2015-09-23	5	2	13	381	82
58	478448.00	20041.00	671.00	98370.00	7171.00	2012-11-22	2011-12-05	2	2	33	114	11
59	170045.00	69623.00	12824.00	19280.00	3626.00	2014-02-28	2019-08-02	3	2	55	45	170
60	113660.00	26322.00	29090.00	8633.00	3435.00	2014-10-22	2020-06-05	1	2	25	215	76
61	151668.00	20791.00	34820.00	43998.00	2068.00	2017-05-31	2013-05-05	4	2	6	279	162
62	428274.00	32791.00	38574.00	49947.00	4714.00	2016-08-06	2013-06-20	2	2	33	72	99
63	25365.00	69909.00	13833.00	59723.00	9905.00	2014-08-17	2020-09-18	2	2	21	119	57
64	295028.00	92859.00	26503.00	24430.00	3143.00	2015-11-15	2011-09-01	2	1	29	354	116
65	204713.00	14735.00	13429.00	49978.00	5766.00	2019-01-09	2013-03-05	3	1	15	325	139
66	467666.00	93930.00	44812.00	75076.00	624.00	2017-03-03	2018-03-28	3	2	8	67	194
67	391299.00	41242.00	32585.00	35478.00	3184.00	2022-10-30	2018-10-10	4	1	5	322	179
68	110628.00	77817.00	68326.00	15325.00	7369.00	2022-10-18	2017-05-14	3	1	29	120	196
69	62363.00	11528.00	81037.00	86875.00	4006.00	2015-08-28	2014-03-07	5	1	42	12	130
70	297709.00	29560.00	10376.00	27594.00	8953.00	2019-01-30	2013-01-04	1	1	30	294	20
71	168223.00	37135.00	77159.00	28295.00	6558.00	2022-03-11	2015-08-02	5	1	59	176	5
72	145656.00	41972.00	29391.00	16736.00	4920.00	2017-06-09	2016-11-10	2	1	39	237	124
73	19706.00	83717.00	20754.00	47929.00	9186.00	2013-11-13	2018-08-30	2	1	41	234	147
74	427576.00	67437.00	71114.00	50197.00	8982.00	2015-11-07	2021-08-19	3	1	15	224	55
75	27633.00	2283.00	85476.00	20101.00	2989.00	2022-01-30	2015-03-29	2	1	5	251	39
76	356567.00	28322.00	62569.00	53305.00	6386.00	2011-06-24	2015-05-06	6	1	52	100	49
77	323102.00	54147.00	84590.00	21481.00	180.00	2015-08-10	2015-06-02	5	2	3	385	104
78	293566.00	60368.00	18172.00	96589.00	996.00	2013-10-12	2015-01-24	2	1	10	230	92
79	55566.00	49748.00	29697.00	2615.00	3304.00	2016-03-11	2019-12-17	3	2	14	376	125
80	415020.00	24595.00	690.00	95627.00	132.00	2013-10-22	2020-05-20	5	2	9	28	18
81	480880.00	30243.00	23080.00	25383.00	5211.00	2017-02-06	2015-05-02	3	1	55	47	63
82	372076.00	92376.00	52767.00	19387.00	8840.00	2019-09-21	2014-01-27	2	2	59	148	130
83	464559.00	4693.00	54878.00	87994.00	7893.00	2022-10-15	2015-07-25	2	1	3	262	196
84	376587.00	550.00	98748.00	82590.00	8739.00	2016-07-20	2015-01-02	6	1	10	127	192
85	78099.00	76468.00	91981.00	81620.00	6020.00	2018-10-13	2018-12-14	2	1	10	381	131
86	368375.00	38801.00	77147.00	5504.00	8110.00	2021-11-20	2011-04-23	1	1	33	243	121
87	353513.00	5218.00	87012.00	97458.00	3929.00	2013-08-22	2014-07-21	3	2	11	286	97
88	214737.00	90156.00	84831.00	64593.00	8343.00	2013-10-29	2022-06-26	4	1	6	188	17
89	399205.00	53754.00	83100.00	3784.00	8857.00	2016-07-05	2019-09-27	4	1	54	300	73
90	274851.00	70407.00	24275.00	94127.00	5180.00	2015-08-15	2015-06-12	4	1	23	131	193
91	497616.00	35835.00	69212.00	86763.00	7182.00	2016-04-18	2019-11-28	4	2	28	375	88
92	174041.00	86570.00	24604.00	30504.00	8760.00	2018-07-01	2022-07-12	3	1	26	183	172
93	485729.00	71254.00	58177.00	31551.00	6596.00	2022-08-05	2013-09-26	4	2	30	362	30
94	476603.00	27208.00	39261.00	94047.00	1720.00	2022-11-05	2010-07-31	1	2	41	22	144
95	457778.00	44996.00	80056.00	72565.00	1335.00	2014-06-16	2019-09-16	3	2	3	51	190
96	358250.00	51135.00	75829.00	4292.00	2818.00	2012-05-04	2012-06-24	1	1	12	128	117
97	199607.00	26346.00	45236.00	36866.00	1900.00	2012-10-16	2015-09-10	4	1	19	166	99
98	470218.00	14004.00	30883.00	26793.00	7037.00	2013-01-14	2012-11-05	3	2	11	117	54
99	314811.00	99172.00	17745.00	16564.00	5402.00	2013-01-08	2017-06-02	4	2	26	237	149
100	486426.00	4860.00	2213.00	3907.00	6988.00	2022-07-27	2020-02-01	1	1	18	172	32
101	399147.00	33047.00	48429.00	65474.00	7194.00	2012-07-27	2010-10-20	2	1	26	355	190
102	444408.00	27667.00	94331.00	60493.00	2510.00	2014-09-19	2014-03-19	2	1	39	237	68
103	358700.00	17681.00	49428.00	32678.00	1131.00	2012-01-29	2016-03-20	5	2	22	254	12
104	259304.00	25557.00	85092.00	85982.00	7212.00	2020-12-31	2019-12-06	5	2	20	28	169
105	322409.00	92649.00	64439.00	42570.00	3846.00	2016-06-19	2012-12-10	4	1	43	99	62
106	211467.00	9219.00	56461.00	63704.00	4177.00	2013-06-25	2013-08-21	3	2	55	267	170
107	267691.00	28621.00	98616.00	80815.00	5138.00	2021-11-29	2013-06-06	4	1	8	396	122
108	297608.00	62309.00	78464.00	43179.00	6270.00	2017-05-16	2015-02-09	2	1	57	97	136
109	414505.00	53799.00	52872.00	57707.00	2809.00	2011-07-12	2013-12-31	2	1	43	235	52
110	369700.00	20833.00	49160.00	47895.00	4994.00	2019-07-09	2017-12-18	4	2	22	141	131
111	218381.00	2860.00	97967.00	50959.00	4893.00	2012-03-04	2018-06-17	3	2	18	149	143
112	111390.00	39388.00	4804.00	76953.00	1030.00	2013-03-17	2018-03-07	6	2	38	323	178
113	79075.00	4707.00	90764.00	75209.00	6201.00	2014-01-29	2014-12-11	4	1	36	235	34
114	378089.00	9931.00	66280.00	53427.00	3798.00	2019-09-08	2014-01-04	3	1	7	392	115
115	426870.00	28615.00	28579.00	65387.00	1867.00	2016-07-05	2012-02-07	6	1	60	329	114
116	171560.00	90326.00	67372.00	89995.00	9708.00	2014-12-25	2021-06-07	1	2	7	282	17
117	259837.00	95274.00	11064.00	7674.00	7723.00	2021-07-05	2019-08-31	2	1	24	159	74
118	323232.00	61910.00	90307.00	69517.00	5435.00	2018-12-14	2013-03-29	6	2	31	35	61
119	462439.00	50651.00	47563.00	66329.00	7519.00	2022-06-01	2020-03-17	5	1	17	362	87
120	22319.00	95011.00	73209.00	16355.00	8589.00	2018-08-27	2018-02-07	5	1	56	59	181
121	276721.00	70313.00	78778.00	63379.00	7189.00	2012-10-03	2017-11-28	5	2	57	95	60
122	475986.00	84431.00	96015.00	27094.00	6518.00	2011-10-02	2017-03-27	4	1	45	271	175
123	404027.00	42601.00	23678.00	57564.00	4039.00	2021-12-09	2010-07-18	1	1	28	300	32
124	402918.00	91957.00	29080.00	34368.00	9303.00	2012-08-02	2013-06-17	3	2	21	80	160
125	454272.00	38628.00	25649.00	45678.00	8964.00	2014-02-06	2014-10-22	3	1	59	364	103
126	51932.00	76302.00	26838.00	82998.00	1711.00	2020-12-23	2020-12-27	3	1	14	190	73
127	80617.00	33201.00	69831.00	88231.00	4079.00	2020-01-23	2015-11-22	3	2	33	192	111
128	327275.00	60970.00	27006.00	2090.00	8135.00	2014-09-25	2020-09-20	5	2	4	236	43
129	47580.00	94184.00	80786.00	41640.00	8189.00	2022-03-24	2020-05-08	4	1	57	315	171
130	410245.00	17186.00	5301.00	44053.00	7195.00	2021-03-11	2011-03-11	4	2	32	382	195
131	108617.00	4561.00	37652.00	31667.00	8373.00	2020-04-25	2020-08-07	4	2	30	162	160
132	426084.00	78854.00	81826.00	84545.00	4495.00	2011-08-13	2017-07-31	3	2	38	344	108
133	369205.00	81436.00	75579.00	3470.00	6962.00	2014-12-19	2012-06-27	1	1	7	52	198
134	99220.00	18908.00	88494.00	59646.00	6112.00	2019-05-21	2017-02-28	1	1	48	70	9
135	471313.00	89653.00	19780.00	29106.00	9069.00	2014-02-14	2014-10-03	3	2	25	162	195
136	105725.00	3406.00	49687.00	29342.00	8430.00	2011-08-27	2020-11-14	6	2	28	15	8
137	204150.00	84129.00	23364.00	88555.00	5574.00	2017-02-06	2019-02-25	6	1	26	350	176
138	103953.00	79280.00	67138.00	26355.00	2009.00	2014-05-12	2015-01-26	1	2	46	295	162
139	26698.00	49961.00	11243.00	68227.00	3641.00	2021-03-27	2017-10-19	2	1	51	192	55
140	390939.00	59206.00	26716.00	42547.00	5685.00	2014-12-29	2014-06-26	2	2	48	151	45
141	439241.00	42276.00	676.00	14989.00	3836.00	2017-04-17	2011-02-24	1	2	12	90	98
142	375368.00	11642.00	58804.00	70592.00	6487.00	2011-04-29	2015-05-15	4	1	18	181	166
143	250836.00	63347.00	1119.00	72440.00	4145.00	2021-10-16	2017-03-24	2	1	38	335	175
144	479669.00	25037.00	30568.00	11484.00	785.00	2019-04-19	2016-02-01	5	1	44	216	146
145	323603.00	41893.00	93687.00	30678.00	3469.00	2013-04-13	2021-08-12	5	2	8	265	120
146	248023.00	17714.00	94175.00	96195.00	4835.00	2012-10-08	2016-02-15	5	2	17	73	158
147	129589.00	52415.00	54535.00	60617.00	6016.00	2022-05-03	2018-04-30	5	1	21	375	150
148	405792.00	5193.00	83683.00	71299.00	6672.00	2020-08-20	2017-10-28	5	2	51	358	150
149	497305.00	82613.00	96741.00	20009.00	3385.00	2014-08-16	2020-04-16	4	1	20	176	154
150	167023.00	89985.00	6290.00	53030.00	922.00	2011-05-18	2020-10-06	2	1	38	328	137
151	470720.00	59513.00	74254.00	74577.00	8311.00	2022-11-02	2015-07-16	1	1	41	393	96
152	474095.00	7155.00	44431.00	31978.00	9143.00	2022-10-20	2020-09-08	4	2	30	385	155
153	177273.00	6524.00	39218.00	12253.00	2682.00	2013-11-16	2014-01-02	4	1	6	30	16
154	304060.00	69276.00	77726.00	16890.00	7212.00	2017-11-30	2011-04-01	3	2	58	137	112
155	128769.00	97453.00	15701.00	23980.00	6001.00	2018-05-31	2022-07-25	1	1	25	377	199
156	263275.00	77303.00	83549.00	48118.00	5249.00	2014-12-25	2019-10-16	3	2	56	341	157
157	109538.00	60610.00	43149.00	81821.00	5351.00	2015-07-17	2012-10-21	4	1	47	22	3
158	494081.00	70352.00	36849.00	32287.00	4968.00	2021-05-19	2015-02-14	5	2	18	60	63
159	456543.00	58652.00	95153.00	41851.00	4218.00	2022-03-16	2011-10-05	3	1	25	287	113
160	93561.00	54865.00	33206.00	57835.00	1998.00	2017-05-09	2014-11-08	4	2	22	53	128
161	384196.00	75722.00	87669.00	98437.00	536.00	2020-01-13	2020-03-23	2	1	28	178	30
162	390223.00	17372.00	67386.00	97918.00	1241.00	2019-04-20	2012-09-02	2	1	9	85	31
163	226725.00	27530.00	57195.00	13758.00	7036.00	2015-07-05	2015-06-17	5	1	16	369	17
164	150224.00	18071.00	83216.00	82464.00	6802.00	2010-12-25	2012-07-06	5	2	37	120	82
165	118562.00	15629.00	85396.00	7504.00	8587.00	2022-06-10	2013-04-28	1	2	15	56	78
166	4701.00	59873.00	47215.00	43253.00	275.00	2021-09-01	2020-10-09	5	2	47	144	149
167	92566.00	54555.00	72453.00	34905.00	5158.00	2013-03-15	2011-09-12	4	1	56	22	19
168	225289.00	61617.00	29325.00	7447.00	4110.00	2012-08-02	2018-06-06	3	1	40	356	53
169	62393.00	66759.00	11022.00	40760.00	4932.00	2012-08-27	2017-07-18	4	2	9	37	41
170	297074.00	88166.00	50584.00	88650.00	8818.00	2018-07-11	2013-10-10	6	1	3	17	172
171	238527.00	48691.00	20361.00	29767.00	8622.00	2011-03-20	2013-04-09	2	1	26	48	36
172	395496.00	8352.00	77724.00	40839.00	7337.00	2019-03-15	2015-10-21	2	2	8	140	168
173	307474.00	6929.00	79368.00	26998.00	1833.00	2014-12-09	2021-09-28	5	1	37	273	63
174	60411.00	33642.00	48872.00	6078.00	1008.00	2015-11-13	2011-10-18	2	2	54	34	63
175	121796.00	93946.00	27664.00	37435.00	8657.00	2011-06-20	2021-06-26	1	1	58	34	85
176	295467.00	1666.00	82239.00	62836.00	6283.00	2014-12-18	2019-05-25	2	1	17	321	184
177	435575.00	89313.00	55775.00	36487.00	3904.00	2014-06-07	2011-01-23	6	1	41	168	32
178	156428.00	97147.00	34878.00	2135.00	3442.00	2014-08-25	2011-09-02	4	1	60	385	39
179	79024.00	99460.00	84317.00	15627.00	8676.00	2016-12-25	2017-06-18	2	1	20	233	125
180	131339.00	49051.00	79427.00	6208.00	4658.00	2015-02-07	2017-03-07	6	1	56	362	13
181	364253.00	16701.00	84520.00	80893.00	9713.00	2016-05-30	2011-09-12	4	1	4	376	57
182	70965.00	22478.00	61972.00	24307.00	1238.00	2021-09-04	2015-03-25	3	1	21	382	5
183	352143.00	81130.00	42618.00	64942.00	2034.00	2019-03-30	2020-06-02	4	1	5	256	188
184	168244.00	36521.00	63992.00	51382.00	857.00	2013-05-29	2013-02-26	2	2	55	232	124
185	4282.00	25483.00	63073.00	26699.00	177.00	2012-04-24	2020-10-02	4	1	3	308	10
186	267075.00	18658.00	38237.00	20943.00	3438.00	2013-01-15	2016-11-24	2	2	44	333	164
187	181363.00	421.00	20580.00	86232.00	4048.00	2013-11-08	2021-01-17	3	1	49	371	147
188	363565.00	23461.00	72403.00	89750.00	9700.00	2018-03-12	2021-01-02	4	2	4	354	157
189	447523.00	36408.00	77465.00	10866.00	1243.00	2015-07-04	2017-11-10	3	2	2	227	21
190	278037.00	24371.00	27549.00	98936.00	6705.00	2012-09-24	2015-12-25	5	2	6	290	100
191	328421.00	49162.00	34744.00	46676.00	9301.00	2020-08-23	2016-05-23	2	2	8	357	52
192	341900.00	85810.00	49258.00	28946.00	3154.00	2013-07-11	2011-01-18	1	2	53	245	64
193	266942.00	45154.00	29492.00	49569.00	6665.00	2022-01-28	2011-01-01	4	2	33	300	160
194	297066.00	91923.00	82619.00	54996.00	130.00	2017-06-29	2012-03-04	6	1	36	129	23
195	324790.00	79183.00	19387.00	81752.00	3980.00	2020-02-28	2020-03-30	1	1	37	95	147
196	462908.00	91345.00	13840.00	55206.00	8187.00	2017-12-14	2013-01-10	2	1	44	98	98
197	119454.00	25443.00	90352.00	18257.00	7695.00	2012-01-13	2021-01-14	2	2	41	180	43
198	46094.00	60889.00	85711.00	74995.00	144.00	2019-04-15	2012-07-14	3	2	5	136	6
199	318166.00	37274.00	67173.00	68184.00	675.00	2011-01-15	2022-03-17	3	1	11	215	88
200	10335.00	10826.00	15162.00	93959.00	4136.00	2017-07-09	2011-12-21	3	2	50	339	195
201	112010.00	91969.00	81015.00	97725.00	9099.00	2013-06-14	2011-09-01	6	2	45	137	129
202	253852.00	36676.00	74004.00	21301.00	5571.00	2013-01-17	2021-04-20	5	2	10	233	93
203	218781.00	70332.00	73343.00	86579.00	7507.00	2022-11-08	2022-06-24	5	1	13	199	68
204	145111.00	70155.00	9177.00	16951.00	6306.00	2014-08-16	2012-08-14	4	2	54	347	60
205	481658.00	99362.00	10284.00	37259.00	9628.00	2016-03-12	2018-03-14	5	2	47	359	32
206	34787.00	94122.00	78361.00	30248.00	82.00	2013-02-19	2014-10-21	1	2	29	74	80
207	301080.00	30368.00	36762.00	19942.00	5689.00	2014-06-17	2022-08-27	1	2	28	348	110
208	405959.00	54245.00	59293.00	83023.00	8186.00	2016-06-27	2016-03-06	2	1	34	360	159
209	343508.00	25533.00	39563.00	26724.00	5433.00	2018-11-14	2021-02-23	3	1	34	311	145
210	87591.00	9574.00	49004.00	12592.00	686.00	2022-08-11	2014-02-01	3	2	34	180	24
211	324350.00	80580.00	99607.00	86142.00	1085.00	2019-03-30	2014-07-30	4	1	39	314	44
212	433934.00	2104.00	79424.00	91961.00	5750.00	2012-12-05	2014-05-18	5	1	28	239	64
213	123849.00	73481.00	88469.00	69215.00	5895.00	2011-09-21	2016-10-30	3	2	23	42	97
214	236242.00	61058.00	46340.00	16080.00	3578.00	2020-07-13	2021-10-02	4	2	54	177	111
215	161005.00	67774.00	13260.00	18575.00	788.00	2017-12-18	2018-09-03	2	1	13	383	150
216	391018.00	88143.00	17914.00	87352.00	6228.00	2014-07-07	2011-07-27	2	2	53	341	46
217	376993.00	98713.00	88810.00	65215.00	9937.00	2015-05-27	2013-06-19	2	2	21	141	192
218	452238.00	97684.00	45615.00	36241.00	4810.00	2020-08-06	2016-05-07	5	1	45	139	127
219	42017.00	68161.00	50122.00	95293.00	8276.00	2017-04-26	2012-04-12	5	2	6	78	126
220	62873.00	93049.00	33436.00	27176.00	6374.00	2011-02-23	2015-07-26	3	1	31	110	121
221	195708.00	25853.00	70544.00	53816.00	21.00	2015-11-06	2022-05-01	3	1	11	381	87
222	431785.00	73420.00	58174.00	62390.00	3052.00	2018-03-06	2018-01-26	1	1	50	272	127
223	499886.00	26792.00	62921.00	59047.00	2862.00	2020-02-14	2018-03-03	4	1	31	2	172
224	431820.00	92650.00	21158.00	68401.00	9611.00	2022-06-24	2014-10-20	4	2	26	76	51
225	323379.00	77005.00	56774.00	84562.00	9473.00	2021-03-10	2017-02-03	2	1	56	197	144
226	234301.00	47313.00	85568.00	44959.00	5614.00	2020-04-30	2014-08-16	1	2	38	11	143
227	110578.00	35975.00	76555.00	21460.00	8805.00	2020-12-04	2018-02-18	5	2	32	322	1
228	248840.00	62764.00	7574.00	55791.00	225.00	2016-06-12	2013-10-10	4	2	17	168	61
229	18827.00	30256.00	52634.00	68555.00	8693.00	2015-08-31	2019-01-15	6	1	17	378	91
230	44472.00	45075.00	85171.00	567.00	3287.00	2022-10-10	2020-11-26	5	2	33	145	10
231	384400.00	51739.00	11088.00	31737.00	2050.00	2019-08-17	2021-05-24	5	2	45	346	65
232	120570.00	83778.00	51383.00	1831.00	1273.00	2014-07-11	2012-08-28	1	2	30	92	73
233	287933.00	38227.00	34413.00	12334.00	6169.00	2011-12-31	2021-09-02	4	1	41	37	22
234	184189.00	9009.00	98161.00	96584.00	4246.00	2022-07-29	2017-08-20	2	2	47	123	162
235	392379.00	43185.00	4404.00	55652.00	3067.00	2018-08-13	2010-12-31	5	2	11	361	158
236	486155.00	22425.00	52430.00	85340.00	9962.00	2011-11-07	2015-07-07	5	2	49	104	18
237	16561.00	41470.00	69559.00	65136.00	9152.00	2021-03-08	2018-12-01	3	2	29	121	139
238	288344.00	9329.00	98690.00	82270.00	5819.00	2018-10-28	2014-01-24	1	1	55	227	194
239	300633.00	51276.00	3623.00	81388.00	3661.00	2022-03-26	2020-01-09	4	1	25	29	72
240	154045.00	30688.00	14244.00	66477.00	9504.00	2014-06-27	2022-02-22	5	1	4	228	42
241	250643.00	4660.00	31329.00	93146.00	9468.00	2015-01-21	2014-09-24	5	1	31	257	68
242	79535.00	98764.00	98307.00	30688.00	8076.00	2014-12-30	2012-09-02	1	2	18	359	27
243	199038.00	23599.00	71345.00	60132.00	6839.00	2014-06-03	2021-04-30	2	2	1	245	44
244	269321.00	34533.00	3657.00	15895.00	3201.00	2021-06-11	2021-02-15	2	2	7	173	169
245	294985.00	2282.00	52649.00	89802.00	3854.00	2018-12-16	2022-07-07	2	2	2	36	43
246	32267.00	21245.00	16241.00	73530.00	3581.00	2012-04-28	2021-07-01	5	2	28	39	70
247	372186.00	35102.00	89794.00	50377.00	5405.00	2015-07-23	2013-12-13	3	2	17	42	134
248	180003.00	11166.00	41786.00	14092.00	7384.00	2019-08-01	2013-06-23	1	1	7	78	44
249	391618.00	27709.00	7955.00	25940.00	9258.00	2021-01-18	2013-07-29	5	2	10	374	76
250	148128.00	90058.00	81528.00	74442.00	6717.00	2018-09-05	2018-03-15	2	1	32	316	9
251	251970.00	8837.00	47634.00	65743.00	6192.00	2022-07-29	2015-01-13	1	2	40	16	49
252	426708.00	6146.00	357.00	85768.00	7118.00	2019-08-01	2020-12-11	3	2	16	183	99
253	335827.00	30550.00	99134.00	78017.00	3312.00	2018-04-05	2013-05-14	2	1	9	182	85
254	398014.00	8235.00	24703.00	18604.00	2944.00	2020-02-11	2021-03-05	5	2	24	17	28
255	380669.00	3365.00	401.00	75179.00	3446.00	2017-01-30	2012-07-22	4	1	32	271	44
256	494633.00	25673.00	15563.00	49581.00	2487.00	2013-03-06	2010-05-05	2	2	28	267	24
257	25113.00	39615.00	82332.00	931.00	765.00	2017-03-25	2016-02-04	6	2	14	315	156
258	286558.00	80933.00	85683.00	7811.00	2168.00	2018-05-26	2019-01-25	3	2	27	70	65
259	127938.00	46156.00	78569.00	55663.00	9253.00	2014-10-25	2018-05-15	3	2	46	136	173
260	430898.00	77731.00	4848.00	43906.00	4504.00	2019-11-15	2021-08-18	5	2	40	132	145
261	286739.00	2271.00	62725.00	54552.00	2027.00	2015-11-11	2013-09-30	6	1	21	96	78
262	412421.00	53479.00	30610.00	23915.00	3587.00	2014-08-03	2018-01-13	3	1	15	200	97
263	97999.00	7365.00	21605.00	53678.00	636.00	2022-01-19	2010-05-15	4	2	8	283	117
264	413573.00	40023.00	30857.00	40395.00	3750.00	2017-03-23	2012-06-23	5	1	54	230	149
265	355590.00	86084.00	31056.00	75952.00	5327.00	2022-03-27	2011-11-21	5	1	54	396	103
266	177835.00	66972.00	8547.00	581.00	7591.00	2015-01-14	2018-12-09	2	2	26	6	67
267	262694.00	3449.00	50139.00	72510.00	977.00	2011-05-22	2021-05-24	2	1	29	193	187
268	171461.00	38875.00	94820.00	23958.00	4788.00	2015-09-14	2015-08-12	5	2	48	343	136
269	71280.00	13636.00	20912.00	73006.00	3793.00	2021-02-04	2021-07-01	3	1	34	233	144
270	184157.00	12983.00	54258.00	16893.00	2115.00	2022-09-01	2018-06-02	3	2	11	91	197
271	490943.00	64412.00	7772.00	11095.00	1404.00	2011-01-14	2022-06-30	3	2	39	66	3
272	23445.00	18003.00	59763.00	62432.00	3705.00	2011-07-18	2011-06-12	1	2	34	289	107
273	488991.00	84272.00	46941.00	61919.00	7838.00	2022-05-12	2015-11-02	2	2	35	104	194
274	497449.00	57519.00	6119.00	54116.00	362.00	2021-08-25	2021-01-18	6	1	12	349	131
275	261770.00	58106.00	79631.00	32524.00	4755.00	2014-08-22	2016-06-15	2	1	12	348	16
276	409080.00	22584.00	587.00	38135.00	6178.00	2014-12-31	2013-08-06	2	2	22	31	80
277	253606.00	81487.00	96040.00	77348.00	292.00	2014-05-30	2015-10-31	6	2	28	229	18
278	126840.00	1720.00	11927.00	79606.00	9921.00	2020-05-01	2016-08-26	5	1	48	354	32
279	96481.00	86074.00	762.00	44806.00	2838.00	2020-07-09	2021-07-28	4	1	9	129	134
280	157626.00	76323.00	27412.00	65885.00	3611.00	2017-08-10	2017-11-28	4	1	14	56	68
281	11104.00	58156.00	41377.00	97491.00	5082.00	2018-05-01	2016-08-26	4	2	59	375	165
282	233808.00	44244.00	95846.00	69297.00	4163.00	2011-06-12	2015-06-14	1	2	3	7	26
283	66599.00	57143.00	98288.00	92873.00	9686.00	2014-03-12	2013-12-02	3	1	31	237	25
284	136888.00	96094.00	53720.00	66504.00	7345.00	2020-09-21	2020-03-14	4	1	56	340	100
285	417665.00	51791.00	99531.00	69470.00	9329.00	2014-12-02	2017-09-09	3	1	29	139	4
286	96658.00	94132.00	53515.00	76477.00	3341.00	2011-03-21	2021-12-11	1	1	43	324	48
287	213487.00	14987.00	21207.00	52710.00	2623.00	2011-02-23	2015-10-23	5	1	3	232	47
288	20727.00	31983.00	22687.00	24236.00	3390.00	2011-06-07	2011-03-21	5	2	41	371	142
289	424827.00	89086.00	43189.00	68892.00	8881.00	2013-02-19	2019-04-29	5	1	9	308	180
290	359576.00	7244.00	37640.00	2481.00	6292.00	2015-05-16	2015-07-22	4	2	54	231	192
291	459252.00	29360.00	12260.00	73135.00	8863.00	2011-04-05	2020-08-21	1	1	8	49	144
292	235942.00	97209.00	64795.00	51879.00	9544.00	2018-09-17	2016-06-06	4	2	32	148	24
293	422145.00	69936.00	22091.00	40854.00	7607.00	2017-06-07	2012-07-04	4	2	30	29	104
294	293015.00	30834.00	54718.00	77298.00	8258.00	2019-02-21	2022-02-06	4	1	55	138	15
295	122177.00	9751.00	94606.00	28798.00	8235.00	2011-12-29	2013-04-29	3	2	43	307	116
296	363818.00	98745.00	29083.00	84133.00	399.00	2020-10-30	2016-05-01	1	2	47	111	2
297	395863.00	9248.00	58557.00	35480.00	7682.00	2012-12-23	2010-09-07	2	2	18	125	189
298	228814.00	45468.00	71399.00	22942.00	8000.00	2014-08-02	2021-07-17	5	1	34	372	174
299	180048.00	31821.00	34382.00	89499.00	9441.00	2020-05-05	2018-10-30	3	1	26	167	23
300	106977.00	15318.00	36443.00	20087.00	325.00	2017-10-05	2016-11-03	1	1	36	228	125
\.


--
-- Data for Name: court_claims_statuses; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.court_claims_statuses (id, name) FROM stdin;
1	отправлено
2	не отправлено
3	получено судом
4	вынесено решение
5	получен исполнительный документ
6	вынесено решение об отказе в исковых требованиях
\.


--
-- Data for Name: court_claims_types; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.court_claims_types (id, name) FROM stdin;
1	исковое заявление
2	заявление о выдаче судебного приказа
\.


--
-- Data for Name: court_levels; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.court_levels (id, name) FROM stdin;
1	Мировой суд
2	районный или городской суд
3	Верховный суд субъекта РФ
4	Суд апелляционной инстанции
5	Суд кассационной инстанции
6	Верховный суд РФ
\.


--
-- Data for Name: courts; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.courts (id, name, address, court_level_id) FROM stdin;
1	In lorem. Donec elementum, lorem	P.O. Box 662, 6901 Dignissim Ave	4
2	venenatis vel, faucibus id, libero.	749-7333 Ac St.	5
3	blandit viverra. Donec tempus, lorem	P.O. Box 447, 6197 Ut Rd.	1
4	purus gravida sagittis. Duis gravida.	Ap #763-6116 Erat. St.	2
5	posuere vulputate, lacus. Cras interdum.	534-2924 Eleifend, Av.	5
6	egestas hendrerit neque. In ornare	Ap #557-8648 Aliquet Av.	5
7	sociis natoque penatibus et magnis	453-5005 Ipsum Rd.	4
8	at auctor ullamcorper, nisl arcu	1945 Mus. Street	4
9	velit eget laoreet posuere, enim	P.O. Box 111, 9231 Lorem. Ave	2
10	consequat nec, mollis vitae, posuere	108-7397 Ut Rd.	5
11	magna. Phasellus dolor elit, pellentesque	Ap #542-1741 In, Ave	5
12	risus. Nulla eget metus eu	563-8677 Vulputate Avenue	4
13	tellus sem mollis dui, in	P.O. Box 538, 780 Magna. Avenue	4
14	felis, adipiscing fringilla, porttitor vulputate,	Ap #343-2880 Non Av.	5
15	lectus. Nullam suscipit, est ac	535-7389 Lectus Av.	6
16	non, sollicitudin a, malesuada id,	8544 Mauris St.	3
17	Maecenas malesuada fringilla est. Mauris	963-1404 Posuere Road	6
18	fermentum risus, at fringilla purus	P.O. Box 127, 407 Vulputate Street	5
19	Donec sollicitudin adipiscing ligula. Aenean	Ap #925-8333 Nunc Rd.	2
20	enim mi tempor lorem, eget	Ap #912-6254 Lorem St.	4
21	volutpat. Nulla dignissim. Maecenas ornare	P.O. Box 669, 4688 Nunc. Rd.	5
22	mi. Aliquam gravida mauris ut	Ap #217-8481 At, St.	3
23	et, rutrum eu, ultrices sit	Ap #440-1661 Arcu Av.	1
24	tincidunt vehicula risus. Nulla eget	P.O. Box 691, 1331 Dolor Av.	5
25	sed dui. Fusce aliquam, enim	214-5486 Nec, Rd.	3
26	ac mattis velit justo nec	9451 Aliquet Rd.	5
27	neque sed dictum eleifend, nunc	458-7864 Blandit Avenue	3
28	tincidunt orci quis lectus. Nullam	827-8527 In Street	3
29	ante. Nunc mauris sapien, cursus	Ap #828-4268 Urna. Av.	4
30	cubilia Curae Donec tincidunt. Donec	4767 Integer Rd.	2
31	pharetra sed, hendrerit a, arcu.	Ap #358-7895 Mauris Rd.	2
32	ante ipsum primis in faucibus	Ap #332-2111 Eu, Ave	2
33	sed, est. Nunc laoreet lectus	449-610 Elit, Avenue	2
34	vitae velit egestas lacinia. Sed	P.O. Box 943, 1497 Aliquam Street	2
35	Nullam velit dui, semper et,	3911 Lacus. Street	4
36	ante. Vivamus non lorem vitae	115-8044 Mauris Road	1
37	urna et arcu imperdiet ullamcorper.	Ap #616-7279 Molestie Street	3
38	porttitor interdum. Sed auctor odio	6602 Nulla. Ave	1
39	euismod et, commodo at, libero.	809-6023 Sed Ave	2
40	eu turpis. Nulla aliquet. Proin	677-384 Nullam St.	4
41	at pede. Cras vulputate velit	1049 Risus. Road	5
42	aliquet molestie tellus. Aenean egestas	373-8741 Porta Road	3
43	lobortis risus. In mi pede,	986-5638 Mollis Ave	5
44	odio. Aliquam vulputate ullamcorper magna.	6893 Orci. Street	6
45	orci, adipiscing non, luctus sit	8342 Porttitor St.	3
46	eget odio. Aliquam vulputate ullamcorper	909-3916 Curabitur Avenue	5
47	aliquet. Proin velit. Sed malesuada	Ap #512-3805 Ante St.	4
48	nec ante blandit viverra. Donec	P.O. Box 869, 2287 Ornare. Road	3
49	laoreet, libero et tristique pellentesque,	204-7949 Fusce Rd.	3
50	nisl arcu iaculis enim, sit	928-5984 Sed St.	4
51	nec tempus scelerisque, lorem ipsum	Ap #895-6646 Et St.	3
52	dis parturient montes, nascetur ridiculus	Ap #773-111 Mi Ave	5
53	sagittis placerat. Cras dictum ultricies	8921 Aliquam Av.	4
54	Etiam vestibulum massa rutrumed magna.	2137 Neque Avenue	5
55	tincidunt nibh. Phasellus nulla. Integer	221-2770 Mollis Ave	2
56	penatibus et magnis dis parturient	P.O. Box 880, 6294 Nascetur Ave	1
57	amet metus. Aliquam erat volutpat.	Ap #631-9037 Volutpat. Rd.	5
58	elit erat vitae risus. Duis	8829 Eros. Ave	6
59	non enim commodo hendrerit. Donec	989-7873 Vel, Ave	1
60	Etiam vestibulum massa rutrum magna.	Ap #341-9985 Ac Avenue	4
\.


--
-- Data for Name: creditor_types; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.creditor_types (id, name) FROM stdin;
1	Физическое лицо
3	Банк
2	Микрофинансовая организация
5	Индивидуальный предприниматель
4	Другая организация
\.


--
-- Data for Name: creditors; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.creditors (id, name, court_identifier, address, group_id, creditor_type_id) FROM stdin;
1	Pellentesque Corp.	7943405550	3625 Ac St.	21	4
2	Sollicitudin Consulting	8152455337	2233 Vel, St.	2	4
3	Ante Nunc PC	3268871671	Ap #189-8580 Feugiat St.	12	2
4	Cursus A LLP	2563263815	358-2574 Eu, St.	15	4
5	Auctor Vitae Ltd	7664712553	740-7995 Dolor Road	12	4
6	Scelerisque Lorem Company	3395160038	Ap #169-368 Luctus St.	16	3
7	Sed Molestie LLC	1635657471	9855 In Avenue	15	2
8	At Foundation	8325039404	P.O. Box 122, 9186 Tempor St.	20	3
9	Mi Pede PC	6752464415	P.O. Box 634, 3733 Neque St.	18	3
10	Imperdiet Ullamcorper Consulting	6164310654	774-1238 Magna. Ave	14	3
11	Senectus Et Associates	9345866165	666-8002 Orci St.	13	3
12	Ut Eros Corp.	7713643233	865-2127 Orci, Rd.	21	4
13	Egestas Aliquam Nec Incorporated	7879115697	P.O. Box 976, 4044 Mattis Street	20	2
14	Mauris Incorporated	1462758031	652-4186 Sit Rd.	6	2
15	Non Hendrerit Associates	1183737372	875 Amet Ave	13	3
16	Ornare Elit Associates	5552694367	621-2809 Mus. St.	14	2
17	Morbi Non Sapien Company	2378579785	755-1838 Velit Street	3	3
18	Semper Pretium LLC	2712868647	Ap #110-8055 Ipsum. St.	18	3
19	Neque Industries	3536723284	5919 Velit Av.	21	4
20	Purus In Molestie Foundation	5016001072	1763 Nec St.	18	3
21	Curabitur Massa Limited	2881844237	Ap #202-6650 Placerat, Road	17	2
22	Ut LLC	2894185238	Ap #655-1159 Gravida. Avenue	6	2
23	Cursus Diam At Limited	6215347993	231-5190 Cras Ave	16	3
24	Enim Nec Corporation	4431003126	Ap #635-8198 Dolor St.	15	4
25	Eleifend Non LLC	8800385082	Ap #104-3261 Metus. St.	3	4
26	Mollis Phasellus Libero Corporation	9105752189	Ap #223-3698 Commodo Rd.	7	4
27	Lectus A Associates	7561568167	P.O. Box 861, 1429 Ligula Rd.	15	3
28	Nam Consequat Company	1111288219	Ap #941-8960 Pharetra, Street	14	2
29	Integer Sem Elit LLP	7719739565	P.O. Box 699, 7907 Lacus Avenue	2	3
30	Ante Nunc Industries	5284844717	Ap #370-5514 Cursus Street	22	4
31	Amet Metus Associates	7915885726	P.O. Box 649, 4357 Sapien. Street	15	3
32	Ligula Tortor Inc.	2102213967	645-2935 Aliquet Rd.	2	3
33	Dui Augue Eu Inc.	4334316135	675-3113 Elit, Rd.	18	2
34	Velit Aliquam Ltd	6327617436	P.O. Box 556, 780 Sed Street	11	2
35	Non Sapien Molestie Institute	6645854083	592-8572 Interdum Street	7	3
36	Adipiscing Foundation	6561938370	945-7130 Curabitur St.	12	4
37	Nunc Nulla Industries	3187157253	P.O. Box 627, 2332 Cursus, Street	16	3
38	Dictum Eu Ltd	0839521389	Ap #490-9886 Duis Rd.	24	3
39	Mattis Velit Corporation	8919876551	Ap #489-4574 Nunc Road	1	4
40	Cras Vulputate Velit Corp.	6086182828	812-5730 Risus Avenue	3	3
41	Ut Sagittis Lobortis Institute	4797126351	7402 Habitant St.	11	3
42	Pretium Et Inc.	0776470063	P.O. Box 751, 9202 Magna. Street	3	4
43	Arcu Vestibulum Limited	8880717018	559 Et Av.	8	3
44	Nec Ante Incorporated	3896758551	5277 Purus Ave	15	3
45	Molestie PC	7216569175	619-4054 Dictum St.	23	2
46	Ut LLC	6612118619	9621 Nonummy. Street	18	3
47	Aenean Eget Magna Associates	2487244480	524-2102 Volutpat Street	10	2
48	Nulla Magna Malesuada Industries	6716021283	Ap #376-8925 Et St.	10	3
49	Placerat Institute	1568228370	8516 Accumsan Rd.	17	4
50	Natoque Penatibus Et LLP	6913176366	345-6546 Neque St.	16	4
51	Ante Blandit Inc.	1098191006	688-8357 Orci Av.	23	3
52	Urna Nec Luctus Associates	4839979682	Ap #837-8004 Ullamcorper. Rd.	17	3
53	Laoreet Posuere Enim Institute	5216719518	Ap #658-910 Accumsan St.	2	3
54	Odio Inc.	6811461196	Ap #729-3939 Nec Rd.	21	3
55	Donec Ltd	4775487594	P.O. Box 455, 8302 Ac Av.	9	3
56	Ornare Elit Industries	5155054100	Ap #525-3388 Arcu. Road	5	3
57	Amet Ornare Foundation	6393546722	186-9013 Phasellus Rd.	6	2
58	Iaculis Odio PC	8377785541	Ap #375-5923 Nunc St.	16	4
59	Lacus Foundation	1851624758	Ap #752-4726 Neque. Street	19	2
60	Sapien LLC	4986845935	9541 Metus Street	16	2
61	Vel Quam Corp.	3736346432	107-7370 Nam Rd.	6	2
62	Accumsan Convallis Ltd	6185381252	Ap #878-9629 Auctor Avenue	22	4
63	Nascetur Ridiculus Mus Associates	4861738456	Ap #178-1341 In Ave	9	4
64	Quis Pede Praesent Foundation	7174518433	P.O. Box 528, 9989 Quam Rd.	22	3
65	Egestas Duis Ltd	1425571572	5411 Vel Rd.	12	3
66	Gravida Aliquam Associates	0133576373	425-6442 Id, Rd.	23	2
67	A Aliquet Vel Inc.	6237583011	P.O. Box 467, 3605 Hendrerit. St.	14	4
68	Sed Sem LLP	6742526866	P.O. Box 576, 1681 Praesent Rd.	19	3
69	Diam PC	2155670151	Ap #783-2070 Donec Rd.	6	3
70	Cras Vehicula Institute	8478158553	P.O. Box 360, 4050 Est. St.	4	2
71	Leo Inc.	7047743794	7431 Tincidunt Av.	18	3
72	Vulputate Posuere PC	5283267534	Ap #897-4502 Nam Street	9	3
73	Vitae Semper Corp.	2253002568	385-5587 Phasellus St.	23	2
74	Eu Turpis Nulla Institute	1782118232	1630 Senectus Ave	14	3
75	Dignissim LLC	4472657415	Ap #439-4755 In Road	9	4
76	Feugiat Metus LLC	3103757752	903-3209 Nisi Ave	10	3
77	Ad Litora LLP	9818321737	P.O. Box 793, 7044 Lorem Avenue	13	3
78	Magna Malesuada Vel Associates	6528585687	587-2792 Amet St.	22	4
79	Fusce Mollis Duis Foundation	1176253346	P.O. Box 939, 8623 Et Road	5	2
80	Pellentesque LLP	4282576252	P.O. Box 129, 2093 Quisque St.	21	3
81	In Corporation	7375788314	Ap #474-2043 Sociis Avenue	20	3
82	Donec Sollicitudin Associates	7592773828	254-2150 Luctus St.	20	2
83	Sagittis Foundation	8747977198	Ap #365-5872 Velit Rd.	22	4
84	Etiam Ltd	7338250287	Ap #843-1403 Lorem Av.	7	3
85	Nostra Corp.	0331256358	4701 Quam. Street	9	3
86	Enim Nisl Corporation	2189116783	Ap #838-5435 Sapien Av.	19	4
87	Semper Cursus Integer Industries	8903926393	838-1226 Semper St.	14	3
88	Ut Sem Corporation	6642773365	3648 Gravida St.	11	3
89	Tempor Corporation	6435102654	549-8946 Posuere St.	10	3
90	Dictum Foundation	0425576365	925-565 Dui. St.	7	4
91	Aliquet Metus Urna Associates	3116887283	961-3919 Eu St.	11	2
92	Aenean Euismod Corp.	9148139127	Ap #507-8104 Aptent Road	18	3
93	Fusce Aliquam Institute	7017294216	Ap #127-9100 Nulla St.	24	4
94	Magna Inc.	0246173863	P.O. Box 422, 7554 Est, Avenue	7	2
95	Ante Ipsum Primis Ltd	1487318162	2985 Vehicula Ave	3	4
96	Ut Ltd	7860006919	782-3681 Ac Avenue	3	3
97	Ac Nulla Ltd	1300995364	Ap #396-7976 Et Avenue	21	4
98	Pede Malesuada Institute	2872669431	Ap #386-7655 Dui Rd.	16	2
99	Vitae Limited	4897480925	9362 Magnis Av.	17	3
100	Enim Condimentum Eget LLC	5973789553	151-6984 Ornare. Rd.	4	3
101	Amber Keller	9362 841477	904-4286 Neque. Av.	21	1
102	Raya Becker	1858 505881	928-907 Eu Rd.	5	1
103	Lev Fulton	2264 489388	3800 Adipiscing Rd.	1	1
104	Quin Middleton	7103 772413	487-5921 Purus Street	5	1
105	Idola Wolf	8225 644856	7414 Sem Av.	4	1
106	Elizabeth Greene	8602 362350	Ap #321-1104 Aliquam St.	23	1
107	Linus Blankenship	2704 131032	Ap #986-7659 Elit Road	22	1
108	Neville Mcclain	4138 349050	276 Eros. St.	9	1
109	Hayden Ratliff	7495 764424	637-6403 Lectus Ave	22	1
110	Michelle Albert	5754 380510	448-2811 Suspendisse St.	15	1
111	Brock Abbott	8343 217683	Ap #518-5114 Eleifend. Ave	16	1
112	Isaac Luna	2435 214046	Ap #436-4024 Mi Avenue	8	1
113	Georgia Willis	1713 866735	P.O. Box 414, 6012 Molestie. St.	16	1
114	Jason Gomez	6318 188425	896-4987 Amet St.	2	1
115	Bert Davidson	4917 628356	Ap #127-8670 Gravida Street	10	1
116	Sonia Matthews	3444 200511	982-8469 Purus. Av.	18	1
117	Xander Williamson	6646 725615	8875 Tempus Ave	1	1
118	Yetta Huber	7372 132136	4750 Iaculis St.	3	1
119	Yoshio Adkins	5121 798263	6916 Mauris Ave	10	1
120	Denton Kennedy	9532 211295	P.O. Box 866, 5614 Mauris Rd.	7	1
121	Vielka Charles	9496 656839	958-5324 Cum Avenue	11	1
122	Kyra Houston	4763 445728	Ap #668-5695 Pharetra Av.	18	1
123	Aline Boone	5594 833529	345-4099 Egestas. Rd.	13	1
124	Lane Alford	2752 489136	495-7828 Tempor Av.	8	1
125	Macaulay Roach	1147 151954	977-8736 Cubilia Ave	10	1
126	Kathleen Stephenson	8932 759373	P.O. Box 560, 7972 Per St.	5	1
127	Patience Hooper	7376 468574	Ap #730-6382 Libero. St.	5	1
128	Demetria Munoz	1636 811829	P.O. Box 942, 7498 Phasellus Road	18	1
129	Deborah Ortiz	4051 356381	Ap #468-5797 Elementum, St.	11	1
130	Phyllis Tyson	0953 518520	518-8863 Nulla Av.	8	1
131	Stacey Kramer	9306 226479	P.O. Box 645, 939 Pellentesque Av.	8	1
132	Alice Nixon	1674 266244	P.O. Box 887, 1011 Dictum Avenue	2	1
133	Ahmed Morton	7045 127018	643-1733 A Rd.	10	1
134	Luke Whitney	9450 264928	370 Nunc Rd.	15	1
135	Rama Brock	2016 708194	P.O. Box 464, 7991 Nullam Rd.	3	1
136	Indigo Grimes	5639 948577	P.O. Box 147, 8897 Vestibulum Road	23	1
137	Rosalyn Murray	8448 450463	948-2760 Lectus. Ave	8	1
138	Dieter Brady	3098 121335	660-2823 Commodo Street	4	1
139	Tanek Padilla	0086 662288	P.O. Box 561, 484 Lacus. Av.	20	1
140	Mason Donaldson	3977 683283	364-7486 Sapien. Ave	2	1
141	Regina Hewitt	4818 834180	Ap #207-6119 Malesuada Av.	3	1
142	Damon O'donnell	1542 351946	958-3238 Sollicitudin Road	6	1
143	Barclay Hess	4627 153122	811-8368 Lacus, Rd.	20	1
144	Destiny Sheppard	5366 426167	P.O. Box 672, 4101 Sed Road	3	1
145	Sawyer Mcdonald	1854 604835	4100 Augue Rd.	11	1
146	Eric Goodwin	5221 008432	164-4471 Mauris Street	10	1
147	Renee Mueller	2713 151227	129-8847 Ac St.	2	1
148	Yoko Weaver	1622 523807	P.O. Box 681, 4130 Eu Street	6	1
149	Gannon Woodard	7990 366058	533-3363 Vivamus St.	14	1
150	Adele Dotson	2815 201586	Ap #940-3052 Commodo Road	6	1
151	Aretha Bruce	2345655175	9534 Donec Rd.	3	5
152	Cullen Chaney	0408720512	623-8402 Lobortis Av.	12	5
153	Hall Horn	1585643435	976-1619 Vitae Street	18	5
154	Jada Huber	4684331867	P.O. Box 811, 6974 Massa. Avenue	16	5
155	Coby Blackwell	6956065485	312-4964 A St.	18	5
156	Paki Finley	8216769030	704-6921 Nunc St.	4	5
157	Yen Horne	0787059594	Ap #526-7296 Quis Av.	22	5
158	Regina Jordan	1332884176	Ap #273-5652 Nunc Rd.	8	5
159	Tatum Oneil	2382309892	Ap #681-3230 Sed, Rd.	25	5
160	Murphy Reyes	1844781165	P.O. Box 257, 2790 Est, Road	16	5
161	Summer Hood	3377823234	Ap #935-6292 Tristique St.	4	5
162	Stewart Delacruz	9663851774	Ap #884-7936 Lorem St.	4	5
163	Miriam Warren	8751445374	Ap #349-2656 Aliquam Avenue	2	5
164	Jamal Thornton	4614415326	9982 Consectetuer St.	17	5
165	Fulton Roberts	2164395214	301-550 Iaculis Rd.	12	5
166	Boris Frost	3446896213	5458 Et, Avenue	16	5
167	Rose Craft	6286555241	P.O. Box 932, 7494 Arcu Street	10	5
168	Patrick Coleman	6793760343	179-978 Est Road	6	5
169	Ria Russo	4562444063	7505 Ut Avenue	18	5
170	Cain Brown	7270423940	9674 Quisque Street	21	5
171	Christine Hamilton	7366223272	915 Suspendisse Rd.	13	5
172	Henry Santiago	5631187343	Ap #532-5462 Libero St.	3	5
173	Leila Sutton	6765532678	187-4998 Lorem Rd.	4	5
174	Azalia Whitney	8614250384	Ap #697-5394 Erat, St.	4	5
175	Marsden Harding	6890425997	8984 Mus. Rd.	10	5
176	Fuller Sexton	3361345252	Ap #704-4359 Aenean Avenue	20	5
177	Lane Moore	4697551174	720-2261 Amet, St.	5	5
178	Hayden Gamble	4541988393	P.O. Box 614, 3512 Nulla. Road	5	5
179	Carter Fuller	8757517824	459-5237 Duis Avenue	18	5
180	Madonna Harrington	8734211816	Ap #550-2994 Quisque Street	16	5
181	Katell Booker	3210933519	P.O. Box 234, 5357 Tellus Avenue	10	5
182	Tatyana Ray	3110152859	256-2941 Dis St.	20	5
183	Ignatius Buck	8837172246	434-9591 Dictum Rd.	13	5
184	Joshua Ramsey	7386374216	8923 Placerat Ave	3	5
185	Medge Mcleod	3045861113	Ap #977-1849 Sociis Rd.	12	5
186	Diana Arnold	8738615886	591-6608 Curabitur Rd.	4	5
187	Vanna Rollins	6172894655	Ap #432-4872 In Ave	4	5
188	Griffin Abbott	1642228712	6512 Erat. St.	2	5
189	Bertha Yates	5800783688	Ap #408-3495 Auctor, Ave	6	5
190	Winifred Davidson	7456410027	495-229 Placerat, Road	14	5
191	Baxter Holmes	2346876346	509-5147 Proin Ave	10	5
192	Benjamin Ferrell	0141153086	241-3958 Nunc St.	23	5
193	Lester Lee	6270903573	Ap #503-2134 Tristique St.	12	5
194	Laurel Willis	6162186383	Ap #148-6333 Elementum Rd.	4	5
195	Keelie Giles	7923592831	702-5205 Turpis Rd.	6	5
196	Cyrus Graves	2330291385	828 Integer Avenue	7	5
197	Eve Anthony	5282811988	Ap #189-566 Neque Street	6	5
198	Zelenia Langley	4485432304	278-2533 Nisl. Road	2	5
199	Belle Vaughn	2204206472	Ap #387-7626 Est St.	21	5
200	Kyra Padilla	3214763173	Ap #266-8552 Suspendisse Rd.	2	5
\.


--
-- Data for Name: debtors; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.debtors (id, name, surname, patronymic, birth_date, birth_place, address) FROM stdin;
1	Xandra	Webb	Hale	1996-07-05	Lincoln	927-7682 Commodo Road
2	Nathaniel	Mayer	Boyle	1986-09-28	Fort Worth	Ap #189-8547 Nulla Rd.
3	Imani	Lloyd	Burt	2002-08-28	Columbus	Ap #218-3402 Donec Rd.
4	Hollee	David	Moses	1988-08-06	Topeka	Ap #512-7930 Nulla Rd.
5	Kibo	Barton	Reilly	1977-08-07	Salt Lake City	P.O. Box 512, 491 Orci Street
6	Jade	Haynes	Stuart	1980-01-09	Vancouver	Ap #213-7214 Lectus. Rd.
7	Shad	Humphrey	Ellison	1987-07-28	Missoula	Ap #649-4695 Quam Rd.
8	Jesse	David	Fulton	1991-09-02	Olympia	5756 Ornare, St.
9	Kennan	Sykes	Guerrero	1998-04-07	Lexington	P.O. Box 304, 3526 Sit Avenue
10	Abbot	Shaffer	Wolfe	1998-02-12	Sandy	Ap #333-8531 Cras Ave
11	Sara	Barr	Martin	1976-11-24	Austin	Ap #282-9191 Nibh Av.
12	Kylan	Mack	Macias	1978-08-02	Glendale	Ap #314-6138 Nec, Rd.
13	Carla	Ferrell	Miles	1992-02-27	Owensboro	616-3893 Sed Rd.
14	Lance	Morton	Oneal	1994-01-31	Missoula	Ap #604-3007 Non, Avenue
15	Hannah	Kidd	Buckley	2003-05-25	Milwaukee	623 Dignissim St.
16	Zenia	Foster	Estrada	2003-01-06	Pocatello	Ap #881-8702 Tempus, Road
17	Jasper	Cantrell	Russo	2004-02-04	San Francisco	Ap #320-4326 Euismod Street
18	Cairo	Woodward	Clarke	2004-03-29	Memphis	Ap #320-7059 Ligula. Street
19	Nolan	May	Reynolds	1995-12-22	Nashville	387-6350 Tellus Street
20	Orli	Knight	Snyder	2002-12-13	Wyoming	281-6204 Et St.
21	Stephanie	Clayton	Gardner	1990-07-12	Vancouver	Ap #346-8856 Donec Av.
22	Nell	Dale	Riley	2002-06-25	Tucson	701-366 Gravida Avenue
23	Dustin	Herrera	Riley	2004-11-15	Georgia	520-8823 Tellus. Street
24	Nerea	Anthony	Duffy	1983-09-30	Aurora	991-6958 Diam. St.
25	Shana	Barr	Conley	2002-01-21	Orlando	5265 Velit Road
26	Kathleen	Quinn	Rowe	1998-11-15	Bridgeport	750-9590 Ut Av.
27	Jasmine	Mccoy	Bond	1984-07-28	Des Moines	568-6722 Sed Street
28	Brian	Wheeler	Henry	1992-10-15	Pike Creek	Ap #105-3178 In, St.
29	Hoyt	Goodwin	Stout	1993-07-16	Broken Arrow	192-3029 Eu Avenue
30	Maggy	Green	Drake	1987-10-31	Provo	435-1053 Urna. Rd.
31	Eve	Poole	Fleming	2004-01-10	Lakewood	Ap #554-3575 Posuere Rd.
32	Garrison	Hawkins	Simpson	1980-04-15	West Jordan	P.O. Box 367, 5616 Ligula. St.
33	Elijah	Guerra	Doyle	1986-10-07	Springfield	240-9193 Fusce Street
34	Hermione	Glass	Kline	1996-03-20	Pocatello	P.O. Box 335, 9960 Eleifend. Av.
35	Janna	Burris	Zimmerman	1985-09-01	Reading	952-8115 Cubilia St.
36	Cameron	Holman	Cameron	1991-10-27	Fort Wayne	P.O. Box 977, 2577 Egestas. Road
37	Nina	Palmer	Ashley	1994-02-25	Sandy	211-3089 Ipsum. Street
38	Ulric	Rodgers	Rios	1988-04-03	West Jordan	5869 Velit Av.
39	Lavinia	Schneider	Delaney	1992-10-16	Rockville	P.O. Box 223, 9033 Amet Av.
40	Brett	Glover	Molina	1992-01-02	Juneau	283-2693 Aliquam Street
41	Phyllis	Odom	Boyer	1980-08-02	Lewiston	Ap #627-3437 Id, Street
42	Zahir	Pruitt	Ingram	1990-03-21	Gulfport	952-8950 Suscipit Ave
43	Danielle	Ball	Roberts	1999-11-11	Erie	Ap #654-1477 Enim. St.
44	Kylie	Callahan	Charles	1996-08-25	Cambridge	Ap #121-6846 Tortor, Avenue
45	Aidan	Black	Carroll	2001-03-20	Bellevue	825-4692 Ante Rd.
46	Yoshi	Tate	Hester	1976-06-08	Dallas	436-1685 Consectetuer Ave
47	Victor	Wolf	Hammond	1996-11-28	Dallas	P.O. Box 181, 8188 In Rd.
48	Cole	Howell	Bender	1981-06-16	Newport News	218-2931 Justo. St.
49	Latifah	Gates	Castro	1978-06-03	San Jose	Ap #760-7947 Consectetuer Avenue
50	Aquila	Beck	Daniels	1992-07-20	Casper	P.O. Box 979, 1517 Sed St.
51	Neil	Copeland	Navarro	1992-04-13	Olathe	293-9821 Metus. Rd.
52	Kasper	Carrillo	Mccoy	2000-03-09	Tampa	768-3345 Dolor St.
53	Dean	Avila	Mclaughlin	1982-04-25	Grand Island	Ap #936-1237 Lectus St.
54	Olivia	Hays	Dyer	1997-11-05	Tuscaloosa	Ap #759-5502 Nisi Road
55	Kenneth	Warren	Daniel	1984-01-05	Provo	Ap #197-5966 Sed Rd.
56	Chloe	Turner	Emerson	1983-04-30	Richmond	442-1168 Convallis Rd.
57	Lucy	Gallagher	Hays	2002-06-30	Indianapolis	Ap #331-7731 Amet, Av.
58	Caryn	Ferguson	Henson	1999-04-09	Denver	Ap #276-6627 Vehicula. Street
59	Candice	Freeman	Wall	1986-07-29	Metairie	P.O. Box 564, 5856 Massa. St.
60	Clare	Lowery	Bruce	1990-08-21	Cambridge	983-1147 Libero. Road
61	Germaine	Foley	Steele	1996-08-06	Tuscaloosa	Ap #710-4485 Sem Ave
62	Jackson	Richardson	Schneider	1983-01-06	Independence	8336 Ligula. Street
63	Ross	Cantrell	Morrison	1994-05-16	Milwaukee	6196 Vitae Road
64	Ciara	Kirk	Forbes	1981-12-08	New Orleans	Ap #243-1738 Enim. St.
65	Michael	Frye	Ware	1997-02-24	Seattle	Ap #132-6742 Libero. Rd.
66	Harper	Morin	Padilla	1976-07-09	Nashville	P.O. Box 949, 801 Turpis St.
67	Nathaniel	Ford	Wright	1999-03-24	Columbia	P.O. Box 718, 4776 Enim Ave
68	Calvin	Love	Hanson	1992-12-18	Norfolk	P.O. Box 427, 743 Ac Street
69	Yoshio	Flynn	Reid	2004-01-13	Tuscaloosa	3331 Faucibus Avenue
70	Chadwick	Colon	Carney	2002-10-27	Pike Creek	P.O. Box 650, 5855 Amet Av.
71	Tad	Marshall	Morse	1991-02-13	Memphis	Ap #317-5970 Nec Av.
72	Nadine	Mcleod	Matthews	2002-07-11	Cambridge	P.O. Box 340, 543 In, Av.
73	Yvette	Kirk	Morse	1997-09-17	Paradise	Ap #719-3655 Ac St.
74	Galena	Velazquez	Holmes	1976-05-24	Colchester	Ap #470-4498 Sed, Ave
75	Mufutau	Romero	Flores	1977-08-14	Tacoma	2781 Semper Rd.
76	Odessa	Curry	Guy	1992-10-09	Harrisburg	776-3332 Magna, St.
77	Vernon	Reid	Frank	1978-07-18	Lexington	P.O. Box 746, 5483 Aliquet St.
78	Caryn	Richmond	Diaz	1991-06-17	Norfolk	397-5095 Turpis Avenue
79	Fuller	Larson	Cunningham	1996-09-11	Bozeman	735-535 Sociis Av.
80	Merritt	Daugherty	Harrell	1994-12-14	Minneapolis	Ap #199-2944 Massa. Ave
81	Adrienne	Coffey	Ayala	1997-09-21	Evansville	Ap #390-1316 Lacinia Rd.
82	Zenia	Dalton	Ramsey	1985-06-30	Portland	Ap #463-9368 Tellus. St.
83	Lev	Walls	Wallace	2004-09-24	Reading	539-1970 Cursus Street
84	Lareina	Macdonald	Franklin	1979-03-18	Gulfport	416-1517 Ac Rd.
85	Macon	Frye	Cook	1983-01-03	Paradise	Ap #935-228 Et, Road
86	Meghan	Beasley	Wiggins	1984-06-27	Minneapolis	P.O. Box 505, 8060 Arcu. Road
87	Keegan	Tucker	Wise	1998-01-21	Topeka	3062 Id Av.
88	Clayton	Compton	Pena	2004-08-17	Mobile	927-9163 Imperdiet St.
89	Autumn	Hoover	Gonzales	1987-01-23	Colchester	3252 Interdum Street
90	Hoyt	Keith	Reyes	1978-03-13	Sandy	1706 Cursus Rd.
91	Victoria	Richardson	Benton	1985-09-07	San Diego	874-9708 Neque. Road
92	Connor	Larsen	Giles	1978-12-02	Kailua	P.O. Box 357, 3721 Pulvinar Rd.
93	Thor	Gomez	Briggs	1997-11-22	Mobile	646-6411 Amet, Ave
94	Beatrice	Guzman	Lindsey	1977-09-19	Las Vegas	Ap #648-8985 Bibendum. St.
95	Acton	Hernandez	Singleton	1985-09-12	Augusta	P.O. Box 985, 3267 Fringilla Av.
96	Joel	Alvarado	Delaney	2003-02-04	Southaven	P.O. Box 777, 5636 Tellus. Av.
97	Christopher	Jacobs	Trujillo	1980-10-02	Seattle	Ap #133-9886 Ut, Avenue
98	Rhiannon	Holcomb	Griffith	1991-02-18	Annapolis	151-2159 Ligula. Street
99	Seth	Guthrie	Wall	1997-11-23	Augusta	Ap #542-9276 Non, Street
100	George	Romero	Durham	1977-01-29	Worcester	Ap #385-8479 Nibh. Ave
101	Ariana	Callahan	Boyd	1983-07-20	Georgia	498-721 Vitae Road
102	Sasha	Riggs	Coffey	1981-05-26	Austin	Ap #457-5332 Ultrices Rd.
103	Dai	Sexton	Holloway	1991-01-01	Gillette	465-289 Nullam Road
104	Allen	Mcmahon	Frazier	2003-07-03	Missoula	8719 Penatibus Street
105	Christian	Moran	Johnston	1988-05-22	Clarksville	495-7629 Amet Street
106	Jenette	Bowen	Mcintosh	1989-10-30	Columbus	Ap #698-7245 Arcu. St.
107	Robin	Dennis	Rowe	1976-12-03	Juneau	P.O. Box 695, 7795 Lectus Street
108	Sarah	Woodard	Hill	1996-10-24	Davenport	P.O. Box 477, 8718 Nunc St.
109	Quinlan	Walton	Hardin	1989-08-06	Knoxville	Ap #147-8659 Lorem, Av.
110	Walter	Ingram	Montgomery	1999-02-06	Worcester	570-6238 Purus, Ave
111	Hyacinth	Moody	Coleman	1978-05-24	Casper	104-1604 Gravida St.
112	Sonya	Hamilton	Morse	1999-08-17	Southaven	P.O. Box 151, 5810 Dolor Rd.
113	Clayton	Hampton	Munoz	1998-03-09	Aurora	613-4265 Pellentesque Rd.
114	Germane	Cortez	Perry	1981-05-15	Augusta	2218 Mauris Ave
115	Samson	Park	Langley	1978-11-21	Chandler	582-3872 Erat. Road
116	Tamekah	Mcgee	Baird	1980-08-12	Chattanooga	Ap #604-716 Phasellus Street
117	Latifah	Cox	Golden	1995-04-04	Meridian	749-4822 Leo. Ave
118	Alvin	Blackwell	Noble	1996-07-10	Boston	8990 Morbi Road
119	Brendan	Bauer	Clemons	2001-12-08	Portland	977-9930 Fusce Ave
120	Skyler	Mckay	Espinoza	1977-06-05	Fresno	Ap #593-9777 Nulla. St.
121	Lee	Leach	Gomez	1989-04-26	Metairie	Ap #854-5839 Nec Street
122	Kellie	Pugh	Shannon	1990-01-24	Las Vegas	5513 Interdum Rd.
123	Kameko	Suarez	Morin	1991-04-27	Paradise	Ap #204-2637 At St.
124	Halee	Little	Nelson	1991-02-18	Bloomington	5025 Augue, Ave
125	Desirae	Crane	Blake	1995-05-09	Tulsa	544-501 Quam Rd.
126	Ferdinand	Acosta	Freeman	1976-08-24	Lowell	P.O. Box 550, 8398 Elit. Avenue
127	Stone	Sweeney	Duffy	2000-03-27	Spokane	P.O. Box 804, 9372 Odio. Rd.
128	Xyla	Fuentes	Mccullough	1988-06-10	Tallahassee	P.O. Box 959, 5921 Sapien. St.
129	Cole	Rasmussen	Mcgowan	1985-01-10	Rock Springs	P.O. Box 268, 2109 Tincidunt, St.
130	Finn	Stanley	Santana	1980-12-12	Akron	898-6407 Nulla Rd.
131	Brian	Roberson	Orr	1996-10-31	Jackson	922-7095 At Avenue
132	Salvador	Frost	Bailey	1996-12-20	Lansing	5031 Ut Ave
133	Dane	Mercado	Walsh	1979-12-21	Detroit	7257 Ligula. Rd.
134	Nerea	Rich	Keith	1985-06-30	Virginia Beach	Ap #375-8754 Fusce Road
135	Iona	Wood	Fry	1998-12-28	Gillette	P.O. Box 640, 9471 Pellentesque Av.
136	Raven	Le	Dorsey	1987-10-30	Des Moines	Ap #694-2097 Bibendum. Rd.
137	Lane	Hobbs	Moses	1983-09-28	Colorado Springs	Ap #923-3740 Lobortis Road
138	Tallulah	Garrison	Velez	1976-01-29	Burlington	Ap #276-9580 Ipsum Road
139	Nasim	Rhodes	Strong	1979-03-13	Portland	P.O. Box 296, 7058 Vel Rd.
140	Armando	Hardy	Gilmore	1983-10-10	Hillsboro	Ap #101-6694 Condimentum. Rd.
141	Acton	Williamson	Strong	1986-10-18	Tampa	931-4833 Consequat Road
142	Gary	Neal	Colon	1982-07-27	Los Angeles	Ap #531-2392 Maecenas Rd.
143	Ariana	Brewer	Sexton	1996-09-29	Olympia	509-8278 Placerat St.
144	Lenore	Moreno	Aguilar	1976-01-14	Auburn	P.O. Box 275, 6952 Eu, St.
145	Melyssa	Watkins	Blake	1996-01-10	Kearney	860-7838 Integer Rd.
146	Ingrid	Benson	Beasley	2004-01-26	Honolulu	2492 Ligula St.
147	Cameron	Mullen	Dixon	1978-05-23	Minneapolis	322-337 Fringilla Road
148	Kermit	Mcmahon	Mclaughlin	1988-02-06	San Diego	3557 Aliquam St.
149	Elvis	Parks	Knowles	1987-10-18	Norfolk	P.O. Box 284, 1738 Maecenas Ave
150	Amela	French	Downs	2002-01-26	Colorado Springs	P.O. Box 204, 4468 Vitae Avenue
151	Vivian	Sutton	Santos	2003-12-29	Lewiston	Ap #641-4989 Aenean Av.
152	Lamar	Mcintosh	Mclaughlin	2002-11-07	Jacksonville	982-7302 Scelerisque Rd.
153	Paki	Bridges	Lee	1984-05-26	Tulsa	797-7948 Orci. St.
154	Amos	Dale	Dillon	1995-03-21	Vancouver	499-8347 Sed Road
155	Hu	Herman	Osborn	1982-03-15	Carson City	Ap #431-9159 Egestas. Rd.
156	Inga	Cote	Hurley	1991-08-10	New Orleans	625-1455 Justo Av.
157	Aurelia	Harper	Warren	2004-02-20	Broken Arrow	Ap #760-7830 Dictum Rd.
158	Garth	Wooten	Lowe	2002-08-20	Austin	Ap #771-6999 Semper Street
159	Iona	Fisher	Love	1980-06-23	Glendale	P.O. Box 845, 768 Lacus. St.
160	Yolanda	Noel	Wilkins	2004-11-11	Norman	Ap #758-7130 Nisi. Road
161	Cain	Patel	Bradshaw	1984-06-21	Hattiesburg	Ap #415-1597 Libero St.
162	Hector	Roberts	Oneal	1982-04-30	Frederick	Ap #813-2700 Facilisis Ave
163	Aphrodite	Cox	Castro	1994-12-20	Burlington	841-1715 Sit St.
164	Bree	Ingram	Haynes	1996-11-20	Springfield	P.O. Box 280, 8540 Metus St.
165	Noel	Sosa	Vargas	1992-11-02	Wilmington	Ap #110-9269 Ut Av.
166	Brittany	Bird	Crane	1994-09-24	Kaneohe	Ap #610-4777 Vel Ave
167	Colleen	Harris	Donaldson	1978-01-21	Kansas City	Ap #614-9149 Nostra, Street
168	Dora	Roberson	Sharpe	2002-12-17	Flint	5929 Mauris Rd.
169	Hayfa	Thornton	Battle	1989-02-28	Norman	501-142 Cursus St.
170	Jameson	Bright	Mckee	1995-11-08	Fort Wayne	P.O. Box 936, 4838 Tellus. Rd.
171	Odessa	Shannon	Poole	1989-11-26	Anchorage	8846 Ac Rd.
172	Ava	Molina	Singleton	1984-08-22	Pike Creek	P.O. Box 947, 7656 Vel, Av.
173	Morgan	Cummings	Carpenter	1992-05-13	Newport News	Ap #821-6111 Donec Rd.
174	Chantale	Day	Britt	1999-10-11	Indianapolis	700-6703 Faucibus Avenue
175	Ciaran	Lowe	Berry	1980-11-24	Kansas City	P.O. Box 481, 6903 Curabitur St.
176	Nora	Riddle	Noble	1992-10-18	Fort Collins	Ap #338-3134 In Rd.
177	Quentin	Banks	Haley	1983-01-25	Portland	4886 Egestas, Road
178	Brandon	Evans	Casey	1992-09-30	Bridgeport	4203 Luctus Ave
179	Jenette	Orr	Shelton	1979-12-20	Pike Creek	P.O. Box 651, 3623 Neque St.
180	Kylee	Carney	Buckley	1999-10-31	Worcester	154-6591 Natoque Rd.
181	Hu	Bonner	Russo	1995-05-04	Evansville	Ap #901-5383 Suspendisse Street
182	Dieter	Rasmussen	Drake	1976-11-21	Hartford	Ap #595-8850 Aenean Rd.
183	Reed	Harmon	Vincent	1995-12-06	Flint	951-192 Pede, Road
184	Lane	Jacobson	Morris	2000-03-13	San Jose	P.O. Box 143, 1023 Curae Road
185	Armand	Harmon	Kramer	1978-04-05	New Orleans	Ap #226-7536 Massa. Rd.
186	Buffy	Riddle	Lopez	1979-02-13	Provo	1497 Nunc Avenue
187	Kelsey	Gibson	Blevins	1988-09-06	Cleveland	923-835 Sit St.
188	Barry	Lane	Delacruz	1992-08-03	Kearney	P.O. Box 673, 3768 Suspendisse St.
189	Amir	Newman	Clayton	2000-01-14	Lansing	Ap #985-8357 Ultricies Rd.
190	Wendy	Graham	Hines	1982-10-29	Seattle	P.O. Box 933, 7883 A St.
191	Shad	Crosby	Lara	1990-05-21	Fort Smith	8101 Tortor. Road
192	Cole	Larson	Harper	1983-06-04	New Haven	238-9995 Nisl Road
193	Ferdinand	Hogan	Aguirre	1975-12-11	Columbus	154-9006 Mus. Rd.
194	Bradley	Velasquez	Langley	1988-01-08	Knoxville	Ap #777-7990 Donec Street
195	Joshua	Saunders	Tate	1977-04-03	Columbus	Ap #387-5739 Tellus. Rd.
196	Olivia	Abbott	Norris	1983-06-22	Jefferson City	P.O. Box 401, 8155 Pharetra Rd.
197	Desiree	Trujillo	Camacho	1979-05-14	Grand Island	872-5691 Consequat Rd.
198	Lysandra	Knox	Bender	1982-05-11	Nashville	273-6531 Proin St.
199	Linda	Wong	Church	1990-12-27	Gresham	6999 Dolor Rd.
200	Kristen	Bean	Sawyer	2001-03-04	San Antonio	607-4629 Laoreet, Road
\.


--
-- Data for Name: executive_doc_types; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.executive_doc_types (id, name) FROM stdin;
1	Судебный приказ
2	Исполнительный лист
\.


--
-- Data for Name: executive_docs; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.executive_docs (id, number, date_issue, resolution_number, resolution_date, main, percents, penalties, fee, sum, type_id, contract_id, bailiff_id, agent_id) FROM stdin;
1	ВС303636761	2001-08-13	6-9177/5677	2021-12-04	463028.00	596311.00	432326.00	2786.00	724403.00	1	246	30	106
2	ВС771857949	2006-07-03	3-2175/8384	2015-01-12	415511.00	266088.00	173368.00	3948.00	3958093.00	2	258	48	54
3	ВС348668732	2018-10-30	2-8766/1751	2014-12-30	368111.00	735171.00	336470.00	7524.00	4329631.00	2	33	46	132
4	ВС865729632	2012-11-26	8-4106/2128	2017-06-21	223900.00	728057.00	286493.00	3028.00	5215471.00	2	382	14	37
5	ВС966342930	2004-08-09	6-8276/2252	2011-06-23	366057.00	594785.00	226821.00	9611.00	1550766.00	1	175	20	9
6	ВС235914835	2009-07-06	6-9844/6659	2012-07-15	296767.00	646061.00	550783.00	9795.00	6473639.00	1	56	21	87
7	ВС738786241	2019-01-21	1-5745/4120	2022-03-10	127115.00	496078.00	234256.00	3086.00	4060716.00	1	132	38	115
8	ВС222666749	2004-12-12	3-6306/1715	2021-06-12	277309.00	36452.00	127635.00	9969.00	9309130.00	2	82	18	69
9	ВС413465383	2004-01-09	8-1237/2709	2017-07-06	365041.00	565080.00	588867.00	4940.00	9462040.00	1	154	3	143
10	ВС488669266	2020-02-23	2-7066/9468	2013-11-16	204971.00	668618.00	590148.00	4800.00	6232485.00	1	148	6	17
11	ВС521881836	2014-03-19	8-2819/6690	2017-07-31	382419.00	140678.00	97381.00	2172.00	2810049.00	2	82	33	53
12	ВС066574278	2021-11-12	5-4471/6916	2019-01-09	409470.00	792290.00	474416.00	2170.00	6990429.00	2	83	39	199
13	ВС527765261	2022-07-26	3-7547/7878	2015-05-23	438136.00	333376.00	20041.00	7899.00	9444077.00	1	138	33	135
14	ВС157120486	2020-09-16	5-3148/6244	2011-08-17	159625.00	40999.00	836148.00	6886.00	8528693.00	1	347	39	126
15	ВС746788691	2016-10-22	5-7116/2164	2016-10-30	323797.00	295356.00	420670.00	6773.00	6393485.00	2	134	11	147
16	ВС469058883	2001-05-27	6-3482/4964	2019-03-28	408218.00	760002.00	665867.00	3504.00	3186145.00	1	159	22	34
17	ВС375262657	2007-08-31	3-3530/9283	2021-10-18	455201.00	601349.00	849572.00	3420.00	6831024.00	1	341	23	34
18	ВС199341513	2017-09-06	3-4029/4051	2017-02-14	64116.00	507564.00	904587.00	5979.00	4148370.00	1	207	34	69
19	ВС487222427	2019-11-28	8-0854/1226	2020-08-05	335463.00	512299.00	679685.00	7640.00	6446428.00	1	321	49	94
20	ВС594416796	2002-03-24	1-0179/1263	2016-09-21	65182.00	59873.00	573677.00	4327.00	9866040.00	2	14	10	117
21	ВС261163162	2012-03-19	3-5106/7957	2022-10-09	425516.00	727962.00	508081.00	1747.00	8581874.00	1	137	30	191
22	ВС180824377	2018-08-13	4-4143/3569	2019-08-26	354481.00	218374.00	241415.00	7645.00	6589927.00	1	72	17	178
23	ВС714858821	2010-09-22	6-8166/8633	2016-01-27	12111.00	549356.00	787148.00	8486.00	5889511.00	1	55	18	153
24	ВС156370524	2018-01-27	2-3589/2935	2020-09-14	463178.00	830452.00	173031.00	5504.00	2647327.00	1	94	41	198
25	ВС856930789	2017-02-10	3-7229/7148	2011-04-21	151243.00	415700.00	913393.00	6988.00	8626153.00	2	216	45	113
26	ВС485155722	2020-01-11	7-1258/1111	2018-06-28	22814.00	11640.00	721850.00	3806.00	8696073.00	1	327	3	18
27	ВС664726590	2022-08-14	6-7745/9823	2022-11-14	124701.00	426201.00	536937.00	6208.00	5926146.00	1	392	29	106
28	ВС155471153	2005-07-25	2-7235/3874	2021-06-19	346582.00	248298.00	981824.00	2050.00	8118651.00	1	2	16	67
29	ВС760451403	2015-02-23	0-6320/3464	2021-09-06	259223.00	725432.00	210571.00	3374.00	9358588.00	1	206	33	150
30	ВС827227474	2020-06-15	4-5909/5267	2011-12-06	313884.00	740551.00	234785.00	4470.00	4132809.00	1	323	17	5
31	ВС108254645	2017-12-19	5-1512/7419	2015-10-23	36385.00	381304.00	624942.00	8618.00	8131995.00	2	132	25	164
32	ВС536914240	2004-05-31	9-8682/6188	2011-09-18	324419.00	725463.00	71132.00	6763.00	334539.00	2	143	46	70
33	ВС611546931	2011-10-12	1-9353/4895	2016-12-13	429228.00	586410.00	868103.00	9626.00	323857.00	2	37	39	9
34	ВС516525267	2002-04-11	4-7441/7658	2022-04-23	55014.00	389841.00	627844.00	2632.00	7678326.00	1	360	49	138
35	ВС446275283	2004-06-18	2-0790/8218	2014-03-21	491890.00	166147.00	629534.00	8168.00	2455064.00	1	313	44	172
36	ВС776228274	2006-09-11	7-2431/8586	2012-12-06	289470.00	521746.00	725770.00	6642.00	2221199.00	2	262	15	59
37	ВС131307627	2005-11-02	2-7554/5885	2013-12-31	184177.00	434070.00	106613.00	3037.00	1203674.00	2	279	33	80
38	ВС437251598	2008-01-09	4-1853/2355	2016-06-27	304088.00	371581.00	3804.00	5227.00	4577129.00	2	192	8	35
39	ВС895535218	2010-04-12	2-1434/3724	2020-09-02	285921.00	550306.00	546998.00	5570.00	1381039.00	2	21	30	33
40	ВС264676524	2001-08-14	6-0136/5523	2020-08-16	147992.00	808546.00	316177.00	3825.00	9585271.00	2	229	46	62
41	ВС665376700	2005-06-04	8-4702/8617	2020-07-27	189881.00	916495.00	883138.00	363.00	332402.00	1	172	43	140
42	ВС257614922	2010-11-01	0-9698/6669	2013-04-08	416149.00	801754.00	654671.00	8120.00	7149615.00	2	135	9	73
43	ВС343267757	2009-11-06	6-4533/2422	2015-02-05	484766.00	12975.00	469197.00	4101.00	9726332.00	1	118	27	90
44	ВС911161401	2021-12-09	6-4462/8777	2015-07-15	410063.00	856483.00	489517.00	7795.00	3070676.00	1	197	48	181
45	ВС464328448	2022-04-14	8-8175/3823	2015-07-18	164822.00	904958.00	416143.00	5855.00	831908.00	1	351	25	124
46	ВС440255216	2021-11-02	7-6496/2184	2019-08-29	21351.00	716150.00	677563.00	2674.00	1580157.00	2	204	9	25
47	ВС551598561	2008-04-08	2-3606/9236	2015-02-02	44599.00	729320.00	495833.00	8211.00	8585741.00	1	86	32	74
48	ВС581486434	2013-01-05	1-2050/1366	2019-11-08	336802.00	990389.00	605191.00	5447.00	8651988.00	2	57	26	3
49	ВС221296385	2008-11-04	9-0681/4919	2010-12-06	180465.00	497783.00	505880.00	334.00	1674691.00	2	309	20	191
50	ВС052977883	2020-08-04	6-3621/1152	2011-07-22	129108.00	598003.00	80068.00	2916.00	6973894.00	2	178	9	166
51	ВС567551148	2014-10-12	4-5312/1552	2020-02-27	351440.00	458148.00	684502.00	7446.00	8221249.00	1	274	36	33
52	ВС366361145	2022-09-30	4-7570/3125	2013-01-01	384899.00	354218.00	272070.00	3095.00	9063116.00	1	315	46	46
53	ВС374747219	2020-02-01	3-7836/1012	2012-06-02	89621.00	756618.00	190577.00	1241.00	8263854.00	2	118	8	37
54	ВС378093256	2004-02-16	4-8181/3922	2012-05-10	163960.00	976215.00	290906.00	7414.00	2842911.00	1	393	4	58
55	ВС177737281	2015-01-25	7-4416/2337	2012-05-13	84483.00	585099.00	11819.00	2804.00	1234338.00	2	348	7	109
56	ВС477873565	2008-12-08	4-1510/1475	2021-01-31	282153.00	8569.00	143333.00	3089.00	1589096.00	1	243	3	45
57	ВС033311473	2012-05-24	4-8583/4261	2011-11-14	405287.00	497897.00	915275.00	5644.00	713742.00	1	254	43	54
58	ВС363368039	2013-11-13	4-5326/8156	2013-01-01	91672.00	485574.00	568087.00	1131.00	5642449.00	1	187	19	83
59	ВС042162627	2008-11-09	3-6046/3342	2012-11-25	491704.00	749626.00	60642.00	708.00	8275875.00	2	127	24	55
60	ВС647793299	2004-02-23	5-1331/5284	2017-01-04	314259.00	917483.00	47900.00	1959.00	5788962.00	1	47	36	125
61	ВС543946139	2012-06-17	9-1220/4280	2011-12-16	377618.00	970090.00	718285.00	9187.00	3547223.00	1	107	39	115
62	ВС112687461	2003-08-17	6-1834/2685	2013-12-09	210607.00	786483.00	533680.00	8536.00	4538985.00	2	180	23	134
63	ВС110186286	2006-12-15	6-3323/6810	2018-10-28	3348.00	513031.00	301344.00	4422.00	6029747.00	2	175	33	174
64	ВС334804658	2002-03-03	7-9571/7777	2012-07-15	124073.00	441039.00	284415.00	6998.00	2594402.00	2	142	13	113
65	ВС228253509	2011-08-27	3-1578/2668	2016-02-29	87010.00	97482.00	3054.00	5625.00	2503928.00	1	263	2	140
66	ВС642763262	2002-02-28	6-3194/7154	2011-10-29	219885.00	193353.00	528484.00	1922.00	9323258.00	2	234	25	97
67	ВС746614439	2013-07-28	2-3204/8531	2017-01-07	280429.00	543284.00	349727.00	6520.00	5152302.00	2	265	33	29
68	ВС758393363	2014-05-21	3-6287/4665	2013-05-14	61626.00	720716.00	369199.00	2973.00	8467551.00	2	224	40	177
69	ВС741218237	2001-05-20	1-1557/0648	2011-04-01	68993.00	445272.00	160665.00	168.00	6895439.00	2	30	36	143
70	ВС528768887	2011-12-10	5-7668/6382	2021-03-23	348132.00	877536.00	845146.00	5876.00	1621566.00	1	286	2	182
71	ВС565071502	2016-02-08	0-2545/3513	2016-07-16	357938.00	895037.00	754333.00	8835.00	3979994.00	2	47	7	93
72	ВС869623357	2020-03-27	4-4224/8273	2011-09-19	471509.00	867617.00	129498.00	9937.00	5259512.00	1	52	9	27
73	ВС949404689	2021-10-09	8-2235/9743	2012-12-19	198492.00	380808.00	81799.00	2304.00	4937825.00	2	396	11	21
74	ВС395382066	2004-12-21	0-3805/4298	2019-07-19	215794.00	65751.00	16161.00	6451.00	2781450.00	1	321	21	95
75	ВС267368397	2006-09-13	4-8764/1066	2019-09-07	285630.00	745967.00	880286.00	9270.00	674708.00	2	94	34	157
76	ВС381064130	2019-06-29	5-3751/8118	2020-06-17	353117.00	67050.00	798163.00	2869.00	5013861.00	1	285	45	27
77	ВС291651023	2019-04-07	9-4688/4147	2019-01-20	313667.00	796317.00	690801.00	5747.00	5522933.00	1	197	22	67
78	ВС213245347	2010-05-26	9-2839/2656	2013-01-16	197536.00	951664.00	232944.00	6592.00	2387194.00	1	134	40	133
79	ВС525483733	2012-11-19	6-5370/7985	2012-07-17	85772.00	999977.00	476804.00	6660.00	2638264.00	2	303	46	79
80	ВС138698382	2002-02-08	4-6632/0837	2017-11-18	77006.00	287017.00	162881.00	3663.00	7644050.00	1	280	1	88
81	ВС458616205	2016-11-21	8-6184/7692	2021-02-12	431691.00	173632.00	387915.00	1374.00	8608292.00	2	163	2	101
82	ВС452231563	2009-08-07	7-2637/4815	2012-04-13	455307.00	767357.00	335792.00	5278.00	7575566.00	1	49	42	77
83	ВС425208339	2003-04-13	2-2417/8732	2013-10-22	275957.00	910069.00	159482.00	7090.00	1502529.00	1	64	39	196
84	ВС272821273	2014-05-28	5-8975/5729	2013-12-28	131700.00	956981.00	668413.00	4070.00	363053.00	2	122	40	142
85	ВС187643325	2003-04-24	7-6635/2397	2022-03-15	413343.00	155787.00	69441.00	3642.00	5797053.00	2	311	29	7
86	ВС180227790	2018-02-10	9-4131/9643	2015-11-08	155581.00	600838.00	952640.00	8085.00	3626136.00	2	181	20	106
87	ВС216117432	2020-01-06	5-1678/1342	2013-02-20	388436.00	131004.00	699572.00	8685.00	6112502.00	1	207	4	5
88	ВС505758314	2021-12-21	6-2668/1481	2022-08-16	217338.00	506937.00	922901.00	5843.00	7559411.00	2	98	48	143
89	ВС768663768	2019-03-22	4-8843/7675	2017-08-21	209161.00	37273.00	294246.00	98.00	9871443.00	2	284	35	73
90	ВС510284416	2003-05-04	0-6865/4412	2014-07-19	448090.00	789075.00	120898.00	7025.00	8200783.00	2	114	14	184
91	ВС902437662	2005-12-10	3-7664/7550	2016-08-04	269485.00	488038.00	860913.00	2044.00	9293569.00	1	16	4	84
92	ВС046708670	2021-07-10	4-1176/8319	2012-07-03	244379.00	742739.00	501472.00	4980.00	2887893.00	2	239	18	78
93	ВС128838037	2002-06-26	7-4283/1700	2020-06-15	25820.00	885846.00	383043.00	5340.00	3412513.00	1	281	26	58
94	ВС673853147	2017-11-11	6-5515/8966	2014-08-09	218281.00	882988.00	714708.00	9633.00	4801776.00	2	141	33	89
95	ВС864258676	2012-05-24	5-9944/4195	2016-02-26	210722.00	753769.00	342325.00	155.00	5897260.00	2	283	8	196
96	ВС328741378	2001-09-21	8-4644/5178	2012-03-18	350057.00	734735.00	102909.00	2029.00	933697.00	1	133	26	196
97	ВС739043862	2011-05-14	9-4362/3725	2012-01-20	223278.00	162590.00	245293.00	6688.00	6527752.00	2	9	20	199
98	ВС968377277	2005-03-18	2-5328/3528	2018-12-04	318196.00	280039.00	603683.00	4253.00	905597.00	2	194	16	140
99	ВС180841426	2003-01-27	3-6167/2414	2015-03-08	96253.00	150733.00	803958.00	7777.00	1492503.00	1	31	13	97
100	ВС222918655	2017-01-20	1-2089/6052	2020-05-19	257400.00	692109.00	144804.00	3461.00	7291467.00	1	27	13	96
101	ВС656482937	2021-12-12	2-3642/2111	2022-10-17	339555.00	974632.00	820480.00	2204.00	5199927.00	2	148	4	195
102	ВС556786012	2009-09-17	8-8623/7598	2012-04-10	351348.00	221005.00	110356.00	1276.00	6742520.00	1	162	3	159
103	ВС923714449	2011-02-01	2-5423/2636	2021-12-19	188515.00	370663.00	836900.00	130.00	6255673.00	2	178	50	193
104	ВС208289471	2019-05-15	7-2617/8741	2018-08-24	99372.00	107231.00	254588.00	1685.00	6790490.00	2	272	17	16
105	ВС896128612	2002-04-18	5-7341/9719	2014-09-14	258347.00	699756.00	861336.00	7090.00	4518638.00	2	99	36	47
106	ВС287434830	2015-09-23	7-5264/4707	2019-02-07	113764.00	213904.00	608207.00	2531.00	7580819.00	1	246	26	83
107	ВС864480554	2011-05-26	6-3303/6511	2022-04-12	478994.00	987758.00	777934.00	185.00	687363.00	1	176	45	125
108	ВС503455122	2007-08-08	0-8983/2342	2017-04-10	218084.00	910712.00	25591.00	5299.00	6971108.00	1	152	49	104
109	ВС442630538	2013-09-30	6-4575/2954	2013-01-28	89929.00	62464.00	225468.00	8590.00	3750932.00	1	376	29	165
110	ВС829298616	2022-09-24	6-2887/6122	2018-11-28	183045.00	261887.00	184581.00	574.00	8496435.00	2	212	7	183
111	ВС152848134	2021-08-12	8-8896/1042	2016-05-02	346774.00	453763.00	622938.00	6091.00	1695688.00	1	392	17	13
112	ВС208788689	2011-02-09	7-7431/0568	2021-02-07	196848.00	674016.00	822425.00	5429.00	1273279.00	1	117	15	76
113	ВС196497316	2011-07-07	3-4629/4488	2021-01-08	463842.00	950910.00	359810.00	8244.00	8710783.00	1	72	6	146
114	ВС469469498	2021-06-02	1-7547/0431	2018-05-18	306443.00	72053.00	844836.00	3491.00	8721133.00	1	20	25	1
115	ВС216914695	2011-04-16	5-1818/8732	2019-12-25	89056.00	513001.00	227427.00	6670.00	9002464.00	1	271	43	127
116	ВС530181310	2019-04-21	7-6047/8825	2019-07-16	480309.00	680132.00	942628.00	537.00	5273094.00	1	48	13	54
117	ВС744287684	2010-07-05	3-7714/2445	2011-01-02	39833.00	869664.00	149986.00	3305.00	3853882.00	1	393	8	163
118	ВС658585434	2007-06-05	5-1636/7573	2011-08-04	31073.00	771810.00	712220.00	8936.00	230148.00	2	205	7	46
119	ВС639122427	2017-12-03	4-2535/3515	2012-12-17	325953.00	902617.00	363441.00	755.00	1236808.00	2	223	36	107
120	ВС674260171	2019-08-23	1-2254/7715	2011-08-06	18706.00	311690.00	785824.00	6467.00	571859.00	1	261	39	123
121	ВС855832450	2009-12-03	8-6585/0732	2015-12-20	10816.00	116051.00	132643.00	7001.00	7967920.00	1	153	32	166
122	ВС582170884	2006-12-06	6-1862/9408	2013-02-26	374714.00	253709.00	611896.00	2086.00	2697894.00	1	242	46	196
123	ВС309358876	2004-09-29	0-0180/2074	2013-12-13	219968.00	595190.00	822890.00	607.00	6844693.00	1	278	33	4
124	ВС227779519	2010-12-14	7-8894/9778	2016-01-18	314388.00	18731.00	823855.00	9349.00	9198229.00	1	56	3	176
125	ВС163613533	2004-11-26	1-9577/4217	2016-09-14	98045.00	884030.00	932657.00	3366.00	3179900.00	1	348	29	157
126	ВС061524940	2001-10-15	4-4585/8822	2014-01-18	55634.00	416088.00	337126.00	2348.00	244572.00	2	125	49	145
127	ВС006813427	2016-10-09	7-7018/3578	2017-07-31	86864.00	80694.00	902634.00	3356.00	2961380.00	2	1	46	68
128	ВС110827447	2011-11-22	8-4581/8037	2012-06-17	413280.00	514936.00	246515.00	5592.00	3039720.00	1	181	35	124
129	ВС568466261	2019-07-03	7-7340/1195	2017-10-22	403651.00	212552.00	697799.00	9255.00	956903.00	2	93	3	11
130	ВС737228709	2016-04-02	8-4566/5814	2013-11-15	25757.00	592610.00	995710.00	4094.00	4202595.00	1	309	32	64
131	ВС949196234	2011-10-03	7-5826/4640	2022-08-08	455897.00	408701.00	831531.00	9989.00	1502377.00	2	22	16	58
132	ВС186392679	2022-02-26	5-4153/9137	2013-02-17	88087.00	643355.00	772239.00	1181.00	1207997.00	1	174	2	137
133	ВС224345218	2022-03-19	5-7317/7384	2019-01-06	226601.00	789994.00	8422.00	205.00	7886958.00	2	120	9	30
134	ВС021484716	2021-07-14	8-8369/1471	2018-06-25	353914.00	386208.00	634757.00	3467.00	2301970.00	1	50	32	59
135	ВС842179258	2008-06-22	3-7587/3260	2020-09-13	401210.00	516649.00	985844.00	8467.00	2368864.00	2	137	48	110
136	ВС546596329	2005-03-30	4-0875/3284	2018-08-10	368064.00	965071.00	592629.00	5584.00	2199987.00	2	273	4	138
137	ВС426663278	2016-07-08	7-7540/1122	2022-10-24	440877.00	660353.00	439468.00	5637.00	3235343.00	1	198	8	78
138	ВС573633263	2019-07-14	3-1404/2488	2015-12-23	468609.00	529416.00	804090.00	8920.00	7606925.00	1	168	29	48
139	ВС972781994	2022-03-29	5-8125/6866	2022-05-12	4618.00	561326.00	963685.00	9163.00	7234797.00	2	154	5	65
140	ВС535967232	2010-03-30	2-3829/9181	2011-03-11	181451.00	113468.00	712989.00	327.00	3739187.00	1	151	5	119
141	ВС285964656	2019-02-03	9-1827/6784	2014-01-15	137404.00	884439.00	445044.00	183.00	2357942.00	1	396	48	18
142	ВС839192627	2015-09-24	0-1221/7771	2015-08-20	241558.00	609906.00	739145.00	7656.00	4022786.00	1	8	7	53
143	ВС291555825	2018-05-10	3-4365/1606	2020-12-02	284373.00	105632.00	52106.00	9880.00	8927727.00	2	39	6	12
144	ВС390661527	2014-08-29	3-8117/1518	2017-06-02	189249.00	402503.00	361502.00	9186.00	8153071.00	1	398	49	22
145	ВС003612064	2011-03-17	8-7528/7676	2016-06-02	475755.00	544148.00	597265.00	985.00	6191595.00	2	89	31	137
146	ВС437344671	2001-09-12	7-6562/8411	2018-09-27	358975.00	379361.00	84546.00	3647.00	1857333.00	2	303	16	84
147	ВС321555548	2003-09-06	8-3249/2917	2014-03-09	173941.00	916611.00	671688.00	4293.00	9627697.00	1	93	48	110
148	ВС639266061	2014-02-08	6-4666/6512	2011-06-27	15025.00	868845.00	780436.00	8137.00	8482227.00	2	328	43	146
149	ВС154174212	2012-04-07	8-1245/6946	2017-07-07	265417.00	78045.00	289408.00	5691.00	6348740.00	1	172	22	178
150	ВС567243372	2013-01-07	4-7115/7725	2013-02-10	489038.00	325743.00	97003.00	9420.00	8418371.00	2	162	40	199
151	ВС862147137	2002-01-29	2-3512/3825	2021-01-20	289577.00	605044.00	463336.00	495.00	4386516.00	2	38	13	86
152	ВС052328689	2016-05-19	1-3047/3197	2012-12-03	239484.00	477561.00	128764.00	383.00	7545060.00	2	341	42	148
153	ВС262945343	2002-12-16	3-6272/7534	2013-04-08	465025.00	766778.00	34721.00	446.00	3643390.00	2	361	24	69
154	ВС971284217	2022-03-05	7-1372/7463	2020-02-10	33839.00	679500.00	370444.00	3024.00	8704067.00	2	217	39	175
155	ВС384172629	2004-12-17	3-6952/1428	2016-01-10	434683.00	384204.00	943476.00	6300.00	7691027.00	2	234	21	61
156	ВС361563273	2009-05-09	3-8234/4871	2016-03-31	316077.00	103071.00	957596.00	4834.00	1978837.00	1	336	35	130
157	ВС719712441	2015-11-01	7-2581/3128	2014-06-09	382775.00	517194.00	558967.00	4809.00	3284096.00	2	11	37	136
158	ВС141418651	2003-05-05	8-0388/7226	2017-06-04	86900.00	140685.00	16631.00	1889.00	7508573.00	2	165	5	107
159	ВС434483627	2010-09-26	8-6488/3929	2016-02-26	454565.00	301420.00	301918.00	2826.00	4650026.00	2	333	9	181
160	ВС822785267	2001-07-11	5-6461/7145	2022-08-22	400225.00	441187.00	454726.00	4467.00	5071295.00	2	76	25	171
161	ВС176371865	2015-05-18	4-2495/9122	2021-02-13	274876.00	636705.00	194794.00	4612.00	9735384.00	2	298	13	154
162	ВС269614463	2012-10-01	5-0865/4521	2019-06-22	485278.00	388043.00	515814.00	3169.00	7161096.00	1	281	43	13
163	ВС753543879	2009-01-09	2-1413/3328	2011-03-17	414122.00	564490.00	990842.00	9466.00	8814530.00	2	376	26	195
164	ВС999922385	2010-01-08	3-3872/3800	2015-11-04	362141.00	623714.00	549495.00	8750.00	3549657.00	2	189	13	38
165	ВС576638624	2008-06-24	1-7719/6578	2013-12-22	467575.00	274329.00	517194.00	1393.00	6092097.00	2	126	1	125
166	ВС529337550	2021-02-10	6-7921/4823	2013-05-27	60136.00	637563.00	836416.00	6677.00	5992379.00	2	115	16	126
167	ВС439077136	2022-06-17	4-5216/2853	2016-09-18	297129.00	24996.00	979391.00	2403.00	7253575.00	1	7	13	160
168	ВС361760516	2010-08-06	3-3654/5842	2016-01-28	442434.00	59485.00	497970.00	9616.00	1411784.00	2	242	30	94
169	ВС381934303	2012-02-15	6-8596/9757	2012-09-02	311336.00	217602.00	123265.00	5927.00	14871.00	1	112	7	103
170	ВС329578519	2018-11-11	1-8433/1069	2020-02-10	55640.00	100607.00	117914.00	5995.00	3244259.00	2	149	8	118
171	ВС857862543	2004-11-28	7-1803/8541	2013-10-18	336883.00	695875.00	537537.00	5955.00	3030053.00	1	299	34	169
172	ВС888342250	2007-03-03	0-1295/2281	2020-07-19	66149.00	363776.00	140777.00	424.00	9827272.00	2	391	50	101
173	ВС643315355	2006-02-01	5-2138/4955	2017-12-25	353382.00	276722.00	737242.00	8764.00	8068673.00	2	40	29	12
174	ВС077375488	2018-03-16	2-0425/7455	2013-05-09	54207.00	26217.00	619073.00	6299.00	4116592.00	2	226	16	86
175	ВС102165726	2014-03-16	9-0713/8626	2020-08-30	483264.00	701218.00	805903.00	97.00	9368576.00	2	295	18	68
176	ВС634542368	2014-12-17	1-5872/3776	2020-04-23	346087.00	319390.00	868106.00	1650.00	2013754.00	2	58	3	61
177	ВС788610827	2012-09-13	6-6234/5389	2022-03-26	400221.00	737562.00	350775.00	9799.00	8859213.00	2	64	31	100
178	ВС234730895	2016-11-26	2-2816/8116	2019-09-28	150375.00	523053.00	425326.00	2484.00	2141074.00	2	228	28	31
179	ВС857523492	2003-01-02	1-5412/7656	2015-02-28	478150.00	570950.00	278518.00	1332.00	6799561.00	2	97	43	89
180	ВС618448325	2015-05-20	7-1734/1628	2020-06-11	46032.00	535015.00	397117.00	6290.00	4398319.00	1	375	45	21
181	ВС886886551	2010-10-04	7-5575/8019	2012-10-13	353547.00	776621.00	891025.00	5353.00	3415156.00	2	125	33	143
182	ВС726305157	2009-10-16	2-9509/7646	2014-01-21	451058.00	108022.00	197208.00	2118.00	9353616.00	1	243	24	197
183	ВС353507034	2021-11-16	7-4718/3439	2020-07-26	230993.00	305962.00	891839.00	5920.00	5458069.00	1	170	28	115
184	ВС623453874	2018-05-20	1-4312/3000	2014-07-03	418773.00	25989.00	205810.00	9122.00	2028535.00	1	67	25	9
185	ВС286143126	2018-03-29	6-2162/1535	2019-04-15	188421.00	547275.00	186065.00	9990.00	4185542.00	1	297	11	175
186	ВС727718552	2013-12-22	9-3827/7522	2014-05-07	302454.00	374563.00	293928.00	9809.00	8514738.00	2	21	30	182
187	ВС361376557	2007-03-07	3-9137/4513	2019-10-30	152218.00	193129.00	592891.00	6763.00	7670157.00	1	281	25	196
188	ВС526126255	2012-11-22	2-5355/1864	2017-04-03	398681.00	756139.00	678496.00	3507.00	4051992.00	1	263	5	12
189	ВС857928082	2003-12-24	8-4158/5572	2016-05-01	432573.00	231015.00	512480.00	8718.00	1110628.00	1	206	24	75
190	ВС702408288	2004-09-22	2-7823/1816	2018-04-27	352884.00	526678.00	494923.00	7346.00	2444651.00	2	207	40	156
191	ВС139100724	2007-08-02	3-4216/7774	2012-07-27	20952.00	189443.00	78905.00	4500.00	5455169.00	2	334	23	158
192	ВС151657577	2013-07-15	9-3934/2510	2014-08-14	235904.00	594380.00	999862.00	5017.00	823198.00	1	100	10	115
193	ВС584423421	2008-08-22	7-4862/1776	2014-01-02	196790.00	29646.00	894498.00	5133.00	1488991.00	2	35	1	109
194	ВС353812439	2013-07-16	2-3485/5022	2014-07-10	50442.00	60059.00	205706.00	1879.00	6149955.00	2	9	16	119
195	ВС473012625	2010-06-05	5-9439/8816	2021-09-23	44063.00	576048.00	321376.00	8853.00	3333543.00	1	25	1	145
196	ВС530384327	2001-03-27	9-8581/2535	2012-12-07	312779.00	666753.00	59661.00	4013.00	6184917.00	2	71	42	161
197	ВС825971722	2019-11-23	5-6577/4882	2022-10-17	46839.00	251996.00	696442.00	6033.00	4887303.00	1	333	6	45
198	ВС714088253	2015-04-22	1-6316/8567	2016-12-09	73419.00	15239.00	88263.00	187.00	1209057.00	1	295	17	61
199	ВС437377114	2021-05-06	1-0874/5260	2015-03-31	117085.00	320921.00	392304.00	1576.00	6293264.00	1	223	44	166
200	ВС535495562	2008-05-25	3-0874/3632	2018-12-25	299323.00	196531.00	930644.00	9098.00	1059055.00	1	327	25	183
201	ВС724836154	2015-07-06	5-3648/7362	2022-11-18	374032.00	557083.00	917322.00	6029.00	7499039.00	1	228	36	178
202	ВС086331515	2005-07-14	5-0813/9971	2015-07-20	328937.00	906037.00	613507.00	8151.00	8608089.00	2	160	30	198
203	ВС405419686	2000-12-08	3-5849/5729	2016-12-21	213030.00	922522.00	325710.00	1864.00	5004898.00	1	268	24	90
204	ВС250507582	2020-05-28	3-5572/8474	2021-05-04	176778.00	600468.00	59717.00	6646.00	187914.00	1	212	28	54
205	ВС402463614	2003-01-03	1-2947/0746	2014-06-20	100830.00	337635.00	800347.00	6197.00	5561579.00	2	207	30	13
206	ВС866286674	2010-01-20	4-2416/2471	2017-01-23	249082.00	92727.00	467927.00	4103.00	8480472.00	1	96	29	15
207	ВС944246478	2022-05-12	2-4104/5165	2016-02-11	253155.00	295305.00	198759.00	1234.00	3250594.00	2	167	49	162
208	ВС249410104	2015-10-22	4-4443/5347	2019-06-16	396653.00	433000.00	522758.00	745.00	6042409.00	1	237	30	160
209	ВС772068725	2020-04-04	7-7484/8222	2019-01-24	4119.00	22431.00	348117.00	1386.00	2379914.00	2	44	12	160
210	ВС322552465	2003-01-02	7-1585/5066	2013-02-18	52437.00	973574.00	518234.00	3508.00	8215254.00	2	245	41	88
211	ВС661585708	2022-07-29	3-0994/9658	2019-12-20	352574.00	417834.00	995253.00	1684.00	7465964.00	2	136	27	185
212	ВС872219262	2013-12-15	7-7055/7181	2016-03-27	263243.00	946726.00	330717.00	4694.00	7604435.00	2	373	31	84
213	ВС684536827	2021-12-19	4-0580/5343	2017-06-05	373906.00	391088.00	570107.00	2332.00	8760176.00	1	76	23	174
214	ВС836572251	2010-04-24	6-1822/9220	2013-01-31	334020.00	707270.00	77006.00	3670.00	2044067.00	1	267	49	73
215	ВС883349866	2014-08-11	6-9638/8372	2021-10-23	249569.00	222004.00	143873.00	5655.00	1705659.00	1	35	48	174
216	ВС305357854	2021-03-14	7-3536/1378	2016-06-23	376653.00	119537.00	183842.00	6577.00	6166304.00	2	275	38	134
217	ВС251857820	2006-10-04	7-3108/0186	2019-04-24	160832.00	269103.00	241084.00	7121.00	6715417.00	2	268	31	38
218	ВС368863946	2011-11-20	6-1103/3329	2015-01-10	144238.00	723293.00	563558.00	8848.00	9047415.00	2	98	46	136
219	ВС263898436	2018-04-25	9-6718/9024	2012-10-27	416809.00	877325.00	372902.00	8823.00	7382351.00	2	229	32	19
220	ВС198480584	2018-04-25	6-8493/3422	2014-05-23	494148.00	443067.00	362498.00	6908.00	8463231.00	1	245	47	63
221	ВС354275112	2021-10-16	9-1815/7564	2012-10-09	41603.00	338240.00	210538.00	1717.00	592560.00	2	319	8	81
222	ВС232835244	2016-03-20	6-0618/3136	2020-01-09	207187.00	403201.00	475383.00	6104.00	3775936.00	1	112	32	125
223	ВС714765773	2006-01-24	4-7672/7767	2017-07-20	108844.00	449361.00	744595.00	5785.00	7763230.00	1	134	33	148
224	ВС542732108	2014-10-18	7-3406/6682	2013-10-13	349916.00	999429.00	717588.00	7356.00	7255523.00	1	367	23	62
225	ВС382812882	2009-01-09	7-2711/1733	2013-01-28	332812.00	305957.00	779357.00	8791.00	8258747.00	1	53	1	7
226	ВС172423595	2016-11-13	5-1390/2205	2012-06-21	285468.00	371438.00	591372.00	6915.00	673754.00	1	207	38	73
227	ВС551412828	2004-01-21	6-8735/4334	2020-02-03	403919.00	359483.00	903905.00	2717.00	9602868.00	2	79	46	131
228	ВС438833481	2016-10-24	5-4366/5623	2015-10-10	294079.00	532927.00	82092.00	5735.00	3996442.00	1	29	16	43
229	ВС166671743	2010-12-04	2-2320/8756	2022-05-11	82507.00	660989.00	197327.00	3855.00	2137823.00	1	382	21	55
230	ВС632703482	2008-12-09	2-4654/1313	2021-12-11	177838.00	61881.00	771913.00	1138.00	8664473.00	1	304	38	189
231	ВС732709148	2005-08-15	7-5287/2688	2017-01-02	49121.00	33163.00	617577.00	2472.00	8222663.00	2	263	43	94
232	ВС757354616	2017-06-13	8-0359/8789	2015-12-11	35047.00	583852.00	683638.00	617.00	7927488.00	1	315	16	59
233	ВС332134665	2011-02-18	9-0118/7601	2011-01-05	229916.00	266230.00	519566.00	8837.00	1337731.00	2	106	14	177
234	ВС821124965	2016-07-11	2-5214/7034	2020-11-30	30670.00	756753.00	301129.00	4170.00	5422107.00	1	290	3	128
235	ВС812671225	2021-08-19	4-6122/6844	2020-09-16	494099.00	635774.00	12938.00	5624.00	9017908.00	1	399	25	178
236	ВС883686522	2022-02-23	3-3388/8028	2015-09-13	133425.00	994492.00	543233.00	675.00	2063311.00	2	132	30	15
237	ВС715526777	2014-05-21	8-0859/7036	2018-01-24	69502.00	181261.00	821847.00	4890.00	2231732.00	1	204	30	36
238	ВС112213517	2002-02-20	7-3357/6579	2011-07-05	468780.00	397903.00	332556.00	4426.00	6942334.00	2	200	27	76
239	ВС173517899	2004-10-31	0-2198/8511	2017-02-18	80101.00	802696.00	862571.00	2863.00	1472135.00	1	346	3	113
240	ВС839168588	2022-06-15	3-4962/6663	2021-08-13	305495.00	581789.00	950451.00	7892.00	835007.00	2	88	26	137
241	ВС677826250	2004-10-17	5-4239/4970	2016-11-07	25540.00	26759.00	883650.00	6092.00	6603358.00	1	290	3	135
242	ВС069397881	2008-04-24	7-4737/4636	2014-06-11	46499.00	95786.00	385745.00	2756.00	8153877.00	1	69	32	76
243	ВС037984983	2018-12-02	5-5541/5096	2015-08-01	178823.00	280039.00	748480.00	2349.00	3151268.00	1	388	29	5
244	ВС676361348	2004-02-15	6-1485/3493	2015-07-26	5924.00	287590.00	314145.00	2150.00	5606506.00	1	102	41	7
245	ВС376633114	2001-08-24	8-6688/4893	2019-07-04	73685.00	969002.00	644760.00	8845.00	6512979.00	2	92	1	190
246	ВС274270628	2009-08-15	3-5777/2675	2015-12-31	459991.00	321836.00	17741.00	5296.00	7878982.00	1	313	17	185
247	ВС222332928	2016-10-04	3-3985/5517	2014-09-16	286073.00	215925.00	861453.00	6190.00	2417857.00	2	236	25	9
248	ВС220418741	2011-12-01	2-8162/7207	2019-02-10	32910.00	707196.00	58014.00	5930.00	1769764.00	1	78	13	46
249	ВС635488847	2019-01-23	5-6531/4972	2020-02-21	322851.00	912355.00	43227.00	9395.00	2860579.00	2	203	15	153
250	ВС427526266	2004-07-12	8-8542/0783	2020-08-11	486494.00	655589.00	768760.00	7329.00	2642500.00	1	225	32	160
251	ВС498587655	2015-08-30	7-8034/3917	2022-07-07	230614.00	512284.00	815594.00	4404.00	5004782.00	2	242	32	9
252	ВС318201669	2020-03-08	4-0653/7017	2011-06-27	88441.00	729189.00	809168.00	6508.00	7213271.00	1	396	18	163
253	ВС189386874	2012-04-30	2-6395/1045	2020-07-08	320607.00	421770.00	508401.00	7639.00	8144059.00	2	399	6	142
254	ВС853593288	2013-06-10	3-4682/4720	2021-10-29	177685.00	910345.00	115182.00	7508.00	9297573.00	1	230	20	129
255	ВС494037260	2021-11-15	9-6787/7373	2019-07-10	415089.00	758673.00	543337.00	3227.00	5471184.00	1	71	21	26
256	ВС407861389	2004-03-28	6-7154/3718	2014-04-25	237852.00	637273.00	44114.00	622.00	644458.00	2	12	27	161
257	ВС447896493	2012-01-25	0-7795/3436	2021-05-10	427965.00	694464.00	575762.00	9196.00	9868050.00	1	389	9	56
258	ВС107190338	2007-04-27	6-8284/2969	2019-03-15	155598.00	774104.00	266568.00	3196.00	464729.00	2	33	41	139
259	ВС219417182	2010-06-20	3-8275/7518	2011-05-16	304736.00	697876.00	943565.00	3030.00	4300757.00	1	9	36	13
260	ВС321434113	2007-08-27	0-5740/1414	2022-05-31	478679.00	956388.00	290597.00	6263.00	718178.00	2	196	41	84
261	ВС168873814	2017-02-10	7-7783/5837	2021-10-01	188703.00	92114.00	175431.00	4883.00	7125744.00	1	261	7	198
262	ВС497631154	2017-09-10	1-2296/1714	2012-03-29	221794.00	676550.00	817129.00	8790.00	6450171.00	1	173	40	138
263	ВС467727650	2002-06-27	2-8558/1781	2012-10-14	215613.00	699565.00	680143.00	3870.00	9981436.00	1	202	29	53
264	ВС286742232	2009-06-30	2-7610/5150	2014-08-27	432843.00	468096.00	765338.00	2474.00	304693.00	2	155	21	123
265	ВС402489002	2022-06-22	4-9185/8504	2020-02-29	100582.00	871157.00	473971.00	3037.00	8024926.00	2	19	47	130
266	ВС907272436	2018-11-10	6-2252/8188	2016-09-16	100717.00	638101.00	606329.00	8439.00	1588763.00	2	102	7	8
267	ВС388623001	2006-08-02	6-3663/7241	2021-07-13	240013.00	675258.00	784502.00	3834.00	1390621.00	1	6	13	158
268	ВС323866320	2020-01-19	6-0792/4661	2021-12-10	67374.00	796244.00	362040.00	5092.00	9563239.00	2	129	16	39
269	ВС444353516	2005-04-01	4-8129/6850	2017-03-15	20977.00	70017.00	419342.00	6727.00	7810972.00	1	387	2	89
270	ВС936705729	2003-10-09	8-6605/2174	2016-05-21	294404.00	338785.00	360636.00	8645.00	7806829.00	1	147	41	14
271	ВС747325868	2012-12-27	9-2663/1568	2014-06-05	309347.00	282201.00	244752.00	969.00	3804610.00	1	383	28	68
272	ВС202276382	2008-06-24	0-2359/6960	2014-07-09	287109.00	487343.00	598353.00	8847.00	1263975.00	1	336	6	130
273	ВС402128360	2015-12-09	4-7718/6465	2011-05-28	50512.00	113191.00	807486.00	1132.00	3848702.00	2	204	30	24
274	ВС517972565	2017-05-25	6-8167/1271	2017-05-01	72386.00	418763.00	837866.00	7202.00	3591361.00	2	98	10	2
275	ВС692416577	2017-11-06	2-2664/0663	2018-03-07	63337.00	241559.00	972455.00	6602.00	7076130.00	2	283	41	183
276	ВС771118416	2010-05-07	1-5443/5742	2021-03-24	272714.00	170354.00	479711.00	8737.00	1791231.00	1	389	34	39
277	ВС618288711	2003-06-16	2-4577/1014	2011-05-04	116625.00	257082.00	661355.00	6475.00	7456894.00	2	83	21	76
278	ВС292273253	2018-07-24	4-7311/2243	2016-01-27	371216.00	25602.00	845792.00	4085.00	1764124.00	2	290	39	176
279	ВС858105321	2009-06-07	2-1886/1217	2011-06-19	396612.00	739483.00	53147.00	6975.00	7964228.00	2	145	2	144
280	ВС235753088	2011-12-17	0-4241/7223	2019-11-29	169968.00	585887.00	20239.00	2969.00	6570169.00	2	91	41	153
281	ВС047512608	2002-07-18	7-5238/8264	2018-09-28	279573.00	215044.00	326672.00	9462.00	6475894.00	2	12	36	38
282	ВС115125431	2004-06-13	1-7440/0825	2017-04-13	372921.00	664283.00	325943.00	5406.00	4267016.00	2	20	45	100
283	ВС180047580	2001-10-06	9-0649/6447	2018-09-04	294366.00	317362.00	872318.00	3219.00	2908093.00	2	301	31	87
284	ВС156619992	2006-12-04	2-3583/0426	2018-10-30	16817.00	128928.00	103970.00	828.00	9413190.00	1	157	49	28
285	ВС841883486	2011-05-01	2-7714/7884	2017-07-25	422623.00	11183.00	459582.00	2714.00	6909747.00	2	318	38	11
286	ВС917072844	2021-08-16	6-4292/4740	2020-06-26	171879.00	325389.00	905789.00	3562.00	1829752.00	1	120	9	106
287	ВС011737655	2020-02-22	5-0241/6744	2018-01-17	448426.00	575031.00	527072.00	6845.00	1312337.00	2	175	47	119
288	ВС467269977	2010-10-08	2-3783/1146	2014-11-17	26139.00	339449.00	25254.00	6659.00	3847527.00	1	325	23	63
289	ВС203867862	2022-03-06	5-1442/1545	2018-11-01	474057.00	745450.00	412467.00	1245.00	4838974.00	2	17	37	6
290	ВС143957271	2021-03-07	3-8507/7889	2011-07-23	78471.00	319930.00	975792.00	3713.00	491206.00	2	247	37	101
291	ВС945780559	2015-10-04	2-6886/3591	2012-12-15	216518.00	355081.00	345849.00	1298.00	3377663.00	2	24	13	176
292	ВС567863839	2014-06-07	0-8109/4234	2016-04-10	237004.00	568321.00	683177.00	1752.00	4057100.00	2	30	2	86
293	ВС254145815	2012-08-05	6-6657/6171	2021-08-28	108484.00	260823.00	788742.00	6200.00	151539.00	1	364	17	115
294	ВС228764960	2020-10-29	3-3110/1380	2019-04-17	277346.00	363803.00	866086.00	8487.00	416227.00	1	158	2	69
295	ВС314647217	2017-05-11	6-7150/2258	2015-12-04	314919.00	807106.00	344301.00	2224.00	7540575.00	2	163	4	172
296	ВС571373111	2001-08-19	3-9554/8496	2013-12-22	29491.00	364670.00	874752.00	6555.00	3029781.00	2	60	21	190
297	ВС186891568	2003-10-23	4-3761/5772	2022-07-13	419860.00	382866.00	748527.00	9993.00	27516.00	2	137	42	162
298	ВС332722635	2003-05-23	6-7820/9587	2018-07-15	299032.00	79524.00	790828.00	5161.00	5121031.00	2	361	47	61
299	ВС253778682	2016-04-02	5-2887/3547	2015-08-13	430935.00	64190.00	288292.00	1989.00	7983657.00	1	140	10	42
300	ВС567665797	2020-01-26	6-5946/3855	2018-07-17	262663.00	727741.00	126058.00	3247.00	7782624.00	1	340	27	158
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.groups (id, name) FROM stdin;
1	Ut Lacus Nulla Institute
2	Aliquet Vel Vulputate Consulting
3	Consequat Purus Institute
4	Luctus Felis Purus Incorporated
5	Sem Institute
6	At Industries
7	Mauris Integer Sem Foundation
8	Vel PC
9	Sollicitudin Adipiscing Ligula LLP
10	Dui Nec Foundation
11	Molestie Associates
12	Urna Vivamus Molestie Consulting
13	Risus In PC
14	Suspendisse Aliquet PC
15	Et PC
16	Suspendisse Eleifend Cras LLP
17	Nam Ac Associates
18	Sapien Gravida Limited
19	Duis Volutpat PC
20	Enim Incorporated
21	Morbi PC
22	Purus Gravida Sagittis Associates
23	Ac Mattis LLC
24	Magnis Dis Inc.
25	Egestas Fusce Institute
26	Semper Tellus Inc.
27	Facilisis Suspendisse Commodo Institute
28	Ornare Egestas Ligula Corp.
29	Malesuada Malesuada Inc.
30	Neque Pellentesque Institute
31	Convallis Ligula Donec Foundation
32	Massa Non Industries
33	Est Nunc Limited
34	Sem Consequat Nec Corp.
35	Nisl LLP
36	Amet Faucibus Ut Incorporated
37	At Auctor Ullamcorper Institute
38	Vestibulum Ante PC
39	A Auctor Consulting
40	Sapien Molestie LLC
41	At Ltd
42	Tincidunt Donec Vitae Limited
43	Risus LLP
44	Ridiculus Mus Donec Institute
45	Ac PC
46	Consectetuer Euismod LLP
47	Aliquam Ornare Industries
48	Fusce Mi Corp.
49	Sem Molestie Corporation
50	Imperdiet Ltd
\.


--
-- Data for Name: passport_types; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.passport_types (id, name) FROM stdin;
1	Паспорт гражданина РФ
2	Паспорт иностранного гражданина
\.


--
-- Data for Name: passports; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.passports (id, series, number, issued_by, issued_date, gov_unit_code, type_id, debtor_id) FROM stdin;
1	0617	130641	rutrum urna, nec luctus felis purus ac	2004-04-11	696-832	2	18
2	4963	311074	Duis gravida. Praesent eu nulla at	2014-11-19	451-357	1	152
3	2472	077090	Nulla interdum. Curabitur dictum. Phasellus in felis.	2014-11-03	363-737	2	9
4	6706	157952	nunc nulla	2018-10-27	362-247	1	144
5	8578	295348	elit, pharetra ut, pharetra sed, hendrerit a, arcu.	2014-11-25	194-443	1	180
6	1697	125131	dui. Cras pellentesque. Sed dictum. Proin eget odio.	2004-07-04	847-687	1	67
7	7298	217813	mauris.	2008-05-06	631-918	2	53
8	6615	614775	mattis semper, dui lectus rutrum	2001-11-19	545-846	1	152
9	1115	211671	et pede. Nunc sed orci lobortis augue scelerisque mollis.	2005-10-03	358-577	2	131
10	6410	234584	consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae,	2013-01-11	540-122	2	47
11	5789	783362	aliquam	2015-08-13	462-532	2	89
12	2671	916848	Aliquam adipiscing lobortis risus. In mi pede, nonummy	2016-09-19	728-346	2	80
13	3542	216543	ac orci. Ut semper pretium neque. Morbi	2013-08-10	418-416	1	141
14	5413	314693	odio vel est tempor bibendum. Donec felis orci, adipiscing	2011-06-15	086-477	1	48
15	8717	205277	vehicula et, rutrum	2015-01-31	892-710	1	119
16	7511	159981	sapien. Nunc pulvinar arcu et	2009-06-22	351-461	1	118
17	5124	385386	convallis ligula. Donec luctus aliquet odio.	2005-02-01	373-818	2	53
18	4734	655315	enim non nisi. Aenean eget metus.	2004-12-26	882-868	1	102
19	7813	934607	turpis. In condimentum.	2014-04-02	146-458	2	19
20	3115	313526	Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero	2012-08-22	397-622	2	184
21	6636	377646	felis purus ac	2010-02-08	246-176	2	24
22	0476	570491	aliquam iaculis, lacus pede sagittis augue, eu tempor erat	2017-04-05	418-722	1	32
23	5865	177848	vitae diam. Proin	2009-12-22	005-636	2	169
24	7114	324834	scelerisque, lorem ipsum sodales purus, in molestie tortor	2008-05-08	345-556	2	143
25	0623	084364	dictum cursus. Nunc mauris elit, dictum eu, eleifend nec,	2015-12-11	134-824	1	162
26	4195	184624	Integer	2013-10-16	471-080	2	174
27	1166	541091	Morbi non	2006-01-30	615-777	2	128
28	7552	877283	bibendum sed, est.	2006-10-01	617-325	2	152
29	3428	696312	magna. Ut tincidunt orci	2018-06-23	874-675	1	9
30	8205	553270	erat, in consectetuer	2008-02-11	379-467	2	29
31	3103	766566	Cras sed	2016-06-07	634-792	2	93
32	7735	662202	hendrerit neque. In ornare sagittis felis. Donec tempor, est	2018-06-04	038-371	1	125
33	3345	818648	auctor, nunc nulla vulputate dui, nec tempus mauris erat eget	2006-01-26	786-701	1	175
34	0176	702394	eros. Proin ultrices. Duis volutpat	2012-02-24	977-457	2	18
35	7838	261168	natoque penatibus et	2005-10-04	223-142	1	112
36	9489	073646	et pede. Nunc sed orci lobortis augue scelerisque mollis.	2002-01-23	715-736	2	89
37	7717	667063	purus mauris a nunc. In at	2015-04-21	427-377	2	59
38	2754	616883	ullamcorper. Duis	2008-01-14	250-335	2	104
39	1385	931773	tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare,	2017-04-02	759-952	2	148
40	3441	583852	magna et ipsum cursus vestibulum. Mauris	2014-08-09	869-604	1	38
41	7205	877842	Sed pharetra,	2001-10-11	818-848	1	93
42	0288	304006	elit, pharetra ut, pharetra	2003-07-10	485-775	2	79
43	8865	841885	sollicitudin adipiscing ligula.	2011-12-29	680-412	1	166
44	9327	530123	Pellentesque ut ipsum ac mi eleifend egestas. Sed	2016-06-08	825-348	2	156
45	0164	824236	dictum. Proin eget odio. Aliquam	2003-07-25	052-367	1	158
46	6098	211637	quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam.	2017-09-04	774-741	2	94
47	7453	546546	leo. Morbi neque tellus, imperdiet non,	2005-06-14	232-197	1	95
48	5123	607573	leo. Cras vehicula	2004-10-05	211-530	2	114
49	6102	711933	sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed	2018-04-03	536-477	2	124
50	4402	733196	scelerisque	2006-01-10	144-327	1	40
51	7232	663738	arcu. Vestibulum ut eros	2009-09-22	374-064	2	35
52	3389	388748	in, cursus et, eros. Proin	2018-12-08	078-992	1	30
53	3207	608718	sodales elit erat vitae risus. Duis a mi	2002-12-23	597-135	2	131
54	1636	769164	magna. Lorem	2001-03-29	163-040	1	10
55	4408	756274	molestie orci tincidunt adipiscing. Mauris	2008-10-02	728-343	1	133
56	1204	289132	euismod est arcu ac orci. Ut semper pretium neque.	2019-10-03	913-737	1	127
57	5327	096877	felis. Donec tempor,	2020-02-16	296-121	1	89
58	5272	242384	malesuada augue	2017-02-20	076-616	1	82
59	8282	828519	magna. Lorem ipsum dolor	2016-08-31	230-885	2	148
60	7698	834486	non justo. Proin non massa non ante	2012-03-22	563-508	1	23
61	1318	028994	egestas. Sed pharetra, felis eget	2018-03-19	490-348	1	121
62	9138	558173	Phasellus dapibus quam quis diam.	2004-10-06	457-176	2	78
63	8502	617544	dolor. Fusce	2009-05-20	680-678	2	21
64	2427	273714	Sed nec	2012-04-29	452-237	1	48
65	6245	374047	scelerisque, lorem ipsum sodales purus, in	2017-01-25	912-527	1	197
66	7454	743316	natoque penatibus et	2008-12-18	434-982	1	36
67	2938	339553	nisi nibh lacinia orci, consectetuer euismod est arcu ac	2019-02-03	676-537	2	189
68	5936	357860	eu arcu. Morbi sit amet	2015-03-01	785-267	2	149
69	9173	269155	ac risus.	2018-10-06	763-318	1	83
70	8857	086426	non,	2016-05-12	887-954	1	72
71	3115	074156	nec	2019-11-09	668-548	2	178
72	8556	183250	Cras vulputate velit eu	2007-11-01	840-271	1	117
73	4056	367217	congue. In scelerisque scelerisque dui. Suspendisse ac	2011-09-19	324-020	2	173
74	3885	923772	Sed dictum. Proin eget odio.	2009-09-24	165-777	1	69
75	7716	433328	facilisis non, bibendum sed, est. Nunc	2015-11-23	918-387	2	106
76	6732	931320	Aliquam ornare, libero at auctor ullamcorper,	2020-06-14	774-814	1	31
77	7223	205483	Nulla facilisis. Suspendisse commodo tincidunt	2002-08-07	144-184	1	155
78	4575	656195	Mauris vel turpis.	2014-09-25	053-886	1	176
79	0007	479208	sit amet risus. Donec egestas. Aliquam nec enim.	2004-10-12	610-067	2	39
80	2185	671912	non,	2011-04-12	779-967	1	139
81	6781	468142	vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor	2015-01-02	174-162	2	132
82	8370	671873	Donec est mauris, rhoncus id,	2007-04-06	124-258	1	29
83	8192	276016	ac ipsum. Phasellus vitae	2016-02-16	516-421	2	68
84	8525	868527	cursus non,	2002-04-22	378-651	2	48
85	3162	848540	nonummy. Fusce fermentum	2012-11-06	900-137	1	113
86	4235	673943	Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec	2008-02-29	288-004	1	133
87	4627	667662	habitant morbi tristique senectus et netus et	2003-05-27	197-300	2	150
88	7544	048693	lobortis. Class aptent taciti sociosqu ad	2016-01-01	742-616	2	78
89	2537	828654	sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie	2004-06-23	147-354	2	60
90	9873	814618	eget laoreet posuere, enim nisl	2008-12-23	080-313	1	194
91	3375	184237	Phasellus in felis. Nulla tempor augue ac	2014-02-03	558-548	2	54
92	2340	605486	orci. Phasellus	2003-01-16	467-262	1	146
93	1260	575428	eu nulla	2002-10-24	153-227	1	146
94	7372	232533	Sed diam lorem, auctor quis, tristique ac, eleifend	2009-07-25	996-974	1	176
95	6426	825242	aliquet	2008-09-25	714-142	2	197
96	4740	735111	est	2015-02-06	538-185	2	154
97	2892	463183	facilisi. Sed neque. Sed eget lacus.	2010-08-20	564-281	1	62
98	2140	215344	neque	2017-06-30	816-785	2	61
99	3294	437581	gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum	2009-08-28	458-788	2	55
100	1732	431524	in consectetuer ipsum nunc id	2002-10-28	559-005	1	133
101	9826	574169	nascetur ridiculus mus. Aenean eget magna.	2009-10-07	251-043	2	100
102	1829	481818	aliquam,	2008-08-11	564-294	1	98
103	1581	247282	mauris eu	2017-11-06	224-197	1	141
104	5532	821601	enim,	2008-01-07	757-579	2	169
105	9384	547494	arcu ac orci. Ut semper pretium neque.	2001-02-17	333-681	2	131
106	7915	372448	urna. Nullam lobortis quam a	2009-09-28	574-413	1	176
107	2752	861634	vehicula risus. Nulla eget metus eu erat	2014-03-20	229-716	1	136
108	6847	731654	netus et	2015-02-10	431-179	1	78
109	4243	527714	amet diam eu	2004-11-11	114-055	2	27
110	1116	878656	gravida mauris ut mi. Duis risus odio,	2006-02-14	815-641	1	131
111	3227	663499	amet orci. Ut sagittis lobortis mauris.	2005-05-23	823-642	1	173
112	4921	632247	feugiat metus sit amet ante. Vivamus non lorem vitae	2001-04-20	146-518	1	89
113	6346	885811	enim, condimentum eget, volutpat ornare,	2015-11-24	428-833	2	104
114	4754	718517	consequat, lectus sit amet luctus vulputate, nisi sem	2009-02-20	524-049	1	45
115	1638	661555	purus sapien, gravida non, sollicitudin a, malesuada id, erat.	2015-08-06	119-444	1	103
116	4527	221142	facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa.	2020-01-19	865-154	2	186
117	5315	419587	sodales purus, in molestie tortor nibh sit amet orci. Ut	2012-11-24	455-731	2	105
118	0341	622883	posuere at, velit. Cras	2002-11-13	411-613	2	29
119	0582	112820	aliquet vel, vulputate eu, odio. Phasellus	2011-02-25	275-381	1	90
120	7448	925901	mattis velit justo nec	2016-06-07	721-421	2	68
121	2252	479677	sem	2011-05-17	886-470	2	121
122	4196	129161	eget nisi dictum augue malesuada	2011-03-06	666-963	2	103
123	5049	585724	odio,	2007-09-16	647-249	1	115
124	3643	367008	velit. Aliquam nisl.	2016-12-23	352-178	2	180
125	7389	176718	orci sem eget massa.	2005-08-19	183-718	1	70
126	8663	511567	Curae Donec tincidunt.	2014-03-02	364-194	1	190
127	9332	504596	vehicula	2001-09-11	152-714	1	2
128	0753	617625	primis	2016-04-24	120-272	1	73
129	2267	043546	Sed neque. Sed eget lacus. Mauris non dui nec	2013-05-30	883-880	2	81
130	9260	538125	nulla at sem molestie sodales. Mauris	2006-11-11	664-873	1	165
131	7292	284808	pellentesque, tellus sem	2001-05-01	282-733	1	101
132	9480	578411	fames ac turpis egestas. Aliquam fringilla cursus	2007-02-13	463-608	1	123
133	5633	707178	sit amet luctus vulputate, nisi	2011-09-10	984-218	2	117
134	6786	072822	semper tellus id nunc interdum	2009-01-07	712-822	2	181
135	3633	797747	lectus rutrum urna, nec luctus felis purus ac tellus.	2007-05-05	898-959	2	29
136	1065	034737	blandit mattis. Cras eget nisi	2012-04-17	568-443	1	5
137	7144	867380	malesuada id, erat. Etiam vestibulum massa rutrum	2010-07-07	141-722	2	9
138	3473	622666	ipsum dolor	2004-01-17	829-778	1	64
139	5612	668681	auctor. Mauris	2013-02-09	182-357	2	118
140	4306	867885	dictum augue malesuada malesuada.	2009-03-31	347-417	1	168
141	6933	013128	ligula. Nullam enim. Sed nulla ante, iaculis nec,	2020-05-23	603-626	2	160
142	2467	508575	interdum. Sed auctor odio a purus. Duis elementum, dui	2013-03-25	181-586	2	26
143	9231	456863	quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed	2008-06-28	832-335	1	140
144	6676	542872	Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla	2005-06-30	364-087	2	111
145	4124	006620	mauris sagittis placerat. Cras dictum ultricies ligula. Nullam	2016-04-28	301-268	1	97
146	6425	867766	vulputate velit eu	2020-05-29	295-661	1	15
147	5448	333680	dictum placerat, augue. Sed molestie. Sed	2006-06-18	701-988	2	139
148	3507	656379	eu sem. Pellentesque ut ipsum ac mi eleifend egestas.	2016-09-10	714-535	2	29
149	5463	448433	turpis egestas. Fusce	2000-12-21	387-468	1	46
150	0088	431566	Sed eu eros. Nam	2006-10-29	654-434	1	42
151	3458	323851	semper pretium neque. Morbi quis urna. Nunc quis arcu	2014-04-21	522-339	1	129
152	3992	052424	interdum ligula eu enim. Etiam	2018-09-04	762-575	2	59
153	6151	568751	consequat, lectus sit amet luctus vulputate,	2016-06-10	847-074	1	136
154	5049	450348	adipiscing	2020-08-14	533-057	1	87
155	1502	262429	Ut tincidunt orci	2004-10-01	003-177	1	92
156	2442	533104	eget mollis lectus pede et risus. Quisque libero	2008-04-14	163-171	1	20
157	7421	624577	nulla at sem molestie sodales. Mauris blandit enim consequat	2019-07-13	136-431	1	138
158	4782	496610	enim, gravida sit amet,	2006-04-18	031-145	2	174
159	0364	667819	vel sapien imperdiet ornare. In faucibus.	2009-02-06	193-843	1	77
160	4097	137078	nonummy ac, feugiat non, lobortis quis,	2012-07-21	172-208	1	52
161	8651	326249	ac turpis egestas. Aliquam fringilla cursus purus. Nullam	2007-11-24	967-414	1	153
162	1069	257644	scelerisque	2002-10-13	324-465	2	177
163	7188	143332	pellentesque. Sed dictum. Proin eget	2006-04-02	656-193	1	10
164	4240	328155	ornare. Fusce mollis. Duis sit	2004-06-12	620-273	1	101
165	8306	600194	orci. Donec nibh. Quisque nonummy	2019-01-12	369-672	1	163
166	9121	914961	ac mattis velit justo nec ante. Maecenas mi	2004-12-04	972-712	1	198
167	4232	038817	luctus et ultrices posuere cubilia Curae Phasellus	2017-06-06	615-398	1	79
168	8432	943366	Donec	2005-11-19	131-949	2	60
169	8538	502427	gravida	2014-09-01	641-250	2	132
170	2122	778681	et nunc.	2015-04-21	451-784	1	58
171	2301	652467	nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam	2012-04-01	456-266	2	84
172	7514	917017	velit	2005-04-25	122-484	2	69
173	9137	156810	vitae, orci. Phasellus dapibus	2013-09-09	171-145	1	179
174	0385	293577	amet nulla.	2009-05-23	475-534	1	76
175	5877	476136	ipsum. Donec sollicitudin adipiscing ligula. Aenean	2015-05-17	423-388	1	95
176	0854	028587	malesuada fringilla est. Mauris	2019-01-15	904-244	2	40
177	3405	267639	semper cursus. Integer mollis. Integer tincidunt aliquam	2020-08-06	899-277	1	146
178	5748	602632	tellus. Phasellus	2015-05-03	211-072	1	66
179	3132	359821	ad litora torquent per conubia nostra, per inceptos	2013-09-10	571-866	1	133
180	6512	123164	quam vel sapien imperdiet ornare. In faucibus.	2007-03-11	478-087	2	160
181	4833	145039	Sed diam lorem, auctor quis, tristique	2008-11-10	965-880	1	2
182	0218	745124	erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin	2016-04-15	313-567	1	98
183	0382	975754	Fusce	2011-08-03	400-548	1	46
184	3772	664164	arcu. Aliquam ultrices iaculis odio. Nam interdum enim non	2019-11-08	686-945	1	153
185	7105	429259	mauris sit amet lorem semper auctor. Mauris vel	2010-04-28	762-266	2	177
186	9444	458463	egestas. Duis ac arcu. Nunc mauris.	2009-10-13	223-581	1	69
187	1116	323604	Mauris molestie	2006-03-14	238-637	2	72
188	3665	784685	sed turpis nec mauris blandit	2003-01-02	148-288	1	9
189	6126	521447	turpis. Aliquam	2006-06-13	240-718	2	59
190	4034	217361	in, hendrerit consectetuer, cursus et,	2007-01-22	041-307	2	19
191	2644	243714	molestie. Sed id risus	2011-04-10	713-246	1	187
192	4556	526371	cursus luctus, ipsum leo elementum sem,	2004-10-28	715-120	1	23
193	4061	835128	nec tempus scelerisque, lorem ipsum	2007-10-13	418-486	1	178
194	5976	707884	ac turpis egestas. Aliquam fringilla cursus purus.	2006-08-20	771-258	1	56
195	9565	155083	ultrices posuere cubilia Curae Donec tincidunt. Donec vitae	2006-06-04	240-315	1	81
196	4135	324785	pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet	2008-05-25	255-764	2	169
197	0226	275639	Praesent eu nulla at sem molestie sodales. Mauris	2011-01-28	778-818	1	93
198	7151	314522	magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum	2019-07-04	631-133	1	30
199	1663	448277	ullamcorper. Duis at lacus. Quisque	2014-01-05	217-452	1	114
200	1642	481263	elit,	2003-03-13	164-423	2	92
\.


--
-- Data for Name: requisites; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.requisites (id, checking_account, correspondent_account, bank_requisites_id, creditor_id, is_default) FROM stdin;
1	57408487429581487745	66596678253739803159	5	175	f
2	25734492814022219660	69735716335256364	25	102	t
3	66731743385261713062	38895976000818350339	34	98	f
4	50877169169334703637	65363805988866531120	37	112	f
5	55033139349963648794	34862336567408845544	36	160	f
6	32799306013767576136	26759213895186787952	16	73	t
7	34573912343287538888	87256614619929606331	33	171	t
8	34868873667546302981	76166763228568358187	4	147	t
9	63219776241184707598	28181014586306311916	35	160	t
10	77581594385323397015	97068985353664813204	47	80	t
11	77155651345186987960	36029725496236185288	48	140	t
12	8743731331213196861	52214045623554102120	8	44	f
13	76769289617444172938	70288923763059848136	31	189	t
14	4518884786488834406	4180820296651756635	44	43	t
15	5760303760241955869	84090584786538292914	23	49	f
16	23150727591054617897	12978337662333418345	5	29	t
17	35048213338370315461	47334535716280468471	26	22	f
18	26526110468639327771	46719661581331635133	31	186	f
19	44826511352685237753	71484450551363826378	48	8	t
20	11274443517282333615	66515183035769478876	13	101	f
21	67474186635842866687	61812861182344874746	6	125	f
22	95555405563696757231	55242018805078284494	8	176	f
23	72228715618570146811	58136872744717153282	18	55	t
24	32543015976915859167	16085328472434266551	34	171	t
25	26654650242115245725	26718155457893183103	13	113	t
26	34718322066883872615	38832063332798011304	4	137	f
27	64785391652682434961	62801337318412384673	12	32	t
28	82349532178118780297	73621763872116338747	11	150	t
29	12067681533622555361	32163864917857077855	34	13	f
30	56279356715833051677	94736185085473527843	32	18	f
31	33352151671499928915	62767643179463831166	33	190	t
32	66547276653861706637	12267890077011464475	35	179	t
33	94638888255033593834	46633542858043863863	9	97	f
34	42455091262277858047	84821398918996477367	35	155	f
35	85455051588715523867	35231727165655456247	49	87	f
36	25582816655714725668	99737350644343191193	29	5	t
37	64212862667852753118	87071425217138605492	35	189	t
38	42825870355231958165	52393614023806426567	25	146	f
39	22848583259825615001	39389222487167501383	46	174	f
40	17680875102947854683	84347105537613775228	22	77	f
41	1263162734407844316	41208464637481624123	27	140	t
42	64249615946488632433	30026204681726661338	29	56	t
43	42753587365752389888	24824330827552977934	44	103	f
44	90823673427058404442	47268159531146502607	16	48	t
45	37642095750394214819	74858373397809670616	40	60	t
46	49645737861133625154	87555022457849229555	23	188	t
47	58877324851185563041	26563453566714718274	30	58	f
48	46676385618365643766	97464706322244508789	36	28	t
49	35875421768868260268	28538157022121586433	42	62	f
50	67876488538447931128	14345272404749955661	2	114	f
51	31462643423600321260	27723566958345375342	8	166	t
52	25227850822462548801	68173775524436745592	26	82	t
53	31034924445435234958	95404178884318313873	29	5	t
54	79460567312628632634	87514226638151873738	11	107	f
55	65557278207197535144	50707817120101125876	22	171	f
56	83438443522050464688	86873412859045245745	34	91	t
57	28182324945125725062	38737535082814754149	50	166	t
58	10652059427736727396	53261625163039618288	16	20	t
59	17966317321499487914	27019135659725291130	49	172	f
60	55554389411332646016	15074566846137297679	44	185	f
61	85322588483332320980	72475262624641261370	1	176	t
62	72882637593961726707	65545564131745877840	49	64	t
63	67493167266771266051	54866527763116177625	29	158	t
64	45087173598283429052	81443321911374372269	24	148	f
65	25821025375068887287	57683582876857163818	24	50	f
66	45340739175162643909	29732426726647441776	44	81	t
67	83804232567477492067	68389197474869038146	17	182	t
68	59261457809716253787	80829491044317585665	34	165	t
69	74174153877242461447	8612250718653148858	46	145	t
70	57485122662341483580	33360891888410276584	20	100	f
71	57825713784426753626	66646257257793758345	42	79	t
72	35752377813534801237	96247344240695285617	10	74	f
73	60562607718961694157	4643583596814664167	12	197	f
74	75180553666853374687	75016921613681213217	32	132	t
75	29287799409397482187	26353500252264582161	25	10	f
76	61577355291855791791	24674124952334336889	43	75	t
77	83684563838514715688	42323763286843397154	18	162	t
78	15764671712441191005	93046212113921664312	25	70	f
79	61377751387328204324	21806831757422562781	18	119	t
80	58970523136383507785	48243855481461356585	23	19	t
81	51754912248756747021	74967040954315723352	30	133	f
82	82243834149767923640	88862617346763588588	37	36	f
83	26872773103647243768	59750530087018276712	12	138	t
84	84358851779520661652	51347895286294037107	33	141	t
85	11432559376151027849	7301153802539114529	13	193	t
86	56759638642465574173	58836048632375819109	19	200	t
87	87826811179642881607	16874091675486106829	34	56	f
88	78046990698435015322	5535322277521756351	19	74	t
89	54229237504677165048	54534885065752671536	23	75	t
90	98846218335472141510	73418245030742651255	4	66	t
91	15445627496350535865	27122705506045768395	29	179	t
92	25515078494282126981	72189670465186776280	25	151	t
93	97832836422252753626	21139166644634400162	35	86	t
94	35776618381245127186	75727725757231940287	9	158	t
95	23255950789167880988	30624850532215355874	8	98	t
96	90321531785612984532	62682362541756769957	35	43	f
97	24001328793562978748	88242134324491274223	39	22	f
98	85438242861573951528	60870633566116162727	38	77	f
99	29568841444023264919	33568655873216569972	9	119	t
100	25136437616728869452	1679633623548322352	27	76	t
101	47686453446923651803	35376824845406012025	32	71	t
102	65921654273750386013	62772444553998389143	46	120	t
103	80586677558242577483	75023202397474204813	22	95	f
104	68871652382476762782	11432112384336787391	4	23	t
105	82298052263210136117	37485218565654446024	43	45	f
106	96318984564575425544	47335634585409699625	42	37	t
107	36684205416876271564	88727226864963583364	8	172	t
108	85386477882687129115	49881276466405316514	36	46	f
109	33704162431937295416	24177104671285521739	12	59	t
110	73661846315672376067	27477442340272821875	24	77	f
111	10734665451021353878	71024018002726812791	26	112	t
112	67249839596183048615	85686126902038651178	15	74	t
113	38254128249144483217	73184762227735551851	6	144	f
114	35842324374736726395	68352053014357938888	17	160	t
115	36596605468683729424	33868292477348948836	22	18	f
116	64162167402181678358	97481397511040316222	18	148	t
117	66800202287540175853	91744870852465519054	27	65	f
118	14452923531709352735	57174401435478653575	27	186	t
119	2567654670852347335	65720177071804290223	23	6	f
120	41862336226439666004	53477143216371357629	13	41	t
121	94788754911345102895	58874634606914161456	32	119	f
122	28586346296822183342	88117693145742705537	7	182	f
123	58966586774129631382	90112175912775260345	47	103	f
124	74163356737726229264	41231069637119468089	13	165	f
125	46511362252454182689	37588924646465652929	35	15	t
126	73343471715546536462	13217591140013537732	15	29	f
127	73975744317868829630	83086076627346501849	22	55	f
128	86530668092764745411	50911888273718357901	14	55	t
129	48946447779078886268	41978239683084283681	34	112	t
130	70730328513579475643	65079953436359618143	9	106	f
131	83809268173964915241	13892516187858833270	25	19	f
132	8563819043771565546	48077143051912686416	3	14	f
133	19784984575387488489	34663806575411430924	12	14	f
134	31280718425746712236	85218465286668241128	45	122	f
135	11252436565686448372	65523487383739245253	29	152	f
136	26287418858579501976	32348519022012565236	16	114	t
137	59234003781828321476	15604122265640535932	10	15	f
138	1372862343825225794	74325921748426888551	20	68	t
139	70847937404367842331	41626404275684931571	4	21	f
140	77151522725216727370	93742888076814365749	43	52	t
141	51413364116786875258	54277422412978513707	45	176	f
142	49482875988707485054	46221149189892351414	17	177	t
143	18512574082673333767	37017624272145778228	37	160	f
144	24316813478556263527	72732163235656713182	17	106	f
145	73186133284126504666	98372360883815413561	27	28	t
146	3532387887412341238	65102458195613545801	36	53	f
147	28621734355151811394	75476115177727472345	8	20	f
148	73163411846636903152	72181433495969251852	4	18	t
149	78844487617632814927	48178131459563545526	46	50	f
150	59434977464534020123	59454008171224154626	31	17	t
151	95940358054894778285	69403295670727905305	3	29	t
152	84466785712267107113	30014731881285367256	20	103	f
153	85386583871983126185	98607798328885276386	38	107	f
154	28923965436178742154	6280537928066470966	5	20	t
155	84431374771250877681	88495724275352334928	13	188	f
156	70192101718411558733	93615767430267525821	13	23	f
157	82791368651817065771	33265380130421381820	29	166	t
158	82337881335562114819	73026762149341166807	23	52	f
159	50094442443264466671	67646818076719525747	49	42	f
160	38121725432453568736	26115861153804524263	8	109	t
161	26616688265152418849	16776333366427735136	39	154	t
162	11202808181671309213	26626210524846410157	26	120	t
163	18697752358310156211	53642363941467720266	36	62	t
164	24379522813827438888	87238456614984866381	36	109	t
165	35886563887751668061	33751676787912247290	10	145	t
166	94712647337775173741	27579694658109041326	32	85	t
167	64649487187645333977	82764191550234643284	43	15	t
168	48095366382854551904	75136752863715867527	20	43	t
169	58323379549830100929	83129815502665611960	3	29	t
170	48384962661082826177	33371411754303704835	48	110	f
171	88134804141578322404	91444314112854258763	12	179	f
172	95825753202685232486	72521737711747114431	29	35	t
173	75492386584664411576	94545963082237388413	12	39	f
174	7357221211647995261	107788448251812654	5	185	t
175	45896355435152227707	67097811193607955289	36	140	t
176	32258914788106556167	78606224325171415523	40	65	f
177	61569288638312258148	18761855246219212776	25	171	f
178	18611453275251513030	51441719627531117191	39	61	t
179	66726072646895477622	60687567417323262452	2	188	t
180	68406326187207238481	80268581637044856849	34	111	f
181	17398430052339319074	12549442837545608036	47	101	t
182	94724684168113626112	57681360683649257477	30	65	t
183	68081507488137941945	30646343238853052042	21	21	f
184	84147099385332603057	24956402346844116606	31	85	t
185	36889418302133016588	36366445650526281768	39	153	f
186	6622584826077656962	51218913103434514871	32	52	f
187	17615486544864354265	71478214338868121824	27	62	f
188	85588217316548575572	58934720793146627408	19	108	f
189	36881130563219298236	52560104808112119643	43	33	t
190	45801221978905301273	22964447864357551411	3	190	f
191	46513433145859795508	56536496534417691395	31	195	t
192	86326887748281983263	16050284214187835255	44	114	t
193	21587201265955592169	81222927704115269625	19	116	f
194	33325195324493231214	96372227174131326585	39	76	f
195	62213931117099597604	81899545781512791886	39	67	f
196	47598830828762905295	68754007772082601405	18	23	t
197	36240243113311882891	68681386399344652868	44	49	t
198	43763201697130137263	56925086141626448733	12	161	f
199	65216412581250677045	86669276762655746131	36	46	t
200	3546103872327254122	47167881272676622816	36	151	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jamil
--

COPY public.users (id, name, surname, email, password, is_online, phone_number, img, group_id) FROM stdin;
1	MacKenzie	Wright	amet@hotmail.ca	Nullam	t	(368) 848-3711	https://yahoo.com/group/9?str=se	14
2	Ruth	Robles	tempor@icloud.couk	et	t	(675) 714-3345	http://zoom.us/en-us?q=11	18
3	Ferdinand	Jones	eleifend.egestas@hotmail.edu	pretium	f	(441) 364-5016	http://baidu.com/settings?q=test	13
4	Brielle	Clemons	dui.fusce@outlook.couk	Duis	f	(952) 445-3593	http://wikipedia.org/group/9?client=g	23
5	Darryl	Simpson	nulla.tempor.augue@hotmail.couk	ac	f	(756) 716-3268	https://guardian.co.uk/en-us?client=g	23
6	Kermit	Hopkins	lobortis.nisi@protonmail.ca	eu	t	(425) 687-6442	http://whatsapp.com/en-ca?k=0	36
7	Sacha	Porter	egestas.urna@icloud.com	non,	t	(384) 430-0219	http://reddit.com/site?ad=115	4
8	Solomon	Chapman	imperdiet.ullamcorper@yahoo.edu	eu,	t	(653) 634-7903	http://pinterest.com/sub/cars?gi=100	5
9	Alan	Todd	quis.pede.praesent@icloud.ca	Proin	f	(138) 136-3992	https://walmart.com/settings?gi=100	42
10	Nash	Hoover	euismod.et.commodo@icloud.com	magna	f	(619) 253-7185	http://nytimes.com/site?q=0	47
11	Lawrence	Gilmore	lacus@hotmail.org	neque	f	(273) 286-5776	https://nytimes.com/one?page=1&offset=1	49
12	Marvin	Morgan	netus.et.malesuada@hotmail.net	in	f	(572) 278-9613	https://bbc.co.uk/group/9?search=1	43
13	Timothy	Estes	id.sapien@hotmail.edu	euismod	t	(632) 546-3279	http://google.com/site?p=8	42
14	Clayton	Stout	a.purus.duis@aol.com	dictum.	t	(960) 461-7447	https://guardian.co.uk/sub?q=0	19
15	Camille	Aguirre	consequat.auctor@google.net	pede	f	(883) 226-0164	https://baidu.com/fr?g=1	2
16	Addison	Ball	odio.semper.cursus@yahoo.net	Mauris	t	(357) 247-4948	https://whatsapp.com/en-ca?str=se	31
17	Penelope	Crosby	pharetra.sed@yahoo.ca	lorem	f	(746) 292-3178	http://baidu.com/user/110?q=test	20
18	Jermaine	Sparks	a.aliquet@outlook.couk	odio.	f	(486) 372-6774	http://baidu.com/group/9?p=8	42
19	Denton	Guy	duis.dignissim@icloud.org	malesuada	t	(257) 884-3261	https://instagram.com/user/110?client=g	25
20	Hope	Gordon	nunc@yahoo.couk	In	f	(474) 616-8045	https://guardian.co.uk/settings?client=g	13
21	Baxter	Morales	aliquet.diam@google.couk	consectetuer,	f	(812) 232-3644	http://wikipedia.org/en-us?client=g	21
22	Merrill	Kinney	pretium@icloud.net	odio	t	(217) 885-6158	https://pinterest.com/fr?client=g	28
23	Hyatt	Cook	condimentum.donec.at@google.net	nec,	t	(870) 453-5422	https://zoom.us/en-ca?ad=115	38
24	Velma	Calhoun	non.sollicitudin@yahoo.edu	nascetur	f	(147) 159-5825	http://pinterest.com/group/9?client=g	30
25	Sebastian	Hendricks	arcu.iaculis.enim@hotmail.org	semper	f	(387) 178-5844	http://wikipedia.org/sub?q=4	20
26	Leonard	Franklin	aptent.taciti@google.com	augue,	t	(872) 986-1047	http://baidu.com/en-ca?q=4	29
27	Stewart	Walton	nec.ante@yahoo.com	velit	t	(382) 107-4573	http://google.com/one?k=0	12
28	Arthur	Mckenzie	mi.fringilla.mi@outlook.ca	nisl	t	(519) 727-4704	http://whatsapp.com/user/110?search=1&q=de	26
29	Zelda	Carpenter	euismod.in@outlook.edu	quam,	f	(581) 736-9238	http://twitter.com/en-us?q=4	26
30	Hamilton	Estrada	vitae.posuere@hotmail.net	ac	t	(644) 394-5139	http://wikipedia.org/sub?ad=115	40
31	Chancellor	Matthews	enim.consequat@icloud.edu	neque.	f	(725) 887-4328	https://facebook.com/group/9?q=4	39
32	Kato	Blackburn	et.malesuada.fames@yahoo.ca	sit	t	(266) 976-1445	https://bbc.co.uk/group/9?str=se	9
33	Kylee	Baxter	at.risus@hotmail.com	Nam	t	(778) 496-4711	http://yahoo.com/one?gi=100	45
34	Kylee	Schmidt	dictum.eleifend@yahoo.ca	mi	t	(746) 746-4435	http://zoom.us/settings?str=se	4
35	Ulysses	Cote	neque.et.nunc@hotmail.couk	risus	f	(425) 574-6786	https://twitter.com/sub/cars?q=11	12
36	Scott	Mathews	mi.tempor@aol.edu	metus.	t	(557) 143-3630	http://youtube.com/site?ab=441&aad=2	38
37	Imogene	Roman	cras.sed@hotmail.edu	ut	t	(539) 863-2148	http://pinterest.com/one?q=test	41
38	Vivian	Cooper	nulla.interdum@icloud.edu	erat	t	(675) 541-1237	http://youtube.com/site?ad=115	4
39	Geoffrey	Maynard	malesuada.vel.venenatis@aol.couk	sagittis	t	(133) 691-3239	http://guardian.co.uk/site?str=se	50
40	Jameson	Compton	neque@outlook.org	orci	f	(577) 155-8094	http://twitter.com/sub?q=4	43
41	Arden	Brady	sem@outlook.ca	massa	f	(764) 320-6368	http://youtube.com/one?str=se	39
42	Brielle	Elliott	ipsum@hotmail.net	iaculis	t	(262) 581-3314	https://guardian.co.uk/site?page=1&offset=1	15
43	Jermaine	Gould	aliquam.adipiscing@aol.net	amet,	f	(371) 466-1767	http://guardian.co.uk/group/9?search=1	19
44	Brent	Brooks	varius@yahoo.org	eu	t	(114) 148-8982	http://whatsapp.com/site?p=8	34
45	Eleanor	French	ante@aol.org	neque	f	(424) 845-8267	https://reddit.com/sub?k=0	48
46	Tanya	Malone	aliquam.adipiscing@protonmail.org	metus	f	(256) 221-8634	https://baidu.com/sub?client=g	6
47	Duncan	Mcgee	aliquet.phasellus.fermentum@protonmail.edu	ut	f	(555) 787-2462	http://walmart.com/en-ca?search=1	42
48	Hunter	Bishop	ut.erat@hotmail.edu	risus.	t	(793) 872-8147	https://youtube.com/one?g=1	46
49	Penelope	Travis	libero.integer@yahoo.ca	pellentesque	f	(308) 831-4817	http://google.com/sub?q=11	19
50	Vera	Hayden	mauris.erat.eget@protonmail.net	ornare	t	(517) 834-1801	http://cnn.com/sub/cars?search=1	41
51	Hilel	Charles	consectetuer.cursus@yahoo.net	Cum	f	(441) 804-1451	http://reddit.com/one?p=8	11
52	Wade	Oliver	eleifend@hotmail.couk	dictum	t	(774) 363-7320	https://nytimes.com/site?q=11	10
53	Hilel	Dale	per.conubia@aol.com	mauris	t	(962) 822-2356	http://whatsapp.com/user/110?g=1	37
54	Heather	Cervantes	viverra.maecenas@google.ca	orci.	f	(136) 741-6862	https://facebook.com/en-us?ad=115	45
55	Natalie	Cameron	elit@icloud.edu	amet	f	(359) 133-3376	http://netflix.com/sub/cars?q=11	16
56	Graiden	Serrano	quam.elementum.at@aol.com	mus.	f	(736) 247-7872	https://guardian.co.uk/en-us?str=se	11
57	Kyla	Solomon	in@hotmail.org	Aliquam	f	(184) 465-8172	https://instagram.com/user/110?gi=100	44
58	Donna	Ramirez	ac.turpis.egestas@hotmail.ca	Nulla	f	(372) 102-9522	http://netflix.com/fr?k=0	47
59	Carissa	Wong	tempor.bibendum@google.org	sit	t	(435) 984-0277	http://cnn.com/en-ca?g=1	22
60	Elmo	Stephens	risus@icloud.ca	orci	t	(637) 737-5861	https://baidu.com/fr?k=0	36
61	Uriel	Slater	ipsum.primis.in@hotmail.ca	fermentum	t	(314) 890-3783	http://walmart.com/settings?search=1	38
62	Allistair	Newton	enim@protonmail.com	sagittis	f	(151) 879-9586	http://facebook.com/en-ca?ad=115	5
63	Jonas	Duncan	vulputate.ullamcorper@icloud.edu	Donec	f	(251) 832-5762	https://wikipedia.org/en-ca?q=0	8
64	Kirby	Richards	lectus@hotmail.ca	placerat,	t	(658) 847-3539	http://whatsapp.com/group/9?str=se	49
65	Serina	Rogers	nunc@yahoo.couk	magnis	f	(114) 424-3150	https://walmart.com/fr?q=11	12
66	Leah	Bryan	odio.sagittis@google.ca	in	f	(624) 377-5832	https://nytimes.com/sub/cars?search=1&q=de	29
67	Ronan	Hurley	integer@outlook.com	porttitor	f	(183) 815-0583	https://zoom.us/settings?k=0	16
68	Amanda	Chaney	sapien.cras@protonmail.ca	habitant	t	(812) 718-7343	http://baidu.com/en-ca?page=1&offset=1	26
69	Keane	Dodson	elit.nulla@icloud.org	a	f	(370) 949-6890	http://ebay.com/sub/cars?gi=100	41
70	Mannix	Boyd	tempor.lorem@aol.net	dolor	f	(765) 863-3928	https://nytimes.com/site?k=0	40
71	Guy	Bond	vel@outlook.edu	nisi.	f	(873) 244-0558	http://ebay.com/one?p=8	10
72	Garrison	Pugh	nunc.sed@google.edu	Quisque	t	(452) 214-8886	https://baidu.com/en-us?q=test	22
73	Regan	Shields	ornare.libero@outlook.com	sem	t	(685) 112-8626	https://naver.com/one?k=0	4
74	Latifah	England	at.augue.id@protonmail.edu	quis	t	(557) 686-1139	https://zoom.us/settings?ad=115	40
75	Oprah	Sears	vitae.risus@outlook.org	Sed	f	(846) 358-1515	https://zoom.us/sub?gi=100	50
76	Kelly	Dale	lorem.sit@outlook.com	hymenaeos.	t	(963) 122-2986	http://wikipedia.org/sub?q=4	33
77	Finn	Baker	lectus@outlook.couk	sed	t	(452) 326-7742	https://guardian.co.uk/one?ab=441&aad=2	20
78	Cecilia	Solomon	eros.non@google.net	luctus	t	(268) 810-6955	http://ebay.com/sub/cars?gi=100	45
79	Christopher	Peters	magna.phasellus.dolor@protonmail.ca	feugiat	t	(532) 435-6133	https://pinterest.com/sub?q=test	3
80	Ashton	Benjamin	orci.quis@icloud.com	Etiam	f	(352) 227-1184	http://youtube.com/settings?k=0	11
81	Anthony	Patterson	nascetur@outlook.couk	non,	f	(747) 732-9140	https://walmart.com/settings?search=1&q=de	48
82	Geoffrey	Oliver	eu@icloud.net	nibh	f	(265) 217-3735	https://instagram.com/fr?client=g	40
83	Carlos	Lowery	penatibus.et@yahoo.ca	ipsum.	t	(221) 804-3173	http://wikipedia.org/user/110?str=se	28
84	Karleigh	Schmidt	at@google.couk	ac	t	(351) 993-9616	https://youtube.com/en-us?str=se	2
85	Frances	Mckay	posuere.cubilia@yahoo.com	dui,	f	(258) 224-6037	https://yahoo.com/one?page=1&offset=1	37
86	Helen	Gordon	maecenas.ornare.egestas@outlook.ca	sed	f	(944) 687-5904	https://whatsapp.com/fr?client=g	49
87	Kennan	Drake	elit@google.ca	tellus.	f	(822) 273-0105	https://cnn.com/en-us?search=1&q=de	9
88	Benjamin	Sandoval	mauris.molestie@yahoo.ca	accumsan	f	(783) 465-1287	http://instagram.com/site?ab=441&aad=2	7
89	Austin	Estes	sapien.gravida@yahoo.edu	tincidunt	f	(156) 240-3434	http://guardian.co.uk/user/110?page=1&offset=1	17
90	Shoshana	Russell	ligula@hotmail.ca	rutrum	f	(735) 529-6152	http://bbc.co.uk/en-us?gi=100	31
91	Sylvester	Parrish	cursus@icloud.org	elit	f	(576) 352-6745	http://ebay.com/fr?q=test	29
92	Fritz	Bond	nullam.vitae@outlook.net	mollis.	f	(577) 524-5819	http://zoom.us/one?q=11	46
93	Leah	Garcia	mauris.suspendisse@hotmail.net	sociis	t	(637) 277-2165	http://baidu.com/en-ca?k=0	11
94	Gillian	Good	turpis.non@icloud.net	erat	t	(530) 821-4388	http://google.com/sub?q=test	32
95	Leo	Vega	auctor.velit@outlook.ca	et	f	(252) 259-2155	http://netflix.com/user/110?client=g	21
96	Shaeleigh	Mosley	nullam@google.com	Sed	f	(750) 239-6324	http://nytimes.com/user/110?q=test	32
97	Rooney	Norman	mollis.integer@outlook.ca	erat	f	(423) 356-2441	https://netflix.com/sub/cars?q=11	48
98	Hadassah	Hurley	suspendisse.sagittis.nullam@aol.org	tincidunt	f	(618) 546-6144	https://google.com/fr?p=8	6
99	Tatyana	Douglas	libero.morbi@outlook.com	non	f	(706) 248-1456	http://ebay.com/site?str=se	39
100	Kai	Ballard	sed.hendrerit@protonmail.couk	pede.	t	(343) 733-2027	http://pinterest.com/one?q=4	43
101	Jonah	Santiago	sed.congue@aol.edu	Suspendisse	f	(327) 352-4115	https://google.com/user/110?gi=100	4
102	Armand	Meyer	amet@aol.com	mus.	f	(971) 476-3752	https://baidu.com/en-us?search=1&q=de	12
103	Aiko	Moran	ut.eros.non@icloud.ca	non	f	(657) 716-4757	https://ebay.com/sub?search=1&q=de	49
104	Darryl	Bradford	placerat.velit.quisque@yahoo.com	eleifend,	f	(717) 361-3433	http://facebook.com/en-ca?search=1&q=de	27
105	Michael	Raymond	aliquet.proin@yahoo.com	eget	f	(432) 179-1808	http://guardian.co.uk/sub?q=4	10
106	Mollie	Lindsey	posuere@yahoo.net	id,	t	(415) 424-6728	https://google.com/group/9?ad=115	46
107	Neil	Eaton	lorem@outlook.edu	inceptos	t	(945) 305-6837	http://nytimes.com/sub/cars?search=1	18
108	Cairo	Paul	suspendisse@outlook.couk	Sed	f	(615) 813-3842	https://pinterest.com/en-ca?search=1	26
109	Aimee	Olsen	molestie.arcu@outlook.edu	lacinia	f	(585) 939-0361	http://youtube.com/settings?q=4	9
110	Yoko	Holman	auctor.velit.eget@aol.com	congue.	f	(489) 444-2786	http://cnn.com/user/110?q=4	32
111	Warren	Flynn	duis.elementum@aol.net	In	f	(134) 888-6658	https://naver.com/en-us?g=1	25
112	Violet	Rollins	dolor.fusce@outlook.net	Vivamus	f	(543) 252-6315	http://facebook.com/site?q=11	14
113	Lacota	Kramer	erat.volutpat@outlook.org	tempor	t	(237) 913-6850	https://instagram.com/one?q=4	11
114	Brock	Solis	ullamcorper.duis@aol.couk	sagittis	f	(764) 661-3601	https://baidu.com/user/110?q=11	49
115	Lewis	Waller	ut.nulla@aol.com	Aliquam	f	(245) 929-9577	http://netflix.com/user/110?gi=100	48
116	Whitney	Lynn	nunc.mauris.elit@outlook.ca	tincidunt	t	(467) 854-3596	https://naver.com/settings?q=11	48
117	Damian	Baldwin	luctus.felis@google.couk	mauris	f	(553) 356-0476	http://cnn.com/group/9?gi=100	25
118	Melvin	Sykes	mauris.morbi@icloud.ca	turpis	t	(145) 347-8068	https://twitter.com/settings?q=0	23
119	Brenda	Cruz	consequat.enim@yahoo.ca	parturient	f	(701) 305-5150	https://baidu.com/site?search=1	35
120	Thane	Berry	non@hotmail.net	Morbi	f	(572) 671-1148	https://google.com/group/9?str=se	14
121	Sade	Wilder	dictum.ultricies.ligula@google.com	euismod	t	(445) 152-1842	http://ebay.com/user/110?q=4	9
122	Alfreda	Berg	neque.vitae@icloud.edu	Morbi	t	(216) 713-3784	https://pinterest.com/settings?ad=115	13
123	Sierra	Barnett	integer.urna@hotmail.com	a,	f	(772) 856-1539	https://instagram.com/sub/cars?q=4	18
124	Declan	Chapman	nunc.sed.pede@google.edu	Nullam	t	(753) 776-3141	https://whatsapp.com/en-ca?ad=115	1
125	Julian	Roth	justo.eu@aol.org	eget	t	(767) 401-5181	https://guardian.co.uk/one?p=8	32
126	Serina	Ochoa	sed@icloud.couk	Donec	f	(598) 786-2651	http://nytimes.com/user/110?q=4	13
127	Violet	Pierce	cursus.et.eros@icloud.org	dapibus	f	(662) 823-1758	https://ebay.com/en-ca?search=1&q=de	5
128	Nasim	Patrick	enim.non@protonmail.couk	odio,	f	(334) 977-1456	https://wikipedia.org/group/9?g=1	40
129	Lane	Schroeder	non.luctus@yahoo.com	diam	t	(215) 315-1314	http://netflix.com/one?gi=100	33
130	Colin	Holloway	feugiat.placerat@outlook.org	scelerisque,	f	(643) 372-2268	http://bbc.co.uk/sub/cars?search=1&q=de	36
131	Yasir	Hamilton	arcu.eu.odio@icloud.ca	enim	f	(226) 547-2725	https://naver.com/fr?page=1&offset=1	24
132	Basil	Raymond	urna.ut@icloud.edu	semper.	f	(132) 877-1055	https://instagram.com/one?page=1&offset=1	18
133	Kelly	Heath	arcu.ac@outlook.org	nonummy	t	(306) 585-2753	https://netflix.com/settings?search=1&q=de	32
134	Rhiannon	Preston	curabitur.massa.vestibulum@yahoo.edu	nec	t	(407) 533-2244	http://guardian.co.uk/en-us?q=0	13
135	Harriet	Alford	malesuada.vel@yahoo.org	luctus	f	(959) 553-6536	https://pinterest.com/site?client=g	20
136	Rhona	Oneal	vestibulum@yahoo.com	adipiscing	f	(812) 774-7103	http://instagram.com/en-us?k=0	11
137	Dahlia	Baker	dui.quis@google.net	semper	t	(632) 644-5761	https://whatsapp.com/fr?str=se	27
138	Sophia	Sosa	interdum.libero@hotmail.org	non,	t	(528) 836-8584	https://netflix.com/sub/cars?q=test	15
139	Olga	Pace	sapien.aenean@outlook.net	neque.	t	(667) 704-4338	https://twitter.com/user/110?page=1&offset=1	22
140	Hamilton	Lewis	fringilla@yahoo.edu	ac	f	(768) 590-4902	http://netflix.com/en-ca?ad=115	5
141	Hammett	Farrell	lectus@protonmail.org	sapien.	t	(160) 247-4381	http://facebook.com/one?search=1	4
142	Stacey	Hancock	fringilla@outlook.com	aptent	f	(417) 290-4582	https://facebook.com/en-ca?q=4	40
143	Plato	Morrison	dolor.nonummy.ac@protonmail.couk	vitae	f	(971) 788-3241	https://zoom.us/sub/cars?search=1&q=de	20
144	Victoria	Wynn	purus.accumsan.interdum@hotmail.edu	sit	f	(707) 217-8564	http://guardian.co.uk/site?search=1	47
145	Angela	Mccoy	scelerisque@google.net	dolor	f	(997) 477-0763	https://whatsapp.com/en-ca?q=0	28
146	MacKensie	Sweet	sagittis.nullam.vitae@icloud.ca	quis	f	(488) 871-5668	https://walmart.com/en-ca?k=0	4
147	Lamar	Finley	vitae@google.net	pretium	t	(740) 494-4107	http://reddit.com/sub?str=se	22
148	Kermit	Sears	donec.tincidunt@hotmail.org	ac	f	(864) 548-2472	http://ebay.com/site?page=1&offset=1	38
149	Gabriel	Glass	nulla.integer@google.edu	tempor	f	(476) 875-5847	http://twitter.com/sub/cars?k=0	48
150	Ulla	Duke	aliquet.libero@icloud.couk	mauris	f	(647) 124-6658	http://ebay.com/fr?str=se	27
151	Noble	May	adipiscing.elit.aliquam@yahoo.couk	nunc,	t	(324) 875-2757	http://naver.com/one?ad=115	35
152	Cruz	Pugh	nunc@yahoo.net	imperdiet	f	(477) 257-4254	http://pinterest.com/one?client=g	21
153	Abdul	Leonard	suspendisse.commodo.tincidunt@icloud.org	erat,	t	(982) 596-1494	http://twitter.com/sub/cars?client=g	3
154	Jemima	Boyle	augue@aol.com	dolor	t	(979) 198-2419	https://google.com/en-us?k=0	19
155	Mara	Decker	eget@icloud.org	eu	f	(317) 772-2539	https://naver.com/en-ca?search=1&q=de	33
156	Beatrice	Jimenez	euismod.urna.nullam@aol.ca	euismod	f	(520) 888-5655	http://ebay.com/sub/cars?search=1	18
157	Sasha	Perry	libero.mauris@aol.ca	eleifend	f	(124) 564-8481	http://youtube.com/fr?page=1&offset=1	21
158	Noelani	Nixon	lacus.mauris@aol.com	consectetuer	t	(678) 669-5313	https://facebook.com/site?q=11	14
159	Rae	Mcknight	convallis.in@hotmail.org	massa.	t	(574) 293-1052	http://reddit.com/user/110?search=1&q=de	38
160	Solomon	Carver	pharetra@icloud.net	fringilla	t	(646) 543-7380	http://pinterest.com/settings?search=1&q=de	6
161	Rosalyn	Berger	pellentesque.sed.dictum@google.com	interdum	t	(417) 764-2915	https://yahoo.com/sub/cars?g=1	34
162	Jenette	Lynch	commodo.auctor.velit@icloud.com	mauris	t	(773) 137-4872	https://baidu.com/group/9?search=1	30
163	Grady	Clements	ut@yahoo.com	ridiculus	f	(783) 248-1275	http://reddit.com/one?str=se	10
164	Quail	Hart	maecenas.ornare@icloud.com	Maecenas	t	(281) 752-6339	https://wikipedia.org/en-ca?ab=441&aad=2	17
165	Daniel	Weiss	nibh@icloud.com	arcu.	f	(307) 514-6944	https://yahoo.com/en-us?ab=441&aad=2	28
166	Reuben	Mills	duis.at.lacus@outlook.couk	risus	f	(651) 827-8936	http://walmart.com/group/9?client=g	17
167	Rahim	Sweet	tellus.non@aol.couk	Mauris	t	(408) 303-2187	http://ebay.com/sub?page=1&offset=1	32
168	Ramona	Valenzuela	eu@yahoo.org	metus.	f	(321) 482-3561	http://yahoo.com/en-us?g=1	31
169	Hyatt	Garza	non.egestas.a@icloud.ca	Nunc	f	(842) 227-2616	https://cnn.com/user/110?p=8	36
170	Aristotle	Terry	urna.ut.tincidunt@protonmail.ca	Aenean	t	(478) 858-7038	https://facebook.com/user/110?client=g	37
171	David	Ratliff	dictum@protonmail.couk	tellus	f	(510) 387-4125	http://bbc.co.uk/group/9?q=11	16
172	Janna	Barrett	mauris@icloud.org	non,	t	(968) 149-7809	https://cnn.com/user/110?k=0	39
173	Britanney	Parsons	enim.gravida.sit@protonmail.couk	quam.	f	(937) 468-3924	http://cnn.com/en-ca?q=0	38
174	Declan	Wilder	interdum.enim@yahoo.net	euismod	f	(309) 538-0704	https://reddit.com/settings?k=0	11
175	Fletcher	Crane	erat.neque@google.edu	purus,	f	(544) 343-3924	http://walmart.com/settings?search=1	14
176	Miranda	Nunez	aliquam@icloud.org	scelerisque	f	(936) 456-8129	http://naver.com/group/9?g=1	42
177	Noel	Byers	semper.et.lacinia@yahoo.edu	a,	t	(218) 446-1736	https://baidu.com/user/110?page=1&offset=1	11
178	Kathleen	Baxter	tristique.senectus@icloud.net	at,	f	(823) 434-5262	https://twitter.com/sub/cars?str=se	33
179	Vernon	Olsen	orci@icloud.com	elit	t	(518) 713-4420	http://baidu.com/en-us?g=1	27
180	Luke	Jennings	nam.tempor@protonmail.edu	est	f	(159) 552-5541	https://walmart.com/site?g=1	31
181	Quentin	Lane	dapibus.gravida.aliquam@yahoo.net	sit	f	(516) 223-1347	https://naver.com/group/9?q=0	25
182	Alfreda	Camacho	scelerisque.scelerisque@icloud.com	eu	f	(584) 582-1873	http://baidu.com/en-ca?search=1	3
183	Carissa	Mccormick	fringilla.cursus@hotmail.net	id,	t	(535) 997-7674	https://reddit.com/en-us?search=1	39
184	Rhonda	Keller	quis.tristique.ac@google.couk	vulputate	t	(726) 229-0610	https://youtube.com/sub/cars?q=11	20
185	Judah	Vazquez	tincidunt@hotmail.ca	sed	f	(291) 228-1600	https://instagram.com/site?ad=115	41
186	Brian	Pickett	a.nunc@aol.org	hendrerit	t	(611) 897-8393	http://twitter.com/sub?search=1	37
187	Roanna	Woodward	at.velit@google.edu	dolor	t	(562) 637-3735	http://baidu.com/group/9?search=1&q=de	2
188	Chancellor	Wong	nisi@hotmail.edu	ornare.	t	(633) 681-1667	http://walmart.com/en-ca?ab=441&aad=2	11
189	Ariana	Mcgowan	eget@icloud.couk	lobortis	t	(581) 231-1112	http://baidu.com/sub?ad=115	14
190	Lee	Banks	luctus.curabitur@icloud.ca	et	f	(497) 275-8228	https://walmart.com/sub/cars?q=11	13
191	Suki	Ryan	integer.urna@hotmail.couk	Mauris	f	(317) 919-0541	http://instagram.com/one?q=4	39
192	Kylie	Parsons	euismod.est@aol.net	mollis	t	(385) 479-1613	http://yahoo.com/one?str=se	29
193	Zahir	Zamora	dictum.ultricies.ligula@google.net	Integer	f	(291) 784-5283	http://wikipedia.org/sub?k=0	19
194	Tanner	Cline	libero@google.ca	cursus	t	(521) 943-9795	https://guardian.co.uk/sub?q=11	31
195	Omar	Cooper	tempus.mauris@aol.couk	rutrum	t	(236) 614-1927	http://instagram.com/fr?p=8	40
196	Lucius	Maldonado	auctor.non@hotmail.ca	fermentum	t	(636) 703-5051	http://facebook.com/user/110?search=1&q=de	27
197	Lara	Hayes	nec.imperdiet@aol.org	facilisi.	t	(727) 582-8740	http://naver.com/user/110?search=1&q=de	8
198	Austin	Rich	non@protonmail.com	penatibus	t	(255) 849-2887	https://cnn.com/en-ca?k=0	19
199	Rebekah	Kramer	in.scelerisque@yahoo.net	eu	t	(519) 864-2534	https://baidu.com/en-us?ab=441&aad=2	27
200	Geraldine	Dotson	scelerisque.neque@icloud.ca	Donec	t	(696) 926-7024	http://cnn.com/site?search=1&q=de	49
\.


--
-- Name: agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.agents_id_seq', 200, true);


--
-- Name: bailiffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.bailiffs_id_seq', 50, true);


--
-- Name: bank_requisites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.bank_requisites_id_seq', 50, true);


--
-- Name: cessionsInfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public."cessionsInfo_id_seq"', 150, true);


--
-- Name: cessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.cessions_id_seq', 40, true);


--
-- Name: contract_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.contract_types_id_seq', 1, false);


--
-- Name: contracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.contracts_id_seq', 400, true);


--
-- Name: contracts_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.contracts_statuses_id_seq', 1, false);


--
-- Name: court_claims_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.court_claims_id_seq', 300, true);


--
-- Name: court_claims_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.court_claims_statuses_id_seq', 6, true);


--
-- Name: court_claims_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.court_claims_types_id_seq', 2, true);


--
-- Name: court_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.court_levels_id_seq', 6, true);


--
-- Name: courts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.courts_id_seq', 60, true);


--
-- Name: creditor_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.creditor_types_id_seq', 5, true);


--
-- Name: creditors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.creditors_id_seq', 200, true);


--
-- Name: debtors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.debtors_id_seq', 200, true);


--
-- Name: executive_doc_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.executive_doc_types_id_seq', 2, true);


--
-- Name: executive_docs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.executive_docs_id_seq', 300, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.groups_id_seq', 50, true);


--
-- Name: passport_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.passport_types_id_seq', 2, true);


--
-- Name: passports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.passports_id_seq', 200, true);


--
-- Name: requisites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.requisites_id_seq', 200, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jamil
--

SELECT pg_catalog.setval('public.users_id_seq', 200, true);


--
-- Name: agents agents_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.agents
    ADD CONSTRAINT agents_pkey PRIMARY KEY (id);


--
-- Name: bailiffs bailiffs_name_key; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.bailiffs
    ADD CONSTRAINT bailiffs_name_key UNIQUE (name);


--
-- Name: bailiffs bailiffs_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.bailiffs
    ADD CONSTRAINT bailiffs_pkey PRIMARY KEY (id);


--
-- Name: bank_requisites bank_requisites_BIK_key; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.bank_requisites
    ADD CONSTRAINT "bank_requisites_BIK_key" UNIQUE (bik);


--
-- Name: bank_requisites bank_requisites_name_key; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.bank_requisites
    ADD CONSTRAINT bank_requisites_name_key UNIQUE (name);


--
-- Name: bank_requisites bank_requisites_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.bank_requisites
    ADD CONSTRAINT bank_requisites_pkey PRIMARY KEY (id);


--
-- Name: cessions cessionsInfo_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.cessions
    ADD CONSTRAINT "cessionsInfo_pkey" PRIMARY KEY (id);


--
-- Name: cessions_groups cessions_name_key; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.cessions_groups
    ADD CONSTRAINT cessions_name_key UNIQUE (name);


--
-- Name: cessions_groups cessions_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.cessions_groups
    ADD CONSTRAINT cessions_pkey PRIMARY KEY (id);


--
-- Name: contract_types contract_types_name_key; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.contract_types
    ADD CONSTRAINT contract_types_name_key UNIQUE (name);


--
-- Name: contract_types contract_types_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.contract_types
    ADD CONSTRAINT contract_types_pkey PRIMARY KEY (id);


--
-- Name: contracts contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- Name: contracts_statuses contracts_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.contracts_statuses
    ADD CONSTRAINT contracts_statuses_name_key UNIQUE (name);


--
-- Name: contracts_statuses contracts_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.contracts_statuses
    ADD CONSTRAINT contracts_statuses_pkey PRIMARY KEY (id);


--
-- Name: court_claims court_claims_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_claims
    ADD CONSTRAINT court_claims_pkey PRIMARY KEY (id);


--
-- Name: court_claims_statuses court_claims_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_claims_statuses
    ADD CONSTRAINT court_claims_statuses_name_key UNIQUE (name);


--
-- Name: court_claims_statuses court_claims_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_claims_statuses
    ADD CONSTRAINT court_claims_statuses_pkey PRIMARY KEY (id);


--
-- Name: court_claims_types court_claims_types_name_key; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_claims_types
    ADD CONSTRAINT court_claims_types_name_key UNIQUE (name);


--
-- Name: court_claims_types court_claims_types_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_claims_types
    ADD CONSTRAINT court_claims_types_pkey PRIMARY KEY (id);


--
-- Name: court_levels court_levels_name_key; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_levels
    ADD CONSTRAINT court_levels_name_key UNIQUE (name);


--
-- Name: court_levels court_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_levels
    ADD CONSTRAINT court_levels_pkey PRIMARY KEY (id);


--
-- Name: courts courts_name_key; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_name_key UNIQUE (name);


--
-- Name: courts courts_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT courts_pkey PRIMARY KEY (id);


--
-- Name: creditor_types creditor_types_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.creditor_types
    ADD CONSTRAINT creditor_types_pkey PRIMARY KEY (id);


--
-- Name: creditors creditors_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.creditors
    ADD CONSTRAINT creditors_pkey PRIMARY KEY (id);


--
-- Name: debtors debtors_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.debtors
    ADD CONSTRAINT debtors_pkey PRIMARY KEY (id);


--
-- Name: executive_doc_types executive_doc_types_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.executive_doc_types
    ADD CONSTRAINT executive_doc_types_pkey PRIMARY KEY (id);


--
-- Name: executive_docs executive_docs_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.executive_docs
    ADD CONSTRAINT executive_docs_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: passport_types passport_types_name_key; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.passport_types
    ADD CONSTRAINT passport_types_name_key UNIQUE (name);


--
-- Name: passport_types passport_types_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.passport_types
    ADD CONSTRAINT passport_types_pkey PRIMARY KEY (id);


--
-- Name: passports passports_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.passports
    ADD CONSTRAINT passports_pkey PRIMARY KEY (id);


--
-- Name: requisites requisites_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.requisites
    ADD CONSTRAINT requisites_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: agents agents_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.agents
    ADD CONSTRAINT agents_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: agents agents_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.agents
    ADD CONSTRAINT agents_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: cessions cessionsInfo_assignee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.cessions
    ADD CONSTRAINT "cessionsInfo_assignee_id_fkey" FOREIGN KEY (assignee_id) REFERENCES public.creditors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cessions cessionsInfo_assignor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.cessions
    ADD CONSTRAINT "cessionsInfo_assignor_id_fkey" FOREIGN KEY (assignor_id) REFERENCES public.creditors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cessions cessionsInfo_cession_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.cessions
    ADD CONSTRAINT "cessionsInfo_cession_group_id_fkey" FOREIGN KEY (cession_group_id) REFERENCES public.cessions_groups(id) ON UPDATE CASCADE;


--
-- Name: cessions cessionsInfo_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.cessions
    ADD CONSTRAINT "cessionsInfo_group_id_fkey" FOREIGN KEY (group_id) REFERENCES public.groups(id) ON UPDATE CASCADE;


--
-- Name: cessions_groups cessions_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.cessions_groups
    ADD CONSTRAINT cessions_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON UPDATE CASCADE;


--
-- Name: contracts contracts_cession_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_cession_group_id_fkey FOREIGN KEY (cession_group_id) REFERENCES public.cessions_groups(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: contracts contracts_creditor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_creditor_id_fkey FOREIGN KEY (creditor_id) REFERENCES public.creditors(id) ON UPDATE CASCADE;


--
-- Name: contracts contracts_debtor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_debtor_id_fkey FOREIGN KEY (debtor_id) REFERENCES public.debtors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contracts contracts_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON UPDATE CASCADE;


--
-- Name: contracts contracts_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_status_id_fkey FOREIGN KEY (contract_status_id) REFERENCES public.contracts_statuses(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contracts contracts_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.contract_types(id) ON UPDATE CASCADE;


--
-- Name: court_claims court_claims_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_claims
    ADD CONSTRAINT court_claims_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.agents(id) ON UPDATE CASCADE;


--
-- Name: court_claims court_claims_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_claims
    ADD CONSTRAINT court_claims_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.contracts(id) ON UPDATE CASCADE;


--
-- Name: court_claims court_claims_court_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_claims
    ADD CONSTRAINT court_claims_court_id_fkey FOREIGN KEY (court_id) REFERENCES public.courts(id) ON UPDATE CASCADE;


--
-- Name: court_claims court_claims_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_claims
    ADD CONSTRAINT court_claims_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.court_claims_statuses(id) ON UPDATE CASCADE;


--
-- Name: court_claims court_claims_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.court_claims
    ADD CONSTRAINT court_claims_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.court_claims_types(id) ON UPDATE CASCADE;


--
-- Name: courts courts_courtLevelId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.courts
    ADD CONSTRAINT "courts_courtLevelId_fkey" FOREIGN KEY (court_level_id) REFERENCES public.court_levels(id) ON UPDATE CASCADE;


--
-- Name: creditors creditors_creditor_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.creditors
    ADD CONSTRAINT creditors_creditor_type_id_fkey FOREIGN KEY (creditor_type_id) REFERENCES public.creditor_types(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: creditors creditors_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.creditors
    ADD CONSTRAINT creditors_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON UPDATE CASCADE;


--
-- Name: executive_docs executive_docs_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.executive_docs
    ADD CONSTRAINT executive_docs_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.agents(id) ON UPDATE CASCADE;


--
-- Name: executive_docs executive_docs_bailiff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.executive_docs
    ADD CONSTRAINT executive_docs_bailiff_id_fkey FOREIGN KEY (bailiff_id) REFERENCES public.bailiffs(id) ON UPDATE CASCADE;


--
-- Name: executive_docs executive_docs_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.executive_docs
    ADD CONSTRAINT executive_docs_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.contracts(id) ON UPDATE CASCADE;


--
-- Name: executive_docs executive_docs_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.executive_docs
    ADD CONSTRAINT executive_docs_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.executive_doc_types(id) ON UPDATE CASCADE;


--
-- Name: passports passports_debtor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.passports
    ADD CONSTRAINT passports_debtor_id_fkey FOREIGN KEY (debtor_id) REFERENCES public.debtors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: passports passports_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.passports
    ADD CONSTRAINT passports_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.passport_types(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: requisites requisites_bank_requisites_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.requisites
    ADD CONSTRAINT requisites_bank_requisites_id_fkey FOREIGN KEY (bank_requisites_id) REFERENCES public.bank_requisites(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: requisites requisites_creditor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.requisites
    ADD CONSTRAINT requisites_creditor_id_fkey FOREIGN KEY (creditor_id) REFERENCES public.creditors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users users_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jamil
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON UPDATE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO jamil;


--
-- PostgreSQL database dump complete
--

