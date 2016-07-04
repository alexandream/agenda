------------
-- TABLES --
------------
CREATE TABLE tb_artist (
    id integer NOT NULL,
    name varchar(80) NOT NULL
);

CREATE TABLE tb_artist_participation (
    solo_act_id integer NOT NULL,
    role_id integer NOT NULL
);

CREATE TABLE tb_event (
    id integer NOT NULL,
    date timestamp NOT NULL,
    venue_id integer NOT NULL,
    price money NOT NULL,
    series_id integer,
    notes text NOT NULL
);

CREATE TABLE tb_group (
    id integer NOT NULL,
    name varchar(80) NOT NULL
);

CREATE TABLE tb_group_act (
    id integer NOT NULL,
    event_id integer NOT NULL,
    group_id integer,
    special_participation boolean NOT NULL
);

CREATE TABLE tb_group_participation (
    group_act_id integer NOT NULL,
    artist_id integer NOT NULL,
    role_id integer
);

CREATE TABLE tb_programme (
    programme_item_id integer NOT NULL,
    event_id integer NOT NULL
);

CREATE TABLE tb_programme_item (
    id integer NOT NULL,
    description varchar(80) NOT NULL
);

CREATE TABLE tb_role (
    id integer NOT NULL,
    name varchar(80) NOT NULL
);

CREATE TABLE tb_series (
    id integer NOT NULL,
    name varchar(80) NOT NULL,
    description text NOT NULL
);

CREATE TABLE tb_solo_act (
    id integer NOT NULL,
    event_id integer NOT NULL,
    artist_id integer NOT NULL,
    special_participation boolean NOT NULL
);

CREATE TABLE tb_venue (
    id integer NOT NULL,
    name varchar(80) NOT NULL,
    address varchar(160) NOT NULL
);


-----------------------------------------
-- SEQUENCES AND SERIAL DEFAULT VALUES --
-----------------------------------------
CREATE SEQUENCE sq_artist__id;
ALTER SEQUENCE sq_artist__id OWNED by tb_artist.id;
ALTER TABLE ONLY tb_artist ALTER COLUMN id SET DEFAULT nextval('sq_artist__id'::regclass);

CREATE SEQUENCE sq_event__id;
ALTER SEQUENCE sq_event__id OWNED by tb_event.id;
ALTER TABLE ONLY tb_event ALTER COLUMN id SET DEFAULT nextval('sq_event__id'::regclass);

CREATE SEQUENCE sq_group__id;
ALTER SEQUENCE sq_group__id OWNED by tb_group.id;
ALTER TABLE ONLY tb_group ALTER COLUMN id SET DEFAULT nextval('sq_group__id'::regclass);

CREATE SEQUENCE sq_group_act__id;
ALTER SEQUENCE sq_group_act__id OWNED by tb_group_act.id;
ALTER TABLE ONLY tb_group_act ALTER COLUMN id SET DEFAULT nextval('sq_group_act__id'::regclass);

CREATE SEQUENCE sq_programme_item__id;
ALTER SEQUENCE sq_programme_item__id OWNED by tb_programme_item.id;
ALTER TABLE ONLY tb_programme_item ALTER COLUMN id SET DEFAULT nextval('sq_programme_item__id'::regclass);

CREATE SEQUENCE sq_role__id;
ALTER SEQUENCE sq_role__id OWNED by tb_role.id;
ALTER TABLE ONLY tb_role ALTER COLUMN id SET DEFAULT nextval('sq_role__id'::regclass);

CREATE SEQUENCE sq_series__id;
ALTER SEQUENCE sq_series__id OWNED by tb_series.id;
ALTER TABLE ONLY tb_series ALTER COLUMN id SET DEFAULT nextval('sq_series__id'::regclass);

CREATE SEQUENCE sq_solo_act__id;
ALTER SEQUENCE sq_solo_act__id OWNED by tb_solo_act.id;
ALTER TABLE ONLY tb_solo_act ALTER COLUMN id SET DEFAULT nextval('sq_solo_act__id'::regclass);

CREATE SEQUENCE sq_venue__id;
ALTER SEQUENCE sq_venue__id OWNED by tb_venue.id;
ALTER TABLE ONLY tb_venue ALTER COLUMN id SET DEFAULT nextval('sq_venue__id'::regclass);


------------------------------
-- PRIMARY KEYS AND INDEXES --
------------------------------
ALTER TABLE ONLY tb_artist ADD CONSTRAINT pk_artist PRIMARY KEY (id);
ALTER TABLE ONLY tb_artist ADD CONSTRAINT uk_artist__name UNIQUE (name);

ALTER TABLE ONLY tb_event ADD CONSTRAINT pk_event PRIMARY KEY (id);

ALTER TABLE ONLY tb_group ADD CONSTRAINT pk_group PRIMARY KEY (id);
ALTER TABLE ONLY tb_group ADD CONSTRAINT uk_group__name UNIQUE (name);

ALTER TABLE ONLY tb_group_act ADD CONSTRAINT pk_group_act PRIMARY KEY (id);

ALTER TABLE ONLY tb_programme_item ADD CONSTRAINT pk_programme_item PRIMARY KEY (id);
ALTER TABLE ONLY tb_programme_item ADD CONSTRAINT uk_programme_item__description UNIQUE (description);

ALTER TABLE ONLY tb_role ADD CONSTRAINT pk_role PRIMARY KEY (id);
ALTER TABLE ONLY tb_role ADD CONSTRAINT uk_role__name UNIQUE (name);

ALTER TABLE ONLY tb_series ADD CONSTRAINT pk_series PRIMARY KEY (id);
ALTER TABLE ONLY tb_series ADD CONSTRAINT uk_series__name UNIQUE (name);

ALTER TABLE ONLY tb_solo_act ADD CONSTRAINT pk_solo_act PRIMARY KEY (id);

ALTER TABLE ONLY tb_venue ADD CONSTRAINT pk_venue PRIMARY KEY (id);
ALTER TABLE ONLY tb_venue ADD CONSTRAINT uk_venue__name UNIQUE (name);


------------------
-- FOREIGN KEYS --
------------------
ALTER TABLE ONLY tb_artist_participation ADD CONSTRAINT fk_artist_participation__role_id FOREIGN KEY (role_id) REFERENCES tb_role(id);
ALTER TABLE ONLY tb_artist_participation ADD CONSTRAINT fk_artist_participation__solo_act_id FOREIGN KEY (solo_act_id) REFERENCES tb_solo_act(id);

ALTER TABLE ONLY tb_event ADD CONSTRAINT fk_event__series_id FOREIGN KEY (series_id) REFERENCES tb_series(id);
ALTER TABLE ONLY tb_event ADD CONSTRAINT fk_event__venue_id FOREIGN KEY (venue_id) REFERENCES tb_venue(id);

ALTER TABLE ONLY tb_group_act ADD CONSTRAINT fk_group_act__group_id FOREIGN KEY (group_id) REFERENCES tb_group(id);

ALTER TABLE ONLY tb_group_participation ADD CONSTRAINT fk_group_participation__artist_id FOREIGN KEY (artist_id) REFERENCES tb_artist(id);
ALTER TABLE ONLY tb_group_participation ADD CONSTRAINT fk_group_participation__group_act_id FOREIGN KEY (group_act_id) REFERENCES tb_group_act(id);

ALTER TABLE ONLY tb_programme ADD CONSTRAINT fk_programme__event_id FOREIGN KEY (event_id) REFERENCES tb_event(id);
ALTER TABLE ONLY tb_programme ADD CONSTRAINT fk_programme__programme_item_id FOREIGN KEY (programme_item_id) REFERENCES tb_programme_item(id);

ALTER TABLE ONLY tb_solo_act ADD CONSTRAINT fk_solo_act__artist_id FOREIGN KEY (artist_id) REFERENCES tb_artist(id);
ALTER TABLE ONLY tb_solo_act ADD CONSTRAINT fk_solo_act__event_id FOREIGN KEY (event_id) REFERENCES tb_event(id);
