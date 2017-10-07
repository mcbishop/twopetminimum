--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: pets; Type: TABLE; Schema: public; Owner: meghb
--

CREATE TABLE pets (
    pet_id integer NOT NULL,
    shelter_id character varying(20),
    pet_name character varying(100),
    pet_description text,
    pet_type character varying(50),
    lastupdate timestamp without time zone
);


ALTER TABLE pets OWNER TO meghb;

--
-- Name: pets_pet_id_seq; Type: SEQUENCE; Schema: public; Owner: meghb
--

CREATE SEQUENCE pets_pet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pets_pet_id_seq OWNER TO meghb;

--
-- Name: pets_pet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meghb
--

ALTER SEQUENCE pets_pet_id_seq OWNED BY pets.pet_id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: meghb
--

CREATE TABLE photos (
    photo_id integer NOT NULL,
    pet_id integer,
    pf_id character varying(5),
    photo_size character varying(5),
    photo_text character varying(200)
);


ALTER TABLE photos OWNER TO meghb;

--
-- Name: photos_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: meghb
--

CREATE SEQUENCE photos_photo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE photos_photo_id_seq OWNER TO meghb;

--
-- Name: photos_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: meghb
--

ALTER SEQUENCE photos_photo_id_seq OWNED BY photos.photo_id;


--
-- Name: shelters; Type: TABLE; Schema: public; Owner: meghb
--

CREATE TABLE shelters (
    shelter_id character varying(20) NOT NULL,
    shelter_name character varying(100)
);


ALTER TABLE shelters OWNER TO meghb;

--
-- Name: pets pet_id; Type: DEFAULT; Schema: public; Owner: meghb
--

ALTER TABLE ONLY pets ALTER COLUMN pet_id SET DEFAULT nextval('pets_pet_id_seq'::regclass);


--
-- Name: photos photo_id; Type: DEFAULT; Schema: public; Owner: meghb
--

ALTER TABLE ONLY photos ALTER COLUMN photo_id SET DEFAULT nextval('photos_photo_id_seq'::regclass);


--
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: meghb
--

COPY pets (pet_id, shelter_id, pet_name, pet_description, pet_type, lastupdate) FROM stdin;
38993423	CA226	Amy and Tracy	Amy and Tracy are very playful and social. Amy is white with black, and Tracy is grey and white. Amy is leader of the pack. They both love playing with toys, chasing the wand toy, and are very affectionate. Being that they both have white noses, and Amy is predominantly white,  it is best if they are Indoor Only cats to protect them from skin cancer. They will do best with another kitten for playmate and companion. They would love to be adopted together.\t\n\nAmy and Tracy are vaccinated, tested negative for FIV and Feline Leukemia, and are microchipped.	Cat	2017-08-05 09:23:56
33948330	CA226	Erza and Lux	Erza i was born April 7, 2015. She's very sweet, playful and loving. She and Lux are both affectionate, and love petting. They will do best in a calm home.\n\n Erza and Lux are vaccinated, tested negative for FIV and Feline Leukemia, and are microchipped.\n\n\nSee youtube video of Cinder here:\nhttps://www.youtube.com/watch?v=ncbUWgjAr64	Cat	2017-09-15 20:32:20
38481286	CA226	Unagi and Sashmi	Unagi and Sashimi are brother and sister, rescued and adopted in 2015. They now need a new home as their owners cannot keep them. Unagi is lighter in color and male. They are excellent pets and they get along very well together and with people. They are mostly indoor cats but love hanging on the outside balcony basking in the sun, bird watching, and listening to all the sounds. Besides playing with their toys, they also love to sleep, take naps, and receive a good brushing of their beautiful grey coats. They are extremely loving, gentle, adorable, healthy, and a whole lot of fun. They are a bonded pair and need to find a loving home together.\n\nUnagi and Sashimi are vaccinated, tested negative for FIV and Feline Leukemia, and are microchipped.	Cat	2017-09-16 09:37:46
39389552	CA226	Izzy and Maggie	Izzy and Maggie are a striking pair, Izzy is a Siamese mix, and Maggie is a beautiful tortoiseshell with green eyes. Maggie is super affectionate and a lap cat. Izzy is too busy to sit in laps but loves to be petted. Both are very playful, and love playing together. Maggie had 3 broken legs and pelvis when rescued, and has totally healed. They are a pair and would love to be adopted together.\n\t\nIzzy and Maggie are vaccinated, tested negative for FIV and Feline Leukemia, and are microchipped.	Cat	2017-09-16 09:33:05
39389419	CA226	Minna and Chester	Minna and Chester are very playful, sweet, and affectionate. Minna is a dilute tortie girl, and Chester is a light orange tabby. Minna jumps high in the air to catch the wand toy. Both love to be petted and cuddle. Chester is a little more shy. They will do best in a calm home without small children. They are a pair and will do best adopted together.\n\t\nMinna and Chester are vaccinated, tested negative for FIV and Feline Leukemia, and are microchipped.	Cat	2017-09-16 09:33:38
39389295	CA226	Bertie and Billy	Bertie and Billy are two very affectionate and playful brothers. Bertie is grey, and Billy is grey and white. Both have a fluffy tail and are very handsome boys. They love to be petted and held. Wand toys ate a favorite, also the laser toy. Bertie and Billy love to play and snuggle with each other. They are bonded brothers and will do best adopted together.\n\t\nBertie and Billy are vaccinated, tested negative for FIV and Feline Leukemia, and are microchipped.	Cat	2017-09-16 09:34:08
28854051	CA226	Bonnie and Emmy	Bonnie and Emmy are loving and playful cats who enjoy being petted.  They were born August 21, 2013.  Bonnie is white and buff, and Emmy is white with black.  Bonnie is more timid of the two and does not like to be picked up, but she likes petting.  She enjoys being around Emmy. Emmy loves to be held and cuddled. She will follow you everywhere, be the first to greet you at the door and lay her head on your foot.  They are very bonded and love to cuddle and sleep together and need to be adopted together. Both cats are mostly white and they are Indoor cats.  They will do best in a calm home without very small children. Older children are fine.\n\nEmmy has tested positive for the FIV antibody but is asymptomatic and healthy.  She must be an indoor cat to protect her health.  FIV Positive cats can live long happy lives and Emmy is a healthy cat.  \nInfo on FIV: http://www.bestfriends.org/theanimals/petcare/cats_fiv.cfm\n\nEmmy loves to chew plastic bags so she will need a home that does not leave plastic bags laying around. (this is her only addiction.)\n\nBonnie is vaccinated and tested negative for FIV and Feline Leukemia, and is microchipped.\nEmmy is vaccinated, tested negative for Feline Leukemia, but positive for FIV, and is microchipped.	Cat	2017-09-16 09:48:09
38993382	CA226	Gavin and Greta	Gavin and Greta are both very affectionate and purr a lot. They will lie on their foster when seated.  Both kitten are very playful, and love chasing ping pong balls, furry mice toys, and the wand toy. They are very active and will do best with another kitten for companion and playmate. They would love to be adopted together.\t\n\nGavin and Greta are vaccinated, tested negative for FIV and Feline Leukemia, and are microchipped.	Cat	2017-09-16 06:47:48
39569892	CA226	Davey and Marie	Davey and Marie are friendly and very playful kittens.  Davey is black and white, and Marie is a Siamese Lynx-point mix.  They love being petted and held. Davey is very outgoing, and Marie a little shy. They love playing, sleeping, and snuggling together. They are a bonded pair and need to be adopted together.\n\nDavey and Marie are vaccinated, tested negative for FIV and Feline Leukemia, and are microchipped.	Cat	2017-10-05 10:12:07
39579020	CA226	Benji and Chester	Benji and Chester are very playful, and love to be petted.  Benji is a Siamese Flame-point mix, and Chester is an orange tabby.  Benji is a bit shy but will come out of his shell once he gets to know you. Both love the wand toy and laser.  Benji, Chester, and Minna are fostered together and all like playing, snuggling and sleeping together.  Benji will do best in a calm home without small children. Benji and Chester are best friends and need to be adopted together. \n\nBenji and Chester are vaccinated, tested negative for FIV and Feline Leukemia, and are microchipped.	Cat	2017-10-06 07:14:24
39579183	CA226	Kovu and Kingston	Kovu and Kingston are playful brothers. Kovu is a brown tabby with beautiful markings, and his brother Kingston is a sleek black cat. They are both very sweet, playful and loving, as well as curious and responsive. They are very affectionate and love petting. They have gone outside in a secure yard and sleep indoor, but can adapt to an indoor only home. They are a bonded pair and need to be adopted together. They will do best in a calm home. \n\nKovu and Kingston are vaccinated and mictochipped.	Cat	2017-10-06 07:44:39
38522710	CA935	Mittens and his brothers	Please note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Samantha at samnalx5@yahoo.com\n\nA full description will be added shortly.\n\nPlease note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Samantha at samnalx5@yahoo.com\n\nVisit www.MaineCoonAdoptions.com for adoption information and applications, our adoptable kitties and more, and join us on Facebook for more pictures, videos, chat and fun at www.facebook.com/MaineCoonAdoptions. June 20, 2017, 6:50 pm	Cat	2017-06-21 00:10:20
38041180	CA935	Riley & Will [CP]	Please note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Allison at allison_r1596@sbcglobal.net or 530-957-8584\n\n Hello! We are Riley and Will, two brothers who need a new forever home. We are best friends and have lived together since birth (in 2008). We love to play with each other and snuggle with each other and are just really great indoor cats who enjoy catching some sun rays and hanging out. Will is the more affectionate of the two of us and under the right circumstances will be an ideal lap cat. Riley is just as loving but a bit more independent â he loves attention, just on his own terms. We get along with everybody â other cats, children, probably even dogs. We have been neutered, tested negative and were checked out at the vet a year ago. We are in Placerville so if youâd like to learn more, contact Allison and she can tell you all about us.\n\n Please note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Allison at allison_r1596@sbcglobal.net or 530-957-8584\n\n Visit www.MaineCoonAdoptions.com for adoption information and applications, our adoptable kitties and more, and join us on Facebook for more pictures, videos, chat and fun at www.facebook.com/MaineCoonAdoptions.	Cat	2017-05-12 20:35:04
38104448	CA935	Rusty & Tigger [CP]	Please note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Gina at ginamsimi@gmail.com or 415-710-9896\n\n Hello! We are Rusty and Tigger, two brothers and best friends in need of a new forever home after our owner got very sick and now needs to move into a facility that doesnât take kitties. As you know, big orange kitties are considered the gentle giants of the cat world and we are no exception. We are very laid back and easy going and, like many Maine Coons, people describe us as being very dog like in our behavior. Dogs of the cat world, people, thatâs us. Rusty has the orange-and-white fur and Tiggerâs is almost all orange. But weâre both big ole love bugs. We were born in 2002, have been neutered and are up to date on all our shots. If youâd like to learn more, contact Gina and she can tell you all about us.\n\n Please note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Gina at ginamsimi@gmail.com or 415-710-9896\n\n Visit www.MaineCoonAdoptions.com for adoption information and applications, our adoptable kitties and more, and join us on Facebook for more pictures, videos, chat and fun at www.facebook.com/MaineCoonAdoptions.	Cat	2017-05-19 01:55:05
38189165	CA935	**URGENT Gracie & Fredja [CP]	Please note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Scott & Carmen at carmenfwilliams@yahoo.com\n\n Hello! We are Gracie and Fredja, two lovely purebred Maine Coons in need of a new forever home after our human passed away. As you can see, we are both gorgeous, with all the wonderful attributes associated with Maine Coons. We are also quite loving and wonderful companions who would prefer a home with a stable routine and humans who are around to keep us company. We are very bonded so it would be especially wonderful if we could be adopted together. We were born in 2009, have been declawed, spayed and are up to date on our shots. We are in Aptos so if you would like to learn more, contact Scott and Carmen and they can tell you all about us.\n\n Please note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Scott & Carmen at carmenfwilliams@yahoo.com\n\n Visit www.MaineCoonAdoptions.com for adoption information and applications, our adoptable kitties and more, and join us on Facebook for more pictures, videos, chat and fun at www.facebook.com/MaineCoonAdoptions.	Cat	2017-06-02 02:21:06
38630210	CA935	Walt & Walker	Please contact MCA: No Calls (Elaine) (mainecoonadoptions@gmail.com) for more information about this pet.Hi Folks! We are Walt and Walker and letâs face it, we are just plain adorable little guys. Playful, outgoing, happy, sweet, curious, and pretty confident, we are brothers who are extremely attached to each other and we need to be adopted together. We hang out together all the time and when itâs time for a nap or a log sleep, our foster Mom pretty much always finds us curled up together (one of our heads is always resting somewhere on the otherâs body!) Now me, Walt, just take a look at my video and you may be able to hear my purring while I play with my catnip fish toy: https://youtu.be/D6arA8OjKaY As for me, Walker, Iâm a bit shy in my video but Iâve warmed WAY up since then! https://youtu.be/MLUb8Ze0Pv4 We were born in mid-April 2017 and am neutered, tested negative, up to date with our shot, and microchipped. We are great with other cats, probably fine with well-trained dogs, and probably ok with children over the age of ten. We are living in a private foster home, so please fill out an adoption application at www.mainecoonadoptions.com\n\nVisit www.MaineCoonAdoptions.com for adoption information and applications, our adoptable kitties and more, and join us on Facebook for more pictures, videos, chat and fun at www.facebook.com/MaineCoonAdoptions. June 30, 2017, 11:50 am	Cat	2017-06-30 16:53:29
38664421	CA935	Roxy and Buster	Please note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Jessica at 510-816-5931\n\nMust find home by July 8th!!! -\n\nMeet Buster & Roxie, 3-yr old litter mates who have always known life together. They are as precious as they are adorable. Buster, the grey kitty, is incredibly loving & affectionate. Roxy, the white kitty, has light calico markings and she is also a sweetie-pie. Her personality is a bit more confident than her brother's, and both cats are sweet, playful, & wonderful companion kitties for each other & for their human. They l\n...\nove to play together & nap together as well as snuggling up with their special human. They are not fond of being picked up & held, but that's okay- they prefer to hop up on the seat (or bed) & settle in beside you. They currently enjoy indoor/outdoor life, with Buster being the one who likes to go outside more, while Roxy is more of an "inside" girl. They need to be rehomed into a house that has no dogs, as Buster is deathly afraid of them, and Roxy has been known to swat at them.. so best that they go into a dog-free home. Both Buster & Roxy are neutered & up to date on their vaccines. A living arrangement was set, but the person recently backed out of the agreement, and now their current owner needs everyone's help to make sure these kitties find a loving home, very quickly.\n\nPlease note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Jessica phone 510-816-5931 and/or email: jessielee215@aol.com\n\nVisit www.MaineCoonAdoptions.com for adoption information and applications, our adoptable kitties and more, and join us on Facebook for more pictures, videos, chat and fun at www.facebook.com/MaineCoonAdoptions. July 4, 2017, 8:38 pm	Cat	2017-07-05 02:47:30
38664420	CA935	Buster and Roxie	URGENT - Please SHARE - Fremont, San Francisco Bay Area\n\nBUSTER AND ROXY NEED A NEW HOME BY JULY 8th!\n\nMeet Buster & Roxie, 3-yr old litter mates who have always known life together. They are as precious as they are adorable. Buster, the grey kitty, is incredibly loving & affectionate. Roxy, the white kitty, has light calico markings and she is also a sweetie-pie. Her personality is a bit more confident than her brother's, and both cats are sweet, playful, & wonderful companion kitties for each other & for their human. They l\n...\nove to play together & nap together as well as snuggling up with their special human. They are not fond of being picked up & held, but that's okay- they prefer to hop up on the seat (or bed) & settle in beside you. They currently enjoy indoor/outdoor life, with Buster being the one who likes to go outside more, while Roxy is more of an "inside" girl. They need to be rehomed into a house that has no dogs, as Buster is deathly afraid of them, and Roxy has been known to swat at them.. so best that they go into a dog-free home. Both Buster & Roxy are neutered & up to date on their vaccines. A living arrangement was set, but their person recently backed out of the agreement, and now their current owner needs everyone's help to make sure these kitties find a loving home, very quickly.\n\nBuster and Roxie are about three years old and from the same litter. They are both fairly small cats. If it all possible they would love to stay together they are very loving with each other. And never been apart.\n\nContact Jessica 510 816-5931\n\nPlease note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Jessica at 510-816-5931. email: jessielee215@aol.com\n\nVisit www.MaineCoonAdoptions.com for adoption information and applications, our adoptable kitties and more, and join us on Facebook for more pictures, videos, chat and fun at www.facebook.com/MaineCoonAdoptions. July 4, 2017, 8:38 pm	Cat	2017-07-05 02:47:30
37955956	CA271	Zach and Kayla	Zach (male) and Kayla (female) (a.k.a âZaylaâ, their celebrity power-couple nickname) are a cute pair who are part of our Pet Survivor Program (PSP). Sadly, their owner passed away and left them to us so that we could find them a new loving home. Because they are part of this program, if you can provide a loving home for them, we will cover their medical costs for the rest of their lives. \n\nThey are a shy pair and take a while to feel comfortable around people. They are masters at hiding, but once they get to know you, they are very sweet and enjoy being pet and brushed. Theyâll even drool when being pet because they love it so much. Kayla is a little more outgoing than Zach, but is still shy. Please help these two sweetie pies live out the rest of their lives in a loving home! They are 9 years old.\n\nThey are bonded and must stay together.\n\n** WANT MORE INFO OR THINKING OF ADOPTING THIS PET? ** -------- For a QUICK RESPONSE go to -- WWW.HOPALONG.ORG -- and complete an adoption application. It is not a commitment to adopt, it just begins the process and shows interest in a particular animal. Someone will contact you by phone or email within 2 full business days to interview you or inform you on the status of your application.	Cat	2017-09-08 18:49:47
38233896	CA935	Audrey & Licorice [CP]	Please contact Marcia Slackman (mslack199@gmail.com) for more information about this pet.Please note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Marcia at mslack199@gmail.com or 510-734-9924\n\nHello! We are Audrey and Licorice, two gorgeous and playful kitties in need of a forever home. As you can see, we are quite the elegant matched pair and quite bonded - we enjoy cuddling and chasing and grooming each other. We are also still quite young - born in June 2016 - and at the perfect age where weâve outgrown all that kitten madness but are young and playful and quite affectionate. Audrey is the most affectionate and will purr as soon as you get near her. She has yellow eyes, is super sweet, playful and healthy and has a white wisp on her chest. Licorice is quite handsome and has a long sleek body set off by amazing amber eyes. He looks a bit like a panther (and perhaps has some Burmese in him) and is very gentle and a little shy, although he will talk when he wants something (perhaps a little pet or some treats or toys). We have been fixed and are ready for our forever home. If youâd like to learn more, contact Marcia and she can tell you all about us. Or you can check out our video: https://youtu.be/Urau4lnoAPo\n\nPlease note that this is a courtesy Marcia at mslack199@gmail.com or 510-734-9924\n\nVisit www.MaineCoonAdoptions.com for adoption information and applications, our adoptable kitties and more, and join us on Facebook for more pictures, videos, chat and fun at www.facebook.com/MaineCoonAdoptions. 10/6/17 2:29 PM	Cat	2017-10-06 22:40:32
39507544	CA935	Princess & Maddie [CP]	Please note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Katee at kateeza24@gmail.com or 510-205-0867\n\nHello! We are Princess and Maddy, two best friends (almost twins, even!) in need of a forever home, hopefully together. We are both very sweet and affectionate, although we can be a little shy at first. We do both really love affection, though. Princess, who has a little more yellow in her eyes and a little more white in her fur, is the sweetest thing you will ever meet and has a lovely purr that she sometimes leaves on as if conversing with you. Sheâs also the first one to come and greet you and rub on you and show you her belly - which has the softest fur - and then snuggle right in. Maddy is not quite as directly affectionate but likes to make sure sheâs touching you when she falls asleep. We are both real snuggle types and with a little time and patience will make wonderful companions and lap cats. We were born in 2012, have been spayed and are currently in Oakland so if youâd like to learn more, contact Katee and she can tell you all about us.. Here's a short video of Maddie\n\nPlease note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Katee at kateeza24@gmail.com or 510-205-0867\n\nVisit www.MaineCoonAdoptions.com for adoption information and applications, our adoptable kitties and more, and join us on Facebook for more pictures, videos, chat and fun at www.facebook.com/MaineCoonAdoptions. 10/6/17 2:29 PM	Cat	2017-10-06 22:40:33
39350615	CA935	Oscar and Max [CP]	Please note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Stephanie at stelar85@gmail.com\n\nHello! Iâm Oscar, and this is my brother, Max. Let me just say up front that I love my people. I like hanging out with you and checking on what youâre doing, and when you go out, I canât wait until you get home. I will also protect you from any monsters lurking in bags or boxesâthose will be investigated immediately. Iâm a pretty relaxed guy and am always up for a game. Or a nap in your lap, whateverâs good for you.\n\nNow, Max, he is deeply committed to the naps and the petting. If you lie down, he will be on your chest ready for attention and will stay in your lap for hours. Heâs also a great conversationalist. Heâs a little more nervous than I am, but still a pretty friendly guy, even with strangers. Also? He has a thing about string. Cannot resist it.\n\nWant more info? Get in touch with Stephanie, and sheâll give you the lowdown. Meanwhile, check out our video.\n\nPlease note that this is a courtesy post; this cat is not with Maine Coon Adoptions. For more information, please contact Stephanie at stelar85@gmail.com\n\nVisit www.MaineCoonAdoptions.com for adoption information and applications, our adoptable kitties and more, and join us on Facebook for more pictures, videos, chat and fun at www.facebook.com/MaineCoonAdoptions. 10/6/17 2:29 PM	Cat	2017-10-06 22:40:33
34353536	CA39	Willow & Zoey	Video Available! Hi there, weâre Willow and Zoey! Weâre both medium-sized spayed female cats who are about 7 years old. Our coats are a combination of Seal Point and Tortoiseshell, which means that theyâre a pretty patchwork of cream and brown, plus we have breathtaking blue eyes. Weâre easy to tell apart because Willowâs coat is a little longer than Zoeyâs, and Zoey has darker coloring on the right side of her pretty face while Willow has darker coloring on her left. Weâre a bonded pair, which means that weâre such good pals that we canât stand to be apart and will need to be adopted together. Zoey is a sweet, friendly, and gentle girl who LOVES to sit in laps and get brushed and scratched as well as to play with fun toys. Willow is a bit more shy, but she is also a nice and affectionate girl who loves attention. We would do best in an adult-only home where we can be the only kitties, and we get along with some dogs. Ask for Willow and Zoey using our special ID numbers A579954 & A579955. We canât wait to meet you!\n\n\n\n\n\nUnless otherwise indicated, adoptable animals are located at our Lantos Center for Compassion at 1450 Rollins Road, Burlingame, CA 94010. Our hours are weekdays from 11am-7pm and weekends from 11am-6pm (closed major holidays). Interested adopters must arrive at least 1 hour before close. \n \n We do our best to update our listings regularly, but we canât guarantee every animal you see is still available. Itâs also typical for us to have animals who havenât had their photos taken yet, so you are welcome to visit our adoption center and have a look around!\n\n To check on an animal's adoption status, please call 650-340-7022 during normal business hours to speak with an adoption counselor or 650-340-7022 ext. 823 anytime to hear a recording of our available animals (updated each morning). Emails will be returned as soon as possible, but please allow up to 48 hours during busy adoption periods like weekends.	Cat	2017-06-01 21:30:55
37577681	CA39	Maggie & Sammy	Video Available Hi! We're Maggie & Sammy, we're looking for a home with room for two! We're a pair of bonded BFFs. Maggie is an 7-year-old medium black and white female cat, Sammy is an 8-year-old brown male tabby. We seem shy but we absolutely love head-to-toe affection.	Cat	2017-08-11 22:30:01
39065903	CA39	Kindred & Goblin	Video Available! Meow Meeeow Meoww Meowwâ¦that means nice to meet you! We're Kindred and Goblin and we would love to find a quiet home with a nice lap to curl up in. We can be a little bit shy at first but if you are patient you will soon find two lifelong friends in us. Kindred is the braver of the two, she is a 10 year old gal with pretty short white fur and a button pink nose. Goblin is a little bit shyer and he is a 10 year old guy with a medium length white coat and beautiful bushy tail. Because of our coloring, we should be indoor only and for families with small children, we suggest that you bring all family members to meet the new companion to make the best match possible. ID# A826381 & A826380	Cat	2017-08-11 22:31:53
38430197	CA387	LEAH, PIP and MELLIE Three seniors in need	This is the Animal Description Header\nThree sweet senior cats need a home! Their elderly owner is in failing health.; Please if you have a soft spot for kitties, these three need a place soon!; My name is Leah and I love curling up next to my favorite person on a couch. I am sleek and soft and used to the good indoor life. I am 15 years old and would be excellent in a quiet home with an older person or couple. My name is Pip and I?m 15 years old looking for a forever home. I?m loving and cuddly with wonderful, soft fur. My favorite activity is sleeping in the sun. I?m very gentle and an excellent companion, good with other cats.Hi my name is Mellie and I?m very shy. I live with 2 other cats, but would be more than happy to be my own. I?m 10 years old and not much trouble. I am an indoor only cat.These three cats have lived together but would be fine on their own. Their human companion has end-stage Ovarian cancer and wants desperately to find loving homes for her dear kitties. They have been a lovely presence in her life and we?re sure they would be in yours. Please call Rodney Paul (friend of their companion) at 510-788-0510 to learn more about these sweet seniors.; And/or, call Len to know more or meet these kitties! 415-850-4085.This is the Animal Description Footer\n8/27/17 4:51 PM	Cat	2017-08-27 23:55:54
38430209	CA387	MIRA, LICORICE, NALA, and SIMBA	This is the Animal Description Header\nWe are Licorice and Mira, two sweet and beautiful siblings looking for our; forever home. We are 7 months old, fixed and vaccinated, and like cat toys,; hanging out, and chasing each other around.; Licorice: I have an incredibly shiny black coat and deep golden eyes. I; love to explore, and also to cuddle and hang out on chairs and in new; places. I enjoy playing with toys with my foster mom. I am very gentle and; enjoy being stroked and will kind of dig in if you pet me behind the ears.; Mira: I am a grey tiger striped tabby teen. I'm a very expressive cat - my; eyes say a lot and foster mom says I'm stunning to look at. She really; can't stop taking my picture and petting me because she says I feel like; silk. That's fine with me, as I'm very mellow and love to be pet and; massaged around my ears and neck. I love playing chase with Licorice and the; other foster kittens, hanging out on a soft blanket with them, and also; snuggling into my favorite spot in the cat tree.; We have both been fixed and tested negative. If you'd like to learn more,; please contact Marcia at mslack199@gmail.com or 510-734-9924.'; 'Nala and Simba: Hello! We are Nala and Simba, sister & brother. We were rescued when we were really little, so we are very trusting of good humans. In fact, we are such social creatures that we start purring as soon as you look at us! We are happy playful kittens recently discovering our ability to climb, jump; and tumble. Life is pretty exciting, don't you think? We love other kitties; so are hoping to be adopted together or with one of our foster friends; (Audrey, Licorice and Mira) or into a house with a friendly resident kitty.; We will be fixed and up to date on our shots when it's time for our forever; home. If you'd like to learn more, contact Marcia and she can tell you all; about us. Please watch this very cute video of them:; https://www.youtube.com/watch?v=R_XpGCMtlzc&feature=youtu.be ; And this one called 'grooming and play': https://yoThis is the Animal Description Footer\n8/27/17 4:51 PM	Cat	2017-08-27 23:55:54
39213078	CA690	Hope and Hana	Hope and Hana are two adorable siamese sisters who are looking for a home together.  They really love each other (sleep together, groom each other) and we don't want to separate them.  They are still a little shy so would be best in a quieter home.   They would be fine in a home with another kitty,\n\nHope and Hana are fostered in Redwood City.   Hope has longhair and Hana has short-hair.  They are 3-4 months old as of Sept 2017.\n\nSF Bay Area adoptions only.\n\n\nIf you would be interested in adopting these two cuties, please download an adoption application from our Petfinder homepage and e-mail to adopt@homelesscatnetwork.org\n\n\nhttp://www.petfinder.com/shelters/CA690.html\n\n\nUnfortunately inquiries without applications cannot be responded to.  Posting will be removed when they are adopted.	Cat	2017-10-02 16:01:42
32879533	CA2193	Abby and Aspen	Please contact adopt@whis-purr.org for more information about this pet who is currently living in a foster home.\n\nGreetings from my foster home.  My name is Abby and I am mama to Ace, Allie, Aspen and Ashe.  I have Aspen with me now and it makes me so happyr.  I do miss my other kids but I hear that they are all in special homes of their very own now! I am a bit fearful and need to learn how to trust you all.  With me though you also will get my very special little man, Aspen.  I just wanted to pop my head in to let you know that we are here and hoping to find a special someone to spend our life with.   Won't you give us a chance?  Hope to meet you soon.\n\nIf you are interested in adopting these cats or any other one listed here please call 877-307-2747 or email adopt@whis-purr.org\n\nAll of the cats adopted from Whis-Purr Rescue are:\n\n Spayed/Neutered \n Current on vaccinations\n Micro-Chipped\n Tested for FIV/FeLV\n\n\nAdopt your new Fur-Ever best friend today!	Cat	2017-05-14 14:17:10
33317648	CA2193	Lola and Max	Please contact adopt@whis-purr.org  for more information about this pet who is currently enjoying the TLC of a foster home \n\nGreetings from our foster home!  We are Lola and Max!  We are very sweet kitties.  We were surrendered when our human mommy had to move to a nursing home.  I, Lola am a Lynxpoint Siamese and my brother is a gorgeous brown tabby!  As you can see, we are not tiny cats.  We are quite loving and heathy.  Wouldn't you love for us to come and live in your home with you?  We look forward to hearing from you soon and maybe you can even come by for a visit!  Or better yet let us visit you forever :)!   \n\nIf you are interested in adopting these cats or any other one listed here please call 877-307-2747 or email adopt@whis-purr.org\n\nAll of the cats adopted from Whis-Purr Rescue are:\n\n Spayed/Neutered \n Current on vaccinations\n Micro-Chipped\n Tested for FIV/FeLV\n\n\nAdopt your new Fur-Ever best friend today!	Cat	2017-05-14 14:17:10
38259369	CA2193	Maisey and Mason	Please contact adopt@whis-purr.org for more information about this pet who is on display at the new Peninsula Feed Store location, 346 El Camino Real in Redwood City, California\n\nGreetings!  We are Maisey and Mason.  We are currently living with our sibs, Maddox, Maudey and Maybell in the Kitty Run !.We are a very sweet pair looking for our forever home together.  We have been here for a bit now and am kind of shy but worth it.  Come and visit us and you will see.  See you soon!\n\nIf you are interested in adopting these cats or any other one listed here please call 877-307-2747 or email adopt@whis-purr.org\n\nAll of the cats adopted from Whis-Purr Rescue are:\n\n Spayed/Neutered \n Current on vaccinations\n Micro-Chipped\n Tested for FIV/FeLV\n\n\nAdopt your new Fur-Ever best friend today!	Cat	2017-06-06 01:30:11
39417633	CA2193	Sydney and Rosita	Please contact adopt@whis-purr.org for more information about this pet who is on display at Whis-Purr Rescue in the Peninsula Feed Store location., 346 El Camino Real in Redwood City, California\n\n\nHello there!  Our names are Sydney and Rosita and we are happy to meet you. We would like to tell you that while we are not born of the same mama, we do love each other and are quite rambunctious.  We have lots of toys but we are happy to share.  Do you want to come and black with us?\n\n\n\n\nIf you are interested in adopting these cats or any other one listed here please call 877-307-2747 or email adopt@whis-purr.org\n\n\nAll of the cats adopted from Whis-Purr Rescue are:\n\n\n Spayed/Neutered \n Current on vaccinations\n Micro-Chipped\n Tested for FIV/FeLV\n\n\nAdopt your new Fur-Ever best friend today!	Cat	2017-09-19 04:33:21
39417552	CA2193	Sweet Pea and Smudge	Please contact adopt@whis-purr.org for more information about this pet who is on display at Whis-Purr Rescue in the Peninsula Feed Store location, 346 El Camino Real in Redwood City, California\n\n\nHello, We are Sweet Pea and Smudge.  We are so adorable and are looking for our forever home together.  We are two peas in a pod, so to speak and we love to play and be with our people.  You can meet us today!  see you soon.!.\n\n\nIf you are interested in adopting these cats or any other one listed here please call 877-307-2747 or email adopt@whis-purr.org\n\n\nAll of the cats adopted from Whis-Purr Rescue are:\n\n\n Spayed/Neutered \n Current on vaccinations\n Micro-Chipped\n Tested for FIV/FeLV\n\n\nAdopt your new Fur-Ever best friend today!	Cat	2017-09-19 04:24:02
39161238	CA2193	Kiki and Kahlua	Please contact adopt@whis-purr.org for more information about this pet who is on display in the middle cage at Whis-Purr Rescue in the Peninsula Feed Store location, 346 El Camino Real in Redwood City, California\n \n\nKiki and Kahlua here. \n We are full of character and have a lot of love for all people.  We are happy to be your friend.  We love to play and cuddle.  Quite purry we are told!  Won't  you come and visit us soon!  We love you and cant wait to see who you are :)!!.\n\n\nIf you are interested in adopting these cats or any other one listed here please call 877-307-2747 or email adopt@whis-purr.org\n\n\nAll of the cats adopted from Whis-Purr Rescue are:\n\n\n Spayed/Neutered \n Current on vaccinations\n Micro-Chipped\n Tested for FIV/FeLV\n\n\nAdopt your new Fur-Ever best friend today!	Cat	2017-09-19 03:35:07
39416848	CA2193	Roy and Mason	Please contact adopt@San whis-purr.org for more information about this pet who is on display at Whis-Purr Rescue located in the Peninsula Feed Store building, 346 El Camino Real in Redwood City, California\n\n\nGreetings from the Kitty Run at our home in the Peninsula Feed Store.  We are Roy and Mason.\n Roy here... I adore my "big brother, Mason" .  We do look kind of alike and we do love each other.  Won't you come and visit us soon in the Kitty Run.  We are loves just waiting for you.   See you soon!\n\n\nIf you are interested in adopting these cats or any other one listed here please call 877-307-2747 or email adopt@whis-purr.org\n\n\nAll of the cats adopted from Whis-Purr Rescue are:\n\n\n Spayed/Neutered \n Current on vaccinations\n Micro-Chipped\n Tested for FIV/FeLV\n\n\nAdopt your new Fur-Ever best friend today!	Cat	2017-09-19 03:31:11
39225135	CA2193	Paulie and Priscilla	Please contact adopt@whis-purr.org for more information about this pet who is on display at Peninsula Feed Store, 346 El Camino Real in Redwood City, California\n\n\nHi there!  My name is Paulie and my best friend is Priscilla.  We have been together since real tiny ones.  We are so loving and friendly.  I am a polydactyl and I have a bunch of toes!    Right now we are hanging out in the Kitty Yoga Room with 8 of our other kitten friends.  Priscilla and I would like to find our forever home together. Be sure and ask to visit us soon.  We have yoga here on Saturdays and you are welcome to join us :).  \n\n\nIf you are interested in adopting these cats or any other one listed here please call 877-307-2747 or email adopt@whis-purr.org\n\n\nAll of the cats adopted from Whis-Purr Rescue are:\n\n\n Spayed/Neutered \n Current on vaccinations\n Micro-Chipped\n Tested for FIV/FeLV\n\n\nAdopt your new Fur-Ever best friend today!	Cat	2017-09-19 04:18:29
39417602	CA2193	Sage and Shadow	Please contact adopt@whis-purr.org for more information about this pet who is on display at Whis-Purr Rescue in the Peninsula Feed Store location, 346 El Camino Real in Redwood City, California\n\n\nGreetings from the kitty run!  Our names are Shadow and Sage.  I personally am called Shadow cause I follow you everywhere!  We are sister and brother and so much enjoy play times , running around and each other.  We are hoping for a visit from you soon.  How about it.  You would love to meet us, you know?  See you in a minute.\n\n\nIf you are interested in adopting these cats or any other one listed here please call 877-307-2747 or email adopt@whis-purr.org\n\n\nAll of the cats adopted from Whis-Purr Rescue are:\n\n\n Spayed/Neutered \n Current on vaccinations\n Micro-Chipped\n Tested for FIV/FeLV\n\n\nAdopt your new Fur-Ever best friend today!	Cat	2017-09-19 04:29:01
39161129	CA2193	Alvin & Archie	Please contact adopt@whis-purr.org for more information about this pet who is on display at the new Peninsula Feed Store, 346 El Camino Real in Redwood City, California\n\n\nGreetings from Cage 1 at the Peninsula Feed Store.  We are Alvin and Archie.  Our sister is Ava and our best friend in Arthur.  He has been with us for a very long time and part of our family.  We too would love to find our forever home together.  Please come and see us any time.  See you then, okay?\n\n\nIf you are interested in adopting these cats or any other one listed here please call 877-307-2747 or email adopt@whis-purr.org\n\n\nAll of the cats adopted from Whis-Purr Rescue are:\n\n\n Spayed/Neutered \n Current on vaccinations\n Micro-Chipped\n Tested for FIV/FeLV\n\n\nAdopt your new Fur-Ever best friend today!	Cat	2017-08-19 21:10:44
39226077	CA2193	Felicity and Lilly	Please contact adopt@whis-purr.org for more information about this pet who is on display at Peninsula Feed Store, 346 El Camino Real in Redwood City, California\n\n\nHello!  We are Felicity and Lilly and we are both Dilute Tortoiseshells.  We are also best friends.\n  We adore playing with each other and all of our friends in the Whis-Purr's Kitty Yoga Room.  We participate in Yoga every Saturday with other Yoga students and the instructor, but you can visit us any time... Just give Whis-Purr a call.  We hope to see you soon!\n\n\nIf you are interested in adopting these cats or any other one listed here please call 877-307-2747 or email adopt@whis-purr.org\n\n\nAll of the cats adopted from Whis-Purr Rescue are:\n\n\n Spayed/Neutered \n Current on vaccinations\n Micro-Chipped\n Tested for FIV/FeLV\n\n\nAdopt your new Fur-Ever best friend today!	Cat	2017-08-26 19:27:26
39226172	CA2193	Shiloh and Savannah	Please contact adopt@whis-purr.org for more information about this pet who is on display at Peninsula Feed Store, 346 El Camino Real in Redwood City, California\n\n\nHi!  We are Shiloh and Savannah.  So I just wanted to say as I am speaking for my best friend Savannah as well... I am an amazing and deep soul.  I adore being pet, a bit shy but love belly rubs and snuggles... on my terms of course.  Now Savannah is an all star soccer player.  Give her a ball and she is gone all over the place.  She is REALLY good.  Savannah and I love each other even though we are not sibs,\n we are the best of friends.  We are kicking it here in our Kitty Yoga Room. \n Come and see us!\n\n\nIf you are interested in adopting these cats or any other one listed here please call 877-307-2747 or email adopt@whis-purr.org\n\n\nAll of the cats adopted from Whis-Purr Rescue are:\n\n\n Spayed/Neutered \n Current on vaccinations\n Micro-Chipped\n Tested for FIV/FeLV\n\n\nAdopt your new Fur-Ever best friend today!	Cat	2017-08-26 19:36:10
39226331	CA2193	Stella and Scotty	Please contact adopt@whis-purr.org for more information about this pet who is on display at Peninsula Feed Store, 346 El Camino Real in Redwood City, California\n\n\nGreetings from the Kitty Yoga Room.  We are Scotty and Stella,  Stella is my great friend and I am also here with my brother Sammy and my sister Sissy.  I am very unique in that I am a tortoiseshell wannabe.  I am black but I have orange streaks throughout my coat!  Stella is absolutely adorable and we both love to be around people.\n  Come on and visit us soon!\n\n\nIf you are interested in adopting these cats or any other one listed here please call 877-307-2747 or email adopt@whis-purr.org\n\n\nAll of the cats adopted from Whis-Purr Rescue are:\n\n\n Spayed/Neutered \n Current on vaccinations\n Micro-Chipped\n Tested for FIV/FeLV\n\n\nAdopt your new Fur-Ever best friend today!	Cat	2017-08-26 19:58:23
39226352	CA2193	Sissy and Sammy	Please contact adopt@whis-purr.org for more information about this pet who is on display at Peninsula Feed Store, 346 El Camino Real in Redwood City, California\n\n\nHello... We are Sissy and Sammy, sibs to Scotty and Stella's good friend.  We are so adorable and sweet.  We love to run around and play with each other and our friends and are really looking forward to expanding our friends as we will be meeting new people in the Kitty Yoga Room.  Maybe you can come too!  Looking forward to meeting you.  See you soon!\n\n\nIf you are interested in adopting these cats or any other one listed here please call 877-307-2747 or email adopt@whis-purr.org\n\n\nAll of the cats adopted from Whis-Purr Rescue are:\n\n\n Spayed/Neutered \n Current on vaccinations\n Micro-Chipped\n Tested for FIV/FeLV\n\n\nAdopt your new Fur-Ever best friend today!	Cat	2017-08-26 20:05:23
39567420	CA575	Tick & Tack	Playful cute bonded pair of girls!!!!These are two bonded playful girls. Love to be held and played with with. Contact Carol Storey text 925-872-3963. Shown on Sunday's 1-4 at Pet Food Express Pleasant Hill.\nCommunity Concern for Cats is an all-volunteer rescue organization helping homeless and abandoned cats in Contra Costa County. Learn more about our adoption process, locations, fees, and download an application at http://www.communityconcernforcats.org/adoptions/adoption-process/. 10/6/17 3:30 PM	Cat	2017-10-06 22:25:06
38927948	CA575	Charlie and Chuck	Please contact Judy (judyheckman@gmail.com) for more information about this pet.Almost Identical BrothersCharlie and Chuck are almost identical black tabby bonded brothers. They love each other and find great comfort in the companionship of their sibling. They are sweet and full of energy, love playing with cat toys and chasing after the red light on a pointer tool. When not busy racing around the house, they believe in total relaxation stretching out on their backs and showing off their spotted tummies. They both also love attention with lots of hugs and kisses.\nContact: Judy Heckman, 925-597-0793, judyheckman@gmail.com.Community Concern for Cats is an all-volunteer rescue organization helping homeless and abandoned cats in Contra Costa County. Learn more about our adoption process, locations, fees, and download an application at http://www.communityconcernforcats.org/adoptions/adoption-process/. 10/6/17 3:30 PM	Cat	2017-10-06 22:25:06
36594306	CA575	Charlie & Willie Wonka	Birthdate: ~Aug. 5, 2016\nCharlie is a gorgeous Orange kitty. His best friend and brother is Willy Wonka with the white nose and gorgeous Gene Wilder eyes. These two are very well adjusted to a busy household of 5 adult cats, one golden retriever, 2 teenage boys and lots of visitors. They have the run of the house and enjoy playing and snuggling with their adopted daddy cat who grooms them like a momma cat.\nContact: Gemma, 925.708.8395, gemmaos@sbcglobal.net\nFoster: Nancy W.Community Concern for Cats is an all-volunteer rescue organization helping homeless and abandoned cats in Contra Costa County. Learn more about our adoption process, locations, fees, and download an application at http://www.communityconcernforcats.org/adoptions/adoption-process/. 10/6/17 3:30 PM	Cat	2017-10-06 22:25:04
38850939	CA575	Licorice and Mira	We are Licorice and Mira, two sweet and beautiful siblings looking for our forever home. We were born April 2016, like cat toys, hanging out, and chasing each other around.\n\nLicorice: I have an incredibly shiny black coat and deep golden eyes. I love to explore, and also to cuddle and hang out on chairs and in new places. I enjoy playing with toys with my foster mom. I am very gentle and enjoy being stroked and will kind of dig in if you pet me behind the ears.\n\nMira: I am a grey tiger striped tabby teen. Iâm a very expressive cat â my eyes say a lot and foster mom says Iâm stunning to look at. She really canât stop taking my picture and petting me because she says I feel like silk. Thatâs fine with me, as Iâm very mellow and love to be pet and massaged around my ears and neck. I love playing chase with Licorice and the other foster kittens, hanging out on a soft blanket with them, and also snuggling into my favorite spot in the cat tree.\n\nCC4C Contact: Gemma, 925.708.8395,gemmaos@sbcglobal.net\nFoster: Marcia S.Community Concern for Cats is an all-volunteer rescue organization helping homeless and abandoned cats in Contra Costa County. Learn more about our adoption process, locations, fees, and download an application at http://www.communityconcernforcats.org/adoptions/adoption-process/. 10/6/17 3:30 PM	Cat	2017-10-06 22:25:04
37396334	CA575	Sal & Sara	Birthdate: 11/15/16 (approx)\nBonded sister and brother rescued from a hoarder's home.\nSara loves to go up under your sweatshirt , snuggle up then fall asleep there.\nThey're both a bit shy, but love to play , jump and chase each other around.\nCome nap time you'll surely catch them cuddled up with each other.\nContact Person: Gemma Contact Number: 925.708.8395\nContact Email: gemmaos@sbcglobal.net\nFoster: Kathy R\nCommunity Concern for Cats is an all-volunteer rescue organization helping homeless and abandoned cats in Contra Costa County. Learn more about our adoption process, locations, fees, and download an application at http://www.communityconcernforcats.org/adoptions/adoption-process/. 10/6/17 3:30 PM	Cat	2017-10-06 22:25:05
38850942	CA575	Bean and Bear	Born about April 1, 2017 in Vacaville, abandoned at just a few weeks. These boys are very unusual tabbies, often referred to as tick tabbies. They have an exotic appearance, almost like chervil so, but they are sweet, lively, and silly kitties. Either one is a great companion for their humans; if you work from home you'll have great company! They are both quick, curious, smart and very loyal.\nThey would love to be adopted together because they are great pals. Separately they would need a home that is active, has kids and/or other animals, and probably at least one adult who works from home.\nCome see them at Walnut Creek PetCo Saturday and Sunday afternoons!\nCC4C Contact: Gemma, 925.708.8395, gemmaos@sbcglobal.netCommunity Concern for Cats is an all-volunteer rescue organization helping homeless and abandoned cats in Contra Costa County. Learn more about our adoption process, locations, fees, and download an application at http://www.communityconcernforcats.org/adoptions/adoption-process/. 10/6/17 3:30 PM	Cat	2017-10-06 22:25:05
26246554	CA1455	SKYLAR Snuggly kitty with bonded sister	Born Approx. JAN 15,2013 Skylar and sister Diggins are as cute as can be. Too funny to watch, they are socialized but want to run and play. Can anyone take both? Not mandatory though. They are both very snuggly, used to small dogs and other cats. They hang around, know their bedtime and are super adorable.\n\nWe will be showing kitties most Saturdays at the Danville Pet Store, 409 Railroad Ave., CA 94526, from 2:30-5:30pm. Call to confirm or to make an appointment. Lori #925-915-9489. Adoption fee is $115, including microchip id.\n\nStill not sure on a pet? Talk to us about fostering this kitty or any other one, even for one month.	Cat	2016-03-13 23:12:28
37663365	CA1717	Vince & Chubby	You can fill out an adoption application online on our official website.\n\nPlease contact Tammy (tammyskittycaboose@yahoo.com), (925) 252-5445 for more information about this pet.\n\nBrother/Sister bonded pair, must be adopted together!\n\nVince and Chubby (Alice) are an adult bonded pair of tuxedo cats.\n\n Alice is very mellow, loves her brother and is a real sweetheart.\n\n Vince loves people and his sister Alice.\n\n They need to be adopted together since they've been together their whole lives.\n\n They are about 6 years old and would be the perfect set of cats for a household that doesn't want to go through kitten craziness. They are loving and settled in their personalities.\n\n Vince and Chubby (Alice) attend the Brentwood Petco adoption events Sat/Sun.	Cat	2017-03-19 13:20:40
\.


--
-- Name: pets_pet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meghb
--

SELECT pg_catalog.setval('pets_pet_id_seq', 1, false);


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: meghb
--

COPY photos (photo_id, pet_id, pf_id, photo_size, photo_text) FROM stdin;
1	38993423	1	x	http://photos.petfinder.com/photos/pets/38993423/1/?bust=1501924848&width=500&-x.jpg
2	33948330	1	x	http://photos.petfinder.com/photos/pets/33948330/1/?bust=1449294104&width=500&-x.jpg
3	38481286	1	x	http://photos.petfinder.com/photos/pets/38481286/1/?bust=1497698892&width=500&-x.jpg
4	39389552	1	x	http://photos.petfinder.com/photos/pets/39389552/1/?bust=1505505306&width=500&-x.jpg
5	39389419	1	x	http://photos.petfinder.com/photos/pets/39389419/1/?bust=1505504606&width=500&-x.jpg
6	39389295	1	x	http://photos.petfinder.com/photos/pets/39389295/1/?bust=1505503185&width=500&-x.jpg
7	28854051	1	x	http://photos.petfinder.com/photos/pets/28854051/1/?bust=1395903909&width=500&-x.jpg
8	38993382	1	x	http://photos.petfinder.com/photos/pets/38993382/1/?bust=1501921542&width=500&-x.jpg
9	39569892	1	x	http://photos.petfinder.com/photos/pets/39569892/1/?bust=1507198066&width=500&-x.jpg
10	39579020	1	x	http://photos.petfinder.com/photos/pets/39579020/1/?bust=1507273675&width=500&-x.jpg
11	39579183	1	x	http://photos.petfinder.com/photos/pets/39579183/1/?bust=1507275877&width=500&-x.jpg
12	38041180	1	x	http://photos.petfinder.com/photos/pets/38041180/1/?bust=1494475676&width=500&-x.jpg
13	38104448	1	x	http://photos.petfinder.com/photos/pets/38104448/1/?bust=1495158904&width=500&-x.jpg
14	38189165	1	x	http://photos.petfinder.com/photos/pets/38189165/1/?bust=1496285971&width=500&-x.jpg
15	37955956	1	x	http://photos.petfinder.com/photos/pets/37955956/1/?bust=1499367527&width=500&-x.jpg
16	38233896	1	x	http://photos.petfinder.com/photos/pets/38233896/1/?bust=1505895802&width=500&-x.jpg
17	39507544	1	x	http://photos.petfinder.com/photos/pets/39507544/1/?bust=1506635515&width=500&-x.jpg
18	39350615	1	x	http://photos.petfinder.com/photos/pets/39350615/1/?bust=1505112772&width=500&-x.jpg
19	34353536	1	x	http://photos.petfinder.com/photos/pets/34353536/1/?bust=1490739319&width=500&-x.jpg
20	37577681	1	x	http://photos.petfinder.com/photos/pets/37577681/1/?bust=1493921779&width=500&-x.jpg
21	39065903	1	x	http://photos.petfinder.com/photos/pets/39065903/1/?bust=1502490692&width=500&-x.jpg
22	38430197	1	x	http://photos.petfinder.com/photos/pets/38430197/1/?bust=1497335410&width=500&-x.jpg
23	38430209	1	x	http://photos.petfinder.com/photos/pets/38430209/1/?bust=1497335380&width=500&-x.jpg
24	39213078	1	x	http://photos.petfinder.com/photos/pets/39213078/1/?bust=1506960101&width=500&-x.jpg
25	32879533	1	x	http://photos.petfinder.com/photos/pets/32879533/1/?bust=1494771430&width=500&-x.jpg
26	33317648	1	x	http://photos.petfinder.com/photos/pets/33317648/1/?bust=1494771430&width=500&-x.jpg
27	38259369	1	x	http://photos.petfinder.com/photos/pets/38259369/1/?bust=1496712609&width=500&-x.jpg
28	39417633	1	x	http://photos.petfinder.com/photos/pets/39417633/1/?bust=1505795465&width=500&-x.jpg
29	39417552	1	x	http://photos.petfinder.com/photos/pets/39417552/1/?bust=1505794840&width=500&-x.jpg
30	39161238	1	x	http://photos.petfinder.com/photos/pets/39161238/1/?bust=1505792092&width=500&-x.jpg
31	39416848	1	x	http://photos.petfinder.com/photos/pets/39416848/1/?bust=1505791649&width=500&-x.jpg
32	39225135	1	x	http://photos.petfinder.com/photos/pets/39225135/1/?bust=1503771251&width=500&-x.jpg
33	39417602	1	x	http://photos.petfinder.com/photos/pets/39417602/1/?bust=1505795148&width=500&-x.jpg
34	39161129	1	x	http://photos.petfinder.com/photos/pets/39161129/1/?bust=1503176839&width=500&-x.jpg
35	39226077	1	x	http://photos.petfinder.com/photos/pets/39226077/1/?bust=1503775311&width=500&-x.jpg
36	39226172	1	x	http://photos.petfinder.com/photos/pets/39226172/1/?bust=1503775736&width=500&-x.jpg
37	39226331	1	x	http://photos.petfinder.com/photos/pets/39226331/1/?bust=1503777249&width=500&-x.jpg
38	39226352	1	x	http://photos.petfinder.com/photos/pets/39226352/1/?bust=1503777700&width=500&-x.jpg
39	39567420	1	x	http://photos.petfinder.com/photos/pets/39567420/1/?bust=1507173160&width=500&-x.jpg
40	38927948	1	x	http://photos.petfinder.com/photos/pets/38927948/1/?bust=1501377252&width=500&-x.jpg
41	36594306	1	x	http://photos.petfinder.com/photos/pets/36594306/1/?bust=1477634819&width=500&-x.jpg
42	38850939	1	x	http://photos.petfinder.com/photos/pets/38850939/1/?bust=1500829556&width=500&-x.jpg
43	37396334	1	x	http://photos.petfinder.com/photos/pets/37396334/1/?bust=1486765487&width=500&-x.jpg
44	38850942	1	x	http://photos.petfinder.com/photos/pets/38850942/1/?bust=1500829564&width=500&-x.jpg
45	26246554	1	x	http://photos.petfinder.com/photos/pets/26246554/1/?bust=1457910749&width=500&-x.jpg
46	37663365	1	x	http://photos.petfinder.com/photos/pets/37663365/1/?bust=1489929640&width=500&-x.jpg
\.


--
-- Name: photos_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: meghb
--

SELECT pg_catalog.setval('photos_photo_id_seq', 46, true);


--
-- Data for Name: shelters; Type: TABLE DATA; Schema: public; Owner: meghb
--

COPY shelters (shelter_id, shelter_name) FROM stdin;
CA1021	Wonder Cat Rescue
CA474	Wonder Dog Rescue
CA1726	Family Dog Rescue
CA326	SF Animal Care & Control
CA1061	Give Me Shelter Cat Rescue
CA1287	Muttville Senior Dog Rescue
CA792	Grateful Dogs Rescue
CA2292	Palomacy Pigeon & Dove Adoptions
CA1832	Animal Aware
CA1957	Saving Grace Rescue Inc
CA2452	4 Dogs Farm Rescue
CA2372	Purrchance Rescue
CA1606	Golden Gate Labrador Retriever Rescue
CA1130	All Fur Love
CA1602	Animal Rights and Rescue Association
CA2175	DogZone Rescue
CA665	Bull Terrier Rescue, Inc.
CA277	Asians for Humans Animals and Nature
CA2529	Mighty Mutts Rescue
CA2403	TnT Small Animal Rescue
CA1226	Camp Cocker Rescue
CA2289	Feral Change
CA111	Island Cat Resources & Adoption
CA301	Friends of the Alameda Animal Shelter
CA1971	West Coast Boxer Rescue
CA2056	PAW FUND
CA1364	North Star Rescue
CA1725	Compassionate Pet Sanctuary
CA406	Marin Cat Connection
CA280	Berkeley Humane
CA412	Berkeley Animal Care Services
CA226	Home At Last Animal Rescue
CA714	Oakland Animal Services
CA271	Hopalong Animal Rescue
CA935	Maine Coon Adoptions (MCA)
CA2037	California Pit Bull Rescue
CA2059	Paws Crossed Small Dog Rescue
CA2543	Memories of Besa Rescue, Inc.
CA560	East Bay SPCA- Oakland Adoption Center
CA39	Peninsula Humane Society & SPCA
CA2508	Unidos para los Animales
CA1603	Good NewZ! Pittie Pups Rescue
CA427	House Rabbit Society - International Headquarters
CA951	Bitten By A Kitten Rescue (BBAK)
CA2016	RabbitEars Rescue
CA387	The Milo Foundation
CA657	BAD RAP
CA2381	Nobody's Perfekt Dogs
CA2485	A Better Chance Rescue
CA1932	FurEver Animal Rescue
CA1238	Dusty Paws Rescue, Inc.
CA346	Friends of the Fairmont Animal Shelter
CA2280	Adopt a Doggie
CA690	Homeless Cat Network
CA2269	Bay Area Alliance for Animals
CA1671	Shake Wiggle N' Roll Animal Rescue
CA2285	Underdog Animal Rescue
CA634	San Francisco Samoyed Rescue
CA1519	Companions In Waiting
CA678	Hayward Animal Services Bureau
CA1028	Nine Lives Foundation
CA94	Pets In Need
CA264	Humanimal Connection Inc.
CA781	Pound Puppy Rescue
CA963	California Bengal Cat Rescue
CA2193	Whis-Purr Rescue, Inc.
CA575	Community Concern for Cats
CA2393	Namaste Akita Rescue Alliance
CA440	Marin Humane Society
CA1037	Contra Costa Humane Society
CA2518	First Responders Animal ResQ
CA1455	Pets and Pals
CA1131	NorCal German Shorthaired Pointer Rescue
CA1528	NorCal Poodle Rescue
CA245	Northern California Sled Dog Rescue (NorSled)
CA1469	East Bay Animal Rescue & Refuge (EBARR)
CA536	Avian Rescue Corp aka Cockatiel Rescue
CA2113	Ozzies Pound Puppies
CA383	Solano County Friends of Animals
CA1092	Calys Cats Feline Rescue
CA1924	Community Cat Rescue
CA2397	Bay Area Animal Rescue Crew
CA2220	Woof Animal Rescue
CA2420	Bay Area German Shepherd Rescue
CA1044	Palo Alto Animal Services
CA92	Humane Society of the North Bay
CA471	Contra Costa SPCA
CA752	Friends of the Formerly Friendless
CA2182	Jake's Place Cat Rescue
CA1669	East County Animal Shelter
CA559	East Bay SPCA- Dublin Adoption Center
CA2160	Dublin Creek Animal Foundation
CA1973	Love & Second Chances
CA222	Feline Friends Network
CA2128	The Kitten Whisperer
CA1437	Doggie Protective Services
CA923	Peninsula CatWorks
CA1710	Rescue of Cairn Terrier Club of Northern California
CA415	Tri-Valley Animal Rescue
CA1687	The Perfect Dog
CA683	Tri-City Animal Shelter
CA2208	C.A.A.T. Rescue
CA2185	Camp Four Paws
CA2396	Tails of Gray
CA1707	Pleasanton Valley Humane Society
CA1775	Lucky Dog Rescue Inc
CA2411	Forsaken Cats Rescue
CA2494	Allie's Pals Cat Rescue
CA1153	Fat Cat Rescue
CA1036	Bay Area Cat Rescue
CA958	Copper's Dream Rescue
CA2340	Guardian Angels International Rescue
CA1825	Umbrella of Hope
CA2061	K9 Paw Print Rescue
CA1027	Cavy House Guinea PIg Rescue
CA874	WKODIT
CA1781	Azaya Ranch Sanctuary
CA129	North Bay Canine Rescue & Placement
CA1649	East Bay Rabbit Rescue
CA2394	German Shepherd Rescue of Northern California
CA573	Safe Haven Animal Sanctuary
CA2054	AKarmic Connections Animal Rescue
CA1676	Lily's Legacy Senior Dog Sanctuary
CA472	Golden Gate Basset Rescue
CA1173	Silicon Valley Animal Control Authority
CA939	Animal Rescue and Care Network Inc.
CA2374	Westie Rescue Northern California
CA2521	Every Pet's Dream
CA1856	Contra Costa Rabbit Rescue
CA1085	Solano County Animal Rescue Foundation
CA1067	Homeless Animals Response Program (H.A.R.P.)
CA338	Homeless Animals' Lifeline Organization (H.A.L.O.)
CA1895	Delta Animals Safe Haven (DASH)
CA1769	Pets Care
CA611	Napa County Animal Shelter
CA1060	Toy Breed Rescue
CA2117	Schwartz Family Animal Welfare Foundation
CA2428	Woofie's Rescue
CA595	City of San José Animal Care Center
CA973	13th St Cats
CA1328	Whiskers, Tails and Ferals
CA426	TikiHut Akita Rescue Association (TARA)
CA571	South Bay Purebred Rescue
CA834	Nike Animal Rescue Foundation (NARF)
CA1965	One Planet Rescue
CA2251	Jakes Wish Dog Rescue
CA2312	Silicon Valley Pet Project
CA1644	St. Francis Animal Protection Society
CA586	CARE Companion Animal Rescue Effort
CA2227	Cal State Dog Rescue
CA2228	Fred's Friends
CA1968	Throw Me A Bone Dog Rescue
CA410	Itty Bitty Orphan Kitty Rescue
CA444	Bay Area Siberian Husky Rescue/Referral
CA504	Solano County Sheriff's Office
CA1421	Yorkshire Terrier National Rescue
CA2045	Animal Rescue Recon
CA813	Big Dog Rescue
CA2514	Last Chance Cat Kitten Rescue
CA1052	Group Education to Protect and Defend Animals
CA1392	Tailchaser Rescue
CA2538	Rhodie's Rescue
CA522	Rohnert Park Animal Shelter
CA1370	Our Pack, Inc.
CA1791	Southern California Dachshund Relief, Inc.
CA946	Red Rover Rescue
CA745	PETaluma PET Pals
CA1584	STAR - Support Team Animal Rescue
CA1685	Lucky Paws Rescue
CA2049	Mountain House Feral Cat Rescue
CA1586	Cat Tales Rescue
CA162	Solano County S.P.C.A.
CA2349	Pause 4 Paws Rescue Mission
CA1100	Northern California Italian Greyhound Rescue IGCA
CA823	Cats' Crossroads
CA2316	Pitter Patter Rescue and Adoption
CA1428	The Dog Spot Rescue, Rehabilitation & Rehoming Center
CA2123	Pits R Us All Breed Rescue and Adoptions
CA2203	Field Of Dreams Rescue
CA1852	Herd It Through The Grapevine
CA1716	BrightHaven, Bliss Adoption Program
CA2000	Redwood Coast Cattledog Rescue
CA639	Special Pets Rescue
CA2531	SNAP Cats
CA802	Ratbone Rescues - West Region
CA2304	Paddington Station
CA697	Sonoma Humane Society
CA1043	Purrfect Pals
CA786	Countryside Rescue & Adoption Center
CA2032	Puppy Lifesaver
CA2324	Compassion Without Borders
CA2306	Jameson Rescue Ranch
CA2414	We Care Animal Rescue
CA1166	Greyhound Friends for Life
CA1276	Forgotten Felines of Sonoma County
CA1892	Nor Cal Pom Rescue, Inc.
CA2436	Dogwood Animal Rescue Project
CA464	People for Pets
CA487	East of Eden Canine Rescue
CA717	Animal Rescue of Tracy
CA1911	Amazing Greys Retired Racers
CA2492	Guardian's Light Dog Rescue
CA1135	The Rabbit Haven
CA1618	Animal Shelter Relief Rescue
CA992	Santa Cruz SPCA
CA2236	Four Paws to Love
CA2177	Wine Country Animal Lovers, Inc.
CA625	Santa Cruz County Animal Shelter
CA2134	3R Rescue, Inc.
CA2084	Green Dog Rescue Project
CA2434	Soft Paws Rescue and Rehab
CA2164	Dogma Animal  Rescue
CA138	Town Cats
CA593	FOSMAS
CA2025	City Lights Foundation
CA2550	South Bay Rabbit Rescue
CA233	Lathrop Animal Services
CA1264	Russell Rescue (North Carolina)
CA149	Stockton Animal Shelter and the Animal Protection League
CA1344	Santa Clara County Animal Care & Control
CA1650	Friends4Pets
CA2467	All Animal Rescue & Friends (AARF)
CA2429	Healdsburg Center - Sonoma Humane Society
CA324	City of Manteca Animal Shelter
CA2463	Hope For Animals International
CA180	Valley SPCA
CA161	Yolo County SPCA
CA449	Orphan Kitten Project
CA1184	People Assisting Lodi Shelter (PALS)
CA128	Lodi Animal Shelter
CA2548	Pit Stop Dog Rescue
CA899	du Clos de la Fourriere
CA2490	Hearts for Paws Rescue
CA855	Pups Rescue
CA2249	Second Chance Kitty
CA1762	Delta Humane Society & S.P.C.A.
CA86	Animal Friends Connection Humane Society
CA2318	All My Tomorrows Pet Rescue
CA2326	Poke-A-Dot's Dalmatian's and Friends Rescue
CA652	Purebreds Plus Cat Rescue
CA1877	Tiramisu Dog Rescue
CA2512	Animal Rescue Squad International
CA2079	Tails of Luv Animal Rescue
CA918	Dogworks www.dogworks.org
CA2507	South County Tail Waggers
CA1050	Niko Rescue Foundation
CA1083	Sisters Animal Sanctuary
CA1078	LapCats
CA632	NorCal Sheltie Rescue
CA1826	Kritter Kamp Rescue
CA1979	South PAWS Pet Rescue, Inc.
CA2003	Northern California Animal Rescue Friends
CA1496	Rotts of Friends Animal Rescue
CA2192	Pet Adoption and Wellness Services (PAWS)
CA2558	River's Rescue
CA1509	Westside Animals for Adoption
CA283	Yolo County Animal Services
CA237	City of Sacramento Animal Care Services
CA2509	Sacramento SPCA
CA1743	4 R Friends
CA1182	Northern California Herpetological Society
CA2311	Almost Home 4ever
CA03	Happy Tails Pet Sanctuary
CA1759	Friends of Unwanted Rabbits - FUR
CA1313	Greater California German Shepherd Rescue Inc
CA1123	ESCALON ANIMAL SHELTER
CA1320	Sacramento House Rabbit Society
CA1970	Cali_FID Parrot & Exotics Rescue Sanctuary
CA1601	Shellden Shelter for Cats & Dogs
CA2484	Second Chance Bird Rescue, West Coast Division
CA285	Cats About Town Society
CA1110	Stanislaus Animal Services Agency
CA1598	Pupz N Palz Rescue
CA1383	Friendly Farms
CA2108	NorCal Cocker Rescue
CA2143	Animal Refugee Response
CA1897	Trinkets Memorial Rabbit Sanctuary
CA1355	Chako Pit Bull Rescue
CA1742	City of Newman
CA348	Sacramento County Animal Care and Regulation
CA32	SPCA of Stanislaus
CA1623	Peace of Mind Dog Rescue
CA2442	Brandy Sleddogs Rescue of Central California
CA1549	ACGSR, Inc
CA288	Rhodesian Ridgeback Rescue of Northern California
CA290	Pet Friends
CA2308	Clearlake Veterinary Clinic
CA2410	Clearlake Animal Control
CA323	Pacific Siamese Rescue
CA2186	Old Dogs New Tricks
CA1164	The SPCA for Monterey County
CA1609	Oakdale Equine Rescue
CA731	City of Oakdale Animal Shelter
CA2279	ASTRO Foundation
CA1698	Tail Waggin All Breed Rescue
CA1154	SAKrescue
CA1190	River City Cat Rescue
CA147	German Shepherd Rescue of Sacramento Valley
CA721	Fluff Buddies
CA1331	Chows Plus
CA888	Sacramento Sierra Norwegian Elkhound Club (SSNEC)
CA1225	Friends of Turlock Animals
CA1309	Save A Spot Dalmatian Rescue
CA2087	Haven Dog Rescue
CA2495	One Dog at a Time
CA957	Sierra Pacific Great Pyrenees Club Rescue
CA2055	Cirby Sunrise Veterinary Clinic
CA667	Orphan Dog Rescue
CA1947	Four-Legged Friends Pet Rescue
CA712	Japanese Chin Care and Rescue Effort (JCCARE)
CA347	Redwood Coast Humane Society
CA1745	Pit Crew Sacramento
CA1171	Fat Kitty City
CA1779	All About Equine Animal Rescue, Inc.
CA2325	Shelter Hope Pet Shop Sacramento
CA2200	Kate's Rescue for Animals
CA1179	Caring 4 Kittens
CA362	Calaveras County Animal Services
CA662	FieldHaven Feline Center
CA1853	One More Dog Rescue, Inc
CA2373	NorCal Bully Breed Rescue
CA2406	Kimie's Kritters Pet Rescue
CA995	Colusa County Animal Control
CA840	Last Hope Cat Kingdom
CA1332	River Bottoms Rescue Inc.
CA960	Yuba County Animal Care Services
CA1693	Kits & Kats Rescue
CA2547	Kitten Central of Placer County
CA2024	Happy Paws Rescue
CA2464	Deb's Claws and Paws Rescue
CA2159	ResQpaws Volunteer Organization
CA833	Mendocino County Animal Care Services
CA2063	Pine Acres Small Dog Rescue
CA1086	Second Chance Bunnies, Inc
CA169	Humane Society of the Sierra Foothills
CA2336	One By One Rescue Project
CA2437	Placer County Animal Services Center
CA71	Humane Society of Tuolumne County
CA2511	Tuolumne County Animal Shelter
CA1505	Friends Forever, A Cat Sanctuary
CA1740	Angels Rescuing Animals
CA334	Animal Outreach of the Mother Lode
CA2142	1 Love Dog Rescue
CA509	Cloud Nine Animal Rescue
CA2526	Remys Retired Rescues
CA718	Merced County Animal Control
CA1597	California Miniature Schnauzer Rescue
CA1251	Sonora Cat Rescue
CA249	Friends of the Animal Community
CA1567	Performance Rescue
CA214	Humane Society for Inland Mendocino County
CA1006	Divine Intervention
CA443	Sutter Buttes Canine Rescue
CA1283	Angels Rescuing Kritters
CA1342	All Points West German Shorthaired and Wirehaired Pointer
CA1326	Rescue For Pet Sake
CA1571	Sammie's Friends Animal Shelter
CA1746	Animal Place
CA1831	SBT Rescue West
CA1375	Scooter's Pals Nevada County, Ca
CA392	AnimalSave
CA755	Center for Animal Protection and Education
CA1901	Nevada County PAWS
CA2083	Grass Valley Animal Control
CA2556	Mendo Shelter Pets Rescue
CA594	Northwest S.P.C.A.
CA1537	The Catnip Society
CA637	SPCA of Mariposa County
CA1209	American Maltese Association Rescue
CA1628	American Maltese Association Rescue
CA314	Mendocino Coast Humane Society
CA05	Butte Humane Society
CA1112	Runamuk Rescue
CA1986	City of Chico Animal Shelter
CA1443	Belleglen Sanctuary
CA2413	Wags and Whiskers Pet Rescue
CA988	TOPCats on the Ridge Inc.
CA1675	Town of Paradise Animal Shelter
CA458	Second Chance Pet Rescue
CA1670	Lone Oak Rescue Inc
CA754	Humane Society of Truckee-Tahoe
CA1382	Kellen Rescue
CA582	El Dorado Co. Animal Services - S. Lake Tahoe
CA2283	Feral Paws Rescue Group
CA1298	K9 Best Friends Forever - K9BFF Inc.
CA1778	Bandit's Buddies Rescue
CA1898	Humanity For Healthy Animals Foundation
CA156	Animal Rescue of Fresno
CA229	Valley Animal Center
CA2390	Fresno Humane Animal Services
CA1111	For the Sake Of Dogs
CA2195	Mending Fences
CA541	Miss Winkles Pet Adoption Center, Clovis
CA1617	All Ears Dog Training
CA1640	Animal Compassion Team of California
NV46	Douglas Animal Welfare Group
CA1042	Northern California Doberman Rescue
CA1631	Deserving Pets Rescue
CA255	Tehama County Department of Animal Services
NV41	Wylie Animal Rescue Foundation (WARF)
NV83	Aussie Border Collie Rescue of Northern Nevada
NV160	Two Dog Farms, Inc.
NV69	Pet Network Humane Society
CA1585	Homeless Animal Rescue Team
CA1071	Pinky Paws ResQ
CA1800	Plumas County Animal Shelter
CA194	Plumas Animal Welfare Society (PAWS)
CA1425	Fresno Bully Rescue
NV178	Reno Tahoe Rescue Society
NV67	Dog Town Canine Rescue
NV190	Catmandu
CA438	High Sierra Animal Rescue
CA889	Kings SPCA
CA1005	Stonecliffe Animal Rescue
CA2291	Valley Animal Haven
CA457	The Cat House on the Kings
CA2307	Central Coast Herding Dog Rescue
NV97	Boxers and Buddies
NV170	Canine Rehabilitation Center and Sanctuary
CA1727	Pawsitive Connections
CA104	Second Chance at Love Humane Society
CA944	Kings County Animal Services
CA1996	Annie's Pet Rescue
CA1466	Foxy Doxy Dachshund Rescue
CA1771	Woods Humane Society North County
CA2066	Stillwater Cat Haven
NV16	SPCA of Northern Nevada
NV104	Willows Change Pet Rescue Network
NV192	Res-Que
NV105	Palomino Valley Pet Rescue Inc.
CA1041	Pets Without Partners
CA601	ResQ Animal Coalition
CA2457	Harmony Acres Sanctuary at Mt. Lassen Animal Group
CA1004	Another Chance Animal Welfare League Inc.
NV164	Little Paws Rat Rescue
CA991	Woods Humane Society
CA579	Homeward Bound CSP Inc.
CA790	Haven Humane Society
CA808	Raining Cats 'n' Dogs
CA916	Feline Network of the Central Coast
NV119	Safe Haven Rescue Kennel
CA414	Valley Oak SPCA
CA520	Save a Dog Today (Matchmaker and Re-homing service)
CA2352	Mutts Transport Services dba Tails of Rescue
CA1475	Befriended Felines San Luis Obispo County
CA492	Tulare County Animal Services
CA569	Toy Fox Terrier Rescue, Inc.
CA2099	Tulare Animal Services
CA940	City of Shasta Lake Animal Control
NV58	Saints Of The West
CA234	Lassen Humane Society
CA947	Lassen County Animal Control
CA1807	Trinity County Animal Shelter
CA1655	CENTRAL VALLEY RESCUE RAILROAD
NV169	Mineral County Animal Shelter
CA1972	Animals In Need Fund
CA701	Santa Maria Valley Humane Society
CA1181	Wasco Animal Shelter
CA65	Santa Barbara County Animal Services
CA835	Central Coast SPCA
NV04	Churchill Animal Protection Society (CAPS)
NV149	Fallon Animal Welfare Group
CA486	Sequoia Humane Society
CA1267	SNIPPP
CA620	Shafter City Animal Control
CA1942	Greater Rural Rescue Society
CA866	Humboldt County Animal Shelter
CA2163	Redwood Pals Rescue
CA1544	Shadow's Fund
CA1660	Russell Rescue CA
CA66	LaPAWS Santa Barbara County
CA969	Volunteers for Inter-Valley Animals
CA2488	Russell Rescue CA
CA551	Paw Printz Pitbull Rescue
CA1377	Pet Matchmaker Rescue
CA150	Siskiyou Humane Society Inc.
CA631	The Cat People
CA2022	A SafeFurr Place Animal Rescue
CA2554	Hand Me Down Dog Rescue
CA2213	Old Yeller Ranch Rescue
CA1548	H.A.L.T. (Helping Animals Live Tomorrow)
CA643	The Peaceful Kingdom Alliance 4 Animals
CA2553	Boxers Mutts & Wiggle Butts Rescue Inc
CA2544	Mutts and Runts Rescue
CA1502	Santa Barbara Humane Society
CA63	Santa Barbara County Animal Services--Santa Barbara Shelter
CA267	Animal Shelter Assistance Program (ASAP)
CA651	Bunnies Urgently Needing Shelter
CA719	D.A.W.G. Dog Adoption Welfare Group
CA666	Second Chance Cocker Rescue
CA187	Rescue Ranch Inc.
CA2119	Goliath Mountain Rescue
CA1243	RESQCATS
CA746	K-9 PALS (K-9 Placement and Assistance League, Inc.)
CA700	High Plateau Humane Society
CA127	Tehachapi Humane Society
CA1380	Save Tehachapi's Orphaned Pets (STOP)
CA1566	Marley's Mutts Dog Rescue
CA1573	Have-a-Heart Humane Society
CA2423	Pacific Waterfowl Rescue
CA656	Humane Society of Ventura County
CA1128	Humane Society of Del Norte
CA1358	Del Norte County Animal Control
CA239	Cats Cradle Rescue
CA377	Greyfoot Cat Rescue
CA647	Ridgecrest Animal Care & Control
CA2267	Almost Eden Rescue
CA2095	SPARC - Santa Paula Animal Rescue Center
CA350	California City Animal Control
CA2378	Surfcat Cafe & Adoptions
CA894	Ventura County Animal Services
CA2264	Paw Works
CA511	The Jindo Project
CA1379	Jack Russell Rescue CA
CA672	L.A. County Animal Care Control: Castaic Shelter
CA967	Foreverhome Pet Rescue
OR276	Sanctuary One
OR15	Klamath Animal Shelter
OR58	Jackson County Animal Care & Control
CA1521	Pink Paws Rescue & Adoption
CA1980	All for Love Animal Rescue
CA1512	TLC  (Tiny Loving Canines)
CA51	ARV (Animal Rescue Volunteers)
CA2263	Simi Valley Missing Pets, Inc
CA913	APET Rescue and Kennels Inc.
CA2223	Feline Underground Network
CA2266	Copper Hill Animal Clinic
CA2322	Tails and Scales Animal Rescue
CA838	Siberian Husky Haven of L.A.
OR352	Committed Alliance to Strays - C.A.T.S.
CA1449	Paw Parent
CA674	L.A. County Animal Care Control: Lancaster
CA2215	Doggy Smiles Rescue
CA515	Healthcare for Homeless Animals
CA2552	Tails of Hope Staffie Haven
CA2519	The Robert T. Brentnall Pawsibilities Foundation
CA1203	Deaf Dog Rescue of America
OR132	Dogs for the Deaf
CA59	LIFE Animal Rescue
CA670	L.A. County Animal Care Control: Agoura
CA920	Southern California Siamese Rescue
CA765	City of Los Angeles West Valley Animal Shelter
CA130	English Springer Rescue America, Inc.
CA317	Life4Paws
CA1212	ResQPet
CA196	Valley Cats, Inc.
CA2313	Home Of Our Own Foundation
CA1412	Angels in Fur Dog Rescue
CA2302	Lori's Angels Animal Rescue
CA404	Pet Adoption Fund
CA1133	Southern California Cat Adoption Tails
CA1804	Saffyre Sanctuary, Inc.
CA1815	Little Pampered Paws Rescue
OR347	Critical Pet Rescue
CA1109	Basset Rescue Network
CA1163	PigHarmony
CA1622	Grand-paws Senior Sanctuary
CA203	The Brittany Foundation
CA2355	EZ Heart & Soul Rescue
CA2357	Designer Dog Rescue
CA2153	Love Habitat Rescue
CA342	Rescue Me Incorporated
CA1074	Best Friends Pet Adoption & Spay Neuter Center
CA402	Cats at the Studios, Inc. (CATS, INC.)
CA1836	J.J. Woofin' Paws Rescue Agency
CA2081	Ady Gil World Conservation
CA2435	Mayte's Rescue
OR330	Shelter Friends
CA2520	Molly's Place Rescue  Sanctuary
CA44	Pet Orphans of Southern California
CA2303	Delaney's Dog
OR344	Miss Gabriel Foundation
CA1324	Spunky's Rescue Ranch
CA938	The Sam Simon Foundation
CA2068	The Fauna Foundation
OR39	Rogue Valley Humane Society
CA1752	HA! Inc.
CA1540	Jason Heigl Foundation
CA319	Boxer Rescue LA
CA1814	Saving K9 Lives Plus, Inc
CA2178	Precious Pals Pet Rescue
CA1489	Smashface Rescue/Rehab
CA767	City of Los Angeles East Valley Animal Shelter
CA137	Cat Connection
CA1427	Southern California Shiba Inu Rescue Inc
CA2290	Rescue From The Hart
CA2533	Voices Out
CA2090	Ruff Patches
CA134	Heaven on Earth Society for Animals
CA72	Friends For Pets Foundation
CA724	Pet Rescue Association
CA2004	Leave No Paws Behind, Inc
CA2498	Tails To the Wind
CA2536	From Cloud to Ground Animal Rescue
CA1523	Evidence of Love Animal Care
CA21	C.A.R.E. aka: Cat/Canine Assist. Ref. Educ.
CA470	Purrfect Solutions Feline Rescue
CA2431	Animal Hope and Wellness Foundation
CA2541	The Rescue Team, Inc.
NV50	City-County Animal Control Center - Winnemucca, NV
CA1890	2TheResQ
CA1308	Camp Cocker Rescue
CA1686	New Life K-9 Rescue
CA932	ARME (Animal Rescue Media Education)
CA2149	Kumo's Proud Tails & Whiskers, Inc.
CA332	Pacific Coast Dog Rescue
CA1855	Indie Rescue Team
CA1278	Kinder4Rescue
CA1720	The Pepper Foundation
CA2140	START
CA2158	Forever Fido Rescue
CA2189	DR Doghouse Bully Crew Rescue
CA2232	Bark Avenue Foundation
CA2297	The Wylder Foundation
CA2447	Hollywood Huskies
CA1903	Labs and Friends.org
CA2537	Dachshunds and Friends Rescue
CA832	Linda Blair Worldheart Foundation
CA858	The Rescue Train
CA1985	Adopt Me Rescue
CA422	Dalmatian Rescue of West Los Angeles
CA397	Cocker Connection
CA890	The Catherine Fund
CA2216	The Animal Protectorates (TAPS)
CA762	Burbank Animal Shelter
CA2460	German Shepherd Rescue-Orphan Dog Placement
CA1615	Caring Arms Rescue, Inc
CA27	Amanda Foundation
CA421	Perfect Pet Rescue
CA793	Animal Alliance
CA827	Helping Persian Cats
CA1121	Karma Rescue
CA1702	The Forgotten Dog Foundation
CA727	Karma Rescue
CA2126	Dachshund Rescue of Los Angeles
CA1210	Santa Monica Animal Shelter
CA994	The Fuzzy Pet Foundation
CA1249	APe Action (Animals People & Environment Action)
CA399	A Dog's Life Rescue
CA2281	The Cat's Meow Animal Rescue
CA2353	Doggone Crazy Animal Rescue, Inc.
CA1040	Los Angeles Rabbit Foundation
CA725	Lange Foundation
CA1977	Wags and Walks
CA2165	NKLA Pet Adoption Center
CA2370	CARE Rescue LA
CA2471	Friends of Milo Foundation
CA2502	League of Extraordinary Mutts
CA250	Ace of Hearts
CA2262	Fluffs and Scruffs, A Dog Rescue
CA812	Used Pets
CA2218	Eastwood Ranch Foundation
CA2473	Buckingham Cats
CA1234	Happy Strays Rescue
CA374	Golden Retriever Club of Greater Los Angeles Rescue
CA2368	Angels Bark Dog Rescue
CA1766	California Miniature Schnauzer Rescue
CA1490	Take Me Home
CA175	Lhasa Happy Homes Rescue
CA227	Voice For The Animals
CA917	Old English Sheepdog Rescue of Southern California
CA1032	Cornish Rex Friends
CA1087	Dogs Without Borders
CA574	The Dawg Squad
CA764	City of Los Angeles West LA Animal Shelter
CA785	Westside German Shepherd Rescue of LA
CA2058	9 Lives Rescue Center
OR36	Wild Rivers Animal Rescue
CA1904	Kitt Crusaders, Inc.
CA2106	Yorkie Rescue of America
CA2271	A Purposeful Rescue
CA2309	Beople's Buddies Animal Rescue
CA910	Star Paws Rescue
CA2082	creatureKIND
CA1556	The Veterinary Care Center
CA1522	Bark n' Bitches - Jimi's Angels
CA1221	CageFree K9 Rescue Foundation
CA166	Adopt-A-Chow LA
CA442	Much Love Animal Rescue
CA2391	Friends for Life Rescue Network
CA1271	Mutt Match LA
CA1471	Bunny World Foundation
CA1679	Sachi Animal Rescue
CA864	Bichons and Buddies
CA2272	Ziggy and Friends Cat Rescue
CA107	Felines & Friends
CA550	Forte Animal Rescue
CA2468	Pacific Pups Rescue
CA55	Kitten Rescue
CA774	Sante D'Or Foundation
CA1678	Dirty Dog Squad
CA1626	Rocky's Rescue
CA741	Samoyed Rescue Of Southern California
CA711	Mutts and Moms
CA809	Stray Cat Alliance
CA2482	PItbulls and Mascara
CA172	Silky Terrier Rescue Charitable Trust
CA1303	Ken-Mar Rescue
CA434	The Mutt Scouts
CA1967	BraveDog Rescue
CA2329	The Real Bark
CA1794	Kitty Bungalow Charm School for Wayward Cats
CA2474	Furry Foundation
CA1860	The Dog Rescuers
CA15	Pasadena Humane Society & SPCA
CA2454	Little Wolf Rescue
CA1132	United Hope for Animals
CA1501	The Cat Posse
CA824	Downtown Dog Rescue
CA2293	Sweet Pawz & Meows Rescue
CA436	Jackie's PURRfect Match
CA901	Fur Baby Rescue
CA763	City of Los Angeles North Central Animal Shelter
CA2395	Sister Sister Rescue
CA114	PAL Rescue & Adoption
CA1611	Rescued Angels, Inc.
CA735	Marley's Pit Stop Rescue
CA1750	The Lovejoy Foundation Inc./Facility Clubhouse
CA2210	Please Dont Kill Me Inc
CA2224	Chews Life Dog Rescue
CA766	City of Los Angeles South LA Animal Shelter
CA176	Noahs Bark
CA2323	Carson Cats Rescue
CA1612	Adoptables at spcaLA South Bay PAC
CA1923	Homeless To Forever Foundation - Monrovia
CA605	San Gabriel Valley Humane Society
CA914	Peter Zippi Memorial Fund Inc
CA2451	Walk Me Home Rescue Group
CA78	Lifeline For Pets
CA1919	Pets Corner
CA1070	Miniature Schnauzers & Friends Rescue
CA1447	A Cat's Tale
CA1950	Gone to the Dogs Rescue Inc.
CA2477	Mutt Hut Rescue, Inc
CA2162	SCT Retrievers
CA48	Save the Dalmatians and Others Canine Rescue
CA2549	Infinite Love Animal Rescue
CA1456	The Dexter Foundation
CA207	PURRfect Partners
CA60	People And Cats Together
CA1803	Bullies and Buddies
CA710	Miracle Dog Rescue
CA2371	Pet Rescue Solutions
CA673	L.A. County Animal Care Control: Carson Shelter
CA2386	Pug Nation Rescue of LA
CA1768	Save a Small Dog Rescue, Inc.
CA671	L.A. County Animal Care & Control: Baldwin Park
CA2356	spcaLA - PetSmart Pico Rivera
CA990	SEAACA (Southeast Area Animal Control Authority)
CA1064	Pet Harbor
CA1722	Smooch Pooch Dog Rescue
CA607	L.A. County Animal Care & Control: Downey
CA305	St. Anthonys Canine Rescue & Corgi Matchmaker
CA193	Rabbit Rescue Inc.
CA2069	Endless Pawsibilities
CA1446	Whiskers & Tails Foundation
CA308	H.E.L.P. (a Home for Every Living Pet)
CA330	Family Additions
CA1619	Basic Needs Foundation, Inc
CA1108	Sweetpea Foundation
CA699	Basset Hound Rescue of Southern California
CA2245	Southern California Abyssinian Rescue (SCAR)
CA2475	The Little Lion Foundation
CA2555	Jellicle Cats Rescue Foundation
CA1747	Pets Forever Found
CA1094	American Bullmastiff Rescue
CA2510	Furry Smiles International Rescue
CA1758	Sunny Saints, Saint Bernard Dog Rescue
CA1296	Border Collies in Need
CA1690	Doggies 911 Rescue
CA2535	Live Love Animal Rescue
CA2197	Maltese Rescue California
CA1414	Kitty Katchers
CA839	South Bay Cats
CA2416	I Dream of Home Rescue, Inc.
CA411	FOHA
CA505	Pet Assistance Foundation
CA635	Southern California Keeshond Rescue Inc.[SCKR]
CA768	City of Los Angeles Harbor Animal Shelter
CA2002	Kitty Devore Rescue
CA2487	PATCH Rescue Inc
CA2155	Welcome Home Dog Rescue
CA2364	Zoey's Place Rescue
CA2260	Zazzy Cats Kitty Rescue
CA759	Long Beach Spay Neuter
CA220	American Brittany Rescue - CA/NV/HI/AZ
CA941	Southern California Dachshund Rescue
CA1749	Orange County Pit Bull Rescue
CA270	Sparky and the Gang
CA2530	Fix Long Beach
CA224	Great Pyrenees Assoc. of So. CA Rescue Inc.
CA2330	Cause for San Bernardino Paws
CA1183	Long Beach Animal Care Services
CA1666	Making Biscuits Cat Rescue
CA366	Adoptables at spcaLA
CA533	Long Beach Felines
CA1866	Ghetto Rescue FFoundation
CA1721	Caring Friends Cat Rescue
CA904	Pet Adoption Connection
CA698	Canine & Kitty Co-op
CA563	Helping Out Pets Everyday
CA77	Friends of Upland Animal Shelter
CA310	Inland Valley Humane Society S.P.C.A.
NV199	Desert Haven Animal Society
CA2392	The Cat Adoption Service
CA2188	Pug Rescue of Korea
CA2450	Furry Canines Rescue
CA760	Pups and Pals
CA1819	Saving Shibas Inc.
CA2256	The Cat Cove
CA1411	Good Dog-Dog Talk Rescue
CA1699	Kribs for Kritters
CA355	Bunny Bunch Rabbit Rescue
CA1478	There's No Place Like Home
CA1899	Mixed Mutts
CA1763	CatPAWS
CA41	Seal Beach Animal Care Center
CA2040	The Pet Food Bank
CA1011	Cats in Need of Human Care
CA1529	Barks of Love
CA1806	Angels N Paws
CA2246	Angels for Animals Rescue
CA2385	OC Community Cats
CA2261	Australian Shepherds Furever
CA1208	Mutts N Stuff Small Dog Rescue
CA738	Rancho Cucamonga Animal Care and Adoption Center
CA2299	Bichon Rescue of Orange County
CA1737	No Stray Left Behind
CA223	Beagles & Buddies
CA268	Animal Protective League
CA1608	Cats in Need Chino
CA1991	All Paws Rescue-Rehabilitation & Education
CA1886	Priceless Pet Rescue
CA1876	A Pawsitive Approach
CA1398	Angel Cat Pet Adoptions
NV157	Furgotten Friends Dog Rescue
NV202	Pets Are Worth Saving  PAWS
CA1735	ARA Canine Rescue Inc
CA934	Dachshund PAWS
CA2400	Happy Mutts Humane Society Inc.
CA1902	WAGS ~ Westminster Adoption Group and Services
CA228	Cats In Need
CA163	West End Shelter for Animals
CA273	Animal Assistance League of Orange County
CA433	A Cause For Paws  OC
CA1066	FOCHP
CA257	OC Animal Care
CA1361	MeoowzResQ
CA1495	Yorkies & Friends Rescue
CA1938	Bichon Rescue Brigade
CA787	Starlight Stepping Stones
CA882	Southern California Bulldog Rescue
CA1589	Pardon . . . Me, Inc.
CA1401	O.C. Animal League, Inc.
CA621	Boston Buddies -So. Calif. Boston Terrier Rescue
OR74	Saving Grace Pet Adoption Center
CA1463	The Lily Sanctuary
CA1579	OC Small Paws
CA2114	Project I Belong
CA2449	BFF Pet Rescue
CA1263	The Cat Cause Foundation
CA619	Second Chance Pet Adoptions
CA2328	Sierra Pacific Furbabies, Inc.
CA336	IMPS - Internet Miniature Pinscher Service, Inc. - Southern CA/NV region
CA400	Little Dog Rescue
CA2029	Outlaw Dogs
CA2377	Bark-9
CA2540	Shamrock Rescue Foundation
CA1851	Southern California Animal Rescue
CA1048	Pooch Match
CA1830	Change of Heart Pit Bull Rescue
CA780	Mountains Humane Society
CA1562	Cat Clinic
CA1595	A Home 4 Ever Rescue
CA1930	Pals For Pets
CA821	National Cat Protection Society
CA997	German Shepherd Rescue of Orange County
CA956	Animal Network of Orange County
CA1789	Pet Match Rescue
CA155	Room 8 Memorial Cat Foundation
CA2404	Somebunny Luvs Me
CA1065	Chihuahua Haven Rescue
CA1723	Purrfect Fit Cat Rescue
CA1927	The Musical Truckin Death Row Dogs Adoption Program . . . Angels Saving Animals
CA2346	House Of Shepherds Rescue
CA2354	Cactus Cat Kitty Rescue
CA1516	Sweet Home Rescue
CA2358	Save SomeBunny Rabbit Rescue, Inc.
CA1367	Dalmatian Rescue of Southern California, Inc.
CA736	Newport Beach Animal Shelter
CA974	Mutts in Need
CA2379	Paw Prints in the Sand Animal Rescue, Inc.
CA2409	Home Free Animal Rescue  Sanctuary
CA856	Coastal German Shepherd Rescue of Southern California
CA1846	NTS Adopt A Pet Program
CA231	San Bernardino City Animal Control
CA641	Sounds of Silent Spirits
CA815	Welcome Home Small Animal Sanctuary
CA842	Helping Paws
CA1760	Lovebugs Rescue
CA2012	Sunshine Haven Wildlife Rescue
CA2348	2 Crue Rescue
CA1451	ALL TOP GUN RESCUES
CA1527	Riverside County Animal Services
CA216	Mary S. Roberts Pet Adoption Center
CA1506	Southern California Pomeranian Rescue
CA30	Irvine Animal Care Center
CA599	OC ARC Orange County Animal Rescue Coalition
CA1712	Wayfaring Felines
CA535	Redlands Humane Society
CA109	Adopt A Saint - Saint Bernard Rescue
CA1962	The Little Red Dog
CA2350	Underdog Rescue
CA2539	Muttly Crew
CA1731	Laguna Woods Cat Club
CA1329	Pei People Shar Pei Rescue, Inc.
CA1847	Forever Home Cat Rescue
CA1504	Olive Branch Parrot Rescue, Inc.
CA299	All Retriever Rescue Foundation
CA446	Redlands Animal Shelter
CA2528	Dogs In Need Organization
CA1587	Cloud 10 Cat Rescue
CA543	Southland Collie Rescue
CA139	BARC
CA25	Laguna Beach Animal Shelter
CA1386	The Pet Rescue Center
CA2043	Compassionate Animal Rescue for Medical Aid
CA2366	Leashes of Love Rescue, Inc.
CA371	New Beginnings For Animals
CA1025	Independent Rescuers
CA24	Mission Viejo Animal Services Center
CA420	Southern Counties Rescue Inc.
CA1916	I.C.A.R.E. Dog Rescue
CA2417	The Pet Adoption Center of Orange County
CA1282	TLC of IE
CA1933	BFF K9 Rescue, Inc.
CA567	Moreno Valley Animal Services
CA1790	Hard Luck Cats
CA1810	German Shepherd Safe Haven, Inc.
CA1981	D.R.E.A.M. Animal Rescue
CA2375	Pacific Park Animal Hospital
CA120	Yucaipa Animal Placement Society
CA1394	The Ark of San Juan, Companion Animal Rescue
CA2369	The Zuri Pet Rescue
CA2489	Doggie Bonez, Inc.
CA2525	Dana Niguel Veterinary Hospital
CA1879	Hope to Home for Cats
CA2444	Guardian Angel Pet Rescue, Inc
CA1621	Angel's Heart Dog Rescue
CA2111	Greendog Foundation
CA1607	Paws Pet Resorts Rescue San Clemente
CA1998	Fur-Ever Home
OR156	Coos County Animal Shelter
OR241	Friends of Coos County Animals Inc.
OR257	Kohl Kitty Kare
CA148	Pet Project Foundation
CA1353	Rescue and Rehome, Inc.
CA857	Menifee Valley Humane Society
NV133	VegasPigPets
NV54	Las Vegas Valley Humane Society
NV163	Animal Network
NV181	Doggie Rescue LV/Animal Help Alliance
NV203	You Gotta Love Them, Inc.
CA983	A Passion for Paws Rescue, Inc..
CA1683	Miracle Animal Rescue Center - M.A.R.C.
OR263	SOSCAT - Sutherlin-Oakland Stray Cat Action Team
OR198	Dogue de Bordeaux Rescue
CA542	Animal Friends of the Valleys
NV145	Those Left Behind Foundation
NV139	L.E.A.N.
NV173	Vegas Shepherd Rescue
NV121	LV Hot-Diggity Dachshund Club and Rescue
NV154	Basenji Club of Southern Nevada
NV158	Cocker Spaniel Recovery Foundation
CA1167	Ramona Humane Society
CA2515	Let Them Be Little Feline Rescue
CA1812	Lucky Bunny Rabbit Rescue
CA1861	Southern Star Animal Rescue
CA2363	Feline Underground Rescue
CA2522	All Paws K9 Rescue
NV22	Heaven Can Wait Animal Society
NV155	A Home 4 Spot
NV187	Hearts Alive Village Las Vegas
NV205	Mayte's Rescue
NV140	Doberman Rescue of Nevada
CA2225	Castaway Paws
CA2546	Art N Paws Animal Rescue
CA2461	Freedom Rescue, Inc
NV141	CARES Coalition
NV196	Lone Woof Rescue
NV84	Las Vegas Labrador Rescue
NV128	Senior Spaniel Rescue, Inc.
NV51	Las Vegas Doberman Pinscher and Dachshund Rescue
NV198	Louisa's New Leash On  Life Rescue
NV204	Pekes Paws and Tails
NV185	Paulie's Ultimate Rescue and Rehabilitaiton
NV125	Homeward Bound Cat Adoptions
NV177	The Samadhi Legacy Foundation- a 501 (c) (3)
NV153	Windy's Ranch & Rescue
NV197	Forgotten Fosters
\.


--
-- Name: pets pets_pkey; Type: CONSTRAINT; Schema: public; Owner: meghb
--

ALTER TABLE ONLY pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (pet_id);


--
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: meghb
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (photo_id);


--
-- Name: shelters shelters_pkey; Type: CONSTRAINT; Schema: public; Owner: meghb
--

ALTER TABLE ONLY shelters
    ADD CONSTRAINT shelters_pkey PRIMARY KEY (shelter_id);


--
-- Name: photos photos_pet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: meghb
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pet_id_fkey FOREIGN KEY (pet_id) REFERENCES pets(pet_id);


--
-- PostgreSQL database dump complete
--

