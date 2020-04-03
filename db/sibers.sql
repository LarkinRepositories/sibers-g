--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE sibers;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5f0b3492f3c382e5338eda87a59c6b843';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-2.pgdg100+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-2.pgdg100+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "sibers" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-2.pgdg100+1)

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

--
-- Name: sibers; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE sibers WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE sibers OWNER TO postgres;

\connect sibers

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
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id bigint NOT NULL,
    title character varying(1000) NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    img character varying(255),
    text character varying(2048) NOT NULL
);


ALTER TABLE public.news OWNER TO postgres;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.news ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0	larkinds	classpath:liquibase/db.changelog-1.0.xml	2020-04-02 13:46:26.95134	1	EXECUTED	8:0ae1020006ba238686d3dc86d63ff7d9	createTable tableName=news		\N	3.8.8	\N	\N	5809986909
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, title, created, img, text) FROM stdin;
1	Teddy Roosevelt on a Moose: Fake News, or Fake Fake News?	2020-04-02 13:48:47.967	1e1a0586-6320-4a01-bc91-9b378ed979b1.Снимок экрана от 2020-04-02 13-48-36.png	                        An old photo of a US president on mooseback is often used to illustrate the deep roots of media deception. The real story may not back that up. PRESIDENT THEODORE ROOSEVELT was larger than life, in many ways. He explored the Amazon. He delivered a campaign speech after being shot. (“The bullet is in me now, so that I cannot make a very long speech, but I will try my best,” he told the horrified audience.) He was the very first president both to drive a car and fly in a plane. He got into a bar fight in a tiny town called Wibaux, Montana. And on at least one occasion, Roosevelt rode in a saddle on a moose. There’s even a photo of that last thing: Teddy in his iconic white safari hat, perched atop an antlered beast as it fords a body of water flanked by evergreens. The legs of our 26th president dangled in the water. It’s fitting, somehow, to find Roosevelt in this unusual position. (The man did at one point have a pet bear named Jonathan Edwards.) The problem is that this particular ride never happened. The image is doctored—a photograph of the president that was cut and glued atop a picture of a moose. Up close, the famous photo is easy to identify as a sham: The seams around his legs and hands are messy and indicate foul play. (Anybody who knows much about moose wouldn’t need to make a close inspection. The wild creatures are not exactly friendly, and they certainly don’t appreciate being ridden.) Yet the image, ripe with the juicy mythology of a president who could sometimes seem as though he’d ridden out of a tall tale, has been shared far and wide, and treated as the real deal. Today, you can find it printed onto mugs, posters, and even cheeky T-shirts.      \r\n\r\n                    \r\n                    
2	How American Politics Became a Meme Theater	2020-04-02 13:50:02.396	6d73a82e-d61e-4cde-aac7-67dd2d5a8937.Снимок экрана от 2020-04-02 13-49-34.png	EVERY POLITICAL MOMENT is now a potential meme—and politicians know it. Today, that politico is Speaker of the House Nancy Pelosi in a white pantsuit, deadpanning as she rips up President Trump’s third State of the Union speech. It was not a private moment of frustration caught by an errant paparazzo. She did it the moment Trump’s speech ended, while she was still in the speaker’s designated State of the Union spot: behind the president, beside Vice President Mike Pence, and directly in front of the cameras.     \r\n                    
3	Pepe the Frog Foretold the Fraught World of Modern Memes	2020-04-02 13:50:52.086	\N	When Furie first drew Pepe the Frog, a cartoon that’s become one of the most recognizable and controversial memes in the world, it was just another doodle, the latest in a long line of anthropomorphic amphibians. “It’s just been kind of a slow drip of frogs all my life,” Furie says. In 2005, Pepe became a part of Furie’s comic Boy’s Club, a series about a silly, slovenly group of friends in an early-twenties funk. By 2016, Pepe the Frog was an online hate symbol, a racist, beswastikaed nightmare creature beloved by digital white supremacists. Pepe’s catchphrase, “Feels good, man,” was also subjected to sinister remix. The line Furie wrote as a weirdo’s response to being caught peeing with his pants around his ankles passed through the darkest of internet prisms and became “Kill Jews, man.” “I’m just a spectator,” Furie says.\r\n\r\nFeels Good Man does linger on the anguished online reactionaries who took Pepe from fratty to fascist, but mostly, it doodles an intimate, uncomfortable portrait of a naive cartoonist trying to drag a JPEG back from the maw of 4chan’s ugliest corners—simply because it’s right and because it’s his. He’s a children’s book author, an unlikely gladiator, except for how he isn’t. In 2020, creators’ struggle to wrest ownership of their art from the internet is the biggest dustup in town. By telling Furie’s story, Feels Good Man lays the choreography and competing emotions of that struggle bare. Pepe the Frog isn’t really a frog anymore, just an enigmatic prize in a fight that nobody’s really figured out how to win.
4	The Real Meaning Behind Arson Frog	2020-04-02 13:52:22.518	3fc9650f-03a1-459f-934d-d22df242418d.Снимок экрана от 2020-04-02 13-52-12.png	IT ALL STARTED with a joke about tacos. TikTok user @tinymeatgang69699 posted a clip of someone wheeze-scream-laughing at an array of kitschy framed signs in what seems to be a home goods store, one of which reads “Thank goodness I don’t have to hunt my own food. I don’t even know where tacos live.” Commenters—who, because of TikTok’s demographics, are most likely to be teenage members of Generation Z—resoundingly pronounced the jokes “boomer humor.” One user, @matherfukr (kids these days!), came to baby boomer comedy’s defense. “I mean to be fair these are actually jokes,” they wrote. “Half of Gen Z would laugh if someone took a picture of frog, colored it blue and wrote arson under it.”
5	Hate That Stupid 'Be Like Bill' Meme All Over Facebook? Here's How to Make it Stop.	2020-04-02 13:54:28.128	98cbd82b-c3a9-41c4-9ba8-02f3af3d76d5.Снимок экрана от 2020-04-02 13-53-50.png	Who’s to blame for “Be Like Bill” fever? A 23-year-old Moldovan expat named Eugeniu Croitoru who lives in Milan. He spawned that smarmy little runt late last year. His lovely creation, which auto-generates passive-aggressive (and flagrantly misogynistic) advice on how how not to act like a jerk on Facebook, has garnered 1.5 million likes so far. Yippee.\r\n\r\nRelated: Grumpy Cat and the Thriving Cat Meme Marketplace\r\n\r\nCroitoru’s genius explanation for his contribution to society: “‘Bill’ can be anyone who is smart and has common sense and who doesn’t do annoying things,” or so he told the BBC. “You’ll also notice Bill can be someone who makes fun of himself and jokes about others too occasionally.”\r\n\r\nWhatever, dude. Bill is rude. Bill is gross. Bill needs to go away.                        \r\n                    
6	Man Behind Hide The Pain Harold Meme On His Unexpected Viral Fame	2020-04-02 13:56:20.223	efd33ec9-5a4d-4e76-b55d-9aee93303e3d.Снимок экрана от 2020-04-02 13-55-21.png	Man Behind Hide The Pain Harold Meme On His Unexpected Viral Fame\r\nThe man behind viral meme 'Hide The Pain Harold' has spoken about the surreal experience of becoming internet famous without even trying - admitting he felt annoyed initially, while his wife simply hated it all... until the commercial work started coming through, that is.\r\nHarold is actually a Hungarian man called Arató András, who told LADbible last year that he had found viral fame after a photo of him smiling with a pained look in his eyes surfaced online.\r\nNine years ago - when András was still working as an electrical engineer - a photographer had seen a holiday picture of his on the internet, and asked him for a 'trial shooting'.\r\nAndrás agreed, but was unsure what the stock photos would be used for. It wasn't until later that year that he realised what had happened when he did a reverse image search on a photo of himself. He was everywhere.\r\nIn a new interview with the Guardian, András said: "Once the memes were out in the world, journalists began to contact me, and wanted to come to my home to interview me.\r\n"My wife hated it: she thought it interfered in our private life and didn't like the way I was portrayed.
7	Teacher Uses Gordon Ramsay Memes To Grade Homework	2020-04-02 13:57:06.449	\N	How times have changed academically. Many of our parents and grandparents would have got the cane for misbehaving. Lots of us would have got a big red cross if we gave an incorrect answer. Now, pupils at Leyden High School in Franklin Park, Illinois, get feedback through little pictures of Gordon Ramsay and basketball player, Nick Young.\r\n\r\nAinee Fatima, who teaches English and Media Studies, shared a video of her applying the peculiar marking method online on Wednesday and it has since been viewed nearly 10 million times.\r\n\r\nIn the video, Ainee sticks a picture of NBA player Nick Young with question marks by his head on the pupil's work, indicated that their answer is confusingly far off the mark.
8	Was George Orwell secretly a reactionary snitch? How the author became an internet meme and target of the hard left	2020-04-02 14:03:19.653	45d04346-dfd3-4205-8394-64110ad06a07.Снимок экрана от 2020-04-02 14-03-07.png	In 1949 the man who conceived Big Brother gave a semi-secret government department a list of 38 ‘crypto-communists’ and ‘fellow travellers’ – a revelation that has given rise to a peculiar revisionism of his legacy.\r\nTo many, he came close to being a secular saint.\r\n\r\nGeorge Orwell, born 115 years ago on Monday, was the writer who challenged the iniquities of imperialism and capitalism, who took a bullet in the throat fighting fascism, and who taught a Western audience about the horrors of Stalinist communism.\r\n\r\nThat he died young, of tuberculosis at the age of 46, in 1950, served only to enhance his posthumous reputation. He became, in the words of one astute critic, “the James Dean of the Cold War, the John F Kennedy of English letters”.
9	Daniel Pearl: Pakistan overturns convicted man's death sentence	2020-04-02 14:05:42.7	\N	Pakistan has overturned the death sentence of the man convicted of killing US journalist Daniel Pearl, defence lawyers have told reporters.\r\n\r\nBritish-born Ahmed Omar Saeed Sheikh, who has been in prison since 2002, has had his sentence reduced to seven years, said lawyer Khawaja Naveed.\r\nThree other men given life sentences over the killing have been acquitted by the Sindh High Court and released.\r\n\r\nPearl, who worked for the Wall Street Journal, went missing in January 2002.\r\nHe had been researching Islamist militant activity in Karachi in the wake of the 11 September 2001 attacks on the US.\r\nA month later, authorities said he had been killed after receiving video footage of his beheading.\r\nSheikh was convicted shortly afterwards by an anti-terrorism court, but there have long been questions over the case.
10	The man who grew his own Amazon rainforest	2020-04-02 14:06:52.742	10eaaa3f-0695-4bfd-85d0-c08d9e3e45e1.Снимок экрана от 2020-04-02 14-06-22.png	A corner of the Amazon that had been cleared and used as farmland has been restored to rainforest.\r\n\r\nThe man who owns it, Omar Tello, gave up his job as an accountant and spent 40 years recreating a patch of pristine forest in Ecuador, stretching just a few hundred metres in each direction.\r\n\r\nHe’s trying to encourage other landowners to do the same, so they can turn the tide of deforestation.
11	The godfather of fake news	2020-04-02 14:08:29.98	\N	Christopher Blair takes a sip of his coffee.\r\n\r\nThen he carefully focuses on one of the three screens in front of him.\r\n\r\nHe’s in his home office, 45 minutes outside Portland, Maine, on the US East Coast.\r\n\r\nStroking his thick beard, he looks at his bookmarks bar.\r\n\r\nHe takes another sip before his coffee goes cold, inhales long and hard, then logs into the back end of one of his many websites.\r\n\r\nHe begins by choosing a subject. Which “lucky” politician will be on the receiving end of his attention today?\r\n\r\nBill Clinton? Hillary Clinton? One of the Obamas?\r\n\r\nOr maybe the subject of his story won’t be a person, but a policy. Gun control? Police brutality? Feminism? Anything that will push buttons.\r\n\r\n
12	The truth behind Japan's mysterious 'Atlantis'	2020-04-02 14:10:15.209	5ed5a62f-f88b-4fa8-a627-81b0858263e4.Снимок экрана от 2020-04-02 14-09-50.png	Beneath the coastal waters of the Japanese island of Yonaguni lies a series of mysterious rock formations. Since its discovery nearly 35 years ago, the strangely symmetrical shapes and structures of the 'Yonaguni Monument' have led to fierce debate over its true origins.\r\n\r\nCould the odd shapes of this structure really have been carved by a lost Japanese civilisation many thousands of years ago, or is it just a stunning example of natural geology deep beneath the sea?
13	Classic cars reborn as electric vehicles	2020-04-02 14:12:19.217	\N	classic E-type Jaguar was ridden by newlyweds Britain's Prince Harry and Meghan Markle on the way to their evening wedding reception in May, 2018. The 1968 model had been refitted as a zero emissions vehicle prototype. It's one of a number of classic cars getting an electric makeover. STEVE PARSONS/AFP/AFP/Getty Images\r\nConceptual designs for the the E-type Zero are based on the 1968 Series 1.5 Jaguar E-Type Roadster. The car will boast an acceleration of 0-62 mph in 5.5 seconds. Jaguar Land Rover\r\n                    
14	Linux Mint 20 is 64-bit only, based on Ubuntu 20.04, and named 'Ulyana'	2020-04-02 14:14:20.637	c7f85b4b-91a6-4a81-873c-d1163afcbd8e.Снимок экрана от 2020-04-02 14-14-05.png	Linux Mint is great operating system. It is based on the excellent Ubuntu and features three great desktop environment options -- Cinnamon, MATE and Xfce. While it is a smart choice for Linux beginners, it is also good for experts too.\r\n\r\nToday, we learn some new details about the upcoming Linux Mint 20. While most of the newly revealed information is positive, there is one thing that is sure to upset many Linux Mint users.\r\nFirst things first, Linux Mint 20 will be based on the upcoming Ubuntu 20.04. This shouldn't come as a surprise, as Mint only uses Long Term Support versions of Ubuntu, and 20.04 will be an LTS. We also now know the name of Linux Mint 20. The Mint team always uses female names, and this time they chose "Ulyana." This is apparently a Russian name meaning "youthful."
15	Amazon Prime allows in-app purchases for Apple users	2020-04-02 14:15:17.994	\N	Amazon has begun allowing iPhone and Apple TV users to make in-app purchases and rent movies and shows from Amazon Prime.\r\n\r\nThe move is a reversal for Amazon which had forced Prime users to leave the app and go to Amazon's website via a browser to make purchases.\r\n\r\nIt is also a change for Apple which will allow Amazon to use its own payment system.\r\n\r\nThe changes apply to Amazon Prime users in the US, UK and Germany.\r\n\r\nPeople using iPhones, iPads and iPod touches as well as Apple TVs began to see the changes on Wednesday.\r\n\r\nA message from Amazon alerted users to the new feature when they opened the app.\r\n\r\n"Browse, rent, or buy new release movies, popular TV shows, and more - now within the app," it read.\r\n\r\nPrior to the change users of iOS or tvOS could only watch shows or films they had purchased directly from Amazon's website or on another device such as an Android phone or Amazon's Fire TV. If an Apple user wanted to buy a video from Prime they had to complete the transaction on Amazon's website.
16	Man Behind Hide The Pain Harold Meme On His Unexpected Viral Fame - 1	2020-04-02 14:16:55.894	\N	                        Man Behind Hide The Pain Harold Meme On His Unexpected Viral Fame The man behind viral meme 'Hide The Pain Harold' has spoken about the surreal experience of becoming internet famous without even trying - admitting he felt annoyed initially, while his wife simply hated it all... until the commercial work started coming through, that is. Harold is actually a Hungarian man called Arató András, who told LADbible last year that he had found viral fame after a photo of him smiling with a pained look in his eyes surfaced online. Nine years ago - when András was still working as an electrical engineer - a photographer had seen a holiday picture of his on the internet, and asked him for a 'trial shooting'. András agreed, but was unsure what the stock photos would be used for. It wasn't until later that year that he realised what had happened when he did a reverse image search on a photo of himself. He was everywhere. In a new interview with the Guardian, András said: "Once the memes were out in the world, journalists began to contact me, and wanted to come to my home to interview me. "My wife hated it: she thought it interfered in our private life and didn't like the way I was portrayed.\r\n                    
17	Man Behind Hide The Pain Harold Meme On His Unexpected Viral Fame - 2	2020-04-02 14:17:05.567	e38b62a1-ac9c-4d58-9e83-4f75f95508f4.Снимок экрана от 2020-04-02 13-55-21.png	                                                Man Behind Hide The Pain Harold Meme On His Unexpected Viral Fame The man behind viral meme 'Hide The Pain Harold' has spoken about the surreal experience of becoming internet famous without even trying - admitting he felt annoyed initially, while his wife simply hated it all... until the commercial work started coming through, that is. Harold is actually a Hungarian man called Arató András, who told LADbible last year that he had found viral fame after a photo of him smiling with a pained look in his eyes surfaced online. Nine years ago - when András was still working as an electrical engineer - a photographer had seen a holiday picture of his on the internet, and asked him for a 'trial shooting'. András agreed, but was unsure what the stock photos would be used for. It wasn't until later that year that he realised what had happened when he did a reverse image search on a photo of himself. He was everywhere. In a new interview with the Guardian, András said: "Once the memes were out in the world, journalists began to contact me, and wanted to come to my home to interview me. "My wife hated it: she thought it interfered in our private life and didn't like the way I was portrayed.\r\n                    \r\n                    
18	Man Behind Hide The Pain Harold Meme On His Unexpected Viral Fame - 3	2020-04-02 14:17:09.782	\N	                                                                        Man Behind Hide The Pain Harold Meme On His Unexpected Viral Fame The man behind viral meme 'Hide The Pain Harold' has spoken about the surreal experience of becoming internet famous without even trying - admitting he felt annoyed initially, while his wife simply hated it all... until the commercial work started coming through, that is. Harold is actually a Hungarian man called Arató András, who told LADbible last year that he had found viral fame after a photo of him smiling with a pained look in his eyes surfaced online. Nine years ago - when András was still working as an electrical engineer - a photographer had seen a holiday picture of his on the internet, and asked him for a 'trial shooting'. András agreed, but was unsure what the stock photos would be used for. It wasn't until later that year that he realised what had happened when he did a reverse image search on a photo of himself. He was everywhere. In a new interview with the Guardian, András said: "Once the memes were out in the world, journalists began to contact me, and wanted to come to my home to interview me. "My wife hated it: she thought it interfered in our private life and didn't like the way I was portrayed.\r\n                    \r\n                    \r\n                    
19	Man Behind Hide The Pain Harold Meme On His Unexpected Viral Fame - 4	2020-04-02 14:17:16.059	\N	                                                                                                Man Behind Hide The Pain Harold Meme On His Unexpected Viral Fame The man behind viral meme 'Hide The Pain Harold' has spoken about the surreal experience of becoming internet famous without even trying - admitting he felt annoyed initially, while his wife simply hated it all... until the commercial work started coming through, that is. Harold is actually a Hungarian man called Arató András, who told LADbible last year that he had found viral fame after a photo of him smiling with a pained look in his eyes surfaced online. Nine years ago - when András was still working as an electrical engineer - a photographer had seen a holiday picture of his on the internet, and asked him for a 'trial shooting'. András agreed, but was unsure what the stock photos would be used for. It wasn't until later that year that he realised what had happened when he did a reverse image search on a photo of himself. He was everywhere. In a new interview with the Guardian, András said: "Once the memes were out in the world, journalists began to contact me, and wanted to come to my home to interview me. "My wife hated it: she thought it interfered in our private life and didn't like the way I was portrayed.\r\n                    \r\n                    \r\n                    \r\n                    
20	Man Behind Hide The Pain Harold Meme On His Unexpected Viral Fame - 5	2020-04-02 14:17:33.561	2f432a69-528f-4fb3-b6b5-9768f2dd95b3.Снимок экрана от 2020-04-02 13-55-21.png	                                                                                                                        Man Behind Hide The Pain Harold Meme On His Unexpected Viral Fame The man behind viral meme 'Hide The Pain Harold' has spoken about the surreal experience of becoming internet famous without even trying - admitting he felt annoyed initially, while his wife simply hated it all... until the commercial work started coming through, that is. Harold is actually a Hungarian man called Arató András, who told LADbible last year that he had found viral fame after a photo of him smiling with a pained look in his eyes surfaced online. Nine years ago - when András was still working as an electrical engineer - a photographer had seen a holiday picture of his on the internet, and asked him for a 'trial shooting'. András agreed, but was unsure what the stock photos would be used for. It wasn't until later that year that he realised what had happened when he did a reverse image search on a photo of himself. He was everywhere. In a new interview with the Guardian, András said: "Once the memes were out in the world, journalists began to contact me, and wanted to come to my home to interview me. "My wife hated it: she thought it interfered in our private life and didn't like the way I was portrayed.\r\n                    \r\n                    \r\n                    \r\n                    \r\n                    
21	Teddy Roosevelt on a Moose: Fake News, or Fake Fake News??	2020-04-02 14:18:24.935	a2deaabf-6fb5-4759-a597-e1bda4784b1e.Снимок экрана от 2020-04-02 13-48-36.png	An old photo of a US president on mooseback is often used to illustrate the deep roots of media deception. The real story may not back that up. PRESIDENT THEODORE ROOSEVELT was larger than life, in many ways. He explored the Amazon. He delivered a campaign speech after being shot. (“The bullet is in me now, so that I cannot make a very long speech, but I will try my best,” he told the horrified audience.) He was the very first president both to drive a car and fly in a plane. He got into a bar fight in a tiny town called Wibaux, Montana. And on at least one occasion, Roosevelt rode in a saddle on a moose. There’s even a photo of that last thing: Teddy in his iconic white safari hat, perched atop an antlered beast as it fords a body of water flanked by evergreens. 
22	The truth behind Japan's mysterious 'Atlantis' - 2	2020-04-02 14:19:06.164	5ff6880c-dda5-45e3-b9a8-d225355effdf.Снимок экрана от 2020-04-02 14-09-50.png	Beneath the coastal waters of the Japanese island of Yonaguni lies a series of mysterious rock formations. Since its discovery nearly 35 years ago, the strangely symmetrical shapes and structures of the 'Yonaguni Monument' have led to fierce debate over its true origins. Could the odd shapes of this structure really have been carved by a lost Japanese civilisation many thousands of years ago, or is it just a stunning example of natural geology deep beneath the sea?
\.


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 22, true);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: news news_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_title_key UNIQUE (title);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

