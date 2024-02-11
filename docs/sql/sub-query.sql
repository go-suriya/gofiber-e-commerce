-- left join select all
SELECT 
  p.id, 
  p.title, 
  i.url 
FROM 
  products p 
  LEFT JOIN images i ON i.product_id = p.id;

-- sub query images => products
SELECT 
  p.id, 
  p.title, 
  (
    SELECT 
      i.url 
    FROM 
      images i 
    WHERE 
      i.product_id = p.id 
    LIMIT 
      1
  ) AS "url" 
FROM 
  products p
	
-- sub query images => products array	
select 
  p.id, 
  p.title, 
  (
    select 
      array_to_json(
        array_agg("t")
      ) 
    from 
      (
        select 
          i.id, 
          i.filename, 
          i.url 
        from 
          images i 
        where 
          i.product_id = p.id
      ) as "t"
  ) 
from 
  products p
	
	
SELECT 
  p.id, 
  p.title, 
  (
    SELECT 
      to_jsonb("t") 
    FROM 
      (
        SELECT 
          i.id, 
          i.filename, 
          i.url 
        FROM 
          images i 
        where 
          i.product_id = p.id 
        limit 
          1
      ) AS "t"
  ) 
FROM 
  products p
	
	
-- create json object	
SELECT 
  json_build_object('id', p.id, 'title', p.title) 
FROM 
  products p

	
