-- Step 1: Create database --
CREATE DATABASE dishes_db;

-- Step 2: Use the new database --
USE dishes_db;

-- Step 3: Create tables --
CREATE TABLE state(
	 Id INT AUTO_INCREMENT PRIMARY KEY,
     State VARCHAR(20),
     Country VARCHAR(20),
     Capital VARCHAR(20),
     Area_sqkm INT,
     GDP_usd INT,
     Latitude DECIMAL(10,8),
     Longitude DECIMAL(11,8)
     );
     
CREATE TABLE occasion(
     Id INT AUTO_INCREMENT PRIMARY KEY,
     Occasion VARCHAR(20),
     Meaning VARCHAR(100)
     );     
     
CREATE TABLE dishes(
     Id INT AUTO_INCREMENT PRIMARY KEY,
     Dish VARCHAR(500),
     `Description` VARCHAR(500),
     Classification VARCHAR(100)
     );     

CREATE TABLE expert_elicitation(
     Id INT AUTO_INCREMENT PRIMARY KEY,
     State VARCHAR(20),
     Occasion VARCHAR(20),
     Dish VARCHAR(500),
     Dish2 VARCHAR(500)
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

-- Step 4: Preview tables (top 200 rows are shown by default; for >200 rows, specify row limit) --
SELECT * FROM state;
SELECT * FROM occasion;
SELECT * FROM dishes;
SELECT * FROM expert_elicitation LIMIT 300;
SELECT * FROM ingredients LIMIT 1000;

-- Step 5: Load data by exporting the contents from dishes_db.xlsx --
    -- Instructions:
	-- 1. After previewing a table, click on the "Import records from external file" icon 
    -- 2. Follow the instructions in the window that appears, making sure that the right Excel sheet is being used as data source and the right table is being used as destination
    
    -- NB: Area and GDP per capita (as of 2017–2018) obtained from Wikipedia --
    -- NB: Definitions adapted from the first draft of the EE paper --   
    -- NB: Dish descriptions adapted from list of dishes and their definitions compiled by Jhoanne, Claire and nutritionists --   


-- Sample Queries (Just change the WHERE conditions as needed) --
	-- NB: This database is used in Python for data analyses so most of the queries are run there. --

-- Dishes by state and by occasion --
SELECT * FROM expert_elicitation WHERE State = "Odisha" AND Occasion = "AM Snack";

-- Dish classification by state and by occasion --
SELECT
     EE.State, EE.Occasion, EE.Dish2,  
     D.Classification
FROM 
     expert_elicitation AS EE
LEFT JOIN 
     dishes as D
ON 
     EE.Dish2 = D.Dish
WHERE
     State = "Odisha" AND Occasion = "AM Snack"     
LIMIT 300;