-- Verificar qué category_id tienen los temas de las categorías problemáticas

-- Ver temas de Arte
SELECT 
  'ARTE' as categoria,
  c.name as categoria_nombre,
  c.id as categoria_id_correcto,
  t.category_id as tema_category_id,
  t.title,
  CASE WHEN t.category_id = c.id THEN 'CORRECTO' ELSE 'INCORRECTO' END as estado
FROM topics t
CROSS JOIN categories c
WHERE c.name = 'Arte'
AND t.title LIKE '%arte%'
LIMIT 5;

-- Ver temas de Ciencia  
SELECT 
  'CIENCIA' as categoria,
  c.name as categoria_nombre,
  c.id as categoria_id_correcto,
  t.category_id as tema_category_id,
  t.title,
  CASE WHEN t.category_id = c.id THEN 'CORRECTO' ELSE 'INCORRECTO' END as estado
FROM topics t
CROSS JOIN categories c
WHERE c.name = 'Ciencia'
AND t.title LIKE '%ciencia%'
LIMIT 5;

-- Ver temas de Fútbol
SELECT 
  'FUTBOL' as categoria,
  c.name as categoria_nombre,
  c.id as categoria_id_correcto,
  t.category_id as tema_category_id,
  t.title,
  CASE WHEN t.category_id = c.id THEN 'CORRECTO' ELSE 'INCORRECTO' END as estado
FROM topics t
CROSS JOIN categories c
WHERE c.name = 'Fútbol'
AND t.title LIKE '%fútbol%'
LIMIT 5;

-- Ver qué category_id tiene la mayoría de los temas
SELECT category_id, COUNT(*) as total_temas
FROM topics
GROUP BY category_id
ORDER BY total_temas DESC;
