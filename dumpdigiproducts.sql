--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: digipro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.digipro (
    id integer NOT NULL,
    model character varying(255),
    weight text,
    size text,
    pixel text,
    cpu real,
    internal_memory text,
    ram text,
    ict boolean,
    main_camera_resolution text,
    battery text,
    price text,
    created_at date,
    updated_at date
);


ALTER TABLE public.digipro OWNER TO postgres;

--
-- Data for Name: digipro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.digipro (id, model, weight, size, pixel, cpu, internal_memory, ram, ict, main_camera_resolution, battery, price, created_at, updated_at) FROM stdin;
13714776	Samsung Galaxy S24 Ultra Dual SIM 256GB And 12GB RAM Mobile Phone - Vietnam	233.0	8.6×79×162.3	1440×3120 پیکسل	3.39	256	12	t	200	5000	601990000	2024-12-14	2024-12-14
14851833	Samsung Galaxy A55 Dual SIM 256GB And 8GB RAM Mobile Phone - Vietnam	213.0	161.1x77.4x8.2	1080x2340 پیکسل پیکسل	2	256	8	t	50	5000	205290000	2024-12-14	2024-12-14
13969461	Samsung Galaxy A15 Dual SIM 128GB And 6GB RAM Mobile Phone - Vietnam	200.0	8.4×76.8×160.1	1080×2340 پیکسل	2	128	6	f	50	5000	94590000	2024-12-14	2024-12-14
12924184	Samsung Galaxy S23 FE Dual SIM 256GB And 8GB RAM Mobile Phone - Vietnam	209.0	8.2×76.5×158	1080×2340  پیکسل	1.8	256	8	t	50	4500	280590000	2024-12-14	2024-12-14
14851175	Samsung Galaxy A35 Dual SIM 128GB and 8GB RAM mobile phone - Vietnam	209.0	8.2×78×161.7	1080x2340 پیکسل	2	128	8	t	50	5000	152900000	2024-12-14	2024-12-14
11103764	Samsung Galaxy S23 Ultra Dual SIM 256GB And 12GB RAM Mobile Phone - Vietnam	234.0	8.9×78.1×163.4	1440×3088 پیکسل	2	256	12	t	200	5000	511990000	2024-12-14	2024-12-14
13981188	Samsung Galaxy A25 Dual SIM 256GB And 8GB RAM Mobile Phone - Vietnam	197.0	161×76.5×8.3	1080×2340  پیکسل	2	256	8	t	50	5000	131990000	2024-12-14	2024-12-14
13968309	Samsung Galaxy A15 Dual SIM 128GB And 4GB RAM Mobile Phone - Vietnam	200.0	8.4×76.8×160.1	1080×2340 پیکسل	2	128	4	f	50	5000	84860000	2024-12-14	2024-12-14
13586950	Samsung Galaxy A05 Dual SIM 64GB And 4GB RAM Mobile Phone	195.0	8.8×78.2×168.8	720×1600 پیکسل	1.8	64	4	f	50	5000	50820000	2024-12-14	2024-12-14
13969596	Samsung Galaxy A15 Dual SIM 256GB And 8GB RAM Mobile Phone - Vietnam	200.0	8.4×76.8×160.1	1080×2340 پیکسل	2	256	8	f	50	5000	109750000	2024-12-14	2024-12-14
14851182	Samsung Galaxy A35 Dual SIM 256GB and 8GB RAM mobile phone - Vietnam	209.0	8.2×78×161.7	1080x2340 پیکسل	2	256	8	t	50	5000	120000000	2024-12-14	2024-12-14
13804646	Samsung Galaxy A05s Dual SIM 128GB And 4GB RAM Mobile Phone	194.0	8.8×77.8×168	1080×2400  پیکسل	1.9	128	4	f	50	5000	65900000	2024-12-14	2024-12-14
13804607	Samsung Galaxy A05s Dual SIM 64GB And 4GB RAM Mobile Phone	194.0	8.8×77.8×168	1080×2400  پیکسل	1.9	64	4	f	50	5000	63990000	2024-12-14	2024-12-14
14851820	Samsung Galaxy A55 Dual SIM 128GB And 8GB RAM Mobile Phone - Vietnam	213.0	161.1x77.4x8.2	1080x2340 پیکسل پیکسل	2	128	8	t	50	5000	187000000	2024-12-14	2024-12-14
13980975	Samsung Galaxy A25 Dual SIM 128GB And 6GB RAM Mobile Phone - Vietnam	197.0	161×76.5×8.3	1080×2340  پیکسل	2	128	6	t	50	5000	113340000	2024-12-14	2024-12-14
14129480	Samsung Galaxy S24 Dual SIM 256GB And 8GB RAM Mobile Phone - Vietnam	\N	\N	1080×2340  پیکسل	3.2	256	8	t	50	4000	509990000	2024-12-14	2024-12-14
10940362	Samsung Galaxy A54 5G Dual SIM 256GB And 8GB RAM Mobile Phone	202.0	8.2×76.7×158.2	2340 × 1080 پیکسل	2	256	8	t	50	5000	196990000	2024-12-14	2024-12-14
14663276	Samsung Galaxy S24 Ultra Dual SIM 1TB And 12GB RAM Mobile Phone - Vietnam	233.0	8.6×79×162.3	1440×3120 پیکسل	3.39	1	12	t	200	5000	949990000	2024-12-14	2024-12-14
14717266	Samsung Galaxy A55 Dual SIM 256GB And 8GB RAM Mobile Phone	213.0	161.1x77.4x8.2	1080x2340 پیکسل پیکسل	2	256	8	t	50	5000	199640000	2024-12-14	2024-12-14
14717197	Samsung Galaxy A55 Dual SIM 128GB And 8GB RAM Mobile Phone	213.0	161.1x77.4x8.2	1080x2340 پیکسل پیکسل	2	128	8	t	50	5000	200000000	2024-12-14	2024-12-14
13257100	Samsung Galaxy S21 FE 5G Dual SIM 256GB And 8GB RAM Mobile Phone Snapdragon version - Activated	177.0	7.9×74.5×155.7	1080×2340  پیکسل	1.8	256	8	t	12	4500	212500000	2024-12-14	2024-12-14
14127306	Samsung Galaxy S24 Plus Dual SIM 256GB And 12GB RAM Mobile Phone - Vietnam	196.0	7.7×75.9×158.5	1440×3122 پیکسل	3.2	256	12	t	50	4900	552990000	2024-12-14	2024-12-14
13804793	Samsung Galaxy A05s Dual SIM 128GB And 6GB RAM Mobile Phone	194.0	8.8×77.8×168	1080×2400  پیکسل	1.9	128	6	f	50	5000	79900000	2024-12-14	2024-12-14
11103849	Samsung Galaxy S23 Ultra Dual SIM 512GB And 12GB RAM Mobile Phone - Vietnam	234.0	8.9×78.1×163.4	1440×3088 پیکسل	2	512	12	t	200	5000	639990000	2024-12-14	2024-12-14
12223768	Samsung Galaxy Z Fold5 Dual SIM 256GB And 12GB RAM Mobile Phone - Vietnam	253.0	6.1×129.9×154.9	1812×2176 پیکسل	2	256	12	t	50	4400	730000000	2024-12-14	2024-12-14
12224131	Samsung Galaxy Z Flip5 Single SIM 512GB And 8GB RAM Mobile Phone - Vietnam	187.0	6.9×71.9×165.1	1080×2460 پیکسل	\N	512	8	t	12	3700	476900000	2024-12-14	2024-12-14
12924162	Samsung Galaxy S23 FE Dual SIM 256GB And 8GB RAM Mobile Phone	209.0	8.2×76.5×158	1080×2340  پیکسل	1.8	256	8	t	50	4500	283000000	2024-12-14	2024-12-14
13980612	Samsung Galaxy A25 Dual SIM 128GB And 6GB RAM Mobile Phone	197.0	161×76.5×8.3	1080×2340  پیکسل	2	128	6	t	50	5000	113990000	2024-12-14	2024-12-14
13981087	Samsung Galaxy A25 Dual SIM 256GB And 8GB RAM Mobile Phone	197.0	161×76.5×8.3	1080×2340  پیکسل	2	256	8	t	50	5000	139700000	2024-12-14	2024-12-14
14851189	Samsung Galaxy A35 Dual SIM 128GB and 8GB RAM mobile phone	209.0	8.2×78×161.7	1080x2340 پیکسل	2	128	8	t	50	5000	151990000	2024-12-14	2024-12-14
11778941	Samsung Galaxy A34 5G Dual SIM 256GB And 8GB RAM Mobile Phone - Vietnam	199.0	8.2×78.1×161.3	2340 × 1080 پیکسل	2	256	8	t	48	5000	172000000	2024-12-14	2024-12-14
11590932	Samsung Galaxy A24 4G Dual SIM 128GB And 8GB RAM Mobile Phone - Vietnam	195.0	8.3×77.6×162.1	1080×2340 پیکسل	2	128	8	f	50	5000	149300000	2024-12-14	2024-12-14
11971261	Samsung Galaxy S21 FE 5G Dual SIM 128GB And 8GB RAM Mobile Phone - Vietnam	177.0	7.9×74.5×155.7	1080×2340  پیکسل	2.9	128	8	t	12	4500	203000000	2024-12-14	2024-12-14
13336917	Samsung Galaxy S21 FE 5G Dual SIM 128GB And 8GB RAM Mobile Phone Snapdragon version - Activated	177.0	7.9×74.5×155.7	1080×2340  پیکسل	1.8	128	8	t	12	4500	219990000	2024-12-14	2024-12-14
17465958	Samsung Galaxy A16 4G Dual SIM Storage 128GB And 4GB RAM Mobile Phone - Vietnam - With 25W Samsung Charger	200.0	164.4x77.9x7.9	1080x2340 پیکسل	2	128	4	f	50	5000	118800000	2024-12-14	2024-12-14
14273177	Samsung Galaxy S24 Ultra Dual SIM 256GB And 12GB RAM Mobile Phone with Samsung Charger - Vietnam	233.0	8.6×79×162.3	1440×3120 پیکسل	3.39	256	12	t	200	5000	659900000	2024-12-14	2024-12-14
17464490	Samsung Galaxy A16 4G Dual SIM Storage 128GB And 6GB RAM Mobile Phone - Vietnam	200.0	164.4x77.9x7.9	1080x2340 پیکسل	2	128	6	f	50	5000	113460000	2024-12-14	2024-12-14
14181093	Samsung Galaxy A15 Dual SIM 128GB And 6GB RAM Mobile Phone with samsung charger - Vietnam	200.0	8.4×76.8×160.1	1080×2340 پیکسل	2	128	6	f	50	5000	103554000	2024-12-14	2024-12-14
14130589	Samsung Galaxy A05 Dual SIM 64GB And 4GB RAM Mobile Phone with Samsung charger	195.0	8.8×78.2×168.8	720×1600 پیکسل	1.8	64	4	f	50	5000	58250000	2024-12-14	2024-12-14
16151809	Samsung Galaxy A15 Dual SIM 128GB And 6GB RAM Mobile Phone with 25W Samsung charger - Vietnam	200.0	8.4×76.8×160.1	1080×2340 پیکسل	2	128	6	f	50	5000	101990000	2024-12-14	2024-12-14
\.


--
-- Name: digipro digiProducts_copy1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.digipro
    ADD CONSTRAINT "digiProducts_copy1_pkey" PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

