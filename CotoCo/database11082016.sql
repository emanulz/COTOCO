--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activities_activity; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE activities_activity (
    id integer NOT NULL,
    activity_name character varying(255) NOT NULL,
    activity_description character varying(255) NOT NULL
);


ALTER TABLE activities_activity OWNER TO emanuelziga;

--
-- Name: activities_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE activities_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activities_activity_id_seq OWNER TO emanuelziga;

--
-- Name: activities_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE activities_activity_id_seq OWNED BY activities_activity.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO emanuelziga;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO emanuelziga;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO emanuelziga;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO emanuelziga;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO emanuelziga;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO emanuelziga;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO emanuelziga;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO emanuelziga;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO emanuelziga;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO emanuelziga;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO emanuelziga;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO emanuelziga;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: bills_bill; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE bills_bill (
    id integer NOT NULL,
    bill_date date NOT NULL,
    bill_total numeric(7,2) NOT NULL,
    bill_supplier_id integer NOT NULL,
    bill_order_id integer NOT NULL
);


ALTER TABLE bills_bill OWNER TO emanuelziga;

--
-- Name: bills_bill_bill_detail_list; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE bills_bill_bill_detail_list (
    id integer NOT NULL,
    bill_id integer NOT NULL,
    billdetail_id integer NOT NULL
);


ALTER TABLE bills_bill_bill_detail_list OWNER TO emanuelziga;

--
-- Name: bills_bill_bill_detail_list_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE bills_bill_bill_detail_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bills_bill_bill_detail_list_id_seq OWNER TO emanuelziga;

--
-- Name: bills_bill_bill_detail_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE bills_bill_bill_detail_list_id_seq OWNED BY bills_bill_bill_detail_list.id;


--
-- Name: bills_bill_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE bills_bill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bills_bill_id_seq OWNER TO emanuelziga;

--
-- Name: bills_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE bills_bill_id_seq OWNED BY bills_bill.id;


--
-- Name: bills_billdetail; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE bills_billdetail (
    id integer NOT NULL,
    bill_detail_price numeric(10,2) NOT NULL,
    bill_detail_amount numeric(7,2) NOT NULL,
    bill_detail_total numeric(7,2) NOT NULL,
    bill_detail_product_id character varying(7) NOT NULL
);


ALTER TABLE bills_billdetail OWNER TO emanuelziga;

--
-- Name: bills_billdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE bills_billdetail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bills_billdetail_id_seq OWNER TO emanuelziga;

--
-- Name: bills_billdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE bills_billdetail_id_seq OWNED BY bills_billdetail.id;


--
-- Name: clients_client; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE clients_client (
    id integer NOT NULL,
    client_name character varying(255) NOT NULL,
    client_phone numeric(11,0) NOT NULL,
    client_address character varying(255) NOT NULL,
    client_email character varying(254) NOT NULL,
    client_id numeric(20,0) NOT NULL
);


ALTER TABLE clients_client OWNER TO emanuelziga;

--
-- Name: clients_client_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE clients_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clients_client_id_seq OWNER TO emanuelziga;

--
-- Name: clients_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE clients_client_id_seq OWNED BY clients_client.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO emanuelziga;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO emanuelziga;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO emanuelziga;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO emanuelziga;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO emanuelziga;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO emanuelziga;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO emanuelziga;

--
-- Name: orders_order; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE orders_order (
    id integer NOT NULL,
    order_date date NOT NULL,
    order_total numeric(11,2) NOT NULL,
    order_activity_id integer NOT NULL,
    order_project_id integer NOT NULL,
    order_supplier_id integer NOT NULL
);


ALTER TABLE orders_order OWNER TO emanuelziga;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_order_id_seq OWNER TO emanuelziga;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE orders_order_id_seq OWNED BY orders_order.id;


--
-- Name: orders_order_order_product_list; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE orders_order_order_product_list (
    id integer NOT NULL,
    order_id integer NOT NULL,
    orderdetail_id integer NOT NULL
);


ALTER TABLE orders_order_order_product_list OWNER TO emanuelziga;

--
-- Name: orders_order_order_product_list_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE orders_order_order_product_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_order_order_product_list_id_seq OWNER TO emanuelziga;

--
-- Name: orders_order_order_product_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE orders_order_order_product_list_id_seq OWNED BY orders_order_order_product_list.id;


--
-- Name: orders_orderdetail; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE orders_orderdetail (
    id integer NOT NULL,
    order_detail_price numeric(11,2) NOT NULL,
    order_detail_amount numeric(7,2) NOT NULL,
    order_detail_total numeric(11,2) NOT NULL,
    order_detail_product_id character varying(7) NOT NULL,
    order_detail_description character varying(255) NOT NULL,
    order_detail_unit character varying(255) NOT NULL
);


ALTER TABLE orders_orderdetail OWNER TO emanuelziga;

--
-- Name: orders_orderdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE orders_orderdetail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_orderdetail_id_seq OWNER TO emanuelziga;

--
-- Name: orders_orderdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE orders_orderdetail_id_seq OWNED BY orders_orderdetail.id;


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE products_product (
    product_code character varying(7) NOT NULL,
    product_description character varying(255) NOT NULL,
    product_price numeric(10,2) NOT NULL,
    product_taxes numeric(5,2) NOT NULL,
    product_unit character varying(255) NOT NULL,
    product_usetaxes boolean NOT NULL,
    product_department_id integer,
    product_subdepartment_id integer,
    product_consecutive numeric(3,0) NOT NULL
);


ALTER TABLE products_product OWNER TO emanuelziga;

--
-- Name: products_productdepartment; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE products_productdepartment (
    id integer NOT NULL,
    productdepartment_name character varying(255) NOT NULL,
    productdepartment_code character varying(2) NOT NULL
);


ALTER TABLE products_productdepartment OWNER TO emanuelziga;

--
-- Name: products_productdepartment_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE products_productdepartment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_productdepartment_id_seq OWNER TO emanuelziga;

--
-- Name: products_productdepartment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE products_productdepartment_id_seq OWNED BY products_productdepartment.id;


--
-- Name: products_productsubdepartment; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE products_productsubdepartment (
    id integer NOT NULL,
    productsubdepartment_name character varying(255) NOT NULL,
    productsubdepartment_code character varying(2) NOT NULL,
    productsubdepartment_department_id integer NOT NULL
);


ALTER TABLE products_productsubdepartment OWNER TO emanuelziga;

--
-- Name: products_productsubdepartment_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE products_productsubdepartment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_productsubdepartment_id_seq OWNER TO emanuelziga;

--
-- Name: products_productsubdepartment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE products_productsubdepartment_id_seq OWNED BY products_productsubdepartment.id;


--
-- Name: projects_project; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE projects_project (
    id integer NOT NULL,
    project_name character varying(255) NOT NULL,
    project_description character varying(255) NOT NULL
);


ALTER TABLE projects_project OWNER TO emanuelziga;

--
-- Name: projects_project_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE projects_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_project_id_seq OWNER TO emanuelziga;

--
-- Name: projects_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE projects_project_id_seq OWNED BY projects_project.id;


--
-- Name: projects_project_project_activity; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE projects_project_project_activity (
    id integer NOT NULL,
    project_id integer NOT NULL,
    activity_id integer NOT NULL
);


ALTER TABLE projects_project_project_activity OWNER TO emanuelziga;

--
-- Name: projects_project_project_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE projects_project_project_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_project_project_activity_id_seq OWNER TO emanuelziga;

--
-- Name: projects_project_project_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE projects_project_project_activity_id_seq OWNED BY projects_project_project_activity.id;


--
-- Name: suppliers_supplier; Type: TABLE; Schema: public; Owner: emanuelziga
--

CREATE TABLE suppliers_supplier (
    id integer NOT NULL,
    supplier_name character varying(255) NOT NULL,
    supplier_phone numeric(11,0) NOT NULL,
    supplier_address character varying(255) NOT NULL,
    supplier_email character varying(254) NOT NULL
);


ALTER TABLE suppliers_supplier OWNER TO emanuelziga;

--
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE suppliers_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE suppliers_supplier_id_seq OWNER TO emanuelziga;

--
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE suppliers_supplier_id_seq OWNED BY suppliers_supplier.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY activities_activity ALTER COLUMN id SET DEFAULT nextval('activities_activity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY bills_bill ALTER COLUMN id SET DEFAULT nextval('bills_bill_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY bills_bill_bill_detail_list ALTER COLUMN id SET DEFAULT nextval('bills_bill_bill_detail_list_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY bills_billdetail ALTER COLUMN id SET DEFAULT nextval('bills_billdetail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY clients_client ALTER COLUMN id SET DEFAULT nextval('clients_client_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY orders_order ALTER COLUMN id SET DEFAULT nextval('orders_order_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY orders_order_order_product_list ALTER COLUMN id SET DEFAULT nextval('orders_order_order_product_list_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY orders_orderdetail ALTER COLUMN id SET DEFAULT nextval('orders_orderdetail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY products_productdepartment ALTER COLUMN id SET DEFAULT nextval('products_productdepartment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY products_productsubdepartment ALTER COLUMN id SET DEFAULT nextval('products_productsubdepartment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY projects_project ALTER COLUMN id SET DEFAULT nextval('projects_project_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY projects_project_project_activity ALTER COLUMN id SET DEFAULT nextval('projects_project_project_activity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY suppliers_supplier ALTER COLUMN id SET DEFAULT nextval('suppliers_supplier_id_seq'::regclass);


--
-- Data for Name: activities_activity; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY activities_activity (id, activity_name, activity_description) FROM stdin;
1	Losa de contrapiso	Losa de 2 pulgadas de espesor
\.


--
-- Name: activities_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('activities_activity_id_seq', 1, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add Actividad	7	add_activity
20	Can change Actividad	7	change_activity
21	Can delete Actividad	7	delete_activity
22	Can add Factura	8	add_bill
23	Can change Factura	8	change_bill
24	Can delete Factura	8	delete_bill
25	Can add Detalle de la factura	9	add_billdetail
26	Can change Detalle de la factura	9	change_billdetail
27	Can delete Detalle de la factura	9	delete_billdetail
28	Can add Cliente	10	add_client
29	Can change Cliente	10	change_client
30	Can delete Cliente	10	delete_client
31	Can add Orden	11	add_order
32	Can change Orden	11	change_order
33	Can delete Orden	11	delete_order
34	Can add Detalle de la orden	12	add_orderdetail
35	Can change Detalle de la orden	12	change_orderdetail
36	Can delete Detalle de la orden	12	delete_orderdetail
37	Can add Producto	13	add_product
38	Can change Producto	13	change_product
39	Can delete Producto	13	delete_product
40	Can add Familia	14	add_productdepartment
41	Can change Familia	14	change_productdepartment
42	Can delete Familia	14	delete_productdepartment
43	Can add Sub-Familia	15	add_productsubdepartment
44	Can change Sub-Familia	15	change_productsubdepartment
45	Can delete Sub-Familia	15	delete_productsubdepartment
46	Can add Proyecto	16	add_project
47	Can change Proyecto	16	change_project
48	Can delete Proyecto	16	delete_project
49	Can add Proveedor	17	add_supplier
50	Can change Proveedor	17	change_supplier
51	Can delete Proveedor	17	delete_supplier
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('auth_permission_id_seq', 51, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$H796Q1fJqdby$SCuuRJzA8Lf6vIsbgD2TIZDVf3ruH047dyXNBhgoao4=	2016-08-10 16:19:49.162442-06	t	emanuelziga			emanuelziga@gmail.com	t	t	2016-08-10 16:19:38.820095-06
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: bills_bill; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY bills_bill (id, bill_date, bill_total, bill_supplier_id, bill_order_id) FROM stdin;
\.


--
-- Data for Name: bills_bill_bill_detail_list; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY bills_bill_bill_detail_list (id, bill_id, billdetail_id) FROM stdin;
\.


--
-- Name: bills_bill_bill_detail_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('bills_bill_bill_detail_list_id_seq', 1, false);


--
-- Name: bills_bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('bills_bill_id_seq', 1, false);


--
-- Data for Name: bills_billdetail; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY bills_billdetail (id, bill_detail_price, bill_detail_amount, bill_detail_total, bill_detail_product_id) FROM stdin;
\.


--
-- Name: bills_billdetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('bills_billdetail_id_seq', 1, false);


--
-- Data for Name: clients_client; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY clients_client (id, client_name, client_phone, client_address, client_email, client_id) FROM stdin;
\.


--
-- Name: clients_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('clients_client_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-08-11 17:17:09.348326-06	1	Materiales	1	Added.	14	1
2	2016-08-11 17:18:29.322441-06	1	Agregados	1	Added.	15	1
3	2016-08-11 17:18:39.005746-06	2	Cemento	1	Added.	15	1
4	2016-08-11 17:19:11.109511-06	0102001	Cemento Holcim	1	Added.	13	1
5	2016-08-11 17:19:14.739292-06	0102001	Cemento Holcim	2	No ha modificado ningún campo.	13	1
6	2016-08-11 17:19:51.268864-06	0102002	Cemento Otra Marca	1	Added.	13	1
7	2016-08-11 17:20:32.071035-06	0101001	Arena Fina	1	Added.	13	1
8	2016-08-11 17:21:04.011551-06	1	Ferreteria Fixur	1	Added.	17	1
9	2016-08-11 17:21:15.600551-06	2	Ferreteria Palmares	1	Added.	17	1
10	2016-08-11 17:21:31.649423-06	1	Losa de contrapiso	1	Added.	7	1
11	2016-08-11 17:21:46.334276-06	1	Casa Adrian Coto	1	Added.	16	1
12	2016-08-11 18:30:15.107848-06	3	3	2	Modifica order_detail_description.	12	1
13	2016-08-11 18:30:24.723066-06	2	2	2	Modifica order_detail_description.	12	1
14	2016-08-11 18:30:32.884863-06	1	1	2	Modifica order_detail_description.	12	1
15	2016-08-11 18:40:07.736763-06	2	2	3		11	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 15, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	activities	activity
8	bills	bill
9	bills	billdetail
10	clients	client
11	orders	order
12	orders	orderdetail
13	products	product
14	products	productdepartment
15	products	productsubdepartment
16	projects	project
17	suppliers	supplier
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('django_content_type_id_seq', 17, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	activities	0001_initial	2016-08-10 15:48:10.459414-06
2	contenttypes	0001_initial	2016-08-10 15:48:10.473752-06
3	auth	0001_initial	2016-08-10 15:48:10.559756-06
4	admin	0001_initial	2016-08-10 15:48:10.588511-06
5	admin	0002_logentry_remove_auto_add	2016-08-10 15:48:10.605336-06
6	contenttypes	0002_remove_content_type_name	2016-08-10 15:48:10.63949-06
7	auth	0002_alter_permission_name_max_length	2016-08-10 15:48:10.654786-06
8	auth	0003_alter_user_email_max_length	2016-08-10 15:48:10.669754-06
9	auth	0004_alter_user_username_opts	2016-08-10 15:48:10.684905-06
10	auth	0005_alter_user_last_login_null	2016-08-10 15:48:10.698911-06
11	auth	0006_require_contenttypes_0002	2016-08-10 15:48:10.703049-06
12	auth	0007_alter_validators_add_error_messages	2016-08-10 15:48:10.71625-06
13	suppliers	0001_initial	2016-08-10 15:48:10.728085-06
14	projects	0001_initial	2016-08-10 15:48:10.754965-06
15	products	0001_initial	2016-08-10 15:48:10.767533-06
16	orders	0001_initial	2016-08-10 15:48:10.847025-06
17	orders	0002_auto_20160731_1136	2016-08-10 15:48:10.903474-06
18	orders	0003_auto_20160731_1139	2016-08-10 15:48:10.941872-06
19	bills	0001_initial	2016-08-10 15:48:11.012544-06
20	bills	0002_auto_20160802_1040	2016-08-10 15:48:11.055955-06
21	bills	0003_bill_bill_order	2016-08-10 15:48:11.086737-06
22	clients	0001_initial	2016-08-10 15:48:11.10004-06
23	clients	0002_auto_20160807_2001	2016-08-10 15:48:11.121483-06
24	clients	0003_auto_20160807_2010	2016-08-10 15:48:11.147979-06
25	clients	0004_auto_20160807_2011	2016-08-10 15:48:11.163771-06
26	products	0002_auto_20160709_1221	2016-08-10 15:48:11.192301-06
27	products	0003_product_product_price	2016-08-10 15:48:11.218499-06
28	products	0004_auto_20160730_1008	2016-08-10 15:48:11.275633-06
29	products	0005_auto_20160807_2005	2016-08-10 15:48:11.453682-06
30	products	0006_auto_20160809_0703	2016-08-10 15:48:11.565038-06
31	products	0007_auto_20160809_0711	2016-08-10 15:48:11.644482-06
32	products	0008_auto_20160809_0717	2016-08-10 15:48:11.702873-06
33	products	0009_auto_20160809_0730	2016-08-10 15:48:11.770271-06
34	products	0010_auto_20160809_1052	2016-08-10 15:48:11.80982-06
35	products	0011_auto_20160809_1112	2016-08-10 15:48:11.870837-06
36	products	0012_auto_20160809_1134	2016-08-10 15:48:11.934464-06
37	projects	0002_auto_20160807_2001	2016-08-10 15:48:11.988029-06
38	sessions	0001_initial	2016-08-10 15:48:12.006396-06
39	orders	0004_orderdetail_order_detail_description	2016-08-11 18:29:22.42932-06
40	orders	0005_orderdetail_order_detail_unit	2016-08-11 19:32:57.289613-06
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('django_migrations_id_seq', 40, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
2jqo0sdet4tl896qyg7tfc88obm9jt19	ZTA2NzUwYjc0NTg5MWNkNDc1OTc2NGExMTUxM2ZhZTJjZTg3YTU5NDp7Il9hdXRoX3VzZXJfaGFzaCI6ImJkMGNjODhhOTk3MWJlYmM4ZDg3NjA2Y2Y0YzA1NzAyMDZlZDhkODQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-24 16:19:49.165605-06
\.


--
-- Data for Name: orders_order; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY orders_order (id, order_date, order_total, order_activity_id, order_project_id, order_supplier_id) FROM stdin;
1	2016-08-11	112500.00	1	1	1
3	2016-08-11	51500.00	1	1	1
4	2016-08-11	43500.00	1	1	2
5	2016-08-11	35000.00	1	1	1
\.


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('orders_order_id_seq', 5, true);


--
-- Data for Name: orders_order_order_product_list; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY orders_order_order_product_list (id, order_id, orderdetail_id) FROM stdin;
1	1	1
2	1	2
3	1	3
10	3	10
11	3	11
12	3	12
13	4	13
14	4	14
15	4	15
16	4	16
17	4	17
18	4	18
19	5	19
\.


--
-- Name: orders_order_order_product_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('orders_order_order_product_list_id_seq', 19, true);


--
-- Data for Name: orders_orderdetail; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY orders_orderdetail (id, order_detail_price, order_detail_amount, order_detail_total, order_detail_product_id, order_detail_description, order_detail_unit) FROM stdin;
3	5500.00	10.00	55000.00	0102001	Cemento Holcim	
2	5000.00	8.00	40000.00	0102002	Cemento Otra Marca	
1	3500.00	5.00	17500.00	0101001	Arena fina	
4	3500.00	1.00	3500.00	0101001		
5	5000.00	7.00	35000.00	0102002		
6	5500.00	3.00	16500.00	0102001		
7	3500.00	4.00	14000.00	0101001	Arena Fina	
8	5000.00	2.00	10000.00	0102002	Cemento Otra Marca	
9	5500.00	6.00	33000.00	0102001	Cemento Holcim	
10	5000.00	2.00	10000.00	0102002	Cemento Otra Marca	
11	5500.00	5.00	27500.00	0102001	Cemento Holcim	
12	3500.00	4.00	14000.00	0101001	Arena Fina	
13	3500.00	8.00	28000.00	0101001	Arena Fina	m3
14	5000.00	2.00	10000.00	0102002	Cemento Otra Marca	saco
15	5500.00	1.00	5500.00	0102001	Cemento Holcim	Saco
16	3500.00	8.00	28000.00	0101001	Arena Fina	m3
17	5000.00	2.00	10000.00	0102002	Cemento Otra Marca	saco
18	5500.00	1.00	5500.00	0102001	Cemento Holcim	Saco
19	3500.00	10.00	35000.00	0101001	Arena Fina	m3
\.


--
-- Name: orders_orderdetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('orders_orderdetail_id_seq', 19, true);


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY products_product (product_code, product_description, product_price, product_taxes, product_unit, product_usetaxes, product_department_id, product_subdepartment_id, product_consecutive) FROM stdin;
0102001	Cemento Holcim	5500.00	13.00	Saco	t	1	2	1
0102002	Cemento Otra Marca	5000.00	13.00	saco	t	1	2	2
0101001	Arena Fina	3500.00	10.00	m3	t	1	1	1
\.


--
-- Data for Name: products_productdepartment; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY products_productdepartment (id, productdepartment_name, productdepartment_code) FROM stdin;
1	Materiales	01
\.


--
-- Name: products_productdepartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('products_productdepartment_id_seq', 1, true);


--
-- Data for Name: products_productsubdepartment; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY products_productsubdepartment (id, productsubdepartment_name, productsubdepartment_code, productsubdepartment_department_id) FROM stdin;
1	Agregados	01	1
2	Cemento	02	1
\.


--
-- Name: products_productsubdepartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('products_productsubdepartment_id_seq', 2, true);


--
-- Data for Name: projects_project; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY projects_project (id, project_name, project_description) FROM stdin;
1	Casa Adrian Coto	Casa Uvita Adrian Coto
\.


--
-- Name: projects_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('projects_project_id_seq', 1, true);


--
-- Data for Name: projects_project_project_activity; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY projects_project_project_activity (id, project_id, activity_id) FROM stdin;
1	1	1
\.


--
-- Name: projects_project_project_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('projects_project_project_activity_id_seq', 1, true);


--
-- Data for Name: suppliers_supplier; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY suppliers_supplier (id, supplier_name, supplier_phone, supplier_address, supplier_email) FROM stdin;
1	Ferreteria Fixur	8888888	Palmares, Daniel Flores, 200 m Norte de la Guardia Rural	fixur@fixur.com
2	Ferreteria Palmares	88888888	Palmares, Daniel Flores, 200 m Norte de la Guardia Rural	fpalmares@fpalmares.com
\.


--
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('suppliers_supplier_id_seq', 2, true);


--
-- Name: activities_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY activities_activity
    ADD CONSTRAINT activities_activity_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: bills_bill_bill_detail_list_bill_id_b85e1ec3_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY bills_bill_bill_detail_list
    ADD CONSTRAINT bills_bill_bill_detail_list_bill_id_b85e1ec3_uniq UNIQUE (bill_id, billdetail_id);


--
-- Name: bills_bill_bill_detail_list_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY bills_bill_bill_detail_list
    ADD CONSTRAINT bills_bill_bill_detail_list_pkey PRIMARY KEY (id);


--
-- Name: bills_bill_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY bills_bill
    ADD CONSTRAINT bills_bill_pkey PRIMARY KEY (id);


--
-- Name: bills_billdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY bills_billdetail
    ADD CONSTRAINT bills_billdetail_pkey PRIMARY KEY (id);


--
-- Name: clients_client_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY clients_client
    ADD CONSTRAINT clients_client_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: orders_order_order_product_list_order_id_8f27027e_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY orders_order_order_product_list
    ADD CONSTRAINT orders_order_order_product_list_order_id_8f27027e_uniq UNIQUE (order_id, orderdetail_id);


--
-- Name: orders_order_order_product_list_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY orders_order_order_product_list
    ADD CONSTRAINT orders_order_order_product_list_pkey PRIMARY KEY (id);


--
-- Name: orders_order_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY orders_order
    ADD CONSTRAINT orders_order_pkey PRIMARY KEY (id);


--
-- Name: orders_orderdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY orders_orderdetail
    ADD CONSTRAINT orders_orderdetail_pkey PRIMARY KEY (id);


--
-- Name: products_product_product_code_9b97c0ac_pk; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY products_product
    ADD CONSTRAINT products_product_product_code_9b97c0ac_pk PRIMARY KEY (product_code);


--
-- Name: products_productdepartment_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY products_productdepartment
    ADD CONSTRAINT products_productdepartment_pkey PRIMARY KEY (id);


--
-- Name: products_productdepartment_productdepartment_code_76da2a66_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY products_productdepartment
    ADD CONSTRAINT products_productdepartment_productdepartment_code_76da2a66_uniq UNIQUE (productdepartment_code);


--
-- Name: products_productdepartment_productdepartment_name_key; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY products_productdepartment
    ADD CONSTRAINT products_productdepartment_productdepartment_name_key UNIQUE (productdepartment_name);


--
-- Name: products_productsubdepartment_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY products_productsubdepartment
    ADD CONSTRAINT products_productsubdepartment_pkey PRIMARY KEY (id);


--
-- Name: products_productsubdepartment_productsubdepartment_name_key; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY products_productsubdepartment
    ADD CONSTRAINT products_productsubdepartment_productsubdepartment_name_key UNIQUE (productsubdepartment_name);


--
-- Name: projects_project_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY projects_project
    ADD CONSTRAINT projects_project_pkey PRIMARY KEY (id);


--
-- Name: projects_project_project_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY projects_project_project_activity
    ADD CONSTRAINT projects_project_project_activity_pkey PRIMARY KEY (id);


--
-- Name: projects_project_project_activity_project_id_03940dfc_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY projects_project_project_activity
    ADD CONSTRAINT projects_project_project_activity_project_id_03940dfc_uniq UNIQUE (project_id, activity_id);


--
-- Name: suppliers_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY suppliers_supplier
    ADD CONSTRAINT suppliers_supplier_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: bills_bill_7161be0e; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX bills_bill_7161be0e ON bills_bill USING btree (bill_order_id);


--
-- Name: bills_bill_bill_detail_list_1f62f768; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX bills_bill_bill_detail_list_1f62f768 ON bills_bill_bill_detail_list USING btree (billdetail_id);


--
-- Name: bills_bill_bill_detail_list_88bce984; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX bills_bill_bill_detail_list_88bce984 ON bills_bill_bill_detail_list USING btree (bill_id);


--
-- Name: bills_bill_c0003347; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX bills_bill_c0003347 ON bills_bill USING btree (bill_supplier_id);


--
-- Name: bills_billdetail_3840b8d0; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX bills_billdetail_3840b8d0 ON bills_billdetail USING btree (bill_detail_product_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: orders_order_596486eb; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX orders_order_596486eb ON orders_order USING btree (order_project_id);


--
-- Name: orders_order_771c6836; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX orders_order_771c6836 ON orders_order USING btree (order_activity_id);


--
-- Name: orders_order_92cace63; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX orders_order_92cace63 ON orders_order USING btree (order_supplier_id);


--
-- Name: orders_order_order_product_list_2f06cccd; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX orders_order_order_product_list_2f06cccd ON orders_order_order_product_list USING btree (orderdetail_id);


--
-- Name: orders_order_order_product_list_69dfcb07; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX orders_order_order_product_list_69dfcb07 ON orders_order_order_product_list USING btree (order_id);


--
-- Name: orders_orderdetail_1bf11334; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX orders_orderdetail_1bf11334 ON orders_orderdetail USING btree (order_detail_product_id);


--
-- Name: products_product_738aa7d0; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX products_product_738aa7d0 ON products_product USING btree (product_department_id);


--
-- Name: products_product_d337f99e; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX products_product_d337f99e ON products_product USING btree (product_subdepartment_id);


--
-- Name: products_productdepartment_productdepartment_code_76da2a66_like; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX products_productdepartment_productdepartment_code_76da2a66_like ON products_productdepartment USING btree (productdepartment_code varchar_pattern_ops);


--
-- Name: products_productdepartment_productdepartment_name_b683665e_like; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX products_productdepartment_productdepartment_name_b683665e_like ON products_productdepartment USING btree (productdepartment_name varchar_pattern_ops);


--
-- Name: products_productsubdepa_productsubdepartment_name_2b75d425_like; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX products_productsubdepa_productsubdepartment_name_2b75d425_like ON products_productsubdepartment USING btree (productsubdepartment_name varchar_pattern_ops);


--
-- Name: products_productsubdepartment_87cf710c; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX products_productsubdepartment_87cf710c ON products_productsubdepartment USING btree (productsubdepartment_department_id);


--
-- Name: projects_project_project_activity_b098ad43; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX projects_project_project_activity_b098ad43 ON projects_project_project_activity USING btree (project_id);


--
-- Name: projects_project_project_activity_f8a3193a; Type: INDEX; Schema: public; Owner: emanuelziga
--

CREATE INDEX projects_project_project_activity_f8a3193a ON projects_project_project_activity USING btree (activity_id);


--
-- Name: D43ff4271e33a2ad7eaa8f3e1d8325cb; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY products_product
    ADD CONSTRAINT "D43ff4271e33a2ad7eaa8f3e1d8325cb" FOREIGN KEY (product_subdepartment_id) REFERENCES products_productsubdepartment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bills_bill_bill_d_billdetail_id_66c8b754_fk_bills_billdetail_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY bills_bill_bill_detail_list
    ADD CONSTRAINT bills_bill_bill_d_billdetail_id_66c8b754_fk_bills_billdetail_id FOREIGN KEY (billdetail_id) REFERENCES bills_billdetail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bills_bill_bill_detail_list_bill_id_9c577c02_fk_bills_bill_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY bills_bill_bill_detail_list
    ADD CONSTRAINT bills_bill_bill_detail_list_bill_id_9c577c02_fk_bills_bill_id FOREIGN KEY (bill_id) REFERENCES bills_bill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bills_bill_bill_order_id_696ee7ef_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY bills_bill
    ADD CONSTRAINT bills_bill_bill_order_id_696ee7ef_fk_orders_order_id FOREIGN KEY (bill_order_id) REFERENCES orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bills_bill_bill_supplier_id_d1a565a4_fk_suppliers_supplier_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY bills_bill
    ADD CONSTRAINT bills_bill_bill_supplier_id_d1a565a4_fk_suppliers_supplier_id FOREIGN KEY (bill_supplier_id) REFERENCES suppliers_supplier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bills_billdetail_bill_detail_product_id_138db420_fk; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY bills_billdetail
    ADD CONSTRAINT bills_billdetail_bill_detail_product_id_138db420_fk FOREIGN KEY (bill_detail_product_id) REFERENCES products_product(product_code) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c890a0f16cba430efc0bd405d5d5a589; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY products_productsubdepartment
    ADD CONSTRAINT c890a0f16cba430efc0bd405d5d5a589 FOREIGN KEY (productsubdepartment_department_id) REFERENCES products_productdepartment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cbb4c7d38a75c6e8e9be2f7f3131aba4; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY products_product
    ADD CONSTRAINT cbb4c7d38a75c6e8e9be2f7f3131aba4 FOREIGN KEY (product_department_id) REFERENCES products_productdepartment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_ord_order_activity_id_fdd5bf4b_fk_activities_activity_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY orders_order
    ADD CONSTRAINT orders_ord_order_activity_id_fdd5bf4b_fk_activities_activity_id FOREIGN KEY (order_activity_id) REFERENCES activities_activity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orde_order_supplier_id_e351eb98_fk_suppliers_supplier_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY orders_order
    ADD CONSTRAINT orders_orde_order_supplier_id_e351eb98_fk_suppliers_supplier_id FOREIGN KEY (order_supplier_id) REFERENCES suppliers_supplier(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order_o_orderdetail_id_d5d8d027_fk_orders_orderdetail_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY orders_order_order_product_list
    ADD CONSTRAINT orders_order_o_orderdetail_id_d5d8d027_fk_orders_orderdetail_id FOREIGN KEY (orderdetail_id) REFERENCES orders_orderdetail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order_order_product_order_id_08f83d10_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY orders_order_order_product_list
    ADD CONSTRAINT orders_order_order_product_order_id_08f83d10_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order_order_project_id_26a7941f_fk_projects_project_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY orders_order
    ADD CONSTRAINT orders_order_order_project_id_26a7941f_fk_projects_project_id FOREIGN KEY (order_project_id) REFERENCES projects_project(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderdetail_order_detail_product_id_11948778_fk; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY orders_orderdetail
    ADD CONSTRAINT orders_orderdetail_order_detail_product_id_11948778_fk FOREIGN KEY (order_detail_product_id) REFERENCES products_product(product_code) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project_activity_id_ffc7faae_fk_activities_activity_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY projects_project_project_activity
    ADD CONSTRAINT projects_project_activity_id_ffc7faae_fk_activities_activity_id FOREIGN KEY (activity_id) REFERENCES activities_activity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: projects_project_pro_project_id_2b1d38e3_fk_projects_project_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY projects_project_project_activity
    ADD CONSTRAINT projects_project_pro_project_id_2b1d38e3_fk_projects_project_id FOREIGN KEY (project_id) REFERENCES projects_project(id) DEFERRABLE INITIALLY DEFERRED;


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

