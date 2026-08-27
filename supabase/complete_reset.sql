-- Limpieza completa de la base de datos
DELETE FROM topics;
DELETE FROM categories;

-- Verificar que esté vacío
SELECT 'TEMAS' as tabla, COUNT(*) as total FROM topics;
SELECT 'CATEGORÍAS' as tabla, COUNT(*) as total FROM categories;
