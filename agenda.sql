------------
-- HEADER --
------------

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;


CREATE SCHEMA events;
ALTER SCHEMA events OWNER TO postgres;
COMMENT ON SCHEMA events IS 'Events on the event list';


SET search_path = events, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;

------------------
-- MAIN OBJECTS --
------------------

-- tb_artist
CREATE TABLE tb_artist (
    id integer NOT NULL,
    name varchar(80) NOT NULL
);

ALTER TABLE tb_artist OWNER to agenda;

CREATE SEQUENCE sq_artist__id;
ALTER TABLE sq_artist__id OWNER TO agenda;
ALTER SEQUENCE sq_artist__id OWNED BY tb_artist.id
ALTER TABLE ONLY tb_artist ALTER COLUMN id SET DEFAULT nextval('sq_artist__id'::regclass);


-- tb_event 
CREATE TABLE tb_event (
    id integer NOT NULL,
    date timestamp(0) without time zone NOT NULL,
    venue_id integer NOT NULL,
    price money,
    series_id integer,
    notes text
);

ALTER TABLE tb_event OWNER TO agenda;

CREATE SEQUENCE sq_event__id;
ALTER TABLE sq_event__id OWNER TO agenda;
ALTER SEQUENCE sq_event__id OWNED BY tb_event.id;
ALTER TABLE ONLY tb_event ALTER COLUMN id SET DEFAULT nextval('sq_event__id'::regclass);


-- tb_group 
CREATE TABLE tb_group (
    id integer NOT NULL,
    name varchar(80) NOT NULL
);

ALTER TABLE tb_group OWNER to agenda;

CREATE SEQUENCE sq_group__id;
ALTER TABLE sq_group__id OWNER TO agenda;
ALTER SEQUENCE sq_group__id OWNED BY tb_group.id
ALTER TABLE ONLY tb_group ALTER COLUMN id SET DEFAULT nextval('sq_group__id'::regclass);


-- tb_programme_item
CREATE TABLE tb_programme_item (
    id integer NOT NULL,
    description character varying(80)
);

ALTER TABLE tb_programme_item OWNER to agenda;

CREATE SEQUENCE sq_programme_item__id;
ALTER TABLE sq_programme_item__id OWNER TO agenda;
ALTER SEQUENCE sq_programme_item__id OWNED BY tb_programme_item.id
ALTER TABLE ONLY tb_programme_item ALTER COLUMN id SET DEFAULT nextval('sq_programme_item__id'::regclass);


-- tb_role
CREATE TABLE tb_role (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);

ALTER TABLE tb_role OWNER TO agenda;

CREATE SEQUENCE sq_role__id;
ALTER TABLE sq_role__id OWNER TO agenda;
ALTER SEQUENCE sq_role__id OWNED BY tb_role.id;
ALTER TABLE ONLY tb_role ALTER COLUMN id SET DEFAULT nextval('sq_role__id'::regclass);


-- tb_series 
CREATE TABLE tb_series (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    description text
);

ALTER TABLE tb_series OWNER TO agenda;

CREATE SEQUENCE sq_series__id;
ALTER TABLE sq_series__id OWNER TO agenda;
ALTER SEQUENCE sq_series__id OWNED BY tb_series.id;
ALTER TABLE ONLY tb_series ALTER COLUMN id SET DEFAULT nextval('sq_series__id'::regclass);


-- tb_venue
CREATE TABLE tb_venue (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    addressx character varying(160)
);

ALTER TABLE tb_venue OWNER TO agenda;

CREATE SEQUENCE sq_venue__id;
ALTER TABLE sq_venue__id OWNER TO agenda;
ALTER SEQUENCE sq_venue__id OWNED BY tb_venue.id;
ALTER TABLE ONLY tb_venue ALTER COLUMN id SET DEFAULT nextval('sq_venue__id'::regclass);


------------------
-- CONSTRAINTS  --
------------------

-- tb_event 
ALTER TABLE ONLY tb_event ADD CONSTRAINT pk_event PRIMARY KEY (id);
ALTER TABLE ONLY tb_event ADD CONSTRAINT fk_event__series_id FOREIGN KEY (series_id) REFERENCES tb_series(id);
ALTER TABLE ONLY tb_event ADD CONSTRAINT fk_event__venue_id FOREIGN KEY (venue_id) REFERENCES tb_venue(id);


-- tb_role
ALTER TABLE ONLY tb_role ADD CONSTRAINT uk_role__name UNIQUE (name);
ALTER TABLE ONLY tb_role ADD CONSTRAINT pk_role PRIMARY KEY (id);


-- tb_series
ALTER TABLE ONLY tb_series ADD CONSTRAINT uk_series__name UNIQUE (name);
ALTER TABLE ONLY tb_series ADD CONSTRAINT pk_series PRIMARY KEY (id);


-- tb_venue
ALTER TABLE ONLY tb_venue ADD CONSTRAINT uk_venue__nameUNIQUE (name);
ALTER TABLE ONLY tb_venue ADD CONSTRAINT uk_venue PRIMARY KEY (id);


------------
-- FOOTER --
------------

REVOKE ALL ON SCHEMA events FROM PUBLIC;
REVOKE ALL ON SCHEMA events FROM postgres;
GRANT ALL ON SCHEMA events TO postgres;
GRANT ALL ON SCHEMA events TO PUBLIC;
