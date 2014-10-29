--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: RoadSquirrel; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA "RoadSquirrel";


ALTER SCHEMA "RoadSquirrel" OWNER TO admin;

SET search_path = "RoadSquirrel", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: OAuth2; Type: TABLE; Schema: RoadSquirrel; Owner: admin; Tablespace: 
--

CREATE TABLE "OAuth2" (
	    id integer NOT NULL,
	    provider_id integer DEFAULT 0 NOT NULL,
	    user_id integer NOT NULL,
	    access_token character varying(254) NOT NULL,
	    refresh_token character varying(254)
);


ALTER TABLE "RoadSquirrel"."OAuth2" OWNER TO admin;

--
-- Name: OAuth2_id_seq; Type: SEQUENCE; Schema: RoadSquirrel; Owner: admin
--

CREATE SEQUENCE "OAuth2_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "RoadSquirrel"."OAuth2_id_seq" OWNER TO admin;

--
-- Name: OAuth2_id_seq; Type: SEQUENCE OWNED BY; Schema: RoadSquirrel; Owner: admin
--

ALTER SEQUENCE "OAuth2_id_seq" OWNED BY "OAuth2".id;


--
-- Name: skill; Type: TABLE; Schema: RoadSquirrel; Owner: admin; Tablespace: 
--

CREATE TABLE skill (
	    id integer NOT NULL,
	    name character varying(254) NOT NULL
);


ALTER TABLE "RoadSquirrel".skill OWNER TO admin;

--
-- Name: skill_id_seq; Type: SEQUENCE; Schema: RoadSquirrel; Owner: admin
--

CREATE SEQUENCE skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "RoadSquirrel".skill_id_seq OWNER TO admin;

--
-- Name: skill_id_seq; Type: SEQUENCE OWNED BY; Schema: RoadSquirrel; Owner: admin
--

ALTER SEQUENCE skill_id_seq OWNED BY skill.id;


--
-- Name: user; Type: TABLE; Schema: RoadSquirrel; Owner: admin; Tablespace: 
--

CREATE TABLE "user" (
	    id integer NOT NULL,
	    email character varying(254) NOT NULL,
	    first_name character varying(254) NOT NULL,
	    last_name character varying(254) NOT NULL
);


ALTER TABLE "RoadSquirrel"."user" OWNER TO admin;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: RoadSquirrel; Owner: admin
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "RoadSquirrel".user_id_seq OWNER TO admin;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: RoadSquirrel; Owner: admin
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: user_skill; Type: TABLE; Schema: RoadSquirrel; Owner: admin; Tablespace: 
--

CREATE TABLE user_skill (
	    id integer NOT NULL,
	    user_id integer NOT NULL,
	    skill_id integer NOT NULL
);


ALTER TABLE "RoadSquirrel".user_skill OWNER TO admin;

--
-- Name: user_skill_id_seq; Type: SEQUENCE; Schema: RoadSquirrel; Owner: admin
--

CREATE SEQUENCE user_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "RoadSquirrel".user_skill_id_seq OWNER TO admin;

--
-- Name: user_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: RoadSquirrel; Owner: admin
--

ALTER SEQUENCE user_skill_id_seq OWNED BY user_skill.id;


--
-- Name: id; Type: DEFAULT; Schema: RoadSquirrel; Owner: admin
--

ALTER TABLE ONLY "OAuth2" ALTER COLUMN id SET DEFAULT nextval('"OAuth2_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: RoadSquirrel; Owner: admin
--

ALTER TABLE ONLY skill ALTER COLUMN id SET DEFAULT nextval('skill_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: RoadSquirrel; Owner: admin
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: RoadSquirrel; Owner: admin
--

ALTER TABLE ONLY user_skill ALTER COLUMN id SET DEFAULT nextval('user_skill_id_seq'::regclass);


--
-- Name: OAuth2_pkey; Type: CONSTRAINT; Schema: RoadSquirrel; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY "OAuth2"
    ADD CONSTRAINT "OAuth2_pkey" PRIMARY KEY (id);


--
-- Name: skill_pkey; Type: CONSTRAINT; Schema: RoadSquirrel; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY skill
    ADD CONSTRAINT skill_pkey PRIMARY KEY (id);


--
-- Name: user_email_key; Type: CONSTRAINT; Schema: RoadSquirrel; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: RoadSquirrel; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_skill_pkey; Type: CONSTRAINT; Schema: RoadSquirrel; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY user_skill
    ADD CONSTRAINT user_skill_pkey PRIMARY KEY (id);


--
-- Name: OAuth2_user_id_fkey; Type: FK CONSTRAINT; Schema: RoadSquirrel; Owner: admin
--

ALTER TABLE ONLY "OAuth2"
    ADD CONSTRAINT "OAuth2_user_id_fkey" FOREIGN KEY (user_id) REFERENCES "user"(id);


--
-- Name: user_skill_skill_id_fkey; Type: FK CONSTRAINT; Schema: RoadSquirrel; Owner: admin
--

ALTER TABLE ONLY user_skill
    ADD CONSTRAINT user_skill_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES skill(id) ON DELETE CASCADE;


--
-- Name: user_skill_user_id_fkey; Type: FK CONSTRAINT; Schema: RoadSquirrel; Owner: admin
--

ALTER TABLE ONLY user_skill
    ADD CONSTRAINT user_skill_user_id_fkey FOREIGN KEY (user_id) REFERENCES "user"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--
