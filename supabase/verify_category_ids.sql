-- Verificar la consistencia de category_id en la base de datos
SELECT 
  c.name as categoria,
  c.id as categoria_id,
  COUNT(t.id) as temas_con_category_correcto,
  (SELECT COUNT(*) FROM topics WHERE mode = 'improvisado') - COUNT(t.id) as temas_fuera_de_categoria
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id AND t.mode = 'improvisado'
GROUP BY c.name, c.id
ORDER BY c.name;

-- Verificar qué category_id están usando los temas
SELECT 
  category_id,
  COUNT(*) as total_temas
FROM topics
WHERE mode = 'improvisado'
GROUP BY category_id
ORDER BY total_temas DESC;

-- Verificar si hay temas con category_id NULL
SELECT 
  COUNT(*) as temas_sin_categoria
FROM topics
WHERE category_id IS NULL AND mode = 'improvisado';
