-- Limpiar y recrear categorías para modo improvisado

-- Primero borramos todos los temas de modo improvisado
DELETE FROM topics WHERE mode = 'improvisado';

-- Luego borramos todas las categorías existentes
DELETE FROM categories;

-- Insertar las nuevas categorías con iconos apropiados
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

-- Verificar que se crearon correctamente
SELECT name, icon FROM categories ORDER BY name;
