-- Limpiar todos los temas de investigación profunda
DELETE FROM topics
WHERE mode = 'profundo';

-- Verificar que se limpiaron correctamente
SELECT COUNT(*) as temas_profundo_restantes
FROM topics
WHERE mode = 'profundo';
