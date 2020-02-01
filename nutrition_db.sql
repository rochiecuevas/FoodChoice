-- Create database --
-- CREATE DATABASE nutrition_db; 

-- Use the new database --
USE nutrition_db;

-- Create tables --
CREATE TABLE occasion(
     Id INT AUTO_INCREMENT PRIMARY KEY,
     Occasion VARCHAR(20),
     Meaning VARCHAR(100)
     );  
     
CREATE TABLE dishes(
     Id INT AUTO_INCREMENT PRIMARY KEY,
     Dish VARCHAR(500),
     `Description` VARCHAR(500),
     Bengali_name VARCHAR(500),
     Category VARCHAR(500)
     );     
     
CREATE TABLE ingredients(
     Id INT AUTO_INCREMENT PRIMARY KEY,
     Dish VARCHAR(500),
     Recipe_No INT,
     Ingredient VARCHAR(500),
     Amount_gm DECIMAL(19, 3),
     Carbohydrate_gm DECIMAL(19, 3),
     Protein_gm DECIMAL(19, 3),
     Fat_gm DECIMAL(19, 3),
     Energy_kcal DECIMAL(19, 3)
);     

CREATE TABLE recipes(
     Id INT AUTO_INCREMENT PRIMARY KEY,
     Dish VARCHAR(500),
     Occasion VARCHAR(500),
     Recipe_No INT
);

-- Load data manually --
INSERT INTO occasion(Occasion, Meaning)
VALUES
     ("Breakfast","daily eating occasion occurring after the longest sleep period"),
     ("AM Snack","daily eating occasion after breakfast and before lunch"),
     ("Lunch", "daily eating occasion in the middle of the day"),
     ("PM Snack", "daily eating occasion after lunch and before dinner"),
     ("Dinner", "daily eating occasion in the evening, before sleeping for the night"),
     ("Special occasion", "eating occasion that coincides with festivities and does not happen everyday");


-- Preview the database tables --
SELECT * FROM recipes LIMIT 1000;
SELECT * FROM ingredients LIMIT 1000;
SELECT * FROM dishes LIMIT 1000;
SELECT * FROM occasion LIMIT 1000;

-- NB: Data in Excel sheet to be transformed and prepared for exporting into SQL as csv files --
-- Follow the proompts in importing csv data into database tables --

-- Sample query (1) --
-- Display the ingredients and the occasions for each recipe --
SELECT 
     I.Recipe_No, 
     I.Dish, 
     R.Occasion,
     SUM(I.Amount_gm) AS "Amount_gm", 
     SUM(I.Carbohydrate_gm) AS "Carbohydrate_gm", 
     SUM(I.Protein_gm) AS "Protein_gm",
     SUM(I.Fat_gm) AS "Fat_gm",
     SUM(I.Energy_kcal) AS "Energy_kcal"
FROM
     ingredients as I
INNER JOIN 
     recipes AS R
     ON I.Recipe_No = R.Recipe_No
GROUP BY
     I.Recipe_No, I.Dish, R.Occasion
LIMIT 2000;     

-- Sample query (2) --
-- Display the dishes for the indicated occasion --
SELECT Id, Dish, Occasion
     FROM recipes
     WHERE Occasion IN ("Breakfast")
	 ;

-- Sample query (3) --
-- Calculate the proportion of each nutrient class for each dish --
SELECT 
     Recipe_No, 
     Dish, 
     ROUND(SUM(Carbohydrate_gm)/SUM(Amount_gm) * 100, 1) AS "Carbohydrate (%)", 
     ROUND(SUM(Protein_gm)/SUM(Amount_gm) * 100, 1) AS "Protein (%)", 
     ROUND(SUM(Fat_gm)/SUM(Amount_gm) * 100, 1) AS "Fat (%)" 
FROM ingredients 
GROUP BY Recipe_No, Dish;

-- Sample query (4) --
-- Total amounts of different nutrients --
SELECT 
     R.Occasion,
     SUM(I.Amount_gm) AS "Amount_gm", 
     SUM(I.Carbohydrate_gm) AS "Carbohydrate_gm", 
     SUM(I.Protein_gm) AS "Protein_gm",
     SUM(I.Fat_gm) AS "Fat_gm",
     SUM(I.Energy_kcal) AS "Energy_kcal"
FROM
     ingredients as I
INNER JOIN 
     recipes AS R
     ON I.Recipe_No = R.Recipe_No
GROUP BY
     R.Occasion
;     

-- Sample query (5) --
-- Proportions of different nutrients assuming that each occasion has 100g--
SELECT 
     R.Occasion,
     ROUND(SUM(I.Carbohydrate_gm) / SUM(I.Amount_gm) * 100, 1) AS "Carbohydrate (%)", 
     ROUND(SUM(I.Protein_gm) / SUM(I.Amount_gm) * 100, 1) AS "Protein (%)",
     ROUND(SUM(I.Fat_gm) / SUM(I.Amount_gm) * 100, 1) AS "Fat (%)",
     ROUND(SUM(I.Energy_kcal) / SUM(I.Amount_gm) * 100, 1) AS "Energy (kcal/ 100g)"
FROM
     ingredients as I
INNER JOIN 
     recipes AS R
     ON I.Recipe_No = R.Recipe_No
GROUP BY
     R.Occasion
;   
