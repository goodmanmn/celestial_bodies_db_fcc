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
    name character varying(30) NOT NULL,
    constellation text NOT NULL,
    num_of_stars_billions integer,
    size_in_kpc numeric(3,1)
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
-- Name: jupiter_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.jupiter_moons (
    moon_id integer,
    planet_id integer,
    name character varying(30) NOT NULL,
    radius_in_km numeric(6,2),
    temp_in_k integer,
    jupiter_moons_id integer NOT NULL
);


ALTER TABLE public.jupiter_moons OWNER TO freecodecamp;

--
-- Name: jupiter_moons_jupiter_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.jupiter_moons_jupiter_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jupiter_moons_jupiter_moon_id_seq OWNER TO freecodecamp;

--
-- Name: jupiter_moons_jupiter_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.jupiter_moons_jupiter_moon_id_seq OWNED BY public.jupiter_moons.jupiter_moons_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(30) NOT NULL,
    radius_in_km numeric(6,2),
    temp_in_k integer
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
    star_id integer,
    name character varying(30) NOT NULL,
    is_dwarf_planet boolean,
    has_moon boolean,
    distance_from_sun_in_au numeric(5,2)
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    age_in_myr numeric(5,1),
    temp_in_k numeric(10,1)
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
-- Name: jupiter_moons jupiter_moons_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.jupiter_moons ALTER COLUMN jupiter_moons_id SET DEFAULT nextval('public.jupiter_moons_jupiter_moon_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 400, 26.8);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda', 1000, 46.6);
INSERT INTO public.galaxy VALUES (3, 'Canis Major Overdensity', 'Canis Major', 1, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sagittarius Dwarf Spheroidal', 'Sagittarius', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Dorado/Mensa', 20, 9.9);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Tucana and Hydrus', 3, 5.8);


--
-- Data for Name: jupiter_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.jupiter_moons VALUES (4, 6, 'Metis', 21.50, 123, 1);
INSERT INTO public.jupiter_moons VALUES (5, 6, 'Adrastea', 8.20, 122, 2);
INSERT INTO public.jupiter_moons VALUES (6, 6, 'Amalthea', 83.50, 120, 3);
INSERT INTO public.jupiter_moons VALUES (7, 6, 'Europa', 1560.80, 102, 4);
INSERT INTO public.jupiter_moons VALUES (18, 6, 'Io', 1821.60, 130, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 1738.10, 250);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 11.08, 233);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 6.27, 233);
INSERT INTO public.moon VALUES (4, 6, 'Metis', 21.50, 123);
INSERT INTO public.moon VALUES (5, 6, 'Adrastea', 8.20, 122);
INSERT INTO public.moon VALUES (6, 6, 'Amalthea', 83.50, 120);
INSERT INTO public.moon VALUES (7, 6, 'Europa', 1560.80, 102);
INSERT INTO public.moon VALUES (8, 7, 'Mimas', 198.20, 64);
INSERT INTO public.moon VALUES (9, 7, 'Enceladus', 252.10, 75);
INSERT INTO public.moon VALUES (10, 8, 'Uranus', 788.40, 70);
INSERT INTO public.moon VALUES (11, 8, 'Oberon', 761.40, 70);
INSERT INTO public.moon VALUES (12, 9, 'Triton', 1353.40, 38);
INSERT INTO public.moon VALUES (13, 10, 'Styx', NULL, NULL);
INSERT INTO public.moon VALUES (14, 10, 'Nix', NULL, NULL);
INSERT INTO public.moon VALUES (15, 10, 'Charon', 606.00, 53);
INSERT INTO public.moon VALUES (16, 11, 'Hiiaka', 160.00, 32);
INSERT INTO public.moon VALUES (17, 12, 'S/2015 (136472) 1', 87.00, NULL);
INSERT INTO public.moon VALUES (18, 6, 'Io', 1821.60, 130);
INSERT INTO public.moon VALUES (19, 7, 'Dione', 561.40, 87);
INSERT INTO public.moon VALUES (20, 8, 'Umbriel', 584.70, 75);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', false, false, 0.31);
INSERT INTO public.planet VALUES (2, 1, 'Venus', false, false, 0.72);
INSERT INTO public.planet VALUES (3, 1, 'Earth', false, true, 0.98);
INSERT INTO public.planet VALUES (4, 1, 'Mars', false, true, 1.38);
INSERT INTO public.planet VALUES (5, 1, 'Ceres', true, false, 2.55);
INSERT INTO public.planet VALUES (6, 1, 'Jupiter', false, true, 4.95);
INSERT INTO public.planet VALUES (7, 1, 'Saturn', false, true, 9.08);
INSERT INTO public.planet VALUES (8, 1, 'Uranus', false, true, 18.30);
INSERT INTO public.planet VALUES (9, 1, 'Neptune', false, true, 29.90);
INSERT INTO public.planet VALUES (10, 1, 'Pluto', true, true, 29.70);
INSERT INTO public.planet VALUES (11, 1, 'Haumea', true, true, 34.60);
INSERT INTO public.planet VALUES (12, 1, 'Makemake', true, true, 38.10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 4600.0, 15700000.0);
INSERT INTO public.star VALUES (2, 1, 'VY Canis Major', 8.2, 3490.0);
INSERT INTO public.star VALUES (3, 1, 'AH Scorpii', NULL, 3682.0);
INSERT INTO public.star VALUES (4, 1, 'S Persei', NULL, 3500.0);
INSERT INTO public.star VALUES (5, 5, 'WOH G64', 5.0, 3400.0);
INSERT INTO public.star VALUES (6, 5, 'IRAS 05280-6910', NULL, 3000.0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: jupiter_moons_jupiter_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.jupiter_moons_jupiter_moon_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


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
-- Name: jupiter_moons jupiter_moons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.jupiter_moons
    ADD CONSTRAINT jupiter_moons_name_key UNIQUE (name);


--
-- Name: jupiter_moons jupiter_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.jupiter_moons
    ADD CONSTRAINT jupiter_moons_pkey PRIMARY KEY (jupiter_moons_id);


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
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

