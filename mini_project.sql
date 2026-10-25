-- ANALISIS PRODUK

SELECT
  name,
  category,
  department,
  brand,
  retail_price
FROM
  `bigquery-public-data.thelook_ecommerce.products`
LIMIT 20;

--Identifikasi produk premium
SELECT
  name,
  category,
  brand,
  retail_price
FROM
  `bigquery-public-data.thelook_ecommerce.products`
WHERE
  retail_price > 100
ORDER BY
  retail_price DESC;

--Evaluasi kategori produk
SELECT
  category,
  COUNT(*) AS jumlah_produk
FROM
  `bigquery-public-data.thelook_ecommerce.products`
GROUP BY
  category
ORDER BY
  jumlah_produk DESC;

--Mengenal pelanggan dan pesanan
SELECT
  o.order_id,
  o.status,
  o.created_at,
  u.first_name,
  u.last_name
FROM
  `bigquery-public-data.thelook_ecommerce.orders` AS o
INNER JOIN
  `bigquery-public-data.thelook_ecommerce.users` AS u
ON
  o.user_id = u.id;

--Analisis penjualan per kategori
SELECT
  p.category,
  SUM(oi.sale_price) AS total_penjualan
FROM
  `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN
  `bigquery-public-data.thelook_ecommerce.products` AS p
ON
  oi.product_id = p.id
GROUP BY
  p.category
ORDER BY
  total_penjualan DESC;
