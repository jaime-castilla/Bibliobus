--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-03 17:05:45

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
-- TOC entry 216 (class 1259 OID 16406)
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    "ISBN" character(1) NOT NULL,
    titulo character varying(60) NOT NULL,
    autor character varying(60) NOT NULL,
    "numero de ejemplares" integer NOT NULL,
    id_tema integer NOT NULL
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16420)
-- Name: prestamo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestamo (
    id_reserva integer NOT NULL,
    fecha_prestamo date NOT NULL,
    "fecha_devolución" date NOT NULL,
    "ISBN" character(20) NOT NULL,
    id_socio integer NOT NULL
);


ALTER TABLE public.prestamo OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16418)
-- Name: prestamo_id_reserva_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prestamo_id_reserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prestamo_id_reserva_seq OWNER TO postgres;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 219
-- Name: prestamo_id_reserva_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prestamo_id_reserva_seq OWNED BY public.prestamo.id_reserva;


--
-- TOC entry 220 (class 1259 OID 16419)
-- Name: prestamo_id_socio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prestamo_id_socio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prestamo_id_socio_seq OWNER TO postgres;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 220
-- Name: prestamo_id_socio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prestamo_id_socio_seq OWNED BY public.prestamo.id_socio;


--
-- TOC entry 218 (class 1259 OID 16412)
-- Name: socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socios (
    id_socio integer NOT NULL,
    nombre character varying(60) NOT NULL,
    edad integer NOT NULL
);


ALTER TABLE public.socios OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16411)
-- Name: socios_id_socio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socios_id_socio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socios_id_socio_seq OWNER TO postgres;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 217
-- Name: socios_id_socio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socios_id_socio_seq OWNED BY public.socios.id_socio;


--
-- TOC entry 215 (class 1259 OID 16400)
-- Name: temas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temas (
    id_tema integer NOT NULL,
    nombre character varying(60) NOT NULL
);


ALTER TABLE public.temas OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: temas_id_tema_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temas_id_tema_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temas_id_tema_seq OWNER TO postgres;

--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 214
-- Name: temas_id_tema_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temas_id_tema_seq OWNED BY public.temas.id_tema;


--
-- TOC entry 3190 (class 2604 OID 16423)
-- Name: prestamo id_reserva; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamo ALTER COLUMN id_reserva SET DEFAULT nextval('public.prestamo_id_reserva_seq'::regclass);


--
-- TOC entry 3191 (class 2604 OID 16424)
-- Name: prestamo id_socio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamo ALTER COLUMN id_socio SET DEFAULT nextval('public.prestamo_id_socio_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 16415)
-- Name: socios id_socio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios ALTER COLUMN id_socio SET DEFAULT nextval('public.socios_id_socio_seq'::regclass);


--
-- TOC entry 3188 (class 2604 OID 16403)
-- Name: temas id_tema; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas ALTER COLUMN id_tema SET DEFAULT nextval('public.temas_id_tema_seq'::regclass);


--
-- TOC entry 3347 (class 0 OID 16406)
-- Dependencies: 216
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.libros ("ISBN", titulo, autor, "numero de ejemplares", id_tema) VALUES ('6', 'El Mar del Norte', 'James Mount', 1000, 1);
INSERT INTO public.libros ("ISBN", titulo, autor, "numero de ejemplares", id_tema) VALUES ('5', 'El patio', 'Mark Toms', 800, 2);


--
-- TOC entry 3352 (class 0 OID 16420)
-- Dependencies: 221
-- Data for Name: prestamo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prestamo (id_reserva, fecha_prestamo, "fecha_devolución", "ISBN", id_socio) VALUES (1, '2023-05-12', '2023-05-20', '5                   ', 1);
INSERT INTO public.prestamo (id_reserva, fecha_prestamo, "fecha_devolución", "ISBN", id_socio) VALUES (2, '2023-05-20', '2023-05-27', '6                   ', 2);


--
-- TOC entry 3349 (class 0 OID 16412)
-- Dependencies: 218
-- Data for Name: socios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.socios (id_socio, nombre, edad) VALUES (1, 'Jaime de Castilla', 30);
INSERT INTO public.socios (id_socio, nombre, edad) VALUES (2, 'Jesus Garcia', 33);


--
-- TOC entry 3346 (class 0 OID 16400)
-- Dependencies: 215
-- Data for Name: temas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.temas (id_tema, nombre) VALUES (1, 'novela');
INSERT INTO public.temas (id_tema, nombre) VALUES (2, 'comedia');


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 219
-- Name: prestamo_id_reserva_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prestamo_id_reserva_seq', 1, false);


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 220
-- Name: prestamo_id_socio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prestamo_id_socio_seq', 1, false);


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 217
-- Name: socios_id_socio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socios_id_socio_seq', 1, false);


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 214
-- Name: temas_id_tema_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temas_id_tema_seq', 1, false);


--
-- TOC entry 3195 (class 2606 OID 16410)
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY ("ISBN");


--
-- TOC entry 3199 (class 2606 OID 16426)
-- Name: prestamo prestamo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT prestamo_pkey PRIMARY KEY (id_reserva);


--
-- TOC entry 3197 (class 2606 OID 16417)
-- Name: socios socios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_pkey PRIMARY KEY (id_socio);


--
-- TOC entry 3193 (class 2606 OID 16405)
-- Name: temas temas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas
    ADD CONSTRAINT temas_pkey PRIMARY KEY (id_tema);


--
-- TOC entry 3200 (class 2606 OID 16427)
-- Name: libros fk_libros_temas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT fk_libros_temas FOREIGN KEY (id_tema) REFERENCES public.temas(id_tema) NOT VALID;


--
-- TOC entry 3201 (class 2606 OID 16432)
-- Name: prestamo fk_prestamo_libro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT fk_prestamo_libro FOREIGN KEY ("ISBN") REFERENCES public.libros("ISBN") NOT VALID;


--
-- TOC entry 3202 (class 2606 OID 16437)
-- Name: prestamo fk_prestamo_socios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT fk_prestamo_socios FOREIGN KEY (id_socio) REFERENCES public.socios(id_socio) NOT VALID;


-- Completed on 2023-05-03 17:05:46

--
-- PostgreSQL database dump complete
--

