--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: activities_activity; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE activities_activity (
    id integer NOT NULL,
    activity_name character varying(255) NOT NULL,
    activity_description character varying(255) NOT NULL
);


ALTER TABLE public.activities_activity OWNER TO emanuelziga;

--
-- Name: activities_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE activities_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_activity_id_seq OWNER TO emanuelziga;

--
-- Name: activities_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE activities_activity_id_seq OWNED BY activities_activity.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO emanuelziga;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO emanuelziga;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO emanuelziga;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO emanuelziga;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO emanuelziga;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO emanuelziga;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
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


ALTER TABLE public.auth_user OWNER TO emanuelziga;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO emanuelziga;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO emanuelziga;

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


ALTER TABLE public.auth_user_id_seq OWNER TO emanuelziga;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO emanuelziga;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO emanuelziga;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: bills_bill; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE bills_bill (
    id integer NOT NULL,
    bill_date date NOT NULL,
    bill_total numeric(11,2) NOT NULL,
    bill_order_id integer NOT NULL,
    bill_supplier_id integer NOT NULL,
    bill_iv numeric(11,2) NOT NULL,
    bill_subtotal numeric(11,2) NOT NULL,
    bill_supplier_bill character varying(255) NOT NULL
);


ALTER TABLE public.bills_bill OWNER TO emanuelziga;

--
-- Name: bills_bill_bill_detail_list; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE bills_bill_bill_detail_list (
    id integer NOT NULL,
    bill_id integer NOT NULL,
    billdetail_id integer NOT NULL
);


ALTER TABLE public.bills_bill_bill_detail_list OWNER TO emanuelziga;

--
-- Name: bills_bill_bill_detail_list_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE bills_bill_bill_detail_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bills_bill_bill_detail_list_id_seq OWNER TO emanuelziga;

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


ALTER TABLE public.bills_bill_id_seq OWNER TO emanuelziga;

--
-- Name: bills_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE bills_bill_id_seq OWNED BY bills_bill.id;


--
-- Name: bills_billdetail; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE bills_billdetail (
    id integer NOT NULL,
    bill_detail_price numeric(11,2) NOT NULL,
    bill_detail_amount numeric(7,2) NOT NULL,
    bill_detail_total numeric(11,2) NOT NULL,
    bill_detail_product_id integer NOT NULL,
    bill_detail_description character varying(255) NOT NULL,
    bill_detail_discount numeric(4,2) NOT NULL,
    bill_detail_iv numeric(4,2) NOT NULL,
    bill_detail_product_code character varying(255) NOT NULL,
    bill_detail_unit character varying(255) NOT NULL
);


ALTER TABLE public.bills_billdetail OWNER TO emanuelziga;

--
-- Name: bills_billdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE bills_billdetail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bills_billdetail_id_seq OWNER TO emanuelziga;

--
-- Name: bills_billdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE bills_billdetail_id_seq OWNED BY bills_billdetail.id;


--
-- Name: clients_client; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE clients_client (
    id integer NOT NULL,
    client_name character varying(255) NOT NULL,
    client_phone numeric(11,0),
    client_address character varying(255),
    client_email character varying(254),
    client_id numeric(20,0)
);


ALTER TABLE public.clients_client OWNER TO emanuelziga;

--
-- Name: clients_client_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE clients_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_client_id_seq OWNER TO emanuelziga;

--
-- Name: clients_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE clients_client_id_seq OWNED BY clients_client.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
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


ALTER TABLE public.django_admin_log OWNER TO emanuelziga;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO emanuelziga;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO emanuelziga;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO emanuelziga;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO emanuelziga;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO emanuelziga;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO emanuelziga;

--
-- Name: orders_order; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE orders_order (
    id integer NOT NULL,
    order_date date NOT NULL,
    order_total numeric(11,2) NOT NULL,
    order_activity_id integer NOT NULL,
    order_project_id integer NOT NULL,
    order_supplier_id integer NOT NULL,
    order_iv numeric(11,2) NOT NULL,
    order_subtotal numeric(11,2) NOT NULL
);


ALTER TABLE public.orders_order OWNER TO emanuelziga;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO emanuelziga;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE orders_order_id_seq OWNED BY orders_order.id;


--
-- Name: orders_order_order_product_list; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE orders_order_order_product_list (
    id integer NOT NULL,
    order_id integer NOT NULL,
    orderdetail_id integer NOT NULL
);


ALTER TABLE public.orders_order_order_product_list OWNER TO emanuelziga;

--
-- Name: orders_order_order_product_list_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE orders_order_order_product_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_order_product_list_id_seq OWNER TO emanuelziga;

--
-- Name: orders_order_order_product_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE orders_order_order_product_list_id_seq OWNED BY orders_order_order_product_list.id;


--
-- Name: orders_orderdetail; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE orders_orderdetail (
    id integer NOT NULL,
    order_detail_description character varying(255) NOT NULL,
    order_detail_amount numeric(7,2) NOT NULL,
    order_detail_unit character varying(255) NOT NULL,
    order_detail_price numeric(11,2) NOT NULL,
    order_detail_total numeric(11,2) NOT NULL,
    order_detail_product_id integer NOT NULL,
    order_detail_product_code character varying(255) NOT NULL,
    order_detail_discount numeric(4,2) NOT NULL,
    order_detail_iv numeric(4,2) NOT NULL
);


ALTER TABLE public.orders_orderdetail OWNER TO emanuelziga;

--
-- Name: orders_orderdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE orders_orderdetail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_orderdetail_id_seq OWNER TO emanuelziga;

--
-- Name: orders_orderdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE orders_orderdetail_id_seq OWNED BY orders_orderdetail.id;


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE products_product (
    id integer NOT NULL,
    product_code character varying(7) NOT NULL,
    product_consecutive numeric(3,0) NOT NULL,
    product_description character varying(255) NOT NULL,
    product_price numeric(10,2) NOT NULL,
    product_unit character varying(255) NOT NULL,
    product_usetaxes boolean NOT NULL,
    product_taxes numeric(5,2) NOT NULL,
    product_department_id integer,
    product_subdepartment_id integer,
    product_discount numeric(5,2) NOT NULL
);


ALTER TABLE public.products_product OWNER TO emanuelziga;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO emanuelziga;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE products_product_id_seq OWNED BY products_product.id;


--
-- Name: products_productdepartment; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE products_productdepartment (
    id integer NOT NULL,
    productdepartment_name character varying(255) NOT NULL,
    productdepartment_code character varying(2) NOT NULL
);


ALTER TABLE public.products_productdepartment OWNER TO emanuelziga;

--
-- Name: products_productdepartment_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE products_productdepartment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_productdepartment_id_seq OWNER TO emanuelziga;

--
-- Name: products_productdepartment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE products_productdepartment_id_seq OWNED BY products_productdepartment.id;


--
-- Name: products_productsubdepartment; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE products_productsubdepartment (
    id integer NOT NULL,
    productsubdepartment_name character varying(255) NOT NULL,
    productsubdepartment_code character varying(2) NOT NULL,
    productsubdepartment_department_id integer NOT NULL
);


ALTER TABLE public.products_productsubdepartment OWNER TO emanuelziga;

--
-- Name: products_productsubdepartment_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE products_productsubdepartment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_productsubdepartment_id_seq OWNER TO emanuelziga;

--
-- Name: products_productsubdepartment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE products_productsubdepartment_id_seq OWNED BY products_productsubdepartment.id;


--
-- Name: projects_project; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE projects_project (
    id integer NOT NULL,
    project_name character varying(255) NOT NULL,
    project_description character varying(255) NOT NULL,
    project_active boolean NOT NULL,
    project_client_id integer NOT NULL
);


ALTER TABLE public.projects_project OWNER TO emanuelziga;

--
-- Name: projects_project_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE projects_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_project_id_seq OWNER TO emanuelziga;

--
-- Name: projects_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE projects_project_id_seq OWNED BY projects_project.id;


--
-- Name: projects_project_project_activity; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE projects_project_project_activity (
    id integer NOT NULL,
    project_id integer NOT NULL,
    activity_id integer NOT NULL
);


ALTER TABLE public.projects_project_project_activity OWNER TO emanuelziga;

--
-- Name: projects_project_project_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE projects_project_project_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_project_project_activity_id_seq OWNER TO emanuelziga;

--
-- Name: projects_project_project_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emanuelziga
--

ALTER SEQUENCE projects_project_project_activity_id_seq OWNED BY projects_project_project_activity.id;


--
-- Name: suppliers_supplier; Type: TABLE; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE TABLE suppliers_supplier (
    id integer NOT NULL,
    supplier_name character varying(255) NOT NULL,
    supplier_phone numeric(15,0) NOT NULL,
    supplier_address character varying(255) NOT NULL,
    supplier_email character varying(254),
    supplier_email2 character varying(254),
    supplier_email3 character varying(254),
    supplier_phone2 numeric(15,0) NOT NULL,
    supplier_phone3 numeric(15,0) NOT NULL
);


ALTER TABLE public.suppliers_supplier OWNER TO emanuelziga;

--
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: emanuelziga
--

CREATE SEQUENCE suppliers_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suppliers_supplier_id_seq OWNER TO emanuelziga;

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

ALTER TABLE ONLY products_product ALTER COLUMN id SET DEFAULT nextval('products_product_id_seq'::regclass);


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
1	Meter Colum	
2	Almacenamiento de material	
3	Trabajos preliminares y traza	
4	Fundación Tipo PC	
5	Fundacion Tipo PA	
6	Relleno de grava	
8	Columnas de concreto 1er piso	
9	Paredes de bloques	
10	Vigas de hormigon Tipo VE1 1er piso	
11	Vigas de hormigon Tipo VE2 1er piso	
12	Losa de concreto 2do piso	
7	Losa de concreto cimentación	
13	Columnas de concreto 2do piso	
14	Vigas de hormigón 2do piso	
15	Pared de bloques superior	
16	Vigas de hormigón techo	
17	Estructura techo	
18	Metal lock roof	
19	Tubería de agua potable	
20	Tanques de agua y presión de la bomba	
21	Tubería agua caliente	
22	Tubería agua septica	
23	Tubería aguas jabonosas	
24	Tanque séptico y drenaje	
25	Acabado de paredes 1er piso	
26	Acabado de paredes 2do piso	
27	Cielorasos	
28	Aleros y techos exteriores	
29	Baldosa de porcelana	
30	Baldosa de baño	
31	Instalación electrica	
32	Sanitarios	
33	Fregaderos	
34	Cajas de registro concreto	
35	Accesorios (fuacets, panion, etc)	
36	Llavines	
37	Pintura	
38	Fregadero cocina	
39	Escaleras	
40	Piscina	
41	Cuarto de bombeo	
42	Aceras	
45	Mano de obra Almacenamiento, Lavandería y Cerveza	
46	Mano de obra Cocina	
47	Mano de obra Despensa	
48	Mano de obra Cuarto TV	
49	Mano de obra Medio baño	
50	Mano de obra Escaleras	
51	Mano de obra Terraza	
52	Mano de obra Garage	
53	Mano de obra Aceras	
54	Mano de obra Piscina	
56	Mano de obra Habitaciones	
55	Mano de obra Habitacion Huespedes	
57	Mano de obra Terraza	
58	Mano de obra Puente	
59	Trabajo Entrada Principal (driveway)	
60	Movimiento de Tierra	
61	Puertas Interiores	
62	Puerta Principal	
43	Portón	
63	Armarios Madera	
64	Gabinetes fregaderos	
65	Gabinete T.V.	
66	Aire acondicionado	
67	Mano de obra Instalación electrica	
68	Ventanas	
69	Bajantes	
70	Gabinete cocina y mostrador casa pincipal	
71	Gabinete cocina y mostrador casa huespedes	
72	Valla de acero inoxidable	
73	Cuarto de limpieza	
44	Imprevistos	
74	Pilas piscina	
75	Columnas piscina	
76	Grava piscina	
77	Losa concreto  piscina	
78	Vigas piscina	
79	Vigas piscina	
80	Paredes piscina	
81	Gradas piscina	
82	Gradas paredes piscina	
83	Impermeable piscina	
84	Azulejo piscina	
86	Tubería piscina	
85	Bomba y equipo piscina	
87	Eléctrico piscina	
88	Canaletas	
89	Viga corona	
90	Pavimento	
\.


--
-- Name: activities_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('activities_activity_id_seq', 90, true);


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
2	pbkdf2_sha256$24000$QvYuGhbEa2Iz$r90Nqn3X1G396EDctNi2M8IZNQ0F9+ixg+lEc1I3Kp8=	2016-08-16 18:46:59.407488+00	t	anaproveduria	Ana Yancy	Arias Segura	yancycotocompany@gmail.com	t	t	2016-08-16 14:40:00+00
1	pbkdf2_sha256$24000$yLnYYcxrdJzg$eKjrGzBwIrhCIze+utou/ZDz5ns4TO1R2KzBAlOPRCI=	2016-08-19 00:59:46.708819+00	t	emanuelziga			emanuelziga@gmail.com	t	t	2016-08-16 02:31:42.76921+00
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

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


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

COPY bills_bill (id, bill_date, bill_total, bill_order_id, bill_supplier_id, bill_iv, bill_subtotal, bill_supplier_bill) FROM stdin;
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

COPY bills_billdetail (id, bill_detail_price, bill_detail_amount, bill_detail_total, bill_detail_product_id, bill_detail_description, bill_detail_discount, bill_detail_iv, bill_detail_product_code, bill_detail_unit) FROM stdin;
\.


--
-- Name: bills_billdetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('bills_billdetail_id_seq', 1, false);


--
-- Data for Name: clients_client; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY clients_client (id, client_name, client_phone, client_address, client_email, client_id) FROM stdin;
5	Cliente 1	\N			0
\.


--
-- Name: clients_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('clients_client_id_seq', 5, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-08-16 02:33:58.758889+00	1	Materiales	1	Added.	14	1
2	2016-08-16 02:34:11.853925+00	2	Mano de Obra	1	Added.	14	1
3	2016-08-16 02:34:21.145657+00	3	Contratos Generales Fijos	1	Added.	14	1
4	2016-08-16 02:34:32.686971+00	4	Planos y Diseño  Subfamilias	1	Added.	14	1
5	2016-08-16 02:35:30.336295+00	1	Agregados	1	Added.	15	1
6	2016-08-16 02:35:47.989846+00	2	Cemento	1	Added.	15	1
7	2016-08-16 02:36:00.076469+00	3	Productos de Concreto	1	Added.	15	1
8	2016-08-16 02:36:11.80836+00	4	Acero	1	Added.	15	1
9	2016-08-16 02:36:21.982663+00	5	Madera	1	Added.	15	1
10	2016-08-16 02:36:29.934541+00	6	Cielos	1	Added.	15	1
11	2016-08-16 02:36:42.016751+00	7	Tubería Sanitaria	1	Added.	15	1
12	2016-08-16 02:36:50.795003+00	8	Tubería Potable	1	Added.	15	1
13	2016-08-16 02:37:00.030989+00	9	Tubería Pluvial	1	Added.	15	1
14	2016-08-16 02:37:08.089347+00	10	Equipo Mecánico	1	Added.	15	1
15	2016-08-16 02:37:14.564284+00	11	Eléctrico	1	Added.	15	1
16	2016-08-16 02:37:22.035879+00	12	Equipo de Aguas Residuales	1	Added.	15	1
17	2016-08-16 02:37:29.576459+00	13	Detalles y acabados	1	Added.	15	1
18	2016-08-16 02:37:37.514566+00	14	Pintura	1	Added.	15	1
19	2016-08-16 02:37:46.360532+00	15	Material Plástico	1	Added.	15	1
20	2016-08-16 14:40:00.234573+00	2	anaproveduria	1	Added.	4	1
21	2016-08-16 14:40:14.212031+00	2	anaproveduria	2	Modifica is_staff y is_superuser.	4	1
22	2016-08-16 14:40:47.445189+00	2	anaproveduria	2	Modifica first_name,last_name y email.	4	1
23	2016-08-17 03:42:55.73476+00	1004	Cuartilla	3		13	1
24	2016-08-17 14:49:55.490372+00	2	Cemento	2	No ha modificado ningún campo.	15	2
25	2016-08-17 14:50:38.871692+00	2001	Saco cemento 50k	2	Modifica product_price.	13	2
26	2016-08-17 14:51:18.613877+00	2001	Saco cemento 50k	2	No ha modificado ningún campo.	13	2
27	2016-08-17 15:03:39.262921+00	2001	Saco cemento 50k	2	Modifica product_price.	13	2
28	2016-08-17 15:03:55.553637+00	2001	Saco cemento 50k	2	Modifica product_discount.	13	2
29	2016-08-17 15:04:12.152684+00	2001	Saco cemento 50k	2	No ha modificado ningún campo.	13	2
30	2016-08-17 15:32:49.471038+00	3002	Block 20x20x40	2	Modifica product_price.	13	2
31	2016-08-17 15:39:33.249565+00	5004	Reglas de 1x3x4v	2	Modifica product_price y product_discount.	13	2
32	2016-08-17 15:40:14.698029+00	5007	Tabla de Formaleta 1x12x4v	2	Modifica product_discount.	13	2
33	2016-08-17 18:09:52.494127+00	4014	Hilco soldadura 6013 de 1/8 (gruesa)	2	Modifica product_description,product_price y product_discount.	13	2
34	2016-08-17 18:10:04.055739+00	4013	Hilco soldadura 6013 de 1/8	2	Modifica product_discount.	13	2
35	2016-08-17 19:58:07.183246+00	4004	Bar clavo de acero 3.5x50 (2")	2	Modifica product_price.	13	2
36	2016-08-17 19:58:25.608819+00	4004	Bar clavo de acero 3.5x50 (2")	2	Modifica product_discount.	13	2
37	2016-08-17 20:59:07.566501+00	1	IGUANA VERDE	1	Added.	17	2
38	2016-08-17 21:00:46.671801+00	2	EL COLONO LA JUNGLA S.A.	1	Added.	17	2
39	2016-08-18 00:48:21.064402+00	16	Metal(Techos)	1	Added.	15	1
40	2016-08-18 15:28:22.309441+00	1	Meter Colum	1	Added.	7	2
41	2016-08-18 15:28:57.487317+00	2	Almacenamiento de material	1	Added.	7	2
42	2016-08-18 15:28:59.859033+00	2	Almacenamiento de material	2	No ha modificado ningún campo.	7	2
43	2016-08-18 15:29:49.093143+00	3	Trabajos preliminares y traza	1	Added.	7	2
44	2016-08-18 15:30:36.339446+00	4	Fundación Tipo PC	1	Added.	7	2
45	2016-08-18 15:30:47.429537+00	5	Fundacion Tipo PA	1	Added.	7	2
46	2016-08-18 15:31:14.410243+00	6	Relleno de grava	1	Added.	7	2
47	2016-08-18 15:32:31.6137+00	7	Losa de cimentación de hormigón	1	Added.	7	2
48	2016-08-18 15:33:03.970324+00	8	Columnas de concreto 1er piso	1	Added.	7	2
49	2016-08-18 15:33:34.904726+00	9	Paredes de bloques	1	Added.	7	2
50	2016-08-18 15:34:25.013256+00	10	Vigas de hormigon Tipo VE1 1er piso	1	Added.	7	2
51	2016-08-18 15:34:40.787039+00	11	Vigas de hormigon Tipo VE2 1er piso	1	Added.	7	2
52	2016-08-18 15:36:23.487483+00	12	Losa de concreto 2do piso	1	Added.	7	2
53	2016-08-18 15:37:24.845925+00	7	Losa de concreto cimentación	2	Modifica activity_name.	7	2
54	2016-08-18 15:37:50.702918+00	13	Columnas de concreto 2do piso	1	Added.	7	2
55	2016-08-18 15:49:52.89846+00	14	Vigas de hormigón 2do piso	1	Added.	7	2
56	2016-08-18 15:50:40.239248+00	15	Pared de bloques superior	1	Added.	7	2
57	2016-08-18 15:50:43.144185+00	15	Pared de bloques superior	2	No ha modificado ningún campo.	7	2
58	2016-08-18 15:51:24.509792+00	16	Vigas de hormigón techo	1	Added.	7	2
59	2016-08-18 15:51:41.502039+00	17	Estructura techo	1	Added.	7	2
60	2016-08-18 15:53:38.247636+00	18	Metal lock roof	1	Added.	7	2
61	2016-08-18 15:54:59.312293+00	19	Tubería de agua potable	1	Added.	7	2
62	2016-08-18 15:56:20.563965+00	20	Tanques de agua y presión de la bomba	1	Added.	7	2
63	2016-08-18 15:56:55.997764+00	21	Tubería agua caliente	1	Added.	7	2
64	2016-08-18 15:57:14.389608+00	22	Tubería agua septica	1	Added.	7	2
65	2016-08-18 15:58:39.819084+00	23	Tubería aguas jabonosas	1	Added.	7	2
66	2016-08-18 15:58:59.772552+00	24	Tanque séptico y drenaje	1	Added.	7	2
67	2016-08-18 16:00:46.939075+00	25	Acabado de paredes 1er piso	1	Added.	7	2
68	2016-08-18 16:01:04.113969+00	26	Acabado de paredes 2do piso	1	Added.	7	2
69	2016-08-18 16:03:12.737756+00	27	Cielorasos	1	Added.	7	2
70	2016-08-18 16:05:13.019174+00	28	Aleros y techos exteriores	1	Added.	7	2
71	2016-08-18 16:08:09.974666+00	29	Baldosa de porcelana	1	Added.	7	2
72	2016-08-18 16:08:20.101361+00	30	Baldosa de baño	1	Added.	7	2
73	2016-08-18 16:08:39.048464+00	31	Instalación electrica	1	Added.	7	2
74	2016-08-18 16:08:52.412442+00	32	Sanitarios	1	Added.	7	2
75	2016-08-18 16:09:21.531869+00	33	Fregaderos	1	Added.	7	2
76	2016-08-18 16:12:18.099318+00	34	Cajas de registro concreto	1	Added.	7	2
77	2016-08-18 16:13:36.642824+00	35	Accesorios (fuacets, panion, etc)	1	Added.	7	2
78	2016-08-18 16:14:51.836288+00	36	Llavines	1	Added.	7	2
79	2016-08-18 16:15:07.670667+00	37	Pintura	1	Added.	7	2
80	2016-08-18 16:15:27.639978+00	38	Fregadero cocina	1	Added.	7	2
81	2016-08-18 16:15:42.866114+00	39	Escaleras	1	Added.	7	2
82	2016-08-18 16:18:10.745855+00	40	Piscina	1	Added.	7	2
83	2016-08-18 16:18:30.423242+00	41	Cuarto de bombeo	1	Added.	7	2
84	2016-08-18 16:19:04.157857+00	42	Aceras	1	Added.	7	2
85	2016-08-18 16:19:55.405066+00	43	Puerta principal	1	Added.	7	2
86	2016-08-18 16:22:13.362018+00	44	Unforseens	1	Added.	7	2
87	2016-08-18 16:27:44.871374+00	45	Mano de obra Almacenamiento, Lavandería y Cerveza	1	Added.	7	2
88	2016-08-18 16:28:06.074056+00	46	Mano de obra Cocina	1	Added.	7	2
89	2016-08-18 16:28:34.160353+00	47	Mano de obra Despensa	1	Added.	7	2
90	2016-08-18 16:29:02.044907+00	48	Mano de obra Cuarto TV	1	Added.	7	2
91	2016-08-18 16:29:23.256124+00	49	Mano de obra Medio baño	1	Added.	7	2
92	2016-08-18 16:29:55.487778+00	50	Mano de obra Escaleras	1	Added.	7	2
93	2016-08-18 16:30:19.025291+00	51	Mano de obra Terraza	1	Added.	7	2
94	2016-08-18 16:30:29.299916+00	52	Mano de obra Garage	1	Added.	7	2
95	2016-08-18 16:30:44.022503+00	53	Mano de obra Aceras	1	Added.	7	2
96	2016-08-18 16:30:57.60283+00	54	Mano de obra Piscina	1	Added.	7	2
97	2016-08-18 16:32:54.20091+00	55	Mano de obra Cuarto Huespedes	1	Added.	7	2
98	2016-08-18 16:33:11.206908+00	56	Mano de obra Habitaciones	1	Added.	7	2
99	2016-08-18 16:33:39.625386+00	55	Mano de obra Habitacion Huespedes	2	Modifica activity_name.	7	2
100	2016-08-18 16:35:52.628273+00	57	Mano de obra Terraza	1	Added.	7	2
101	2016-08-18 16:36:07.69383+00	58	Mano de obra Puente	1	Added.	7	2
102	2016-08-18 16:37:52.355789+00	59	Trabajo Entrada Principal (driveway)	1	Added.	7	2
103	2016-08-18 16:38:03.143574+00	60	Movimiento de Tierra	1	Added.	7	2
104	2016-08-18 16:38:20.279649+00	61	Puertas Interiores	1	Added.	7	2
105	2016-08-18 16:38:44.824794+00	62	Puerta Principal	1	Added.	7	2
106	2016-08-18 16:39:29.603405+00	43	Portón	2	Modifica activity_name.	7	2
107	2016-08-18 16:39:50.820046+00	63	Armarios Madera	1	Added.	7	2
108	2016-08-18 16:40:19.172128+00	64	Gabinetes fregaderos	1	Added.	7	2
109	2016-08-18 16:46:42.473253+00	65	Gabinete T.V.	1	Added.	7	2
110	2016-08-18 16:46:58.771885+00	66	Aire acondicionado	1	Added.	7	2
111	2016-08-18 16:47:32.827533+00	67	Mano de obra Instalación electrica	1	Added.	7	2
112	2016-08-18 16:47:40.413616+00	68	Ventanas	1	Added.	7	2
113	2016-08-18 16:48:57.101448+00	69	Bajantes	1	Added.	7	2
114	2016-08-18 16:49:52.123942+00	70	Gabinete cocina y mostrador casa pincipal	1	Added.	7	2
115	2016-08-18 16:50:08.899868+00	71	Gabinete cocina y mostrador casa huespedes	1	Added.	7	2
116	2016-08-18 16:51:06.725487+00	72	Valla de acero inoxidable	1	Added.	7	2
117	2016-08-18 16:51:38.69829+00	73	Cuarto de limpieza	1	Added.	7	2
118	2016-08-18 16:53:37.449612+00	74	Imprevistos	1	Added.	7	2
119	2016-08-18 16:54:08.472966+00	44	Imprevistos	2	Modifica activity_name.	7	2
120	2016-08-18 16:56:02.656449+00	74	Pilas piscina	2	Modifica activity_name.	7	2
121	2016-08-18 16:56:30.402428+00	75	Columnas piscina	1	Added.	7	2
122	2016-08-18 16:56:50.629318+00	76	Grava piscina	1	Added.	7	2
123	2016-08-18 16:57:27.610147+00	77	Losa concreto  piscina	1	Added.	7	2
124	2016-08-18 16:57:51.799705+00	78	Vigas piscina	1	Added.	7	2
125	2016-08-18 16:57:51.928655+00	79	Vigas piscina	1	Added.	7	2
126	2016-08-18 16:58:04.26064+00	80	Paredes piscina	1	Added.	7	2
127	2016-08-18 16:58:24.537721+00	81	Gradas piscina	1	Added.	7	2
128	2016-08-18 16:59:09.69753+00	82	Gradas paredes piscina	1	Added.	7	2
129	2016-08-18 16:59:42.684032+00	83	Impermeable piscina	1	Added.	7	2
130	2016-08-18 17:00:12.027228+00	84	Azulejo piscina	1	Added.	7	2
131	2016-08-18 17:00:28.000822+00	85	Bomba piscina	1	Added.	7	2
132	2016-08-18 17:01:00.399208+00	86	Tubería piscina	1	Added.	7	2
133	2016-08-18 17:01:48.320121+00	85	Bomba y equipo piscina	2	Modifica activity_name.	7	2
134	2016-08-18 17:02:13.269671+00	87	Eléctrico piscina	1	Added.	7	2
135	2016-08-18 17:04:03.844818+00	88	Canaletas	1	Added.	7	2
136	2016-08-18 17:06:28.958533+00	89	Viga corona	1	Added.	7	2
137	2016-08-18 17:08:52.612253+00	90	Pavimento	1	Added.	7	2
138	2016-08-19 01:05:00.165683+00	5	Cliente 1	1	Added.	10	1
139	2016-08-19 01:05:49.516502+00	1	Primer Proyecto	1	Added.	16	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 139, true);


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
1	activities	0001_initial	2016-08-16 02:31:03.078977+00
2	contenttypes	0001_initial	2016-08-16 02:31:03.094723+00
3	auth	0001_initial	2016-08-16 02:31:03.204622+00
4	admin	0001_initial	2016-08-16 02:31:03.234657+00
5	admin	0002_logentry_remove_auto_add	2016-08-16 02:31:03.248388+00
6	contenttypes	0002_remove_content_type_name	2016-08-16 02:31:03.280232+00
7	auth	0002_alter_permission_name_max_length	2016-08-16 02:31:03.293915+00
8	auth	0003_alter_user_email_max_length	2016-08-16 02:31:03.306245+00
9	auth	0004_alter_user_username_opts	2016-08-16 02:31:03.318946+00
10	auth	0005_alter_user_last_login_null	2016-08-16 02:31:03.330596+00
11	auth	0006_require_contenttypes_0002	2016-08-16 02:31:03.332815+00
12	auth	0007_alter_validators_add_error_messages	2016-08-16 02:31:03.343518+00
13	suppliers	0001_initial	2016-08-16 02:31:03.356005+00
14	projects	0001_initial	2016-08-16 02:31:03.386935+00
15	projects	0002_auto_20160807_2001	2016-08-16 02:31:03.423456+00
16	products	0001_initial	2016-08-16 02:31:03.495833+00
17	orders	0001_initial	2016-08-16 02:31:03.588359+00
18	bills	0001_initial	2016-08-16 02:31:03.648511+00
19	bills	0002_auto_20160811_2135	2016-08-16 02:31:03.69291+00
20	bills	0003_auto_20160814_0905	2016-08-16 02:31:03.872429+00
21	bills	0004_auto_20160815_1136	2016-08-16 02:31:03.942439+00
22	bills	0005_auto_20160815_1141	2016-08-16 02:31:03.959657+00
23	clients	0001_initial	2016-08-16 02:31:03.972959+00
24	clients	0002_auto_20160807_2001	2016-08-16 02:31:03.995163+00
25	clients	0003_auto_20160807_2010	2016-08-16 02:31:04.021968+00
26	clients	0004_auto_20160807_2011	2016-08-16 02:31:04.035007+00
27	orders	0002_auto_20160811_2240	2016-08-16 02:31:04.091331+00
28	orders	0003_auto_20160813_2009	2016-08-16 02:31:04.175942+00
29	orders	0004_order_order_subtotal	2016-08-16 02:31:04.207948+00
30	projects	0003_project_project_active	2016-08-16 02:31:04.232514+00
31	sessions	0001_initial	2016-08-16 02:31:04.251551+00
32	products	0002_product_product_discount	2016-08-17 02:32:30.830673+00
33	activities	0002_auto_20160817_1828	2016-08-18 00:46:09.333224+00
34	bills	0006_bill_bill_supplier_bill	2016-08-18 00:46:09.676786+00
35	products	0003_auto_20160817_1818	2016-08-18 00:46:09.822248+00
36	projects	0004_auto_20160817_1828	2016-08-18 00:46:09.853331+00
37	projects	0005_project_project_client	2016-08-18 00:46:09.886668+00
38	suppliers	0002_auto_20160817_1818	2016-08-18 00:46:10.028663+00
39	suppliers	0003_auto_20160818_1843	2016-08-19 00:55:16.964394+00
40	clients	0005_auto_20160818_1903	2016-08-19 01:04:41.448997+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('django_migrations_id_seq', 40, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
qso9g7khvsrb7zfffsp8gto861sxwri8	YjNlYTljOWVjZDM2MmM0N2MwNDYzNGYzY2Y3NzZmMDYzMmNhMzcxNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjZmMDMxYjU1Mzk4NzllMGM3ZWRjMzczZTg1NjAyYjdmMzkzMzkwMTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-30 02:32:28.775846+00
gnvixtm7eusw4jb3e09ehpb8q6yyt51h	NDY1NjEwYjFlNDVkM2NjNDJjNzRmMmUyOWMwNzU0MTIyMDE4ZmEyZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImM3NjA4YjM2OGI4ODZjMWJjZjlmOTNhY2RkOTU0ZWQwYzZkYWI5NDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-08-30 14:41:02.992137+00
45r7dmrd8yrsw0q6qwoa8kcyn9wiv3as	NDY1NjEwYjFlNDVkM2NjNDJjNzRmMmUyOWMwNzU0MTIyMDE4ZmEyZTp7Il9hdXRoX3VzZXJfaGFzaCI6ImM3NjA4YjM2OGI4ODZjMWJjZjlmOTNhY2RkOTU0ZWQwYzZkYWI5NDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-08-30 18:46:59.409956+00
dcmw5hydz9ckyacdfmur8tjff6faqwnz	YjNlYTljOWVjZDM2MmM0N2MwNDYzNGYzY2Y3NzZmMDYzMmNhMzcxNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjZmMDMxYjU1Mzk4NzllMGM3ZWRjMzczZTg1NjAyYjdmMzkzMzkwMTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-31 03:42:40.799576+00
5lvnzysgjx83hvxmlshtnhckh9q9spue	YjNlYTljOWVjZDM2MmM0N2MwNDYzNGYzY2Y3NzZmMDYzMmNhMzcxNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjZmMDMxYjU1Mzk4NzllMGM3ZWRjMzczZTg1NjAyYjdmMzkzMzkwMTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-09-02 00:59:46.714797+00
\.


--
-- Data for Name: orders_order; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY orders_order (id, order_date, order_total, order_activity_id, order_project_id, order_supplier_id, order_iv, order_subtotal) FROM stdin;
1	2016-08-18	17500.00	1	1	1	2013.27	15486.73
\.


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('orders_order_id_seq', 1, true);


--
-- Data for Name: orders_order_order_product_list; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY orders_order_order_product_list (id, order_id, orderdetail_id) FROM stdin;
1	1	1
\.


--
-- Name: orders_order_order_product_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('orders_order_order_product_list_id_seq', 1, true);


--
-- Data for Name: orders_orderdetail; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY orders_orderdetail (id, order_detail_description, order_detail_amount, order_detail_unit, order_detail_price, order_detail_total, order_detail_product_id, order_detail_product_code, order_detail_discount, order_detail_iv) FROM stdin;
1	Arena fina	1.00	Metro3	15486.73	15486.73	1001	1001	0.00	13.00
\.


--
-- Name: orders_orderdetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('orders_orderdetail_id_seq', 1, true);


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY products_product (id, product_code, product_consecutive, product_description, product_price, product_unit, product_usetaxes, product_taxes, product_department_id, product_subdepartment_id, product_discount) FROM stdin;
1001	1001	1	Arena fina	15486.73	Metro3	t	13.00	1	1	0.00
1002	1002	2	Cedazo zaranda 8x8x1/2"	1734.51	Metro	t	13.00	1	1	0.00
1003	1003	3	Cuartilla	13805.31	metro3	t	13.00	1	1	0.00
2002	2002	2	Intaco Mortero repello grueso	4004.42	unidad	t	13.00	1	2	0.00
3003	3003	3	Cuneta de 14"	5308.85	unidad	t	13.00	1	3	0.00
3004	3004	4	Pc bloque entrepiso estereofon 15	2646.00	unidad	t	13.00	1	3	0.00
3005	3005	4	Block 15x20x40	515.70	Unidad	t	13.00	1	3	0.00
3006	3006	5	Pc viguetas entrapiso 1511	7159.29	unidad	t	13.00	1	3	0.00
3007	3007	6	Tubo de concreto de 12"	6761.06	unidad	t	13.00	1	3	0.00
4001	4001	1	Alambre negro #16 x kilo	557.52	Kilo	t	13.00	1	4	10.00
4002	4002	2	Angular 50x50x3.00	8672.57	Unidad	t	13.00	1	4	0.00
4003	4003	3	Angular 50x50x3.00 (2"x2"x1/8)	7415.93	Unidad	t	13.00	1	4	7.00
4005	4005	5	Cable aluminio #2	558.00	Kilo	t	13.00	1	4	0.00
4006	4006	6	Clavo acero 2"	30.97	Unidad	t	13.00	1	4	0.00
4007	4007	7	Clavos corrientes de 2.1/2"	716.81	Kilo	t	13.00	1	4	0.00
4008	4008	8	Gaza para varilla especial	1234.51	unidad	t	13.00	1	4	0.00
4009	4009	9	Gaza sin fin acero 25mm 1"	508.85	unidad	t	13.00	1	4	0.00
4010	4010	10	Gaza sin fin acero 31mm 1 1/4"	508.85	unidad	t	13.00	1	4	0.00
4011	4011	11	Grinding disco p/metal 230mm 9x3/32	2482.30	unidad	t	13.00	1	4	0.00
4012	4012	12	Hierro Techo c-28 0.30x0.81x3.66	4999.00	unidad	t	13.00	1	4	0.00
4015	4015	15	Lamina de hierro negro 3,17x1,22x2,44x1/8	33194.69	unidad	t	13.00	1	4	0.00
4016	4016	16	Maya electr. 2.20x6m(4.88)mm(25.92)	16676.99	unidad	t	13.00	1	4	0.00
4017	4017	17	Maya electr. 2.35x5m(4.11)mm(19.75)	10615.04	unidad	t	13.00	1	4	0.00
4018	4018	18	Mejia clavo de acero 50mm2.7x2''	12.39	unidad	t	13.00	1	4	0.00
4019	4019	19	Metabo disco 230x1.9x22.2 recto	2946.90	unidad	t	13.00	1	4	0.00
4020	4020	20	Perfiles Garva 50x70x1.20x5	6181.42	unidad	t	13.00	1	4	0.00
4021	4021	21	Tornillo Techo 1/4x2	46.90	unidad	t	13.00	1	4	0.00
4022	4022	22	Tornillo Techo broca 1/4x2	36.28	unidad	t	13.00	1	4	0.00
4023	4023	23	Varilla #4 lisa 1/2	3480.00	unidad	t	13.00	1	4	0.00
4024	4024	24	Varilla corrug grado 40 3x6 #3 3/8''	1285.00	unidad	t	0.00	1	4	0.00
4025	4025	25	Varilla corrug grado 40 4x6 #4 1/2''	2575.00	unidad	t	13.00	1	4	0.00
4026	4026	26	Varilla corrug grado 40 4x6 #4 1/2''	2575.00	unidad	t	13.00	1	4	0.00
4027	4027	27	Varilla corrug grado 40 4x6 #4 1/2''	2620.00	unidad	t	13.00	1	4	0.00
4028	4028	28	Varilla corrug grado 40 4x6 #4 1/2''	2515.00	unidad	t	13.00	1	4	0.00
4029	4029	29	Varilla lisa c/cobre1.80 5/8''	9296.45	unidad	t	13.00	1	4	0.00
4030	4030	30	Hierro Techo metal lock blanco #240,53x512mm	3060.00	unidad	t	0.00	1	4	0.00
4031	4031	31	MC tubo estructural galvanizado cuad 72x72x1,50	9051.96	unidad	t	13.00	1	4	0.00
4032	4032	32	Angular HN 25x25x3,00mm (1"x1"x1/8")	3336.28	unidad	t	13.00	1	4	0.00
4033	4033	33	Platina HN 12x3mmx6 metros (1/2"x1/8")	2123.89	unidad	t	13.00	1	4	0.00
4034	4034	34	Tubo ind cuadrado galv #18 25x25x1,20 (1x1)	3393.81	unidad	t	13.00	1	4	0.00
4035	4035	35	Tornillo carroceria CT 3/8x4	199.12	unidad	t	13.00	1	4	5.00
4036	4036	36	Arandela plana 3/8	11.50	unidad	t	13.00	1	4	5.00
4037	4037	37	Platina HN 50x4,76mmx6 metros (2"x3/16")	6000.00	unidad	t	13.00	1	4	5.00
4038	4038	38	EMT union de 10 mm 1/2"	199.12	unidad	t	13.00	1	4	10.00
4039	4039	39	EMT tubo estruc galv cuad 72x72x1,50 (3"x3"x1,50)	12079.65	unidad	t	13.00	1	4	7.00
4040	4040	40	MC tubo estructural galvanizado cuad 100x100x1,50 (4"x4"x1,50)	16659.29	Unidad	t	13.00	1	4	7.00
5001	5001	1	Alfajilla 2x3x4v	3045.45	Unidad	t	13.00	1	5	0.00
5002	5002	2	Cuerda albanil azul	0.00	rollo	t	13.00	1	5	0.00
5003	5003	3	Cuerda albanil nacional blanca	0.00	rollo	t	13.00	1	5	0.00
5005	5005	5	Reglas de 1x3x4v	1795.45	unidad	t	13.00	1	5	0.00
5006	5006	6	Tabla de Formaleta 1x12x3v	1754.55	unidad	t	13.00	1	5	0.00
8001	8001	1	Adaptador hembra poliducto 1/2"	500.00	Unidad	t	13.00	1	8	0.00
8002	8002	2	Adaptador hembra poliducto 3/4"	600.00	Unidad	t	13.00	1	8	0.00
8003	8003	3	Adaptador macho 12mm poliducto eco 1/2"	300.00	Unidad	t	13.00	1	8	0.00
8004	8004	4	Cinta teflon 3/4x10m	1203.00	Unidad	t	13.00	1	8	0.00
8005	8005	5	Cpvc adaptador macho 12mm 1/2"	455.75	Unidad	t	13.00	1	8	0.00
8006	8006	6	Cpvc tapon hembra cts12mm 1/2"	433.63	Unidad	t	13.00	1	8	0.00
8007	8007	7	Cpvc codo 90 cts 12mm 1/2"	278.75	Unidad	t	13.00	1	8	0.00
8008	8008	8	Cpvc tapon hembra cts 12mm 1/2"	433.63	Unidad	t	13.00	1	8	0.00
8009	8009	9	Cpvc tapon hembra cts 12mm 1/2" liso	110.62	Unidad	t	13.00	1	8	0.00
8010	8010	10	Cpvc Te 12mm 1/2"	0.00	Unidad	t	13.00	1	8	0.00
8011	8011	11	Cpvc tubo 12mm 1/2"x6m	6880.53	unidad	t	13.00	1	8	0.00
8012	8012	12	Cpvc union 12mm 1/2''	243.36	unidad	t	13.00	1	8	0.00
8013	8013	13	Emt conector de 50mm 2'' de presion	1933.63	unidad	t	13.00	1	8	0.00
8014	8014	14	Emt curva de 12mm 1/2''	1043.91	unidad	t	13.00	1	8	0.00
8015	8015	15	Emt tuvo de 12mm1/2''x3mts	1752.21	unidad	t	13.00	1	8	0.00
8016	8016	16	Emt tuvo de 50mm2''x3mts	13626.32	unidad	t	13.00	1	8	0.00
8017	8017	17	Emt union de 12mm 1/2''de presion	446.90	unidad	t	13.00	1	8	0.00
2001	2001	1	Saco cemento 50k	5775.50	unidad	t	13.00	1	2	5.00
3002	3002	2	Block 20x20x40	376.11	Unidad	t	13.00	1	3	0.00
5004	5004	4	Reglas de 1x3x4v	1754.55	unidad	t	13.00	1	5	7.00
5007	5007	7	Tabla de Formaleta 1x12x4v	4022.73	unidad	t	13.00	1	5	10.00
4013	4013	13	Hilco soldadura 6013 de 1/8	4079.65	unidad	t	13.00	1	4	5.00
4004	4004	4	Bar clavo de acero 3.5x50 (2")	24.78	Kilo	t	13.00	1	4	10.00
8018	8018	18	Espander pisher nylon	22.12	unidad	t	13.00	1	8	0.00
8019	8019	19	Hg niple 1/2x3	278.76	unidad	t	13.00	1	8	0.00
8020	8020	20	Lanco cemento pvc 1/4G	9256.64	unidad	t	13.00	1	8	0.00
8021	8021	21	Lanco cemento pvc PINTA	5150.44	unidad	t	13.00	1	8	0.00
8022	8022	22	Llave bola pvc 12mm 1/2'' #154-1	398.23	unidad	t	13.00	1	8	0.00
8023	8023	23	Manguera Poliducto	14170.00	Metro  	t	13.00	1	8	0.00
8024	8024	24	PP llave chorro 1/2" #v79-110d	4371.68	unidad	t	13.00	1	8	0.00
8025	8025	25	Pvc adaptador hembra 40 12mm 1/2''	172.57	unidad	t	13.00	1	8	0.00
8026	8026	26	Pvc adaptador macho 18mm 1/2"	0.00	unidad	t	13.00	1	8	0.00
8027	8027	27	Pvc adaptador macho 18mm 3/4"	163.72	unidad	t	13.00	1	8	0.00
8028	8028	28	Pvc adaptador macho 40 12mm 1/2''	84.07	unidad	t	13.00	1	8	0.00
8029	8029	29	Pvc codo 90 12mm 1/2"	172.57	unidad	t	13.00	1	8	0.00
8030	8030	30	Pvc codo 90 18mm 3/4"	203.54	unidad	t	13.00	1	8	0.00
8031	8031	31	Pvc codo 90 56mm 1 1/2"	500.00	unidad	t	13.00	1	8	0.00
8032	8032	32	Pvc codo 90 DWV 100mm 4"	4389.38	unidad	t	13.00	1	8	0.00
8033	8033	33	Pvc codo 90 DWV 100mm 4"	3415.93	unidad	t	13.00	1	8	0.00
8034	8034	34	Pvc codo 90 DWV 38mm 1 1/2"	500.00	unidad	t	13.00	1	8	0.00
8035	8035	35	Pvc codo 90 DWV 50mm 2"	615.04	unidad	t	13.00	1	8	0.00
8036	8036	36	Pvc DWV tapon hembra 100mm 4''	429.20	unidad	t	13.00	1	8	0.00
8037	8037	37	Pvc pegam solv 950ml 1/4	9349.66	unidad	t	13.00	1	8	0.00
8038	8038	38	Pvc reduccion 18x12mm 3/4"x1/2''	123.89	unidad	t	13.00	1	8	0.00
8039	8039	39	Pvc reduccion dwv 100x50mm 4x2	3190.27	unidad	t	13.00	1	8	0.00
8040	8040	40	Pvc reduccion dwv 50x38mm 2x 1 1/2	920.35	unidad	t	13.00	1	8	0.00
8041	8041	41	Pvc tapon hembra 12mm1/2'' liso	132.74	unidad	t	13.00	1	8	0.00
8042	8042	42	Pvc tapon hembra 12mm1/2'' ROSCA	110.52	unidad	t	13.00	1	8	0.00
8043	8043	43	Pvc tapon hembra 18mm3/4''	154.87	unidad	t	13.00	1	8	0.00
8044	8044	44	Pvc te 12mm 1/2"	119.47	unidad	t	13.00	1	8	0.00
8045	8045	45	Pvc te 12mm 1/2"	119.47	unidad	t	13.00	1	8	0.00
8046	8046	46	Pvc te DWV 100mm 4"	5668.14	unidad	t	13.00	1	8	0.00
8047	8047	47	Pvc te DWV 38mm 1 1/2"	645.02	unidad	t	13.00	1	8	0.00
8048	8048	48	Pvc te DWV 50mm 2"	1013.27	unidad	t	13.00	1	8	0.00
8049	8049	49	Pvc tubo 100mm 4"x6m	11115.04	unidad	t	13.00	1	8	0.00
8050	8050	50	Pvc tubo 100mm 4"x6m	11349.56	unidad	t	13.00	1	8	0.00
8051	8051	51	Pvc tubo 38mm 1 1/2''x6m	5150.44	unidad	t	13.00	1	8	0.00
8052	8052	52	Pvc tubo 50mm 2"x6	5172.57	unidad	t	13.00	1	8	0.00
8053	8053	53	Pvc tubo 50mm 2"x6	10168.14	unidad	t	13.00	1	8	0.00
8054	8054	54	Pvc tubo 52mm 2 1/2"x5	15172.57	unidad	t	13.00	1	8	0.00
8055	8055	55	Pvc tubo 62mm 2 1/2''x6m	15172.57	unidad	t	13.00	1	8	0.00
8056	8056	56	Pvc tubo presion 12mm 1/2"x6mts	2889.38	unidad	t	13.00	1	8	0.00
8057	8057	57	Pvc tubo presion 12mm 1/2"x6mts	3500.00	unidad	t	13.00	1	8	0.00
8058	8058	58	Pvc tubo presion 18mm3/4''x6m	6035.40	unidad	t	13.00	1	8	0.00
8059	8059	59	Rotoplas tanq para agua 2500	159920.35	unidad	t	13.00	1	8	0.00
8060	8060	60	Pvc union lisA 12mm 1/2'' 	80.53	unidad	t	13.00	1	8	10.00
8061	8061	61	Union polietileno 12mm 1/2"	215.00	unidad	t	13.00	1	8	0.00
8062	8062	62	Duretan sellador de poliuretano blanco	4331.86	unidad	t	13.00	1	8	0.00
8063	8063	63	Tubo presion SCH40 18mm3/4"x6m BL CAM/CEM	6035.00	unidad	t	13.00	1	8	0.00
8064	8064	64	Tubo abasto connectores metalico 1/2x1/2x55cm largo	2176.99	unidad	t	13.00	1	8	0.00
8065	8065	65	Lanco cemento pvc Wet Dry 4 onz	2132.74	unidad	t	13.00	1	8	0.00
8066	8066	66	Desague lavamanos push con rebalse BL-1065	11252.21	Unidad	t	13.00	1	8	5.00
8067	8067	67	Pvc Te SCH40 18MM 3/4" BL CAM/CEM	221.24	Unidad	t	13.00	1	8	10.00
8068	8068	68	Pvc codo SCH40 18MM 3/4" BL CAM/CEM	203.54	Unidad	t	13.00	1	8	10.00
8069	8069	69	Gaza sin fin acero inox 8508 25MM 1"	508.85	Unidad	t	13.00	1	8	5.00
8070	8070	70	Inasa desague lavamanos push metal	7623.89	Unidad	t	13.00	1	8	10.00
8071	8071	71	SF008-3 adaptador hule p/sifon 1 1/2" BL CAM/CEM	584.07	Unidad	t	13.00	1	8	5.00
8072	8072	72	PVC codo 45 SCH40 38MM 1 1/2" BL CAM/CEM	1070.80	Unidad	t	13.00	1	8	10.00
8073	8073	73	Pvc union lisa SCH40 100 mm 4"BL CAM/CEM	4176.99	Unidad	t	13.00	1	8	10.00
8074	8074	74	PVC codo 90 DWV S32,5 38MM 11/2" GR CAM/CEM	500.00	Unidad	t	13.00	1	8	10.00
8075	8075	75	PVC adaptador hembra SCH40 12MM 1/2" BL CAM/CEM	172.57	Unidad	t	13.00	1	8	10.00
8076	8076	76	EMT caja cuadrada 4x4x21/8 (1/2", 3/4")	1203.54	Unidad	t	13.00	1	8	10.00
8077	8077	77	Tapa cuadrada 4x4 C/KO1/2 TP 478UL	256.64	Unidad	t	13.00	1	8	5.00
8078	8078	78	Brass Craft llave control 1/2x1/2 escuadra 03301C	3942.48	Unidad	t	13.00	1	8	5.00
8079	8079	79	Pvc codo 90 SCH40 12MM 1/2" BL CAM/CEM	119.47	Unidad	t	13.00	1	8	0.00
8080	8080	80	Pvc codo 45 SCH40 12MM 1/2" BL CAM/CEM	185.84	Unidad	t	13.00	1	8	10.00
8081	8081	81	Pvc adaptador macho SCH40 12MM 1/2" BL CAM/CEM	84.07	Unidad	t	13.00	1	8	10.00
8082	8082	82	HG union sencilla 12MM 1/2"	305.31	Unidad	t	13.00	1	8	10.00
8083	8083	83	Pvc codo 90 SCH40 50MM 2"BL CAM/CEM	1402.65	Unidad	t	13.00	1	8	10.00
8084	8084	84	3M cinta adhesiva doble cara 3/4 x metro	1619.47	Unidad	t	13.00	1	8	5.00
8085	8085	85	Eagle cinta adhesiva 25MM X 10 mts #66159 doble cara	4654.87	Unidad	t	13.00	1	8	5.00
8086	8086	86	Eagle cinta adhesiva 15MM X 10 mts #66158 doble cara	2924.78	Unidad	t	13.00	1	8	5.00
8087	8087	87	Amanco PVC tubo SDR17 50MM 2"X6m BL CAM/CEM	18486.73	Unidad	t	13.00	1	8	10.00
8088	8088	88	Pvc tubo presion SCH40 12MM 1/2"X6m BL CAM/CEM	24500.00	Unidad	t	13.00	1	8	10.00
11001	11001	1	Cable aluminio #4	1488.50	Metro	t	13.00	1	11	0.00
11002	11002	2	Cable neutral 3x4	805.00	Metro	t	13.00	1	11	0.00
11003	11003	3	Cable thhn #6 metro verde	1075.22	Metro	t	13.00	1	11	0.00
11004	11004	4	Ch breaker 1p/20a ch 120	6473.45	Unidad	t	13.00	1	11	0.00
11005	11005	5	Ch breaker 2p/40a ch 240	18615.04	Unidad	t	13.00	1	11	0.00
11006	11006	6	Ch tablero designation tp-a em1627-15	861977.88	Unidad	t	13.00	1	11	0.00
11007	11007	7	Emt conector de 12mm 1/2 pesado	230.09	unidad	t	13.00	1	11	0.00
11008	11008	8	Emt cunduleta botagua 50mm 2''	4017.70	unidad	t	13.00	1	11	0.00
11009	11009	9	Pvc curva conduit tipo a 12mm 1/2''	2800.89	unidad	t	13.00	1	11	0.00
11010	11010	10	Pvc curva conduit tipo a 12mm 1/2''	393.81	unidad	t	13.00	1	11	0.00
11011	11011	11	Pvc curva conduit tipo a 18mm 3/4''	477.88	unidad	t	13.00	1	11	0.00
11012	11012	12	Pvc curva conduit tipo a 25mm 1''	584.07	unidad	t	13.00	1	11	0.00
11013	11013	13	Pvc curva conduit tipo a 50mm 2''x5m	0.00	unidad	t	13.00	1	11	0.00
11014	11014	14	Pvc conector macho conduit tipo A 25mm 1"UL GR	438.05	unidad	t	13.00	1	11	0.00
11015	11015	15	Pvc tubo conduit tipo a 12mm 1/2''x3m	1486.73	unidad	t	13.00	1	11	0.00
11016	11016	16	Pvc tubo conduit tipo a 18mm 3/4''x3m	1482.30	unidad	t	13.00	1	11	0.00
11017	11017	17	Pvc tubo conduit tipo a 25mm 1''x3m	3168.14	unidad	t	13.00	1	11	0.00
11018	11018	18	Pvc union conduit tipo a 12mm 1/2''	92.92	unidad	t	13.00	1	11	10.00
11019	11019	19	Pvc union conduit tipo a 18mm 3/4''	128.32	unidad	t	13.00	1	11	0.00
11020	11020	20	Pvc union conduit tipo a 25mm 1''	203.54	unidad	t	13.00	1	11	0.00
11021	11021	21	Tania Centro Carga 6f	23400.00	unidad	t	13.00	1	11	0.00
11022	11022	22	Tubo ind rectangular 25x50x1.20	4004.42	unidad	t	13.00	1	11	0.00
11023	11023	23	Cable THHN #12 metro azul conducen caja	181.42	Metro	t	13.00	1	11	0.00
11024	11024	24	Cable THHN #12 metro rojo conducen caja	181.42	Metro	t	13.00	1	11	5.00
11025	11025	25	Cable THHN #12 metro verde conducen caja	181.42	Metro	t	13.00	1	11	5.00
11026	11026	26	Cable THHN #12 metro blanco conducen caja	181.42	Metro	t	13.00	1	11	5.00
11027	11027	27	Tl bombi LED 6W 3000 K A19-LED/6W/3	3580.50	unidad	t	13.00	1	11	0.00
11028	11028	28	Socket fijo de porcelana NTP 4150 E27	455.75	unidad	t	13.00	1	11	0.00
11029	11029	29	Fermetal socket de porcelana SOC-13	139.82	unidad	t	13.00	1	11	0.00
11030	11030	30	Trupper broca paleta 3/4"	796.46	unidad	t	13.00	1	11	0.00
11031	11031	31	Cable TGP 3 lineas #12	1022.12	metro	t	13.00	1	11	0.00
11032	11032	32	Eagle enchufe polar p/ext 15A 125V NTP 2867	973.45	unidad	t	13.00	1	11	7.00
11033	11033	33	Gaza EMT sencilla de 12MM 1/2"	34.51	unidad	t	13.00	1	4	10.00
11034	11034	34	TL bombi LED 3000D A19-LED/10W	4386.50	unidad	t	13.00	1	4	5.00
11035	11035	35	BV bombi espiral 20W T2 luz blanca E33017	4185.00	unidad	f	0.00	1	4	5.00
11036	11036	36	DW2223 cubo magnetico hexa 3/8 x 2-9/16	1464.60	unidad	t	13.00	1	4	5.00
11037	11037	37	EMT (UL) tubo de 12MM 1/2"x 3mts UL	1765.49	unidad	t	13.00	1	4	10.00
11038	11038	38	PVC tubo conduit tipo A 12MM 1/2"X 3M UL GR CAM/CEM	995.58	unidad	t	13.00	1	4	10.00
11039	11039	39	3M tape electrico super 33 negro 3/4x 20MTS	2915.93	unidad	t	13.00	1	4	10.00
11040	11040	40	Square D breaker enchufar 1P/20A QO120	7446.90	unidad	t	13.00	1	4	10.00
11041	11041	41	Square D breaker enchufar 2P/20A QO220	15517.70	unidad	t	13.00	1	4	10.00
11042	11042	42	Eagle base para fotocelda con soporte 6889	2902.65	unidad	t	13.00	1	4	5.00
11043	11043	43	Eagle fotocelda LUMNIA 110/220V 1000W NTP 6890	6606.19	unidad	t	13.00	1	4	5.00
11044	11044	44	SD centro carga empotrable 3H 70A QOL 2F	18800.88	unidad	t	13.00	1	4	10.00
11045	11045	45	Spander fisher nylon original S-7 EMP 100	13.27	unidad	t	13.00	1	4	5.00
11046	11046	46	Tornillo metal CAB-CIL SPH 8X1 1/2	16.92	unidad	t	13.00	1	4	5.00
11047	11047	47	EMT (UL) conector de 12MM 1/2 pesado UL	230.09	unidad	t	13.00	1	4	5.00
11048	11048	48	Tubo abastro conectores metalicos 1/2x1/2x55cm largo	2176.99	unidad	t	13.00	1	4	5.00
11049	11049	49	Manguera de LED 50mts 7761LED-3000K	159898.23	unidad	t	13.00	1	4	5.00
11050	11050	50	Accesorio conector para 7761 CONECT7761	6938.05	unidad	t	13.00	1	4	5.00
11051	11051	51	Eagle toma polarizado p/ext NTP222	1017.70	unidad	t	13.00	1	4	5.00
11052	11052	52	AC-77873 control abanico-timer WESTING HOUSE	15734.51	unidad	t	13.00	1	4	5.00
11053	11053	53	Timer digital TE102	22141.59	unidad	t	13.00	1	4	0.00
11054	11054	54	DW1224Z broca cobalto 3/8 HSS SPLIT	5690.27	unidad	t	13.00	1	4	5.00
11055	11055	55	DW broca SDS PLUS 1/2"X12"	6336.28	unidad	t	13.00	1	4	5.00
11056	11056	56	UTP cable red negro CAT 5E P/EXTERIOR C/GELxmt	809.73	unidad	t	13.00	1	4	10.00
11057	11057	57	Cordon cable TSJ 2x14xmetro	513.27	unidad	t	13.00	1	4	5.00
11058	11058	58	Cable aluminio XHHW-2 #4 AWG	384.96	unidad	t	13.00	1	4	10.00
11059	11059	59	EMT tapa rectangular c/hueco metal	128.32	unidad	t	13.00	1	4	5.00
11060	11060	60	Tornillo metal CAB-CIL SPH 10X1 1/2	23.76	unidad	t	13.00	1	4	5.00
11061	11061	61	Espander fisher nylon originals S-8	45.13	unidad	t	13.00	1	4	10.00
11062	11062	62	Conector comprension #7 4/0-3/0 A 4/0-3/0	2327.43	unidad	t	13.00	1	4	5.00
11063	11063	63	Conector comprension #2 1/0-3 2/0-2 A 2-5 1-6	685.84	unidad	t	13.00	1	4	5.00
11064	11064	64	Grapa con clavo acero de 8MM x unidad	11.50	unidad	t	13.00	1	4	5.00
11065	11065	65	Pvc curva conduit tipo A 12MM 1/2 UL GR CAM/CEM	447.57	unidad	t	13.00	1	4	10.00
11066	11066	66	EMT conector CMTSJ25 de 1"	398.23	Unidad	t	13.00	1	4	5.00
13001	13001	1	Lanco masilla gris para concreto 1/4	4730.09	galon	t	13.00	1	13	5.00
13002	13002	2	TG pasta gypsum galon (masilla)	3876.11	galon	t	13.00	1	13	10.00
14001	14001	1	Aguarras fino	1575.22	Galon	t	13.00	1	14	0.00
14002	14002	2	Anticor 5000 rustop rojo	6814.16	Galon	t	13.00	1	14	0.00
14003	14003	3	Cintar para pintar azul 2"	5548.67	Unidad	t	13.00	1	14	0.00
14004	14004	4	Fadeli lija pligo agua #80	460.35	Unidad	t	13.00	1	14	0.00
14005	14005	5	Pintura spray negro mate	2367.26	Unidad	t	13.00	1	14	5.00
14006	14006	6	Thinner corriente litro	1876.11	Unidad	t	13.00	1	14	5.00
14007	14007	7	Corrostop 9000-700-14 negro cuarto	6402.65	Unidad	t	13.00	1	14	10.00
15001	15001	1	Cinta de precaucion	6880.53	Metro	t	13.00	1	15	0.00
15002	15002	2	Plastic negro x KILO 2m	1730.00	kilo	t	13.00	1	15	0.00
15003	15003	3	Plastic negro x KILO 3m dob ancho (1mx1,10kg aprox) const	3240.00	kilo	t	13.00	1	15	0.00
15004	15004	4	saran negro-verde 60% 4M ancho	1625.00	Metro	t	13.00	1	15	0.00
15005	15005	5	Saran negro-verde 80% 4M ancho	2065.00	Metro	t	13.00	1	15	0.00
15006	15006	6	Cadena plastica negra 10MM 3/8 X metro	1070.80	Metro	t	13.00	1	15	5.00
15007	15007	7	Lamina Prisma ACS de 3/4 #13MR (1,22X1,44)	20115.04	Unidad	t	13.00	1	15	5.00
15008	15008	8	Polyacril 	0.00	Unidad	t	13.00	1	15	0.00
4014	4014	14	Hilco soldadura 6013 de 1/8 (gruesa)	4849.65	unidad	t	13.00	1	4	5.00
1004	1004	4	Iguana piedra drenaje metro	15000.00	metro3	t	13.00	1	1	0.00
1005	1005	5	Iguana piedra base entreg camion 4x4 m3	16778.76	metro3	t	13.00	1	1	0.00
1006	1006	6	Agregado lastre de tajo la iguana mt	16000.00	mtr	t	13.00	1	1	0.00
2003	2003	3	Cemento gris x kilo	176.99	unidad	t	13.00	1	2	0.00
3008	3008	8	Block 12x20x40	330.00	Unidad	t	13.00	1	3	0.00
4041	4041	41	MC tubo estructural galvanizado cuad 50x50x1,50 (2"x2"x1,50)	9051.95	Unidad	t	13.00	1	4	8.00
4042	4042	42	Tornillo hexagonal 1/4x1 1/2 GR2	39.82	Unidad	t	13.00	1	4	5.00
4043	4043	43	Tornillo hexagonal 1/4x2 GR2	61.95	Unidad	t	13.00	1	4	5.00
4044	4044	44	Tornillo Gypsum fina 25 mm #6 x1	4.72	Unidad	t	13.00	1	4	10.00
4045	4045	45	Tornillo Gypsum fina 38mm #6 x 1 1/2"	6.19	Unidad	t	13.00	1	4	10.00
4046	4046	46	Tornillo Gypsum fina 50mm #6 x 2" 50mm	7.95	Unidad	t	13.00	1	4	10.00
4047	4047	47	Tornillo Gypsum fina 65 mm #8 x 2 1/2"	15.04	Unidad	t	13.00	1	4	10.00
4048	4048	48	Tornillo Gypsum fina 75 mm #8 x 3	20.35	Unidad	t	13.00	1	4	5.00
4049	4049	49	Tornillo Torfix cabeza plana #8 x 3 1/2"	24.78	Unidad	t	13.00	1	4	5.00
4050	4050	50	Tornillo Torfix cabeza plana #12 x 4	30.97	Unidad	t	13.00	1	4	5.00
4051	4051	51	Tornillo Techo punta corriente 1/4 x 3	57.52	Unidad	t	13.00	1	4	5.00
4052	4052	52	Tornillo tirafondo 1/4 x 6	145.74	Unidad	t	13.00	1	4	0.00
4053	4053	53	Tornillo concreto PHILLIPS 1/4 x 2 1/4	163.72	Unidad	t	13.00	1	4	5.00
4054	4054	54	Tubo Red Galv s/rosca CED 20x12mm (1/2")	4318.58	Unidad	t	13.00	1	4	7.00
4055	4055	55	Esquinero metal 3,05m (10ft)	734.51	Unidad	t	13.00	1	4	10.00
4056	4056	56	Angular HN 38x38x3,17mm (11/2"x11/2"x1/8")	6137.17	Unidad	t	13.00	1	4	7.00
4057	4057	57	MC perfil galva 50x70x1,50x 6mts (2"x3"x1,50)	6380.53	Unidad	t	13.00	1	4	7.00
6001	6001	1	Fibrolit LAM 6mm 1219x2438mm	8238.94	unidad	t	13.00	1	6	7.00
6002	6002	2	TG Furring Channnel 0,36x3,66mm (12ft)	756.64	unidad	t	13.00	1	6	5.00
6003	6003	3	TG Lamina gypsum HY Flex 4x8x1/4 flexible	10000.00	unidad	t	13.00	1	6	5.00
6004	6004	4	TG Track p/gypsum en 0,70 de 4"x 3,05m 10ft calib 20	2349.56	unidad	t	13.00	1	6	10.00
6005	6005	5	TG Stud p/gypsum en 0,70 de 4" x 3,05m 10ft calib 20	2734.51	unidad	t	13.00	1	6	10.00
6006	6006	6	Lamina de estereofon 75mm 1,22 x 2,44 x 3"	8336.28	unidad	t	13.00	1	6	7.00
8089	8089	89	Lanco cemento pvc Wet Dry 1/4 gl	9331.86	Unidad	t	13.00	1	8	15.00
8090	8090	90	Lanco Silicon Flex blanco	2752.21	Unidad	t	13.00	1	8	5.00
8091	8091	91	Lanco Silicon Flex transparente	2752.21	Unidad	t	13.00	1	8	5.00
8092	8092	92	Xilo acido muriatico galon	3017.70	Unidad	t	13.00	1	8	10.00
11067	11067	67	DW47451 Disco Diamantado 4 1/2" Continuo ceramina Porcelanato	5734.51	Unidad	t	13.00	1	11	5.00
11068	11068	68	P24326-35 Empotrable LED 8W 3000K Downlight	32969.03	Unidad	t	13.00	1	11	18.00
11069	11069	69	PVC curva conduit tipo A 16mm 3/4" UL GR CAM/CEM	476.05	Unidad	t	13.00	1	11	15.00
11070	11070	70	Metabo disco metal 230x1,9x22,2 Recto A36	2946.90	Unidad	t	13.00	1	11	10.00
11071	11071	71	DW8310 disco flap 4 1/2" grano 120	3026.55	Unidad	t	13.00	1	11	5.00
11072	11072	72	Broca SDS Plus 3/8" x 6" DW5427	3646.02	Unidad	t	13.00	1	11	5.00
12001	12001	1	Ecotank Fosa Septica Biologica de 2500 lts	225663.72	unidad	t	13.00	1	12	10.00
12002	12002	2	Ecotank Filtro Biologico Anaerobio 1950 lts	215044.25	unidad	t	13.00	1	12	10.00
12003	12003	3	Ecotank Caja de registro sanitario	12831.86	unidad	t	13.00	1	12	10.00
12004	12004	4	Ecotank Saco de piedra Volcanica	3115.04	unidad	t	13.00	1	12	10.00
12005	12005	5	Ecotank Trampa de grasa 38 lts Residual	36283.19	unidad	t	13.00	1	12	10.00
13003	13003	3	TG pasta p/gypsum cubeta tapa negra 	9075.22	cubeta	t	13.00	1	13	10.00
13004	13004	4	TG pasta p/gypsum cubeta tapa verde	11482.30	cubeta	t	13.00	1	13	10.00
13005	13005	5	Laticrete bondex 254 platino gris	16261.05	unidad	t	13.00	1	13	5.00
13006	13006	6	Mortero Sur repello grueso	5194.69	unidad	t	13.00	1	13	5.00
13007	13007	7	Laticrete Spectra Lock Polvo 122MID black	11880.53	unidad	t	13.00	1	13	5.00
13008	13008	8	Laticrete Spectra Lock Polvo 122MID platinum	11880.53	unidad	t	13.00	1	13	5.00
13009	13009	9	Laticrete Sepectra Lock Liquido CR cubeta	90442.48	cubeta	t	13.00	1	13	5.00
13010	13010	10	Laticrete Porcelana Wall Grout 1603 SILIK 11,3kg	7995.58	unidad	t	13.00	1	13	10.00
13011	13011	11	Laticrete Porcelana Wall Grout 1688 S SHADOW 11,3kg	7995.58	unidad	t	13.00	1	13	10.00
13012	13012	12	Laticrete Porcelana Wall Grout 1634 SANDSTONE 11,3kg	7995.58	unidad	t	13.00	1	13	10.00
13013	13013	13	Laticrete Porcelana Wall Grout 1660 DUSTY GREY 11,3 kg	7300.69	unidad	t	13.00	1	13	10.00
13014	13014	14	Laticrete bondex 254 platino blanco	17020.00	unidad	t	13.00	1	13	0.00
13015	13015	15	Pedregal bondex porcelanato 20 kg	4424.76	unidad	t	13.00	1	13	10.00
13016	13016	16	TG Masilla rapida en saco 45 min 20 kls	6964.50	unidad	t	13.00	1	13	10.00
14008	14008	8	Felpa Antigota de 9" 321/10	2646.62	Unidad	t	13.00	1	14	5.00
14009	14009	9	Marco c/felpa semiprof 3" REC0013	1517.70	Unidad	t	13.00	1	14	5.00
14010	14010	10	Sur muro seco gris	4557.52	Unidad	t	13.00	1	14	7.00
14011	14011	11	Fandeli lija pliego agua #100	393.81	Unidad	t	13.00	1	14	10.00
14012	14012	12	Fandeli lija pliego agua #120	353.98	Unidad	t	13.00	1	14	0.00
14013	14013	13	Fandeli lija pliego agua #150	340.71	Unidad	t	13.00	1	14	10.00
14014	14014	14	Cinta p/pintor azul 1" x 54,8 mts (masking)	2991.50	Unidad	t	13.00	1	14	5.00
14015	14015	15	Felpa p/pintar 1/2" x 9" GAM YELLOW STRIPE	1553.10	Unidad	t	13.00	1	14	5.00
14016	14016	16	Marco p/felpa profesional 9" GAM	1853.98	Unidad	t	13.00	1	14	10.00
14017	14017	17	Scotch Brite morada indust	694.69	Unidad	t	13.00	1	14	5.00
14018	14018	18	Brocha 4" GAM Master Eco Macha	1960.75	Unidad	t	13.00	1	14	10.00
16001	16001	1	Lamina de hierro negro 3,17mm 1,22x2,44x1/8	28561.95	unidad	t	13.00	1	16	7.00
16002	16002	2	TG Lamina Mold Tough 1/2 12mmx2,44 Gypsum Verde Resis Moho	4986.73	unidad	t	13.00	1	16	7.00
16003	16003	3	TG Lamina securock Glass 1/2x4x8 p/exterior aprox 30 kls	11429.20	unidad	t	13.00	1	16	7.00
\.


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('products_product_id_seq', 1, false);


--
-- Data for Name: products_productdepartment; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY products_productdepartment (id, productdepartment_name, productdepartment_code) FROM stdin;
1	Materiales	00
2	Mano de Obra	01
3	Contratos Generales Fijos	02
4	Planos y Diseño  Subfamilias	03
\.


--
-- Name: products_productdepartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('products_productdepartment_id_seq', 4, true);


--
-- Data for Name: products_productsubdepartment; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY products_productsubdepartment (id, productsubdepartment_name, productsubdepartment_code, productsubdepartment_department_id) FROM stdin;
1	Agregados	1	1
3	Productos de Concreto	3	1
4	Acero	4	1
5	Madera	5	1
6	Cielos	6	1
7	Tubería Sanitaria	7	1
8	Tubería Potable	8	1
9	Tubería Pluvial	9	1
10	Equipo Mecánico	10	1
11	Eléctrico	11	1
12	Equipo de Aguas Residuales	12	1
13	Detalles y acabados	13	1
14	Pintura	14	1
15	Material Plástico	15	1
2	Cemento	2	1
16	Metal(Techos)	16	1
\.


--
-- Name: products_productsubdepartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('products_productsubdepartment_id_seq', 16, true);


--
-- Data for Name: projects_project; Type: TABLE DATA; Schema: public; Owner: emanuelziga
--

COPY projects_project (id, project_name, project_description, project_active, project_client_id) FROM stdin;
1	Primer Proyecto	Primer Proyecto	t	5
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

COPY suppliers_supplier (id, supplier_name, supplier_phone, supplier_address, supplier_email, supplier_email2, supplier_email3, supplier_phone2, supplier_phone3) FROM stdin;
1	IGUANA VERDE	27438929	Uvita de Osa, 200 SW, del puente del Rio Uvita	rogelioiguanaverde@outlook.com	\N	\N	0	0
2	EL COLONO LA JUNGLA S.A.	27438053	Bahia Ballena, Osa, Puntarenas	jpadilla@colonos.com	\N	\N	0	0
\.


--
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emanuelziga
--

SELECT pg_catalog.setval('suppliers_supplier_id_seq', 2, true);


--
-- Name: activities_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY activities_activity
    ADD CONSTRAINT activities_activity_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: bills_bill_bill_detail_list_bill_id_b85e1ec3_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY bills_bill_bill_detail_list
    ADD CONSTRAINT bills_bill_bill_detail_list_bill_id_b85e1ec3_uniq UNIQUE (bill_id, billdetail_id);


--
-- Name: bills_bill_bill_detail_list_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY bills_bill_bill_detail_list
    ADD CONSTRAINT bills_bill_bill_detail_list_pkey PRIMARY KEY (id);


--
-- Name: bills_bill_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY bills_bill
    ADD CONSTRAINT bills_bill_pkey PRIMARY KEY (id);


--
-- Name: bills_billdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY bills_billdetail
    ADD CONSTRAINT bills_billdetail_pkey PRIMARY KEY (id);


--
-- Name: clients_client_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY clients_client
    ADD CONSTRAINT clients_client_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: orders_order_order_product_list_order_id_8f27027e_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY orders_order_order_product_list
    ADD CONSTRAINT orders_order_order_product_list_order_id_8f27027e_uniq UNIQUE (order_id, orderdetail_id);


--
-- Name: orders_order_order_product_list_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY orders_order_order_product_list
    ADD CONSTRAINT orders_order_order_product_list_pkey PRIMARY KEY (id);


--
-- Name: orders_order_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY orders_order
    ADD CONSTRAINT orders_order_pkey PRIMARY KEY (id);


--
-- Name: orders_orderdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY orders_orderdetail
    ADD CONSTRAINT orders_orderdetail_pkey PRIMARY KEY (id);


--
-- Name: products_product_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);


--
-- Name: products_product_product_code_key; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY products_product
    ADD CONSTRAINT products_product_product_code_key UNIQUE (product_code);


--
-- Name: products_productdepartment_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY products_productdepartment
    ADD CONSTRAINT products_productdepartment_pkey PRIMARY KEY (id);


--
-- Name: products_productdepartment_productdepartment_code_key; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY products_productdepartment
    ADD CONSTRAINT products_productdepartment_productdepartment_code_key UNIQUE (productdepartment_code);


--
-- Name: products_productdepartment_productdepartment_name_key; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY products_productdepartment
    ADD CONSTRAINT products_productdepartment_productdepartment_name_key UNIQUE (productdepartment_name);


--
-- Name: products_productsubdepartment_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY products_productsubdepartment
    ADD CONSTRAINT products_productsubdepartment_pkey PRIMARY KEY (id);


--
-- Name: products_productsubdepartment_productsubdepartment_name_key; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY products_productsubdepartment
    ADD CONSTRAINT products_productsubdepartment_productsubdepartment_name_key UNIQUE (productsubdepartment_name);


--
-- Name: projects_project_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY projects_project
    ADD CONSTRAINT projects_project_pkey PRIMARY KEY (id);


--
-- Name: projects_project_project_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY projects_project_project_activity
    ADD CONSTRAINT projects_project_project_activity_pkey PRIMARY KEY (id);


--
-- Name: projects_project_project_activity_project_id_03940dfc_uniq; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY projects_project_project_activity
    ADD CONSTRAINT projects_project_project_activity_project_id_03940dfc_uniq UNIQUE (project_id, activity_id);


--
-- Name: suppliers_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: emanuelziga; Tablespace: 
--

ALTER TABLE ONLY suppliers_supplier
    ADD CONSTRAINT suppliers_supplier_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: bills_bill_7161be0e; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX bills_bill_7161be0e ON bills_bill USING btree (bill_order_id);


--
-- Name: bills_bill_bill_detail_list_1f62f768; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX bills_bill_bill_detail_list_1f62f768 ON bills_bill_bill_detail_list USING btree (billdetail_id);


--
-- Name: bills_bill_bill_detail_list_88bce984; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX bills_bill_bill_detail_list_88bce984 ON bills_bill_bill_detail_list USING btree (bill_id);


--
-- Name: bills_bill_c0003347; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX bills_bill_c0003347 ON bills_bill USING btree (bill_supplier_id);


--
-- Name: bills_billdetail_3840b8d0; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX bills_billdetail_3840b8d0 ON bills_billdetail USING btree (bill_detail_product_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: orders_order_596486eb; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX orders_order_596486eb ON orders_order USING btree (order_project_id);


--
-- Name: orders_order_771c6836; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX orders_order_771c6836 ON orders_order USING btree (order_activity_id);


--
-- Name: orders_order_92cace63; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX orders_order_92cace63 ON orders_order USING btree (order_supplier_id);


--
-- Name: orders_order_order_product_list_2f06cccd; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX orders_order_order_product_list_2f06cccd ON orders_order_order_product_list USING btree (orderdetail_id);


--
-- Name: orders_order_order_product_list_69dfcb07; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX orders_order_order_product_list_69dfcb07 ON orders_order_order_product_list USING btree (order_id);


--
-- Name: orders_orderdetail_1bf11334; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX orders_orderdetail_1bf11334 ON orders_orderdetail USING btree (order_detail_product_id);


--
-- Name: products_product_738aa7d0; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX products_product_738aa7d0 ON products_product USING btree (product_department_id);


--
-- Name: products_product_d337f99e; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX products_product_d337f99e ON products_product USING btree (product_subdepartment_id);


--
-- Name: products_product_product_code_9b97c0ac_like; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX products_product_product_code_9b97c0ac_like ON products_product USING btree (product_code varchar_pattern_ops);


--
-- Name: products_productdepartment_productdepartment_code_76da2a66_like; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX products_productdepartment_productdepartment_code_76da2a66_like ON products_productdepartment USING btree (productdepartment_code varchar_pattern_ops);


--
-- Name: products_productdepartment_productdepartment_name_b683665e_like; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX products_productdepartment_productdepartment_name_b683665e_like ON products_productdepartment USING btree (productdepartment_name varchar_pattern_ops);


--
-- Name: products_productsubdepa_productsubdepartment_name_2b75d425_like; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX products_productsubdepa_productsubdepartment_name_2b75d425_like ON products_productsubdepartment USING btree (productsubdepartment_name varchar_pattern_ops);


--
-- Name: products_productsubdepartment_87cf710c; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX products_productsubdepartment_87cf710c ON products_productsubdepartment USING btree (productsubdepartment_department_id);


--
-- Name: projects_project_a0bba0d8; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX projects_project_a0bba0d8 ON projects_project USING btree (project_client_id);


--
-- Name: projects_project_project_activity_b098ad43; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
--

CREATE INDEX projects_project_project_activity_b098ad43 ON projects_project_project_activity USING btree (project_id);


--
-- Name: projects_project_project_activity_f8a3193a; Type: INDEX; Schema: public; Owner: emanuelziga; Tablespace: 
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
-- Name: bills_bi_bill_detail_product_id_138db420_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY bills_billdetail
    ADD CONSTRAINT bills_bi_bill_detail_product_id_138db420_fk_products_product_id FOREIGN KEY (bill_detail_product_id) REFERENCES products_product(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: orders__order_detail_product_id_11948778_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY orders_orderdetail
    ADD CONSTRAINT orders__order_detail_product_id_11948778_fk_products_product_id FOREIGN KEY (order_detail_product_id) REFERENCES products_product(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: projects_projec_project_client_id_2c7e104d_fk_clients_client_id; Type: FK CONSTRAINT; Schema: public; Owner: emanuelziga
--

ALTER TABLE ONLY projects_project
    ADD CONSTRAINT projects_projec_project_client_id_2c7e104d_fk_clients_client_id FOREIGN KEY (project_client_id) REFERENCES clients_client(id) DEFERRABLE INITIALLY DEFERRED;


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

