-- Crear las categorías (sin temas aún)
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

-- Verificar las categorías creadas
SELECT name, icon FROM categories ORDER BY name;
