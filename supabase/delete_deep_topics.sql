-- Borrar todos los temas de investigación profunda menos uno
-- Dejamos solo "Inteligencia Artificial" y borramos los demás

DELETE FROM topics 
WHERE mode = 'profundo' 
AND title != 'Inteligencia Artificial';

-- Verificar cuántos temas quedan
SELECT COUNT(*) as temas_profundos_restantes 
FROM topics 
WHERE mode = 'profundo';

-- Verificar qué tema quedó
SELECT title, mode 
FROM topics 
WHERE mode = 'profundo';
