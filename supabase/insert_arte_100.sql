-- Insertar 100 temas de Arte de forma segura
DO $$
DECLARE
  arte_category_id UUID;
BEGIN
  -- Obtener el ID de la categoría Arte
  SELECT id INTO arte_category_id FROM categories WHERE name = 'Arte';
  
  IF arte_category_id IS NULL THEN
    RAISE EXCEPTION 'La categoría Arte no existe. Ejecuta primero create_categories_only.sql';
  END IF;
  
  -- Insertar los 100 temas de Arte
  INSERT INTO topics (title, category_id, mode) 
  SELECT 
    unnest(ARRAY[
      'Explica: ¿Por qué el Renacimiento cambió para siempre la forma de ver al ser humano?',
      '¿Por qué el Impresionismo fue considerado un "escándalo" en su época?',
      'Explica: La diferencia clave entre el arte Barroco y el arte Gótico.',
      '¿Fue el arte rupestre la primera forma de redes sociales de la humanidad?',
      'Explica: Qué significa realmente el término "Arte Moderno" vs "Arte Contemporáneo".',
      '¿Por qué el Surrealismo buscaba liberar el inconsciente a través del arte?',
      'Explica: El impacto del "Guernica" de Picasso como denuncia política.',
      '¿Por qué el Minimalismo "menos es más" sigue siendo tan influyente hoy?',
      'Explica: La revolución que supuso la perspectiva lineal en el siglo XV.',
      '¿Fue el Romanticismo una rebelión contra la razón y la industrialización?',
      'Explica: Por qué la "Mona Lisa" es la pintura más famosa del mundo.',
      '¿Fue Van Gogh un genio incomprendido o un producto del marketing póstumo?',
      'Explica: La obsesión de Dalí con los relojes derretidos y el tiempo.',
      '¿Por qué Frida Kahlo es un ícono global más allá de su pintura?',
      'Explica: El significado oculto en "La última cena" de Leonardo da Vinci.',
      '¿Fue Miguel Ángel el artista más completo de la historia?',
      'Explica: Por qué Andy Warhol convirtió una lata de sopa en arte.',
      '¿Por qué las esculturas de Rodin (como "El Pensador") transmiten tanta emoción?',
      'Explica: La etapa "Azul" de Picasso y qué la motivó.',
      '¿Fue Artemisia Gentileschi la primera gran feminista del arte?',
      'Explica: ¿Puede una inteligencia artificial ser considerada un "artista"?',
      '¿Son los NFTs una revolución para los creadores o una estafa especulativa?',
      'Explica: El debate ético de restaurar obras de arte con inteligencia artificial.',
      '¿La fotografía mató a la pintura o la obligó a evolucionar?',
      'Explica: Cómo la impresión 3D está cambiando la escultura contemporánea.',
      '¿Es el "arte digital" tan valioso como el arte físico tradicional?',
      'Explica: El fenómeno de los museos inmersivos (como el de Van Gogh).',
      '¿Deberían los videojuegos ser exhibidos en museos de arte contemporáneo?',
      'Explica: La paradoja de la reproducción masiva de obras de arte (Walter Benjamin).',
      '¿La tecnología nos ha democratizado el arte o lo ha hecho más superficial?',
      'Explica: Por qué "La Fuente" (el urinario) de Duchamp es considerada arte.',
      '¿Es el vandalismo sobre una obra de arte una forma de protesta válida?',
      'Explica: El debate sobre la "apropiación cultural" en el arte contemporáneo.',
      '¿Debería el arte ofender? El límite entre la libertad de expresión y el odio.',
      'Explica: La polémica de la banana pegada con cinta adhesiva de Maurizio Cattelan.',
      '¿Es ético exhibir arte saqueado durante épocas coloniales en museos occidentales?',
      'Explica: Por qué algunos artistas destruyen sus propias obras (ej. Banksy).',
      '¿El arte debe ser bello o puede ser deliberadamente feo para transmitir un mensaje?',
      'Explica: La controversia de las pinturas de Andrés Serrano (ej. "Piss Christ").',
      '¿Debería el Estado financiar arte que la mayoría de la población no entiende?',
      'Explica: La delgada línea entre "graffiti" y "vandalismo".',
      '¿Por qué Banksy mantiene su anonimato y cómo eso potencia su arte?',
      'Explica: El concepto de "arte efímero" (arte que está hecho para desaparecer).',
      '¿Es el "yarn bombing" (tejido urbano) una forma legítima de arte callejero?',
      'Explica: Cómo el muralismo mexicano (Rivera, Siqueiros) cambió el espacio público.',
      '¿Por qué las ciudades sin arte urbano se sienten "muertas" o grises?',
      'Explica: El fenómeno de los "museos de selfies" y la estética para Instagram.',
      '¿El arte callejero pierde su esencia cuando se vende en una galería?',
      'Explica: La diferencia entre una "intervención urbana" y una instalación artística.',
      '¿Por qué el "skate" y el arte urbano comparten la misma filosofía de reapropiación del espacio?',
      'Explica: Por qué un cuadro puede valer 100 millones de dólares.',
      '¿Los museos de arte son elitistas o verdaderos guardianes de la cultura?',
      'Explica: El papel de las casas de subastas (como Christies o Sothebys) en el valor del arte.',
      '¿Es el coleccionismo de arte solo una forma de lavado de dinero?',
      'Explica: Cómo se autentifica una obra de arte y se detectan las falsificaciones.',
      '¿Deberían los museos ser gratuitos para todos, sin excepción?',
      'Explica: El fenómeno del "Mona Lisa effect" (por qué la gente va solo a ver una obra).',
      '¿Por qué el arte de las mujeres ha sido históricamente subvalorado en el mercado?',
      'Explica: Qué es un "mecenas" y por qué el arte sigue necesitando patrocinadores hoy.',
      '¿El valor de una obra de arte lo determina su calidad o su firma?',
      'Explica: La famosa pregunta "¿Qué es el arte?" y por qué no tiene una sola respuesta.',
      '¿La belleza es objetiva o está realmente "en los ojos de quien mira"?',
      'Explica: La teoría de "La muerte del autor" (la intención del artista no importa, solo la interpretación).',
      '¿Puede el arte cambiar realmente la sociedad o solo la refleja?',
      'Explica: El concepto de "Sublime" en la filosofía del arte (lo que nos asombra y asusta a la vez).',
      '¿Nacemos con sensibilidad artística o se puede aprender a apreciar el arte?',
      'Explica: Por qué lloramos o nos emocionamos frente a una obra de arte.',
      '¿El arte tiene la obligación de tener un "mensaje" o puede ser solo decorativo?',
      'Explica: La relación entre el caos y el orden en la composición artística.',
      '¿Es el silencio (como en la música o el espacio negativo en pintura) una forma de arte?',
      'Explica: La diferencia técnica y emocional entre pintar al óleo y al acrílico.',
      '¿Por qué el "Performance Art" (arte de acción) desafía la idea tradicional de obra?',
      'Explica: Qué es el "Claroscuro" y cómo dramática la luz en una pintura.',
      '¿La escultura en mármol sigue siendo relevante en el siglo XXI?',
      'Explica: El arte del "Collage" y cómo reciclar imágenes crea nuevos significados.',
      '¿Por qué el dibujo a mano alzada sigue siendo la base de toda disciplina artística?',
      'Explica: La técnica del "Fresco" y por qué es tan difícil de restaurar.',
      '¿Es la cerámica una artesanía o puede ser considerada bellas artes?',
      'Explica: El concepto de "Ready-made" (objetos cotidianos convertidos en arte).',
      '¿Por qué el color es la herramienta más poderosa para manipular emociones en el arte?',
      'Explica: Por qué una fotografía puede ser más poderosa que mil palabras.',
      '¿El cine de autor es arte o es solo entretenimiento para minorías?',
      'Explica: La regla de los tercios y por qué funciona en la composición visual.',
      '¿La edición digital (Photoshop) ha arruinado la credibilidad de la fotografía artística?',
      'Explica: El concepto de "El instante decisivo" de Henri Cartier-Bresson.',
      '¿Puede un videojuego con una dirección artística excepcional ser considerado una obra maestra?',
      'Explica: La estética del "Cyberpunk" y su influencia en el diseño actual.',
      '¿El "stop motion" es la forma de animación más artística y laboriosa?',
      'Explica: Cómo la banda sonora eleva una escena de cine a la categoría de arte.',
      '¿La realidad virtual (VR) será el próximo gran lienzo para los artistas?',
      'Explica: Por qué el arte es una herramienta fundamental en la educación infantil.',
      '¿El arte puede ser una forma efectiva de terapia para la salud mental?',
      'Explica: Cómo el arte ha sido usado como propaganda política a lo largo de la historia.',
      '¿Por qué las ciudades que invierten en cultura son más prósperas económicamente?',
      'Explica: El rol del arte indígena en la preservación de la identidad cultural.',
      '¿Debería haber más arte en los hospitales y espacios de salud?',
      'Explica: Cómo la moda es una forma de arte corporal y expresión social.',
      '¿El arte contemporáneo está demasiado desconectado de la gente común?',
      'Explica: La importancia de preservar el patrimonio arquitectónico de una ciudad.',
      '¿Si el mundo se acabara mañana, qué obra de arte salvarías y por qué?'
    ]),
    arte_category_id,
    'improvisado';
    
  RAISE NOTICE '100 temas de Arte insertados correctamente';
END $$;

-- Verificar que se insertaron correctamente
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
WHERE c.name = 'Arte'
GROUP BY c.name;
