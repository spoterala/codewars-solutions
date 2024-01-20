-- Let's consider a situation where we have three tables:

-- users table:

-- Columns: id, name
-- Primary key: id
-- products table:

-- Columns: id, product_name
-- Primary key: id
-- orders table:

-- Columns: id, user_id, product_id
-- Primary key: id
-- Foreign keys: user_id references users(id), product_id references products(id)
-- In this kata, we need to find out the names and IDs of all users who ordered every available product at least once. The result should be ordered by user_id in descending order.

-- GLHF!

-- Desired Output
-- The desired output should look like this:

-- user_id	name
-- 20	Lelia Bergstrom Sr.
-- 15	Johnathon Hoppe
-- 1	Sen. Ashley Brakus

select users.id as user_id, users.name as name
from users
join (
  SELECT users.id, COUNT(DISTINCT(products.id)) as count
  from orders
  join users on users.id = orders.user_id
  join products on products.id = orders.product_id
  group by users.id
) as counted on counted.id = users.id
where counted.count = (select count(*) from products)
order by user_id desc;