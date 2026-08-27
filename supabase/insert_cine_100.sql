-- Insertar 100 temas de Cine de forma segura
DO $$
DECLARE
  cine_category_id UUID;
BEGIN
  -- Obtener el ID de la categoría Cine
  SELECT id INTO cine_category_id FROM categories WHERE name = 'Cine';
  
  IF cine_category_id IS NULL THEN
    RAISE EXCEPTION 'La categoría Cine no existe. Ejecuta primero create_categories_only.sql';
  END IF;
  
  -- Insertar los 100 temas de Cine
  INSERT INTO topics (title, category_id, mode) 
  SELECT 
    unnest(ARRAY[
      'Explica: ¿Por qué la llegada del cine sonoro revolucionó Hollywood?',
      '¿Fue Ciudadano Kane realmente una revolución cinematográfica?',
      'Explica: Cómo el cine pasó del blanco y negro al color.',
      '¿Por qué El nacimiento de una nación es importante para la historia del cine y a la vez profundamente polémico?',
      'Explica: El impacto que tuvo Tiburón en el nacimiento del blockbuster moderno.',
      '¿Por qué Star Wars cambió para siempre la industria cinematográfica?',
      'Explica: Qué fue la época dorada de Hollywood.',
      '¿La llegada del streaming representa una revolución comparable a la llegada del sonido?',
      'Explica: Cómo Jurassic Park cambió el uso de los efectos digitales.',
      '¿Cuál ha sido el cambio tecnológico más importante de la historia del cine?',
      '¿Por qué Alfred Hitchcock sigue siendo considerado el maestro del suspense?',
      'Explica: Qué hace reconocible una película de Quentin Tarantino.',
      '¿Es Christopher Nolan uno de los grandes directores de su generación o está sobrevalorado?',
      'Explica: Por qué Stanley Kubrick era famoso por su perfeccionismo.',
      '¿Steven Spielberg es principalmente un gran artista o un gran creador de entretenimiento?',
      'Explica: Qué hace diferente al cine de Wes Anderson.',
      '¿Por qué Martin Scorsese está tan asociado con historias de crimen y moralidad?',
      'Explica: El estilo cinematográfico de Akira Kurosawa y su influencia en Occidente.',
      '¿Guillermo del Toro demuestra que el cine fantástico puede ser cine de autor?',
      '¿Qué es más importante para una película: un gran director o un gran guion?',
      '¿Qué convierte una actuación en una actuación inolvidable?',
      'Explica: La diferencia entre interpretar un personaje y "convertirse" en él.',
      '¿El método de actuación mejora realmente una interpretación?',
      '¿Es necesario que un actor cambie físicamente para demostrar compromiso con un papel?',
      'Explica: Por qué algunos actores quedan asociados para siempre con un solo personaje.',
      '¿Puede una estrella de cine salvar una película mediocre?',
      '¿Qué importa más: el carisma de un actor o su capacidad técnica?',
      'Explica: Por qué algunos villanos terminan siendo más memorables que los protagonistas.',
      '¿Un gran actor puede interpretar cualquier tipo de personaje?',
      '¿Es más difícil hacer reír o hacer llorar al público?',
      '¿Por qué las películas de terror nos gustan si están diseñadas para hacernos sentir miedo?',
      'Explica: La diferencia entre terror psicológico y terror basado en sobresaltos.',
      '¿Las películas de superhéroes son un género cinematográfico o una fórmula comercial?',
      '¿Por qué la ciencia ficción permite hablar del presente utilizando el futuro?',
      'Explica: Qué convierte una comedia romántica en una buena comedia romántica.',
      '¿El western está muerto o simplemente se ha transformado?',
      '¿Por qué el cine de gangsters sigue fascinando al público?',
      'Explica: Qué hace que un thriller mantenga la tensión.',
      '¿Las películas musicales deberían ser más populares actualmente?',
      '¿Cuál es el género cinematográfico más difícil de hacer bien?',
      '¿Marvel cambió el cine para mejor o para peor?',
      'Explica: Por qué el Universo Cinematográfico de Marvel fue un fenómeno sin precedentes.',
      '¿Por qué algunas secuelas superan a la película original?',
      '¿Debería una saga terminar aunque siga generando mucho dinero?',
      'Explica: Por qué El Señor de los Anillos es considerado un referente de las adaptaciones cinematográficas.',
      '¿Star Wars pertenece más a sus creadores o a sus fanáticos?',
      '¿Las franquicias están reduciendo la creatividad de Hollywood?',
      'Explica: Por qué algunos reinicios de películas funcionan y otros fracasan.',
      '¿Es necesario haber visto todas las películas de una saga para disfrutar una nueva entrega?',
      '¿Qué franquicia cinematográfica debería terminar definitivamente?',
      '¿El libro siempre es mejor que la película?',
      'Explica: Por qué adaptar una novela al cine implica necesariamente cambiar cosas.',
      '¿Un director debe ser fiel al material original?',
      '¿Los remakes demuestran falta de creatividad o pueden mejorar una historia?',
      'Explica: La dificultad de convertir los pensamientos de un personaje literario en imágenes.',
      '¿Es justo comparar una película constantemente con el libro en que se basa?',
      '¿Puede una adaptación ser excelente aunque cambie completamente la historia original?',
      '¿Por qué Hollywood rehace tantas películas exitosas del pasado?',
      'Explica: La diferencia entre una adaptación, un remake y un reboot.',
      'Si una película clásica funciona perfectamente, ¿debería prohibirse hacer un remake?',
      'Explica: Cómo el montaje puede cambiar completamente el significado de una escena.',
      '¿Por qué la música puede hacer que una escena normal resulte emocionante?',
      'Explica: Qué es un plano secuencia y por qué puede ser tan impactante.',
      '¿Qué aporta el blanco y negro a una película moderna?',
      'Explica: Cómo la iluminación puede hacer que un personaje parezca peligroso o vulnerable.',
      '¿Una película visualmente espectacular puede ser buena aunque tenga una historia débil?',
      'Explica: Por qué el silencio puede ser más poderoso que el diálogo.',
      '¿Qué importancia tiene el diseño de producción en la creación de un mundo cinematográfico?',
      'Explica: Cómo el montaje rápido y el montaje lento producen sensaciones diferentes.',
      '¿La mejor cámara es la que el espectador nunca nota?',
      '¿Los Oscar realmente premian las mejores películas?',
      'Explica: Por qué una película puede fracasar en taquilla y convertirse después en un clásico.',
      '¿Una película que gana mucho dinero necesariamente es exitosa?',
      '¿Por qué Hollywood invierte cientos de millones en algunas películas?',
      'Explica: Qué significa que una película sea un "fracaso de taquilla".',
      '¿Las campañas de premios influyen demasiado en quién gana un Oscar?',
      '¿Por qué algunas películas independientes logran competir contra grandes estudios?',
      '¿Debería existir una categoría del Oscar para películas populares?',
      'Explica: Cómo funciona el fenómeno del "boca a boca" en el éxito de una película.',
      '¿El presupuesto de una película limita o estimula la creatividad?',
      '¿Puede una película creada parcialmente por inteligencia artificial seguir siendo arte?',
      'Explica: Cómo los efectos visuales han cambiado la manera de hacer cine.',
      '¿El uso excesivo de CGI hace que las películas parezcan menos reales?',
      '¿Debería permitirse recrear digitalmente a actores fallecidos?',
      'Explica: La diferencia entre efectos prácticos y efectos digitales.',
      '¿Una IA podría escribir algún día un guion ganador del Oscar?',
      '¿Los actores digitales podrían reemplazar parcialmente a los actores humanos?',
      'Explica: Cómo la captura de movimiento permite crear personajes digitales convincentes.',
      '¿Las salas de cine sobrevivirán al avance del streaming y la realidad virtual?',
      '¿Podríamos llegar a ver películas completamente personalizadas para cada espectador?',
      '¿El cine tiene la responsabilidad de representar correctamente la realidad?',
      'Explica: Cómo una película puede cambiar la percepción pública de un acontecimiento histórico.',
      '¿Debería separarse la obra cinematográfica de la conducta personal de su creador?',
      '¿Las películas violentas pueden influir realmente en el comportamiento de las personas?',
      'Explica: Por qué algunas películas inicialmente rechazadas terminan convirtiéndose en obras de culto.',
      '¿El cine debe principalmente entretener o también tiene una responsabilidad social?',
      '¿Es correcto cambiar personajes o historias clásicas para adaptarlas a nuevas generaciones?',
      '¿Las películas pueden cambiar realmente la forma de pensar de una sociedad?',
      '¿Qué hace que una película envejezca bien mientras otra parece anticuada pocos años después?',
      'Si pudieras borrar una película de tu memoria para verla otra vez por primera vez, ¿cuál elegirías y por qué?'
    ]),
    cine_category_id,
    'improvisado';
    
  RAISE NOTICE '100 temas de Cine insertados correctamente';
END $$;

-- Verificar que se insertaron correctamente
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
WHERE c.name = 'Cine'
GROUP BY c.name;
