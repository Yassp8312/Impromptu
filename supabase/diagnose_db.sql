-- Script de diagnóstico para verificar el estado de la base de datos

-- Verificar categorías
SELECT 'CATEGORÍAS' as tipo, COUNT(*) as total FROM categories;

-- Mostrar todas las categorías
SELECT name, icon FROM categories ORDER BY name;

-- Verificar temas totales
SELECT 'TEMAS TOTALES' as tipo, COUNT(*) as total FROM topics;

-- Verificar temas por modo
SELECT mode, COUNT(*) as total FROM topics GROUP BY mode;

-- Verificar temas por categoría (solo improvisado)
SELECT 
  c.name as categoria, 
  COUNT(t.id) as temas_improvisado
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id AND t.mode = 'improvisado'
GROUP BY c.name
ORDER BY c.name;

-- Verificar si hay temas sin categoría asignada
SELECT 'TEMAS SIN CATEGORÍA' as tipo, COUNT(*) as total 
FROM topics 
WHERE category_id IS NULL;

-- Mostrar algunos temas de ejemplo
SELECT title, category_id, mode FROM topics LIMIT 5;
