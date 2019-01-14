--
-- Data for States table
--
INSERT INTO states (id, name) VALUES ('d69e17b4-3d86-4e58-b228-926879ceb5c1', 'Alabama');
INSERT INTO states (id, name) VALUES ('c60b7841-1def-4080-bd9e-0165bb7f169e', 'Colorado');
INSERT INTO states (id, name) VALUES ('cb4b63fc-7df0-4210-afb8-4e385c7256aa', 'Connecticut');

--
-- Data for Cities table
--
INSERT INTO cities (id, name, state_id) VALUES ('404708e8-e6ba-4eb5-bdb7-7edc0f3fd07e', 'Jasper', 'd69e17b4-3d86-4e58-b228-926879ceb5c1');
INSERT INTO cities (id, name, state_id) VALUES ('181d7722-b598-49a3-a4ad-17d2ed82e6ca', 'Marion', 'd69e17b4-3d86-4e58-b228-926879ceb5c1');
INSERT INTO cities (id, name, state_id) VALUES ('9094630e-dca5-4064-bf5e-7479625de7db', 'Mobile', 'd69e17b4-3d86-4e58-b228-926879ceb5c1');

INSERT INTO cities (id, name, state_id) VALUES ('c304259b-174a-4067-a7a3-bc23abb38f51', 'Brighton', 'c60b7841-1def-4080-bd9e-0165bb7f169e');
INSERT INTO cities (id, name, state_id) VALUES ('3ee5b87d-8e91-46a9-acd4-f13c86baee1c', 'Cortez', 'c60b7841-1def-4080-bd9e-0165bb7f169e');
INSERT INTO cities (id, name, state_id) VALUES ('03a2b3e7-d0c9-47d2-9804-c94a32d7511b', 'Denver', 'c60b7841-1def-4080-bd9e-0165bb7f169e');

INSERT INTO cities (id, name, state_id) VALUES ('3ee49b18-fb1e-4627-b0be-6e19a4552310', 'Berlin', 'cb4b63fc-7df0-4210-afb8-4e385c7256aa');
INSERT INTO cities (id, name, state_id) VALUES ('fb311822-d7ab-47e4-a50b-539de40b6d48', 'Greenwich', 'cb4b63fc-7df0-4210-afb8-4e385c7256aa');
INSERT INTO cities (id, name, state_id) VALUES ('d698257a-977f-4345-b6cc-74cb72d7a983', 'Shelton', 'cb4b63fc-7df0-4210-afb8-4e385c7256aa');

--
-- Data for Gyms table
--
INSERT INTO gyms (id, name, city_id) VALUES ('4a79130c-2e5a-458c-955d-4b2ebf3436a2', 'gym1', 'c304259b-174a-4067-a7a3-bc23abb38f51');
INSERT INTO gyms (id, name, city_id) VALUES ('aa2c7b07-6a53-4741-9535-3437e6dd39a2', 'gym2', 'c304259b-174a-4067-a7a3-bc23abb38f51');
INSERT INTO gyms (id, name, city_id) VALUES ('05e99d8b-6e7b-499b-992c-96d265adb9e3', 'gym3', 'c304259b-174a-4067-a7a3-bc23abb38f51');

INSERT INTO gyms (id, name, city_id) VALUES ('006f2b7e-db8c-4d74-8b28-dee1eec14845', 'gym4', 'c304259b-174a-4067-a7a3-bc23abb38f51');
INSERT INTO gyms (id, name, city_id) VALUES ('a56fa07d-1750-490f-b9f8-dd8490b763d3', 'gym5', '404708e8-e6ba-4eb5-bdb7-7edc0f3fd07e');
INSERT INTO gyms (id, name, city_id) VALUES ('ef0eb92d-c3ed-467d-a729-b8a03b6927ee', 'gym6', '404708e8-e6ba-4eb5-bdb7-7edc0f3fd07e');

INSERT INTO gyms (id, name, city_id) VALUES ('7d356004-5b84-4127-9730-6ec874d23fda', 'gym7', '181d7722-b598-49a3-a4ad-17d2ed82e6ca');
INSERT INTO gyms (id, name, city_id) VALUES ('27eef48a-b23a-41c6-a2e9-a6b1d39cd145', 'gym8', '181d7722-b598-49a3-a4ad-17d2ed82e6ca');
INSERT INTO gyms (id, name, city_id) VALUES ('9ed746bc-ac7e-43c1-ba17-2ea1ffaaeb0b', 'gym9', '181d7722-b598-49a3-a4ad-17d2ed82e6ca');

--
-- Data for Users table
--
INSERT INTO users (id, name, city_id) VALUES ('4d83d7df-7f9d-4d7f-9811-7cbd10770c68', 'user1', 'c304259b-174a-4067-a7a3-bc23abb38f51');
INSERT INTO users (id, name, city_id) VALUES ('89dc22be-d380-4e1c-9f25-c8156f6493be', 'user2', 'c304259b-174a-4067-a7a3-bc23abb38f51');
INSERT INTO users (id, name, city_id) VALUES ('408abe4c-5031-4527-bfb1-898b98a99179', 'user3', 'c304259b-174a-4067-a7a3-bc23abb38f51');

INSERT INTO users (id, name, city_id) VALUES ('0682cb46-9db8-4dd3-a9b7-733e47e345f9', 'user4', '404708e8-e6ba-4eb5-bdb7-7edc0f3fd07e');
INSERT INTO users (id, name, city_id) VALUES ('1002a990-09ea-4f2a-a608-352d1332e24f', 'user5', '404708e8-e6ba-4eb5-bdb7-7edc0f3fd07e');
INSERT INTO users (id, name, city_id) VALUES ('c5dd9f1a-fe6a-4322-8e97-d3b866294a45', 'user6', '404708e8-e6ba-4eb5-bdb7-7edc0f3fd07e');

INSERT INTO users (id, name, city_id) VALUES ('dcd21737-2bb0-406c-88a1-9656c08a6424', 'user7', '181d7722-b598-49a3-a4ad-17d2ed82e6ca');
INSERT INTO users (id, name, city_id) VALUES ('b4f029f3-0d04-4890-bb4e-165bc501efeb', 'user8', '181d7722-b598-49a3-a4ad-17d2ed82e6ca');
INSERT INTO users (id, name, city_id) VALUES ('abf46409-caaf-4482-95a5-936e874cd0ac', 'user9', '181d7722-b598-49a3-a4ad-17d2ed82e6ca');

--
-- Data for Categories table
--
INSERT INTO categories (id, name) VALUES ('5252a29c-8b8e-4076-87b9-57a0836f3413', 'Zumba');
INSERT INTO categories (id, name) VALUES ('3fa090c9-989a-4e32-9ad2-8301706c4411', 'Aerobics');
INSERT INTO categories (id, name) VALUES ('4ab9c654-aae1-429a-9661-a164195ba35a', 'Box Fit');
INSERT INTO categories (id, name) VALUES ('3c7f2f85-86f9-4402-9c14-bffb967003e9', 'Step');
INSERT INTO categories (id, name) VALUES ('526af0ca-ced3-4ede-9841-7aa8f9a9e62b', 'Circuits');
INSERT INTO categories (id, name) VALUES ('0b79cf14-6ba2-47e5-9e60-e3c9dc2f5119', 'Bootcamp');
INSERT INTO categories (id, name) VALUES ('92004f61-b3dd-4b08-9303-29ba7cb348b7', 'Combat');
INSERT INTO categories (id, name) VALUES ('4d434553-f086-4e44-92df-1ff67d0a7362', 'Cycle');
INSERT INTO categories (id, name) VALUES ('adccbbe9-2c48-4d18-b3b8-e752926d10e4', 'Pump');
INSERT INTO categories (id, name) VALUES ('a2c372f3-aa8e-4675-b107-96acab5f78f8', 'Body Tone');
INSERT INTO categories (id, name) VALUES ('a84234aa-0662-4ff0-9070-70f5ef8862c2', 'Absolute abs');
INSERT INTO categories (id, name) VALUES ('e02de7a3-487b-4482-86e4-57bc3dabfeecj', 'Pilates');
INSERT INTO categories (id, name) VALUES ('b80ee1e3-2485-4d48-b828-92ccaa488fbe', 'Yoga');
INSERT INTO categories (id, name) VALUES ('87ac4a44-3f2e-475b-bb1d-24a67667d0b2', 'Sweat');
INSERT INTO categories (id, name) VALUES ('c41261c2-f24a-47db-a9a4-2683ccd9bd13', 'Strength');

--
-- Data for Gyms_Categories table
--
-- INSERT INTO gyms_categories (gym_id, category_id) VALUES ('4a79130c-2e5a-458c-955d-4b2ebf3436a2', '5252a29c-8b8e-4076-87b9-57a0836f3413');
-- INSERT INTO gyms_categories (gym_id, category_id) VALUES ('4a79130c-2e5a-458c-955d-4b2ebf3436a2', '3c7f2f85-86f9-4402-9c14-bffb967003e9');
-- INSERT INTO gyms_categories (gym_id, category_id) VALUES ('4a79130c-2e5a-458c-955d-4b2ebf3436a2', '4d434553-f086-4e44-92df-1ff67d0a7362');

INSERT INTO gyms_categories (gym_id, category_id) VALUES ('4a79130c-2e5a-458c-955d-4b2ebf3436a2', 'c41261c2-f24a-47db-a9a4-2683ccd9bd13');
INSERT INTO gyms_categories (gym_id, category_id) VALUES ('4a79130c-2e5a-458c-955d-4b2ebf3436a2', '87ac4a44-3f2e-475b-bb1d-24a67667d0b2');
INSERT INTO gyms_categories (gym_id, category_id) VALUES ('4a79130c-2e5a-458c-955d-4b2ebf3436a2', 'b80ee1e3-2485-4d48-b828-92ccaa488fbe');
INSERT INTO gyms_categories (gym_id, category_id) VALUES ('4a79130c-2e5a-458c-955d-4b2ebf3436a2', '5252a29c-8b8e-4076-87b9-57a0836f3413');

INSERT INTO gyms_categories (gym_id, category_id) VALUES ('006f2b7e-db8c-4d74-8b28-dee1eec14845', '5252a29c-8b8e-4076-87b9-57a0836f3413');
INSERT INTO gyms_categories (gym_id, category_id) VALUES ('006f2b7e-db8c-4d74-8b28-dee1eec14845', '3fa090c9-989a-4e32-9ad2-8301706c4411');
INSERT INTO gyms_categories (gym_id, category_id) VALUES ('006f2b7e-db8c-4d74-8b28-dee1eec14845', '4ab9c654-aae1-429a-9661-a164195ba35a');

--
-- Data for Users_Categories table
--
-- INSERT INTO users_categories (user_id, category_id) VALUES ('4d83d7df-7f9d-4d7f-9811-7cbd10770c68', '5252a29c-8b8e-4076-87b9-57a0836f3413');
-- INSERT INTO users_categories (user_id, category_id) VALUES ('4d83d7df-7f9d-4d7f-9811-7cbd10770c68', '3c7f2f85-86f9-4402-9c14-bffb967003e9');
-- INSERT INTO users_categories (user_id, category_id) VALUES ('4d83d7df-7f9d-4d7f-9811-7cbd10770c68', '4d434553-f086-4e44-92df-1ff67d0a7362');

-- INSERT INTO users_categories (user_id, category_id) VALUES ('4d83d7df-7f9d-4d7f-9811-7cbd10770c68', 'c41261c2-f24a-47db-a9a4-2683ccd9bd13');
-- INSERT INTO users_categories (user_id, category_id) VALUES ('4d83d7df-7f9d-4d7f-9811-7cbd10770c68', '87ac4a44-3f2e-475b-bb1d-24a67667d0b2');
-- INSERT INTO users_categories (user_id, category_id) VALUES ('4d83d7df-7f9d-4d7f-9811-7cbd10770c68', 'b80ee1e3-2485-4d48-b828-92ccaa488fbe');

-- INSERT INTO users_categories (user_id, category_id) VALUES ('89dc22be-d380-4e1c-9f25-c8156f6493be', '5252a29c-8b8e-4076-87b9-57a0836f3413');
-- INSERT INTO users_categories (user_id, category_id) VALUES ('89dc22be-d380-4e1c-9f25-c8156f6493be', '3fa090c9-989a-4e32-9ad2-8301706c4411');
-- INSERT INTO users_categories (user_id, category_id) VALUES ('89dc22be-d380-4e1c-9f25-c8156f6493be', '4ab9c654-aae1-429a-9661-a164195ba35a');

