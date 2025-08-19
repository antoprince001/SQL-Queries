-- You’re a consultant for a major pizza chain that will be running a promotion where all 3-topping pizzas will be sold for a fixed price, and are trying to understand the costs involved.

-- Given a list of pizza toppings, consider all the possible 3-topping pizzas, and print out the total cost of those 3 toppings. Sort the results with the highest total cost on the top followed by pizza toppings in ascending order.

-- Break ties by listing the ingredients in alphabetical order, starting from the first ingredient, followed by the second and third.

SELECT
concat(pt1.topping_name,',',
pt2.topping_name,',',
pt3.topping_name) as pizza,
pt1.ingredient_cost+pt2.ingredient_cost+pt3.ingredient_cost as total_cost
FROM pizza_toppings pt1 join pizza_toppings pt2  
on pt1.topping_name < pt2.topping_name JOIN
pizza_toppings pt3 
on pt2.topping_name < pt3.topping_name
order by total_cost desc,pt1.topping_name,
pt2.topping_name,
pt3.topping_name;

-- Recursive CTE
-- The term recursive CTE refers to a subquery that references itself. There are essentially 3 parts to it:

-- Non-recursive query (AKA the base query or anchor),
-- Recursive query, and
-- Termination condition

WITH RECURSIVE all_toppings AS (
  SELECT
  topping_name::VARCHAR,
  ingredient_cost::DECIMAL AS total_cost,
  1 AS topping_numbers
FROM pizza_toppings

UNION ALL

SELECT
  CONCAT(addon.topping_name, ',', anchor.topping_name) AS topping_name,
  addon.ingredient_cost + anchor.total_cost AS total_cost,
  topping_numbers + 1
FROM 
  pizza_toppings AS addon, 
  all_toppings AS anchor
WHERE anchor.topping_name < addon.topping_name
)

SELECT
  STRING_AGG (single_topping, ',' ORDER BY single_topping) AS pizza,
  total_cost
FROM 
  all_toppings, 
  REGEXP_SPLIT_TO_TABLE(topping_name, ',') AS single_topping
WHERE topping_numbers = 3
GROUP BY topping_name, total_cost
ORDER BY total_cost DESC, pizza;
