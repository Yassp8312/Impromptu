-- Corregir los category_id de los temas de Arte, Ciencia y Fútbol

-- Primero obtenemos los IDs correctos de las categorías
DO $$
DECLARE
  arte_id UUID;
  ciencia_id UUID;
  futbol_id UUID;
  educacion_id UUID;
BEGIN
  SELECT id INTO arte_id FROM categories WHERE name = 'Arte';
  SELECT id INTO ciencia_id FROM categories WHERE name = 'Ciencia';
  SELECT id INTO futbol_id FROM categories WHERE name = 'Fútbol';
  SELECT id INTO educacion_id FROM categories WHERE name = 'Educación';
  
  RAISE NOTICE 'IDs de categorías: Arte=%, Ciencia=%, Fútbol=%, Educación=%', 
    arte_id, ciencia_id, futbol_id, educacion_id;
    
  -- Actualizar temas de Arte basándonos en palabras clave
  UPDATE topics 
  SET category_id = arte_id
  WHERE title LIKE '%arte%'
     OR title LIKE '%pintura%'
     OR title LIKE '%escultura%'
     OR title LIKE '%museo%'
     OR title LIKE '%artista%'
     OR title LIKE '%Renacimiento%'
     OR title LIKE '%Impresionismo%'
     OR title LIKE '%Surrealismo%'
     OR title LIKE '%Van Gogh%'
     OR title LIKE '%Picasso%'
     OR title LIKE '%Dalí%';
     
  -- Actualizar temas de Ciencia basándonos en palabras clave
  UPDATE topics 
  SET category_id = ciencia_id
  WHERE title LIKE '%ciencia%'
     OR title LIKE '%evolución%'
     OR title LIKE '%ADN%'
     OR title LIKE '%física%'
     OR title LIKE '%química%'
     OR title LIKE '%universo%'
     OR title LIKE '%Einstein%'
     OR title LIKE '%Galileo%'
     OR title LIKE '%Darwin%';
     
  -- Actualizar temas de Fútbol basándonos en palabras clave
  UPDATE topics 
  SET category_id = futbol_id
  WHERE title LIKE '%fútbol%'
     OR title LIKE '%Maradona%'
     OR title LIKE '%Messi%'
     OR title LIKE '%Cristiano%'
     OR title LIKE '%Pelé%'
     OR title LIKE '%gol%'
     OR title LIKE '%árbitro%'
     OR title LIKE '%Mundial%'
     OR title LIKE '%Champions%'
     OR title LIKE '%Liga%';
     
  RAISE NOTICE 'Temas actualizados correctamente';
END $$;

-- Verificar el resultado
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
GROUP BY c.name
ORDER BY c.name;
