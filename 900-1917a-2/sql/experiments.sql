--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.5
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Data for Name: experiments; Type: TABLE DATA; Schema: public; Owner: sam
--

COPY experiments (schema, title, description, notes, geoseries, geodataset, pmid, expressionlabel, contributors, publicdata, assay, annotation, genus, species) FROM stdin;
grtiny	GR-TINY Experiment	Dexamethazone induction of GR-TINY (Col-0) expression, data at 0, 30, 60 min. Other samples imported from GSE70790.	\N	\N	\N	\N	Norm. FPKM	Kathy Barton, Sam Hokin	f	RNA-seq	TAIR10	Arabidopsis	thaliana
\.

--
-- PostgreSQL database dump complete
--

