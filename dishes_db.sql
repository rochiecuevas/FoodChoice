-- Create database --
-- CREATE DATABASE dishes_db; --

-- Use the new database --
USE dishes_db;

-- DROP TABLE IF EXISTS ingredients;

-- Create tables --
CREATE TABLE state(
	 Id INT AUTO_INCREMENT PRIMARY KEY,
     State VARCHAR(20),
     Country VARCHAR(20),
     Capital VARCHAR(20)
     );
     
CREATE TABLE occasion(
     Id INT AUTO_INCREMENT PRIMARY KEY,
     Occasion VARCHAR(20),
     Meaning VARCHAR(100)
     );     
     
CREATE TABLE dishes(
     Id INT AUTO_INCREMENT PRIMARY KEY,
     Dish VARCHAR(500),
     `Description` VARCHAR(500)
     );     

CREATE TABLE expert_elicitation(
     Id INT AUTO_INCREMENT PRIMARY KEY,
     State VARCHAR(20),
     Occasion VARCHAR(20),
     Dish VARCHAR(500)
);

CREATE TABLE ingredients(
     Id INT AUTO_INCREMENT PRIMARY KEY,
     Dish VARCHAR(500),
     Ingredient VARCHAR(500),
     Ingredient2 VARCHAR(500),
     Odisha INT,
     West_Bengal INT,
     Ing_Category VARCHAR(500)
);

-- Insert additional columns --
ALTER TABLE state
     ADD COLUMN Area_sqkm INT AFTER Capital,
     ADD COLUMN GDP_usd INT AFTER Area_sqkm,
     ADD COLUMN Latitude DECIMAL(10,8),
     ADD COLUMN Longitude DECIMAL(11,8);
     
ALTER TABLE expert_elicitation
     ADD COLUMN Dish2 VARCHAR(500);
     
ALTER TABLE dishes
     ADD COLUMN Classification VARCHAR(100); 
     
-- Load data --
INSERT INTO state(State, Country, Capital)
VALUES 
     ("Odisha", "India", "Bhubaneswar"),
     ("West Bengal", "India", "Kolkata");
     
INSERT INTO occasion(Occasion, Meaning)
VALUES
     ("Breakfast","daily eating occasion occurring after the longest sleep period"),
     ("AM Snack","daily eating occasion after breakfast and before lunch"),
     ("Lunch", "daily eating occasion in the middle of the day"),
     ("PM Snack", "daily eating occasion after lunch and before dinner"),
     ("Dinner", "daily eating occasion in the evening, before sleeping for the night"),
     ("Special occasion", "eating occasion that coincides with festivities and does not happen everyday");
     
INSERT INTO dishes(Dish, `Description`)
VALUES
	 ("Bara", "deep-fried dumpling"),
     ("Sandwich", "bread serves as a container for another food type"),
     ("Chakuli", "fried rice-based cake"),
     ("Chatua", "dry roasted and powdered cereal suspended in water"),
     ("Chole", "chickpeas cooked in curry or sauce"),
	 ("Guguni", "white peas cooked in curry or sauce"),
     ("Chuda chakta", "flattened rice mixed with milk, banana, coconut, sweetener"),
     ("Chuda upma", "porridge made from flattened rice"),
     ("Corn flakes", "toasted flakes of corn typically served with milk"),
     ("Dalia upma", "porridge made with broken wheat"),
     ("Egg omelet", "beaten eggs fried and folded over a filling"),
     ("Idli", "steamed savoury rice cake"),
     ("Pakhala", "cooked rice partially fermented in water"),
     ("Paratha", "unleavened flatbread layered by folding repeatedly"),
     ("Madhi chakta", "puffed rice"),
     ("Puri", "unleavened deep-fried bread"),
     ("Sabji", "vegetable curry"),
     ("Ragi porridge", "porridge made of finger millet"),
     ("Roti", "unleavened flatbread rolled once before cooking"),
     ("Sambar", "lentil-based vegetable stew"),
     ("Santula", "brinjal, raw papaya, potato, and tomato dish that can be boiled or fried"),
     ("Suji halwa", "semolina pudding"),
     ("Suji upma", "porridge made of semolina"),
     ("Biscuit", "soft leavened flour-based baked bread"),
     ("Fruit", "fleshy seed-associated structures of plants"),
     ("Roasted groundnut", "peanut that has been cooked by roasting"),
     ("Chicken curry", "chicken cooked in a sauce consisting of a complex mix of spices"),
     ("Buta aloo curry", "corn and potato cooked in a sauce consisting of a complex mix of spices"),
     ("Dal", "soup containing split pulses"),
     ("Dalma", "kind of dal, contains papaya, brinjal, etc"),
     ("Egg curry", "egg cooked in a sauce consisting of a complex mix of spices"),
     ("Fish curry", "fish cooked in a sauce consisting of a complex mix of spices"),
     ("Khata", "sour side dish or chutney"),
     ("Khichdi", "dish containing rice and lentils which can be eaten as porridge or dry"),
     ("Sanjula", "dish containing different vegetables, prepared using any of the various cooking methods"),
     ("Mutton curry", "mutton cooked in a sauce consisting of a complex mix of spices"),
     ("Pampad", "thin, disc-shaped crisp cooked by frying or by dry heat"),
     ("Paneer curry", "cheese cooked in a sauce consisting of a complex mix of spices"),
     ("Plain rice", "rice cooked by steaming"),
     ("Smashed potato", "boiled potato that has been mashed"),
     ("Prawn curry", "prawn cooked in a sauce consisting of a complex mix of spices"),
     ("Raita", "yogurt mixed with cooked vegetables, intended to cool the palate"),
     ("Saga bhaja", "stir-fried water spinach with garlic"),
     ("Fried vegetables", "vegetables cooked in oil"),
     ("Maka sijha", "boiled corn"),
     ("Pakoda", "small deep-fried balls of finely chopped onions, chilis, and spices mixed in gram flour"),
     ("Chat", "variants of fried dough served with yogurt on the side"),
     ("Dahi vada", "deep-fried dumpling soaked in thick yogurt"),
     ("Aloo dum", "potato stewed with herbs and spices"),
     ("Dosa masala", "crepe stuffed with boiled potatoes, mustard seeds, and other spices"),
     ("Panipuri", "round and hollow puri filled with flavoured water, tamarind chutney, masala, potato, onions, chickpeas"),
     ("Masala mudhi", "puffed rice mixed with herbs, spices, pulses"),
     ("Mudhi khira", "puffed rice and milk"),
     ("Noodles", "unleavened dough extruded into long strips or strings"),
     ("Chuda bhaja", "roasted flaked rice"),
     ("Samosa", "fried or baked dish with a savoury filling"),
     ("Simei kheer", "pudding with vermicelli"),
     ("Vegetable pakoda", "deep-fried vegetable balls"),
     ("Chutney", "different variants of sauces"),
     ("Razma", "kidney bean cooked in thick gravy"),
     ("Sweets", "a wide selection of sugary food"),
     ("Biryani", "mixed rice dish with meat or vegetables"),
     ("Bhature", "fluffy deep-dried leavened bread"),
     ("Chili mushroom", "mushroom cooked with chilies"),
     ("Crab curry", "crab cooked in a sauce consisting of a complex mix of spices"),
     ("Fried rice", "steamed rice sauteed with other ingredients"),
     ("Rice kheer", "pudding with rice"),
     ("Mushroom curry", "mushroom cooked in a sauce consisting of a complex mix of spices"),
     ("Palak paneer", "cheese in a thick paste of pureed spinach and spices"),
     ("Rasgola", "cottage cheese dumplings dipped in sugary syrup"),
     ("Suji kheer", "pudding made with semolina"),
     ("Milk", "nutrient-rich, white liquid food coming from mammals"),
     ("Boda", "double beans"),
     ("Thukpa", "hot noodle soup"),
     ("Pantha bhath", "leftover rice soaked in water overnight, served in the morning with salt, onion, chili"),
     ("Egg", "shelled food laid by female animals like hens"),
     ("Vegetable curry", "vegetables cooked with a complex mix of herbs and spices"),
     ("Luchi", "deep-fried flatbread made with wheat flour"),
     ("Breakfast suji", "semolina eaten at breakfast"),
     ("Cake", "baked flour-based food"),
     ("Bread", "generic term for flour-based food"),
     ("Fish head dal", "split pulses and fish head in a savoury soup"),
     ("Fish head and vegetables", "mixed vegetables and fish head"),
     ("Geri-googly curry", "clams or mussels cooked with a stew of herbs and spices"),
     ("Bamboo shoot", "new bamboo culms that are cooked"),
     ("Sukuti", "dried meat jerky"),
     ("Chapati", "unleavened bread rolled once before light frying"),
     ("Saag", "combination of spinach and mustard greens cooked with a complex combination of herbs and spices"),
     ("Soya curry", "soya cooked with a complex combination of herbs and spices"),
     ("Aloo posto", "potato cooked in a stew with poppy seed paste"),
     ("Aloo paratha", "potato served with unleavened flatbread that has been folded repeatedly"),
     ("French toast", "bread dipped in egg and milk mixture then fried"),
     ("Aloo tikki", "potato croquette"),
     ("Chow mein", "stir-fried noodles"),
     ("Chole momo", "chickpea dumpling"),
     ("Macher chop", "chopped fish"),
     ("Sandesh", "milk- or cheese-based dessert"),
     ("Chidwas pulau", "flattened rice cooked in stock with vegetables or meat in such a way that the grains don't stick together"),
     ("Rachrola kofta", "no translation"),
     ("Fried fish", "fish cooked in hot oil"),
     ("Mutton biryani", "mutton cooked with rice and herbs and spices"),
     ("Naan", "leavened oven-baked flatbread"),
     ("Motor paneer", "dried peas cooked with cheese"),
     ("Hilsa bhappa", "hilsa (fish type) that is steamed with spices"),
     ("Chenne", "cottage cheese"),
     ("Moori masala", "spice mix that may contain coriander, cumin, bay leaves, etc."),
     ("Sprouts", "seeds of cereals or pulses that have been allowed to germinate prior to cooking or direct consumption"),
     ("Bari curry", "split peas that are cooked in a stew of a complex mix of herbs and spices"),
     ("Aloo sabji", "Potato stewed in herbs and spices"),
     ("Chapati and milk", "lightly fried unleavened bread dipped in milk"),
     ("Chena payas", "soft cottage cheese balls cooked in thick sweetened milk"),
     ("Chicken kassa", "chicken in thick and spicy gravy"),
     ("Vegetable dal", "chopped vegetables in a soup containing split pulses"),
     ("Dhoka", "fried lentil cake"),
     ("Egg roll", "flatbread made of egg omelet and flour rolled around a mixture of vegetable and/or meat"),
     ("Ice cream", "frozen dessert composed of milk or cream, flavoured with a sweetener and additional flavouring"),
     ("Ghughuri", "fried gram"),
     ("Mutton kassa", "mutton cooked in a thick and spicy gravy"),
     ("Pulao", "rice or wheat dish in which the grains are cooked in stock such that cooked grains do not stick together"),
     ("Rice pitha", "pancake made with rice flour");
     
INSERT INTO ingredients(Dish, Ingredient, Odisha, West_Bengal, Ing_Category)
VALUE
     ("Khichdi", "Ghee", 0, 1, "Fat");
     ("Ghoogni", "Garam masala", 0, 1, "Spice"),
     ("Ghoogni", "Cumin", 0, 1, "Spice");

-- Update state table to include values for area and GDP per capita (as of 2017–2018) --
UPDATE state SET Area_sqkm = 88752 WHERE Id = 2;
UPDATE state SET GDP_usd = 1400 WHERE Id = 2;
UPDATE state SET Area_sqkm = 155707 WHERE Id = 1;
UPDATE state SET GDP_usd = 1200 WHERE Id = 1;
UPDATE state SET Latitude = 20.9517 WHERE Id = 1;
UPDATE state SET Longitude = 85.0985 WHERE Id = 1;
UPDATE state SET Latitude = 22.9868 WHERE Id = 2;
UPDATE state SET Longitude = 87.8550 WHERE Id = 2;

-- Update ingredients table to edit dish names (after updates from Arindam) --
UPDATE ingredients SET Ing_Category = "Starch" WHERE Id = 685;  

-- Show table (top 200 rows are shown by default; for >200 rows, specify row limit) --
SELECT * FROM state;
SELECT * FROM occasion;
SELECT * FROM dishes;
SELECT * FROM expert_elicitation LIMIT 300;
SELECT * FROM ingredients LIMIT 1000;

SELECT Occasion, Dish2 FROM expert_elicitation WHERE State = "West Bengal";
SELECT * FROM expert_elicitation WHERE Dish2 LIKE "%vegetable curry%";
SELECT * FROM ingredients WHERE Dish LIKE "%chole%";
SELECT * FROM dishes WHERE `Description` LIKE "%rice%";

-- query for starch-based of dishes --
SELECT
     EE.State, 
     EE.Dish2,
     D.`Description`
FROM expert_elicitation AS EE
INNER JOIN dishes AS D 
     ON EE.Dish2 = D.Dish
WHERE 
     State = "West Bengal" AND `Description` LIKE "%rice%" 
     OR 
     State = "West Bengal" AND `Description` LIKE "%semolina%"
     OR
     State = "West Bengal" AND `Description` LIKE "%wheat%"
	 OR
     State = "West Bengal" AND `Description` LIKE "%millet%"
	 OR
     State = "West Bengal" AND `Description` LIKE "%flour%"
	 OR
     State = "West Bengal" AND `Description` LIKE "%corn%"
	 OR
     State = "West Bengal" AND `Description` LIKE "%potato%"
GROUP BY EE.State, EE.Dish2, D.`Description`;

-- query for meat-based of dishes --
SELECT
     EE.State, 
     EE.Dish2,
     D.`Description`
FROM expert_elicitation AS EE
INNER JOIN dishes AS D 
     ON EE.Dish2 = D.Dish
WHERE 
     State = "Odisha" AND `Description` LIKE "%beef%" 
     OR 
     State = "Odisha" AND `Description` LIKE "%pork%"
     OR
     State = "Odisha" AND `Description` LIKE "%chicken%"
	 OR
     State = "Odisha" AND `Description` LIKE "%mutton%"
	 OR
     State = "Odisha" AND `Description` LIKE "%fish%"
	 OR
     State = "Odisha" AND `Description` LIKE "%prawn%"
	 OR
     State = "Odisha" AND `Description` LIKE "%meat%"
GROUP BY EE.State, EE.Dish2, D.`Description`;
     
-- most common ingredients --
SELECT DISTINCT Ingredient, COUNT(Ingredient) AS Frequency 
FROM 
     ingredients 
WHERE 
     -- West_Bengal = 1
     Odisha = 1
GROUP BY 
     Ingredient
ORDER BY Frequency DESC; 


SELECT * FROM ingredients WHERE Dish = "sandesh";
SELECT * FROM expert_elicitation WHERE Dish = "prawn malaikari";