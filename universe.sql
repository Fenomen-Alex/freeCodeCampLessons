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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    distance_from_earth numeric,
    galaxy_type character varying(255) NOT NULL,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    has_atmosphere boolean,
    diameter numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    is_spherical boolean,
    orbit_period integer,
    distance_from_star numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    launch_date date,
    crew_capacity integer,
    planet_id integer,
    star_id integer
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    is_spherical boolean,
    age_in_millions_of_years integer,
    luminosity numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 0, 'Spiral', false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 2530000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (3, 'Messier 33', 'Triangulum Galaxy', 3000000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Galaxy with a supermassive black hole', 53000000, 'Elliptical', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'A spiral galaxy', 28000000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 'A spiral galaxy', 21000000, 'Spiral', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, false, 3474.8);
INSERT INTO public.moon VALUES (2, 'Phobos', 7, false, 22.2);
INSERT INTO public.moon VALUES (3, 'Deimos', 7, false, 12.4);
INSERT INTO public.moon VALUES (4, 'Io', 8, true, 3630.0);
INSERT INTO public.moon VALUES (5, 'Europa', 8, true, 3122.0);
INSERT INTO public.moon VALUES (6, 'Ganymede', 8, true, 5268.0);
INSERT INTO public.moon VALUES (7, 'Callisto', 8, true, 4821.6);
INSERT INTO public.moon VALUES (8, 'Titan', 9, true, 5150.0);
INSERT INTO public.moon VALUES (9, 'Rhea', 9, true, 1528.0);
INSERT INTO public.moon VALUES (10, 'Iapetus', 9, true, 1460.0);
INSERT INTO public.moon VALUES (11, 'Dione', 9, true, 1123.0);
INSERT INTO public.moon VALUES (12, 'Tethys', 9, true, 1062.0);
INSERT INTO public.moon VALUES (13, 'Enceladus', 9, true, 504.0);
INSERT INTO public.moon VALUES (14, 'Mimas', 9, true, 396.0);
INSERT INTO public.moon VALUES (15, 'Hyperion', 9, true, 270.0);
INSERT INTO public.moon VALUES (16, 'Phoebe', 9, true, 213.0);
INSERT INTO public.moon VALUES (17, 'Miranda', 10, true, 471.6);
INSERT INTO public.moon VALUES (18, 'Ariel', 10, true, 1158.8);
INSERT INTO public.moon VALUES (19, 'Umbriel', 10, true, 1169.4);
INSERT INTO public.moon VALUES (20, 'Titania', 10, true, 1577.6);
INSERT INTO public.moon VALUES (21, 'Oberon', 10, true, 1522.8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 365, 1.0);
INSERT INTO public.planet VALUES (2, 'Mars', 1, true, 687, 1.52);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, true, 4333, 5.2);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, true, 10759, 9.58);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, true, 30687, 19.18);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, true, 60190, 30.07);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, true, 88, 0.39);
INSERT INTO public.planet VALUES (8, 'Venus', 1, true, 225, 0.72);
INSERT INTO public.planet VALUES (9, 'Moon', 1, true, 27, 0.0026);
INSERT INTO public.planet VALUES (10, 'Io', 1, true, 2, 0.0028);
INSERT INTO public.planet VALUES (11, 'Europa', 1, true, 4, 0.0028);
INSERT INTO public.planet VALUES (12, 'Ganymede', 1, true, 7, 0.0028);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Voyager 1', 'Probe', '1977-09-05', 0, 1, 1);
INSERT INTO public.spacecraft VALUES (2, 'Hubble Space Telescope', 'Observatory', '1990-04-24', 0, 2, 2);
INSERT INTO public.spacecraft VALUES (3, 'Mars Rover', 'Rover', '2003-06-10', 0, 3, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, 4600, 1.0);
INSERT INTO public.star VALUES (2, 'Sirius', 1, true, 200, 25.4);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, true, 80000, 120000);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 1, true, 5000, 1.5);
INSERT INTO public.star VALUES (5, 'Polaris', 1, true, 70000, 2500);
INSERT INTO public.star VALUES (6, 'Altair', 1, true, 1200, 10.6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: spacecraft spacecraft_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: spacecraft spacecraft_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

