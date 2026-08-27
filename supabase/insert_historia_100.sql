-- Insertar 100 temas de Historia de forma segura
DO $$
DECLARE
  historia_category_id UUID;
BEGIN
  -- Obtener el ID de la categoría Historia
  SELECT id INTO historia_category_id FROM categories WHERE name = 'Historia';
  
  IF historia_category_id IS NULL THEN
    RAISE EXCEPTION 'La categoría Historia no existe. Ejecuta primero create_categories_only.sql';
  END IF;
  
  -- Insertar los 100 temas de Historia
  INSERT INTO topics (title, category_id, mode) 
  SELECT 
    unnest(ARRAY[
      '¿Por qué la invención de la escritura marcó el inicio de la Historia?',
      'Explica: Cómo surgieron las primeras ciudades en Mesopotamia.',
      '¿Por qué Egipto pudo mantener una civilización estable durante miles de años?',
      'Explica: La importancia del río Nilo para el antiguo Egipto.',
      '¿Por qué el Código de Hammurabi fue importante para la historia del derecho?',
      'Explica: Cómo funcionaba la democracia en la antigua Atenas.',
      '¿Fue Alejandro Magno principalmente un conquistador o un difusor de culturas?',
      'Explica: Por qué Esparta desarrolló una sociedad tan militarizada.',
      '¿Qué hizo que el Imperio persa pudiera gobernar territorios tan diversos?',
      '¿Por qué la antigua Grecia tuvo tanta influencia en la cultura occidental?',
      'Explica: Cómo Roma pasó de ser una república a convertirse en un imperio.',
      '¿Por qué Julio César cambió para siempre la historia de Roma?',
      'Explica: La importancia de las Guerras Púnicas entre Roma y Cartago.',
      '¿Por qué cayó el Imperio romano de Occidente?',
      '¿Fue el Imperio romano más exitoso por sus ejércitos o por su capacidad de organización?',
      'Explica: Cómo las carreteras romanas ayudaron a mantener el imperio.',
      '¿Qué importancia tuvo la expansión del cristianismo dentro del Imperio romano?',
      'Explica: La división del Imperio romano entre Oriente y Occidente.',
      '¿Por qué Constantinopla fue una de las ciudades más importantes de la historia?',
      '¿El Imperio bizantino fue realmente una continuación del Imperio romano?',
      'Explica: Cómo surgió y se expandió el islam en el siglo VII.',
      '¿Por qué el mundo islámico medieval se convirtió en un gran centro científico y cultural?',
      'Explica: La importancia de la Casa de la Sabiduría de Bagdad.',
      '¿Qué impacto tuvieron las Cruzadas en Europa y Oriente Medio?',
      'Explica: Cómo funcionaba el sistema feudal en la Europa medieval.',
      '¿Por qué la peste negra transformó profundamente la sociedad europea?',
      '¿La Edad Media fue realmente una época de atraso?',
      'Explica: Por qué las ciudades medievales comenzaron a crecer nuevamente.',
      '¿Qué papel tuvieron los monasterios en la conservación del conocimiento?',
      'Explica: Cómo la Carta Magna limitó el poder del rey de Inglaterra.',
      '¿Por qué el Imperio mongol llegó a convertirse en el mayor imperio terrestre continuo de la historia?',
      'Explica: Cómo Gengis Kan logró unir a las tribus mongolas.',
      '¿Los mongoles fueron únicamente destructores o también facilitaron el intercambio cultural?',
      'Explica: La importancia de la Ruta de la Seda.',
      '¿Por qué China fue durante siglos una de las civilizaciones tecnológicamente más avanzadas?',
      'Explica: La importancia de inventos chinos como la pólvora, el papel y la brújula.',
      '¿Por qué la dinastía Ming construyó y reforzó la Gran Muralla?',
      'Explica: Los viajes marítimos del almirante Zheng He.',
      '¿Por qué Japón desarrolló durante siglos una sociedad dominada por los samuráis?',
      'Explica: Qué significó el aislamiento de Japón durante el período Tokugawa.',
      '¿Por qué el Imperio de Malí fue una de las grandes potencias de África medieval?',
      'Explica: Por qué Mansa Musa se convirtió en una figura legendaria.',
      '¿Qué importancia tuvo Tombuctú como centro de conocimiento y comercio?',
      'Explica: Cómo funcionaban las grandes rutas comerciales transaharianas.',
      '¿Por qué el Reino de Aksum fue importante para la historia africana?',
      'Explica: El desarrollo del Gran Zimbabue.',
      '¿Por qué el Reino del Congo se convirtió en una gran potencia de África Central?',
      'Explica: La importancia histórica del Imperio Songhai.',
      '¿Por qué la historia africana anterior a la colonización suele ser poco conocida fuera del continente?',
      '¿Cómo cambió África el contacto creciente con comerciantes europeos?',
      'Explica: Cómo los mayas desarrollaron conocimientos avanzados de astronomía y matemáticas.',
      '¿Por qué desaparecieron muchas de las grandes ciudades mayas?',
      'Explica: Cómo los aztecas construyeron Tenochtitlán.',
      '¿Cómo logró Hernán Cortés derrotar al Imperio azteca con un ejército relativamente pequeño?',
      'Explica: Cómo los incas administraron un enorme imperio sin un sistema de escritura alfabética.',
      '¿Por qué cayó tan rápidamente el Imperio inca ante los españoles?',
      'Explica: El impacto de las enfermedades europeas sobre las poblaciones americanas.',
      '¿El encuentro entre Europa y América en 1492 fue un descubrimiento, una conquista o ambas cosas?',
      'Explica: El intercambio colombino y cómo transformó el mundo.',
      '¿Qué alimento originario de América crees que cambió más la historia mundial?',
      '¿Por qué el Renacimiento comenzó en las ciudades italianas?',
      'Explica: Cómo la imprenta de Gutenberg transformó la difusión del conocimiento.',
      '¿Por qué la Reforma protestante dividió Europa?',
      'Explica: El conflicto entre Martín Lutero y la Iglesia católica.',
      '¿Cómo cambió la Revolución Científica nuestra forma de entender el universo?',
      'Explica: Por qué Galileo tuvo problemas con la Iglesia.',
      '¿La expansión marítima europea habría sido posible sin nuevos avances tecnológicos?',
      'Explica: Por qué Portugal y España lideraron inicialmente la expansión ultramarina.',
      '¿Cómo cambió el comercio mundial con la apertura de rutas oceánicas?',
      '¿Por qué los imperios europeos comenzaron a competir por colonias?',
      'Explica: Cómo funcionó el comercio transatlántico de personas esclavizadas.',
      '¿Qué consecuencias tuvo la esclavitud atlántica para África, América y Europa?',
      'Explica: La Revolución Gloriosa inglesa y su importancia política.',
      '¿Por qué las ideas de la Ilustración fueron revolucionarias?',
      'Explica: Qué significaba la separación de poderes propuesta por Montesquieu.',
      '¿Por qué la independencia de Estados Unidos tuvo impacto más allá de Norteamérica?',
      'Explica: Las principales causas de la Revolución Francesa.',
      '¿Por qué la toma de la Bastilla se convirtió en un símbolo?',
      '¿Napoleón destruyó los ideales de la Revolución Francesa o ayudó a difundirlos?',
      'Explica: Cómo las guerras napoleónicas transformaron Europa.',
      '¿Por qué la Revolución Industrial comenzó en Gran Bretaña?',
      'Explica: Cómo la máquina de vapor cambió la economía mundial.',
      '¿La Revolución Industrial mejoró o empeoró inicialmente la vida de los trabajadores?',
      'Explica: Cómo el ferrocarril transformó las sociedades del siglo XIX.',
      '¿Por qué surgieron los movimientos obreros?',
      'Explica: Las causas principales del imperialismo europeo del siglo XIX.',
      '¿Cómo cambió la Conferencia de Berlín de 1884-1885 la historia de África?',
      '¿Por qué las potencias europeas pudieron conquistar grandes territorios en África y Asia?',
      'Explica: La Restauración Meiji y la rápida modernización de Japón.',
      '¿Por qué Japón consiguió convertirse en una potencia mundial en pocas décadas?',
      'Explica: Las principales causas de la Primera Guerra Mundial.',
      '¿Cómo pudo el asesinato de un archiduque desencadenar una guerra mundial?',
      'Explica: Por qué la Revolución Rusa de 1917 cambió la política mundial.',
      '¿Por qué el Tratado de Versalles contribuyó a nuevas tensiones en Europa?',
      'Explica: Cómo la Gran Depresión de 1929 afectó a diferentes países.',
      '¿Cuáles fueron las principales causas del ascenso del nazismo en Alemania?',
      'Explica: Por qué la Segunda Guerra Mundial fue un conflicto verdaderamente global.',
      '¿Cómo transformó la Guerra Fría las relaciones internacionales después de 1945?',
      'Explica: Por qué la descolonización cambió el mapa político de África y Asia durante el siglo XX.',
      'Si pudieras presenciar personalmente un solo acontecimiento de la historia universal sin correr ningún peligro, ¿cuál elegirías y por qué?'
    ]),
    historia_category_id,
    'improvisado';
    
  RAISE NOTICE '100 temas de Historia insertados correctamente';
END $$;

-- Verificar que se insertaron correctamente
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
WHERE c.name = 'Historia'
GROUP BY c.name;
