-- Script completo para limpiar y reconstruir la base de datos correctamente

-- 1. Borrar todos los temas existentes
DELETE FROM topics;

-- 2. Borrar todas las categorías existentes
DELETE FROM categories;

-- 3. Crear las categorías correctas (sin "Todos")
INSERT INTO categories (name, icon) VALUES
  ('Tecnología', '⚡'),
  ('Fútbol', '⚽'),
  ('Finanzas', '💰'),
  ('Música', '🎵'),
  ('Personajes', '👤'),
  ('Literatura', '📚'),
  ('Cine', '🎬'),
  ('Productividad', '📈'),
  ('Negocios', '💼'),
  ('Filosofía', '🧠'),
  ('Historia', '📜'),
  ('Educación', '🎓'),
  ('Ciencia', '🔬'),
  ('Relaciones', '❤️'),
  ('Arte', '🎨'),
  ('Videojuegos', '🎮');

-- 4. Verificar que las categorías se crearon correctamente
SELECT name, icon FROM categories ORDER BY name;

-- 5. Ahora ejecuta los scripts de inserción de temas en este orden:
-- - insert_futbol_topics.sql
-- - insert_arte_topics.sql  
-- - insert_ciencia_topics.sql
-- - insert_cine_topics.sql
-- - insert_educacion_topics.sql
-- - insert_filosofia_topics.sql
