-- Crear tabla de categorías
CREATE TABLE IF NOT EXISTS categories (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  icon VARCHAR(10) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Crear tabla de temas
CREATE TABLE IF NOT EXISTS topics (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  category_id UUID REFERENCES categories(id) ON DELETE CASCADE,
  mode VARCHAR(20) NOT NULL DEFAULT 'improvisado' CHECK (mode IN ('improvisado', 'profundo')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Crear índices para búsquedas rápidas
CREATE INDEX IF NOT EXISTS idx_categories_name ON categories(name);
CREATE INDEX IF NOT EXISTS idx_topics_category_id ON topics(category_id);
CREATE INDEX IF NOT EXISTS idx_topics_mode ON topics(mode);

-- Habilitar RLS (Row Level Security)
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE topics ENABLE ROW LEVEL SECURITY;

-- Políticas para categorías
CREATE POLICY "Allow public read access on categories" ON categories
  FOR SELECT USING (true);

CREATE POLICY "Allow insert on categories" ON categories
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow update on categories" ON categories
  FOR UPDATE USING (true);

CREATE POLICY "Allow delete on categories" ON categories
  FOR DELETE USING (true);

-- Políticas para temas
CREATE POLICY "Allow public read access on topics" ON topics
  FOR SELECT USING (true);

CREATE POLICY "Allow insert on topics" ON topics
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow update on topics" ON topics
  FOR UPDATE USING (true);

CREATE POLICY "Allow delete on topics" ON topics
  FOR DELETE USING (true);

-- Función para actualizar updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ language 'plpgsql';

-- Triggers para actualizar updated automáticamente
CREATE TRIGGER update_categories_updated_at BEFORE UPDATE ON categories
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_topics_updated_at BEFORE UPDATE ON topics
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Insertar datos iniciales de categorías
INSERT INTO categories (name, icon) VALUES
  ('Oratoria', '◌'),
  ('Economía', '◈'),
  ('Cultura', '▣'),
  ('De todo', '✦')
ON CONFLICT (name) DO NOTHING;

-- Insertar datos iniciales de temas (basados en los datos actuales)
-- Oratoria
INSERT INTO topics (title, category_id, mode) 
SELECT 
  unnest(ARRAY['La primera impresión', 'El poder de escuchar', 'Cómo contar una historia', 'El miedo a equivocarse', 'La pausa como herramienta', 'Hablar con claridad', 'El lenguaje corporal', 'Convencer sin imponer', 'Liderar una conversación']),
  (SELECT id FROM categories WHERE name = 'Oratoria'),
  'improvisado'
ON CONFLICT DO NOTHING;

-- Economía
INSERT INTO topics (title, category_id, mode) 
SELECT 
  unnest(ARRAY['La inflación', 'El valor del tiempo', 'Ahorrar o invertir', 'El precio de las decisiones', 'Oferta y demanda', 'El futuro del trabajo', 'Dinero y felicidad']),
  (SELECT id FROM categories WHERE name = 'Economía'),
  'improvisado'
ON CONFLICT DO NOTHING;

-- Cultura
INSERT INTO topics (title, category_id, mode) 
SELECT 
  unnest(ARRAY['Una obra que cambió el mundo', 'El poder de la música', 'Tradición y cambio', 'La curiosidad', 'Una ciudad que inspira', 'El papel de los libros', 'La belleza de lo cotidiano']),
  (SELECT id FROM categories WHERE name = 'Cultura'),
  'improvisado'
ON CONFLICT DO NOTHING;

-- De todo
INSERT INTO topics (title, category_id, mode) 
SELECT 
  unnest(ARRAY['Una idea que cambió tu vida', 'Tu mayor aprendizaje', 'La tecnología del futuro', '¿Qué significa vivir bien?', 'Una decisión difícil', 'El miedo y el coraje', 'La importancia del humor']),
  (SELECT id FROM categories WHERE name = 'De todo'),
  'improvisado'
ON CONFLICT DO NOTHING;

-- Temas para investigación profunda (ejemplos)
INSERT INTO topics (title, category_id, mode) 
SELECT 
  unnest(ARRAY['Inteligencia Artificial', 'Cambio climático', 'Historia de tu país', 'El sistema educativo', 'Energías renovables']),
  (SELECT id FROM categories WHERE name = 'De todo'),
  'profundo'
ON CONFLICT DO NOTHING;
