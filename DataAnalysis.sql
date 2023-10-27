

---- Q1. HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?

SELECT COUNT(DISTINCT restaurant_name) 
FROM swiggy as high_rated_restaurant
WHERE rating > 4.5


---- Q2. WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
SELECT city, COUNT(DISTINCT restaurant_name) AS number_of_restaurants
FROM swiggy
GROUP BY city
ORDER BY number_of_restaurants DESC
LIMIT 1




---- Q3. HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?

SELECT DISTINCT restaurant_name AS pizza_restauraunts
FROM swiggy
WHERE restaurant_name LIKE '%Pizza%';

-- For Count
 
SELECT COUNT(DISTINCT restaurant_name) AS pizza_restauraunts
FROM swiggy
WHERE restaurant_name LIKE '%Pizza%';




---- Q4.  WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?

SELECT cuisine, COUNT(cuisine) AS cuisine_count
FROM swiggy
GROUP BY cuisine
ORDER BY cuisine_count DESC
LIMIT 1;




---- Q5.  WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?

SELECT city, ROUND(AVG(rating), 3) as average_rating
FROM swiggy
GROUP BY city
ORDER BY average_rating;




---- Q6. WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?

SELECT restaurant_name, menu_category, MAX(price) AS highest_price_item
FROM swiggy
WHERE menu_category = 'Recommended'
GROUP BY restaurant_name, menu_category;



---- Q7. FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE.
SELECT DISTINCT(restaurant_name), cost_per_person
FROM swiggy
ORDER BY cost_per_person DESC



---- Q8. FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER. 

SELECT DISTINCT(restaurant_name), cost_per_person
FROM swiggy
WHERE cost_per_person > (SELECT AVG(cost_per_person) FROM swiggy)



---- Q9. RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE LOCATED IN DIFFERENT CITIES. 

/*
	In this specific query, t1 and t2 are used to create two aliases for the same table, "swiggy," which allows you to effectively perform a self-join. The query is designed to retrieve details of restaurants that have the same name but are located in different cities within the "swiggy" table.
*/
SELECT DISTINCT(t1.restaurant_name), t1.city AS location_in_diff_cities
FROM swiggy t1
INNER JOIN swiggy t2 
ON t1.restaurant_name = t2.restaurant_name AND t1.city != t2.city;



---- Q10.  WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?

SELECT DISTINCT(restaurant_name), menu_category, COUNT(item) AS no_of_itmes_in_main_course
FROM swiggy
WHERE menu_category = 'Main Course'
GROUP BY restaurant_name, menu_category
ORDER BY no_of_itmes_in_main_course DESC
LIMIT 1;



---- Q11. LIST THE NAMES OF RESTAURANTS THAT ARE 100% VEGEATARIAN IN ALPHABETICAL ORDER OF RESTAURANT NAME.

SELECT restaurant_name
FROM swiggy
GROUP BY restaurant_name
HAVING COUNT(*) > 0 -- Ensure there are records for the restaurant
   AND COUNT(CASE WHEN veg_or_nonveg = 'Veg' THEN 1 ELSE 0 END) = COUNT(*) -- All items are vegetarian
ORDER BY restaurant_name;



---- Q12. WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE FOR ALL ITEMS?




---- Q13. WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?





---- Q14. WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEGEATARIAN FOOD?

SELECT DISTINCT(restaurant_name), COUNT(*) / (SELECT COUNT(*) FROM swiggy WHERE veg_or_nonveg = 'Non-veg') AS percentage
FROM swiggy 
WHERE veg_or_nonveg = 'Non-veg'
GROUP BY restaurant_name
ORDER BY percentage DESC
























