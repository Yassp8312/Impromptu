-- Script para corregir los category_id de los temas existentes

-- Primero, verificar a qué categoría pertenece el ID actual
SELECT name, id FROM categories WHERE id = 'd04a434f-2b06-4797-8fdf-9017a156b89a';

-- Actualizar temas de Fútbol
UPDATE topics 
SET category_id = (SELECT id FROM categories WHERE name = 'Fútbol')
WHERE title LIKE '%Maradona%' 
   OR title LIKE '%fútbol%'
   OR title LIKE '%Champions%'
   OR title LIKE '%Liga%'
   OR title LIKE '%Mundial%'
   OR title LIKE '%gol%'
   OR title LIKE '%árbitro%';

-- Actualizar temas de Arte
UPDATE topics 
SET category_id = (SELECT id FROM categories WHERE name = 'Arte')
WHERE title LIKE '%arte%'
   OR title LIKE '%pintura%'
   OR title LIKE '%escultura%'
   OR title LIKE '%museo%'
   OR title LIKE '%artista%'
   OR title LIKE '%Renacimiento%'
   OR title LIKE '%Impresionismo%';

-- Actualizar temas de Ciencia
UPDATE topics 
SET category_id = (SELECT id FROM categories WHERE name = 'Ciencia')
WHERE title LIKE '%ciencia%'
   OR title LIKE '%evolución%'
   OR title LIKE '%ADN%'
   OR title LIKE '%física%'
   OR title LIKE '%química%'
   OR title LIKE '%universo%'
   OR title LIKE '%Einstein%';

-- Actualizar temas de Cine
UPDATE topics 
SET category_id = (SELECT id FROM categories WHERE name = 'Cine')
WHERE title LIKE '%cine%'
   OR title LIKE '%película%'
   OR title LIKE '%Hollywood%'
   OR title LIKE '%director%'
   OR title LIKE '%actor%'
   OR title LIKE '%Oscar%';

-- Actualizar temas de Educación
UPDATE topics 
SET category_id = (SELECT id FROM categories WHERE name = 'Educación')
WHERE title LIKE '%escuela%'
   OR title LIKE '%educación%'
   OR title LIKE '%profesor%'
   OR title LIKE '%aprender%'
   OR title LIKE '%estudiante%'
   OR title LIKE '%universidad%';

-- Actualizar temas de Filosofía
UPDATE topics 
SET category_id = (SELECT id FROM categories WHERE name = 'Filosofía')
WHERE title LIKE '%filosofía%'
   OR title LIKE '%Platón%'
   OR title LIKE '%ética%'
   OR title LIKE '%moral%'
   OR title LIKE '%Kant%'
   OR title LIKE '%Nietzsche%';

-- Verificar el resultado
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
GROUP BY c.name
ORDER BY c.name;
