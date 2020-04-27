--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.customers (
    customerid integer NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    gender character varying(20),
    address character varying(30),
    phone character varying(20),
    email character varying(30),
    city character varying(30),
    country character varying(30)
);


ALTER TABLE public.customers OWNER TO "user";

--
-- Name: customers_customerid_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.customers_customerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customerid_seq OWNER TO "user";

--
-- Name: customers_customerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.customers_customerid_seq OWNED BY public.customers.customerid;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.employee (
    employeeid integer NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    email character varying(30),
    jobtitle character varying(30)
);


ALTER TABLE public.employee OWNER TO "user";

--
-- Name: employee_employeeid_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.employee_employeeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_employeeid_seq OWNER TO "user";

--
-- Name: employee_employeeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.employee_employeeid_seq OWNED BY public.employee.employeeid;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.orders (
    orderid integer NOT NULL,
    productid integer,
    paymentid integer,
    fullfilledbyemployeeid integer,
    daterequired date,
    dateshipped date,
    status character varying(100)
);


ALTER TABLE public.orders OWNER TO "user";

--
-- Name: orders_orderid_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.orders_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_orderid_seq OWNER TO "user";

--
-- Name: orders_orderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.orders_orderid_seq OWNED BY public.orders.orderid;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.payments (
    customerid integer,
    paymentid integer NOT NULL,
    paymentdate date,
    amount numeric
);


ALTER TABLE public.payments OWNER TO "user";

--
-- Name: payments_paymentid_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.payments_paymentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_paymentid_seq OWNER TO "user";

--
-- Name: payments_paymentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.payments_paymentid_seq OWNED BY public.payments.paymentid;


--
-- Name: products; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.products (
    productid integer NOT NULL,
    productname character varying(50),
    description character varying(300),
    buprice numeric
);


ALTER TABLE public.products OWNER TO "user";

--
-- Name: products_productid_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.products_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_productid_seq OWNER TO "user";

--
-- Name: products_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.productid;


--
-- Name: customers customerid; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.customers ALTER COLUMN customerid SET DEFAULT nextval('public.customers_customerid_seq'::regclass);


--
-- Name: employee employeeid; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.employee ALTER COLUMN employeeid SET DEFAULT nextval('public.employee_employeeid_seq'::regclass);


--
-- Name: orders orderid; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.orders ALTER COLUMN orderid SET DEFAULT nextval('public.orders_orderid_seq'::regclass);


--
-- Name: payments paymentid; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.payments ALTER COLUMN paymentid SET DEFAULT nextval('public.payments_paymentid_seq'::regclass);


--
-- Name: products productid; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.products ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.customers (customerid, firstname, lastname, gender, address, phone, email, city, country) FROM stdin;
3	Leon	Glen	male	81 Everton Rd,Gillits	0820832830	Leon@gmail.com	Durban	South Africa
4	Charl	Muller	male	290A Dorset Ecke	+44856872553	Charl.muller@yahoo.com	Berlin	Germany
5	Julia	Stein	Female	2 Wernerring	+448672445058	Js234@yahoo.com	Frankfurt	Germany
1	lerato	mabitso	male	284 chaucer st	084789657	john@gmail.com	Johannesburg	South Africa
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.employee (employeeid, firstname, lastname, email, jobtitle) FROM stdin;
1	kani	matthews	mat@gmail.com	manager
2	Lesly	Cronje	 LesC@gmail.com	Clerk
3	Gideon	Maduku	m@gmail.com	Accountant
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.orders (orderid, productid, paymentid, fullfilledbyemployeeid, daterequired, dateshipped, status) FROM stdin;
1	1	1	2	2018-05-09	\N	not shipped
2	1	2	2	2018-04-09	2018-03-09	Shipped
3	3	3	3	2018-06-09	\N	not Shipped
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.payments (customerid, paymentid, paymentdate, amount) FROM stdin;
1	1	2018-01-09	150.75
5	2	2018-03-09	150.75
4	3	2018-03-09	700.60
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.products (productid, productname, description, buprice) FROM stdin;
1	Harley Davidson Chopper	This replica features working kickstand front suspension  gear shift lever	150.75
2	Classic Car	 Turnable front wheels  steering function	550.75
3	Sports car	 Turnable front wheels, steering function	700.60
\.


--
-- Name: customers_customerid_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.customers_customerid_seq', 5, true);


--
-- Name: employee_employeeid_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.employee_employeeid_seq', 3, true);


--
-- Name: orders_orderid_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.orders_orderid_seq', 3, true);


--
-- Name: payments_paymentid_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.payments_paymentid_seq', 3, true);


--
-- Name: products_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.products_productid_seq', 3, true);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employeeid);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (paymentid);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- Name: orders orders_fullfilledbyemployeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_fullfilledbyemployeeid_fkey FOREIGN KEY (fullfilledbyemployeeid) REFERENCES public.employee(employeeid);


--
-- Name: orders orders_paymentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_paymentid_fkey FOREIGN KEY (paymentid) REFERENCES public.payments(paymentid);


--
-- Name: orders orders_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- PostgreSQL database dump complete
--

