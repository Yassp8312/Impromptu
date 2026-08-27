-- Insertar 100 temas de Fútbol de forma segura
DO $$
DECLARE
  futbol_category_id UUID;
BEGIN
  -- Obtener el ID de la categoría Fútbol
  SELECT id INTO futbol_category_id FROM categories WHERE name = 'Fútbol';
  
  IF futbol_category_id IS NULL THEN
    RAISE EXCEPTION 'La categoría Fútbol no existe. Ejecuta primero create_categories_only.sql';
  END IF;
  
  -- Insertar los 100 temas de Fútbol
  INSERT INTO topics (title, category_id, mode) 
  SELECT 
    unnest(ARRAY[
      'Explica: La "Mano de Dios" de Maradona',
      '¿Por qué el Maracanazo de 1950 es la mayor sorpresa de la historia?',
      'Explica: El gol de Wembley de 1966 y su polémica',
      '¿Qué hizo especial al "Fútbol Total" de Holanda en los 70?',
      'Explica: La tragedia de Múnich de 1958',
      '¿Por qué el "Gol del Siglo" de Maradona es inolvidable?',
      'Explica: La final de 1982 entre Italia y Alemania',
      '¿Qué significó el "Triplete" del Manchester United en 1999?',
      'Explica: La caída del Nottingham Forest de campeón a la nada',
      '¿Por qué el "Milagro de Estambul" (2005) es legendario?',
      '¿Quién fue el verdadero MVP del Mundial 2022: Messi o Mbappé?',
      'Explica: El fenómeno de "La Scaloneta" en Qatar 2022',
      '¿Por qué Brasil llora desde 2014?',
      'Explica: La maldición de los campeones del mundo',
      '¿Fue el mejor Mundial de la historia el de México 70?',
      'Explica: La "Batalla de Santiago" en 1962',
      '¿Por qué España dominó entre 2008-2012?',
      'Explica: El "Tiki-Taka" y su revolución táctica',
      '¿Qué pasó con Alemania en el Mundial 2018?',
      'Explica: El "Maracanazo" desde la perspectiva brasileña',
      '¿Messi o Cristiano? Argumenta tu elección en 1 minuto',
      'Explica: Por qué Pelé es "O Rei"',
      '¿Por qué Maradona es un mito religioso en Argentina?',
      'Explica: El "Crucifijo" de Ronaldo Nazário y su recuperación',
      '¿Fue Zidane el jugador más elegante de la historia?',
      'Explica: La "Chilena" de Cristiano contra la Juventus',
      '¿Por qué Ronaldinho sonreía más que jugaba?',
      'Explica: El "Hat-trick" de Messi contra el Real Madrid en 2007',
      '¿Fue Cruyff más importante como jugador o como filósofo?',
      'Explica: La "Bicicleta" de Robinho y su legado',
      '¿Quién es el mejor DT de todos los tiempos: Guardiola, Ferguson o otro?',
      'Explica: La "Pep Revolution" en el Barcelona',
      '¿Por qué Mourinho es "The Special One"?',
      'Explica: El "Gegenpressing" de Klopp',
      '¿Fue Simeone el que mató el fútbol ofensivo o lo reinventó?',
      'Explica: El "Catenaccio" italiano',
      '¿Por qué Ancelotti es el rey de las Champions?',
      'Explica: La "Táctica del Bus Estacionado"',
      '¿Fue Bielsa un visionario o un obstinado?',
      'Explica: El "Fútbol Vertical" de Conte',
      'Explica: El "Caso Calciopoli" y su impacto',
      '¿Fue justo el Balón de Oro 2010 para Messi?',
      'Explica: La "Mordida" de Suárez a Chiellini',
      '¿Por qué el "Neymargate" dividió al Barcelona?',
      'Explica: El "Hand of God" de Henry contra Irlanda',
      '¿Fue robo el arbitraje en Argentina-México 2022?',
      'Explica: La "Final Fantasía" del PSG contra el Barcelona',
      '¿Por qué el "Superliga" fracasó en 48 horas?',
      'Explica: El "Caso Tevez" y su propiedad compartida',
      '¿Fue justo el descenso del Parma a Serie D?',
      'Explica: Por qué el Real Madrid es "El Rey de Europa"',
      '¿Por qué el Barcelona es "Més que un club"?',
      'Explica: La "Maldición del Liverpool" antes de 2005',
      '¿Por qué el Manchester United es la marca más grande?',
      'Explica: El "Milan" de los invencibles 2003-2004',
      '¿Fue el "Dream Team" de Cruyff el mejor Barça?',
      'Explica: La "Banda de los Cuatro" del Arsenal',
      '¿Por qué Juventus es sinónimo de victoria en Italia?',
      'Explica: El "Leicester City" campeón 2015-16',
      '¿Por qué Boca-River es el superclásico más pasional?',
      'Explica: Por qué El Clásico es más que fútbol',
      'Argentina-Brasil: amistad o guerra eterna?',
      'Explica: El "Derby della Madonnina" (Milán)',
      '¿Por qué el "Old Firm" (Celtic-Rangers) es religioso?',
      'Explica: La "Batalla de Núremberg" 2006',
      '¿Por qué Inglaterra-Alemania es una rivalidad histórica?',
      'Explica: El "Clásico Joven" en México',
      '¿Por qué Uruguay-Argentina es la primera rivalidad?',
      'Explica: El "Derby del Sol" en Italia',
      '¿Por qué Porto-Benfica divide a Portugal?',
      'Explica: La diferencia entre "Pressing" y "Bloque Bajo"',
      '¿Por qué el "Falso 9" revolucionó el ataque?',
      'Explica: Qué es un "Carrilero" y su función',
      '¿Por qué el "Libero" desapareció del fútbol moderno?',
      'Explica: La "Zona Mixta" en la defensa',
      '¿Por qué el "4-3-3" es la formación más popular?',
      'Explica: Qué es el "Trequartista" italiano',
      '¿Por qué el "Fútbol de Posesión" aburre a algunos?',
      'Explica: La "Transición Defensiva-Ofensiva"',
      '¿Por qué el "Portero Líbero" es tendencia?',
      'Explica: Por qué el fútbol es "La Religión del Siglo XXI"',
      '¿Por qué las "Barras Bravas" son un problema social?',
      'Explica: El fenómeno de los "Ultras" en Europa',
      '¿Por qué el fútbol femenino crece tan rápido?',
      'Explica: La "Pasión del Hincha" vs el "Fan Corporativo"',
      '¿Por qué los "Cánticos" son el alma del estadio?',
      'Explica: El "Business del Fútbol Moderno"',
      '¿Por qué el "Fair Play Financiero" es polémico?',
      'Explica: La "Globalización" del fútbol',
      '¿Por qué el "VAR" divide opiniones?',
      '¿Es justo el Balón de Oro o siempre gana el mismo?',
      'Explica: Por qué Messi tiene 8 Balones de Oro',
      '¿Por qué Cristiano no ganó más Balones?',
      'Explica: La diferencia entre Bota de Oro y Balón de Oro',
      '¿Por qué los porteros nunca ganan el Balón?',
      'Explica: El "FIFA The Best" y su credibilidad',
      '¿Por qué Xavi e Iniesta nunca ganaron el Balón?',
      'Explica: El "Premio Puskás" al mejor gol',
      '¿Por qué el "Jugador del Año UEFA" importa?',
      'Explica: La "Polémica del Balón 2010" entre Messi, Iniesta y Xavi'
    ]),
    futbol_category_id,
    'improvisado';
    
  RAISE NOTICE '100 temas de Fútbol insertados correctamente';
END $$;

-- Verificar que se insertaron correctamente
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
WHERE c.name = 'Fútbol'
GROUP BY c.name;
