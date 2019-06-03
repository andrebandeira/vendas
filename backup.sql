--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3 (Debian 11.3-1.pgdg90+1)
-- Dumped by pg_dump version 11.3 (Debian 11.3-1.pgdg90+1)

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

SET default_with_oids = false;

--
-- Name: config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.config (
    id bigint NOT NULL,
    email_relatorio character varying(100) NOT NULL,
    key_token character varying(50)
);


ALTER TABLE public.config OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id bigint NOT NULL,
    email character varying(100) NOT NULL,
    nome character varying(100) NOT NULL,
    senha character varying(100) NOT NULL,
    auth_token character varying(150),
    auth_validade timestamp without time zone
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venda (
    id bigint NOT NULL,
    vendedor bigint NOT NULL,
    data_hora timestamp without time zone NOT NULL,
    valor double precision NOT NULL,
    comissao double precision NOT NULL
);


ALTER TABLE public.venda OWNER TO postgres;

--
-- Name: venda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.venda_id_seq OWNER TO postgres;

--
-- Name: venda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venda_id_seq OWNED BY public.venda.id;


--
-- Name: vendedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendedor (
    id bigint NOT NULL,
    email character varying(100) NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE public.vendedor OWNER TO postgres;

--
-- Name: vendedor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendedor_id_seq OWNER TO postgres;

--
-- Name: vendedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendedor_id_seq OWNED BY public.vendedor.id;


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Name: venda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda ALTER COLUMN id SET DEFAULT nextval('public.venda_id_seq'::regclass);


--
-- Name: vendedor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedor ALTER COLUMN id SET DEFAULT nextval('public.vendedor_id_seq'::regclass);


--
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.config (id, email_relatorio, key_token) FROM stdin;
1	abandeira@live.com	key123
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, email, nome, senha, auth_token, auth_validade) FROM stdin;
1	admin	admin	$2y$10$IcRAVTIRPAwG1jEuqKfe/.WNl55TfhBjvfUBWEuEc0vpILgJKESWC	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJVU1VBUklPIjoxLCJJUCI6IjEyNy4wLjAuMSIsInRpbWUiOjE1NTk1MjM4MjF9.HEQ3kgK7xlEL6wYyIuTIxMQHPHjPq2P5BUmRr1d-2Zw	2019-06-02 23:04:16
\.


--
-- Data for Name: venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venda (id, vendedor, data_hora, valor, comissao) FROM stdin;
2	1	2019-06-02 21:28:27	150	12.75
3	2	2019-06-02 21:28:35	200	17
1	1	2019-06-01 21:28:14	100	8.5
4	3	2019-06-02 22:00:56	90.5499999999999972	7.70000000000000018
5	3	2019-06-02 22:04:12	10	0.849999999999999978
\.


--
-- Data for Name: vendedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendedor (id, email, nome) FROM stdin;
1	abandeira@live.com	André Bandeira
2	camila@gmail.com	Camila Silva
3	paulop@gmail.com	Paulo Pereira
\.


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 1, true);


--
-- Name: venda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venda_id_seq', 5, true);


--
-- Name: vendedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendedor_id_seq', 3, true);


--
-- Name: config config_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pk PRIMARY KEY (id);


--
-- Name: usuario usuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (id);


--
-- Name: venda venda_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_pk PRIMARY KEY (id);


--
-- Name: vendedor vendedor_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedor
    ADD CONSTRAINT vendedor_pk PRIMARY KEY (id);


--
-- Name: usuario_unq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX usuario_unq ON public.usuario USING btree (email);


--
-- Name: venda_unq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX venda_unq ON public.venda USING btree (vendedor, data_hora, valor);


--
-- Name: vendedor_unq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX vendedor_unq ON public.vendedor USING btree (email);


--
-- Name: venda vendedor_venda_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT vendedor_venda_fk FOREIGN KEY (vendedor) REFERENCES public.vendedor(id);


--
-- PostgreSQL database dump complete
--

