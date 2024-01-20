-- You are provided with a table named product_variants in an online store's database. This table tracks different color and size variants of products along with their stock status. Your task is to write an SQL query that computes the total number of unique product variants and the number of in-stock variants for each product in an online store's inventory.

-- product_variants:

-- id (int): Primary key
-- product_id (int): Identifier for the product.
-- color_id (int): Identifier for a specific color variant of the product.
-- size_id (int): Identifier for a specific size variant of the product.
-- in_stock (boolean): Indicates whether the variant is in stock (true for in stock, false for out of stock).
-- Calculate the total number of unique variants for each product. A unique variant is defined by a unique combination of color_id and size_id. Calculate also the number of variants that are currently in stock for each product.

-- The output should have the following columns:

-- product_id: The identifier for the product.
-- total_unique_variants: The total number of unique variants of the product.
-- in_stock_variants: The number of variants that are currently in stock.
-- The result should be sorted by product_id in ascending order.


SELECT product_id, COUNT(*) AS total_unique_variants, SUM(CASE WHEN product_variants.in_stock THEN 1 ELSE 0 END ) AS in_stock_variants
FROM product_variants
GROUP BY product_id
ORDER BY product_id;