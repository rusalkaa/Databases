--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(100),
    mass numeric,
    distance_from_earth integer,
    galaxy_id integer NOT NULL,
    observations_count integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_blackhole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    number_of_stars bigint,
    type character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20),
    orbit_period double precision,
    is_visible boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    age_in_millions_of_years double precision,
    has_atmosphere boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    is_bright boolean,
    name character varying(20),
    type character varying(50)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_blackhole_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Cygnus X-1', 14.8, 6070, 1, 10);
INSERT INTO public.black_hole VALUES (2, 'Sagittarius A*', 4100000, 26000, 2, 25);
INSERT INTO public.black_hole VALUES (3, 'M87*', 6500000000, 53500000, 3, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that includes Earth', 100000000000, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy to the Milky Way', 1000000000000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller spiral galaxy near Andromeda', 40000000000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Famous for its supermassive black hole', 200000000000, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Known for its stunning spiral arms', 150000000000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Named for its resemblance to a sombrero', 20000000000, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (41, 3, 'Moon', 27.3, true);
INSERT INTO public.moon VALUES (42, 3, 'Phobos', 0.3, true);
INSERT INTO public.moon VALUES (43, 3, 'Deimos', 1.3, true);
INSERT INTO public.moon VALUES (44, 4, 'Deimos', 1.3, true);
INSERT INTO public.moon VALUES (45, 4, 'Phobos', 0.3, true);
INSERT INTO public.moon VALUES (46, 5, 'Titan', 15.9, true);
INSERT INTO public.moon VALUES (47, 5, 'Rhea', 4.5, true);
INSERT INTO public.moon VALUES (48, 6, 'Alpha Moon', 2.1, false);
INSERT INTO public.moon VALUES (49, 6, 'Beta Moon', 1.6, true);
INSERT INTO public.moon VALUES (50, 7, 'Gamma Moon', 5.3, true);
INSERT INTO public.moon VALUES (51, 8, 'Proxima I', 3.2, false);
INSERT INTO public.moon VALUES (52, 8, 'Proxima II', 1.9, true);
INSERT INTO public.moon VALUES (53, 9, 'Sirius I', 4, true);
INSERT INTO public.moon VALUES (54, 9, 'Sirius II', 2.5, true);
INSERT INTO public.moon VALUES (55, 10, 'Vega I', 3.7, false);
INSERT INTO public.moon VALUES (56, 10, 'Vega II', 6.2, true);
INSERT INTO public.moon VALUES (57, 11, 'Kepler I', 7, true);
INSERT INTO public.moon VALUES (58, 11, 'Kepler II', 3.8, true);
INSERT INTO public.moon VALUES (59, 12, 'Gliese I', 2.5, false);
INSERT INTO public.moon VALUES (60, 12, 'Gliese II', 1.7, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', 4500, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4500, true, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 4600, true, 1);
INSERT INTO public.planet VALUES (6, 'Proxima b', 6000, true, 2);
INSERT INTO public.planet VALUES (7, 'Alpha Centauri b', 5000, false, 1);
INSERT INTO public.planet VALUES (8, 'Betelgeuse IV', 7000, false, 5);
INSERT INTO public.planet VALUES (9, 'Sirius IV', 2000, true, 6);
INSERT INTO public.planet VALUES (10, 'Vega VI', 4500, true, 3);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 1000, true, 1);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 8000, true, 4);
INSERT INTO public.planet VALUES (13, 'Tau Ceti e', 3000, false, 4);
INSERT INTO public.planet VALUES (14, 'Luyten b', 1200, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, true, 'Sirius', 'Main Sequence');
INSERT INTO public.star VALUES (2, 1, false, 'Proxima Centauri', 'Red Dwarf');
INSERT INTO public.star VALUES (3, 2, true, 'Vega', 'Main Sequence');
INSERT INTO public.star VALUES (4, 2, true, 'Altair', 'Main Sequence');
INSERT INTO public.star VALUES (5, 3, false, 'Betelgeuse', 'Red Supergiant');
INSERT INTO public.star VALUES (6, 4, true, 'Arcturus', 'Red Giant');


--
-- Name: black_hole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_blackhole_id_seq', 3, true);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole unique_black_hole_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT unique_black_hole_id UNIQUE (black_hole_id);


--
-- Name: galaxy unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: black_hole fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

