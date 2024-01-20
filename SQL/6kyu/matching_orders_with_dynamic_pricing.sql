-- You are a data analyst in a dynamic e-commerce platform where prices of items fluctuate based on supply, demand, and promotional activities. The marketing team wants to analyze how these price changes impact customer orders. Specifically, they're interested in knowing the price of each item at the time an order is placed. This information will help in understanding customer buying patterns and in strategizing future price adjustments.

-- Write a SQL query to match each order with the price of the item at the time of the order. If no price was set for an item before the order date, the price should be listed as null.

-- We have orders table:

-- order_id (int, primary key): Unique identifier for each order.
-- item_id (int): Identifier for the item ordered.
-- order_timestamp (datetime): The date and time when the order was placed.
-- and price_changes table:

-- id (int, primary key): Unique identifier for each price change record.
-- item_id (int): Identifier for the item whose price has changed.
-- change_timestamp (datetime): The date and time when the price change occurred.
-- new_price (int): The new price of the item after the change.
-- Each order in the orders table can have one corresponding record in the price_changes table based on item_id and the order_timestamp falling between the change_timestamp and the next price change.

-- Using PostgreSQL, write a query that retrieves the order_id, item_id, order_timestamp (of string datatype), and the corresponding new_price at the time of the order. For orders placed after a price change and before the next change, the new_price should reflect the price at the time of the order. For orders placed before any price changes for that item, the new_price should be null.

-- Additional Notes:

-- If an order's timestamp matches exactly with a change_timestamp, the new_price at that exact timestamp should be applied.
-- Each order in the orders table includes exactly one item. There are no orders with multiple items.
-- Results should be ordered by order_id in ascending order.
-- Desired Output
-- The desired output should look like this:

-- order_id	item_id	order_timestamp	new_price
-- 1	1	2024-08-31 14:00:00	200
-- 2	2	2024-08-29 15:00:00	100
-- 3	3	2024-07-04 05:00:00	null

SELECT o.order_id AS order_id, o.item_id AS item_id, TO_CHAR(o.order_timestamp, 'YYYY-MM-DD HH24:MI:SS') AS order_timestamp, CAST(pc.new_price AS INTEGER) AS new_price
FROM orders o
LEFT JOIN price_changes pc ON pc.item_id = o.item_id AND pc.change_timestamp <= o.order_timestamp 
WHERE pc.change_timestamp = (SELECT MAX(change_timestamp) 
                             	FROM price_changes 
                             	WHERE price_changes.change_timestamp <= o.order_timestamp 
                             	AND price_changes.item_id = o.item_id 
                            )
OR pc.change_timestamp IS NULL
ORDER BY order_id ASC;