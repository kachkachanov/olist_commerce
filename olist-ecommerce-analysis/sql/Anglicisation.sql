Update products
set category_name=t.category_name_english
from translation t
where products.category_name=t.category_name;
SELECT DISTINCT category_name FROM products LIMIT 10;
SELECT COUNT(*) FROM products
WHERE category_name IS NULL;
DROP TABLE translation;
