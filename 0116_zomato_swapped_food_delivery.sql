# Zomato is a leading online food delivery service that connects users with various restaurants and cuisines, allowing them to browse menus, place orders, and get meals delivered to their doorsteps.

# Recently, Zomato encountered an issue with their delivery system. Due to an error in the delivery driver instructions, each item's order was swapped with the item in the subsequent row. As a data analyst, you're asked to correct this swapping error and return the proper pairing of order ID and item.

# If the last item has an odd order ID, it should remain as the last item in the corrected data. For example, if the last item is Order ID 7 Tandoori Chicken, then it should remain as Order ID 7 in the corrected data.

# In the results, return the correct pairs of order IDs and items.


SELECT  ord.order_id as corrected_order_id, 
CASE WHEN ord2.item is NULL THEN ord.item ELSE ord2.item END AS item
FROM orders ord 
LEFT JOIN orders ord2 
ON (ord2.order_id%2 = 0 AND ord.order_id = (ord2.order_id - 1)) 
OR (ord2.order_id%2 <> 0 AND ord.order_id = (ord2.order_id + 1))


SELECT
  CASE
    WHEN (order_id = (SELECT MAX(order_id) FROM orders)) AND 
         order_id % 2 != 0  THEN order_id
    WHEN order_id % 2 = 0 THEN order_id - 1
    ELSE order_id + 1
  END AS corrected_order_id,
  item
FROM orders
ORDER BY corrected_order_id;


SELECT 
    order_id,
    CASE 
        WHEN LEAD(item) OVER () IS NULL THEN item -- no further values
        WHEN (order_id % 2 != 0) THEN 
            LEAD(item) OVER (ORDER BY order_id) -- look ahead
        ELSE 
            LAG(item) OVER (ORDER BY order_id) -- look behind
    END AS item
FROM orders;
