 -- Find the title of each film
SELECT TITLE FROM movies;
-- Find the director of each film
SELECT DIRECTOR FROM movies;
-- Find the title and director of each film
SELECT TITLE, DIRECTOR FROM movies;
-- Find the title and year of each film
SELECT TITLE, YEAR FROM movies;
-- Find all the information about each film
SELECT * FROM movies;

-- Find the movie with a row id of 6
SELECT * FROM movies WHERE Id = 6;
-- Find the movies released in the years between 2000 and 2010
SELECT * FROM movies WHERE YEAR BETWEEN 2000 AND 2010
-- Find the movies not released in the years between 2000 and 2010
SELECT * FROM movies WHERE YEAR NOT BETWEEN 2000 AND 2010
-- Find the first 5 Pixar movies and their release  year
SELECT Title, YEAR FROM movies WHERE Id BETWEEN 1 and 5

-- Find all the Toy Story movies
SELECT * FROM movies WHERE Title LIKE "%Toy Story%"
-- Find all the movies directed by John Lasseter
SELECT * FROM movies WHERE Director = "John Lasseter";
-- Find all the movies (and director) not directed by John Lasseter
SELECT * FROM movies WHERE Director != "John Lasseter";
-- Find all the WALL-* movies
SELECT * FROM movies WHERE Title LIKE "%WALL-%";

-- List all directors of Pixar movies (alphabetically), without duplicates
SELECT DISTINCT Director FROM movies ORDER BY Director;
-- List the last four Pixar movies released (ordered from most recent to least)
SELECT * FROM movies ORDER BY YEAR DESC LIMIT 4;
-- List the first five Pixar movies sorted alphabetically
SELECT * FROM movies ORDER BY TITLE ASC LIMIT 5;
-- List the next five Pixar movies sorted alphabetically
SELECT * FROM movies ORDER BY TITLE ASC LIMIT 5 OFFSET 5;

-- List all the Canadian cities and their populations
SELECT City, Population FROM north_american_cities WHERE Country = "Canada";
-- Order all the cities in the United States by their latitude from north to south
SELECT * FROM North_american_cities WHERE Country = "United States"
ORDER BY Latitude DESC
-- List all the cities west of Chicago, ordered from west to east
SELECT * FROM north_american_cities WHERE Longitude < -87.629798
ORDER BY Longitude ASC;
-- List the two largest cities in Mexico (by population
SELECT * FROM north_american_cities WHERE Country = "Mexico"
ORDER BY Population DESC LIMIT 2;
-- List the third and fourth largest cities (by population) in the United States and their population
SELECT * FROM north_american_cities WHERE Country = "United States"
ORDER BY Population DESC LIMIT 2 OFFSET 2;

-- Find the domestic and international sales for each movie
SELECT * FROM movies INNER JOIN boxoffice WHERE Id = Movie_id;
-- Show the sales numbers for each movie that did better internationally rather than domestically
SELECT * FROM movies INNER JOIN boxoffice WHERE Id = Movie_id
AND International_sales > Domestic_sales;
-- List all the movies by their ratings in descending order
SELECT * FROM movies INNER JOIN boxoffice WHERE Id = Movie_id
ORDER BY Rating DESC

-- Find the list of all buildings that have employees
SELECT DISTINCT Building_name FROM buildings INNER JOIN employees
WHERE Building_name = Building;
-- Find the list of all buildings and their capacity
SELECT * FROM buildings;
-- List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT building_name, role FROM buildings
LEFT JOIN employees ON building_name = building;

-- Find the name and role of all employees who have not been assigned to a building
SELECT name, role FROM employees WHERE building IS NULL;
-- Find the names of the buildings that hold no employees
SELECT DISTINCT building_name FROM buildings
LEFT JOIN employees ON building_name = building WHERE role IS NULL;

-- List all movies and their combined sales in millions of dollars
SELECT title, (domestic_sales + international_sales) / 1000000 AS total_sales_millions
FROM movies JOIN boxoffice ON movies.id = boxoffice.movie_id;
-- List all movies and their ratings in percent
SELECT title, (Rating * 10) AS rating_percent FROM movies
JOIN boxoffice ON movies.id = boxoffice.movie_id;
-- List all movies that were released on even number years
SELECT * FROM Movies WHERE YEAR % 2 == 0;

-- Find the longest time that an employee has been at the studio
SELECT Max(Years_employed) FROM employees;
-- For each role, find the average number of years employed by employees in that role
SELECT role, AVG(years_employed) as Avg_years FROM employees
GROUP BY role;
-- Find the total number of employee years worked in each building
SELECT SUM(Years_employed), building as Total_years_employed FROM employees GROUP BY Building

-- Find the number of Artists in the studio (without a HAVING clause)
SELECT COUNT(Role) FROM employees WHERE Role = "Artist";
-- Find the number of Employees of each role in the studio
SELECT role, COUNT(Role) FROM employees GROUP BY Role;
-- Find the total number of years employed by all Engineers
SELECT SUM(Years_employed) FROM employees WHERE Role = "Engineer";

-- Find the number of movies each director has directed
SELECT COUNT(Title), Director FROM movies GROUP BY Director;
-- Find the total domestic and international sales that can be attributed to each director
SELECT SUM(Domestic_sales + International_sales),Director FROM boxoffice INNER JOIN movies where Movie_id = Id GROUP BY Director;
