-- Insertar 100 temas de Música de forma segura
DO $$
DECLARE
  musica_category_id UUID;
BEGIN
  -- Obtener el ID de la categoría Música
  SELECT id INTO musica_category_id FROM categories WHERE name = 'Música';
  
  IF musica_category_id IS NULL THEN
    RAISE EXCEPTION 'La categoría Música no existe. Ejecuta primero create_categories_only.sql';
  END IF;
  
  -- Insertar los 100 temas de Música
  INSERT INTO topics (title, category_id, mode) 
  SELECT 
    unnest(ARRAY[
      '¿Por qué la música aparece en prácticamente todas las culturas humanas?',
      'Explica: Cómo el ritmo puede producir una respuesta física incluso sin entender la letra.',
      '¿Puede existir música sin melodía?',
      '¿Por qué una canción puede hacernos recordar momentos de hace muchos años?',
      'Explica: La diferencia entre ritmo, melodía y armonía.',
      '¿La música es un lenguaje universal?',
      '¿Por qué algunas canciones nos emocionan aunque no entendamos el idioma?',
      '¿Qué hace que una melodía sea fácil de recordar?',
      'Explica: Por qué el silencio también puede formar parte de la música.',
      '¿Puede una pieza musical contar una historia sin utilizar palabras?',
      '¿Por qué Johann Sebastian Bach es considerado uno de los grandes compositores de la historia?',
      'Explica: Qué hizo revolucionaria la música de Beethoven.',
      '¿Mozart fue principalmente un genio natural o el resultado de una formación extraordinaria?',
      'Explica: Por qué Beethoven siguió componiendo después de perder gran parte de su audición.',
      '¿Por qué la Novena Sinfonía de Beethoven se convirtió en una obra universal?',
      'Explica: La importancia de Antonio Vivaldi y Las cuatro estaciones.',
      '¿Qué hace que una obra de música clásica sobreviva durante siglos?',
      'Explica: Por qué Chopin está tan relacionado con el piano.',
      '¿Puede una interpretación moderna mejorar una obra compuesta hace cientos de años?',
      '¿Qué compositor clásico crees que tendría mayor éxito si viviera actualmente?',
      'Explica: Por qué la ópera combinó música, teatro y literatura de una manera revolucionaria.',
      '¿La ópera sigue teniendo sentido para el público del siglo XXI?',
      'Explica: La diferencia entre una sinfonía y un concierto.',
      '¿Por qué una orquesta necesita un director?',
      '¿Podría una gran orquesta interpretar correctamente una obra sin director?',
      'Explica: El papel de los instrumentos de cuerda dentro de una orquesta.',
      '¿Qué instrumento transmite mejor las emociones humanas?',
      '¿Por qué el piano se convirtió en uno de los instrumentos más importantes de la música occidental?',
      'Explica: Cómo una misma obra puede sonar completamente diferente según el intérprete.',
      '¿La dificultad técnica convierte automáticamente una obra en mejor música?',
      '¿Por qué el blues tuvo tanta influencia sobre la música popular moderna?',
      'Explica: Cómo nació el jazz y qué lo hizo diferente.',
      '¿Por qué la improvisación es fundamental en el jazz?',
      'Explica: La importancia de Louis Armstrong en la historia de la música.',
      '¿Miles Davis cambió el jazz más por su técnica o por su capacidad de reinventarse?',
      'Explica: Cómo el blues influyó en el nacimiento del rock.',
      '¿Por qué Nueva Orleans fue tan importante para la historia de la música?',
      '¿El jazz es más difícil de apreciar que otros géneros o simplemente requiere más exposición?',
      'Explica: Qué significa improvisar musicalmente.',
      '¿Puede una improvisación ser tan valiosa como una composición escrita?',
      '¿Por qué Elvis Presley se convirtió en un símbolo del nacimiento del rock and roll?',
      'Explica: Cómo The Beatles transformaron la música popular.',
      '¿The Beatles habrían sido igual de importantes sin la evolución de sus últimos álbumes?',
      '¿Por qué Sgt. Pepper’s Lonely Hearts Club Band suele considerarse un álbum revolucionario?',
      'Explica: La influencia de The Rolling Stones en la cultura del rock.',
      '¿Freddie Mercury fue uno de los mejores vocalistas de la historia?',
      'Explica: Por qué Queen consiguió mezclar rock, ópera y música pop.',
      '¿Por qué Bohemian Rhapsody rompe muchas reglas de una canción convencional?',
      '¿Jimi Hendrix cambió más la guitarra eléctrica que cualquier otro músico?',
      '¿Qué hace que una banda de rock sobreviva culturalmente después de separarse?',
      'Explica: Por qué Michael Jackson fue llamado el "Rey del Pop".',
      '¿Madonna cambió la música pop tanto como cambió la imagen del artista pop?',
      'Explica: La importancia del videoclip en el éxito de la música popular.',
      '¿Por qué MTV transformó la industria musical en los años 80?',
      '¿Una estrella pop necesita ser una gran cantante para ser una gran artista?',
      'Explica: Cómo la producción musical puede transformar una canción sencilla.',
      '¿El pop está diseñado para ser fácil de recordar?',
      '¿Por qué algunas canciones extremadamente simples se convierten en éxitos mundiales?',
      '¿Es más importante una buena voz o una personalidad artística reconocible?',
      '¿Qué convierte una canción pop en un clásico?',
      'Explica: Cómo nació el hip-hop en el Bronx.',
      '¿Por qué el rap se convirtió en una de las formas musicales más influyentes del mundo?',
      'Explica: La importancia del sampling en el hip-hop.',
      '¿Tomar fragmentos de otras canciones para crear nueva música es creatividad o copia?',
      '¿El rap debería considerarse también una forma de poesía?',
      'Explica: Cómo el hip-hop pasó de una cultura local a un fenómeno global.',
      '¿Qué es más importante en el rap: la letra, el flow o la producción?',
      '¿Por qué las batallas de rap atraen tanto al público?',
      '¿La música puede convertirse en una herramienta efectiva de protesta social?',
      '¿Hasta qué punto un artista debe ser responsable del mensaje de sus canciones?',
      'Explica: Por qué Bob Marley convirtió el reggae en un fenómeno mundial.',
      '¿Cómo puede una música local convertirse en una música global?',
      'Explica: La importancia de la música africana en el desarrollo de numerosos géneros modernos.',
      '¿Por qué los ritmos africanos tuvieron tanta influencia en la música de América?',
      'Explica: Cómo surgió la salsa a partir de diferentes tradiciones musicales.',
      '¿Por qué el tango está tan vinculado con la identidad de Argentina y Uruguay?',
      'Explica: Cómo el flamenco combina música, canto y baile.',
      '¿Por qué la música brasileña ha tenido tanta influencia internacional?',
      '¿El K-pop demuestra que el idioma ya no es una barrera para el éxito global?',
      '¿La globalización está enriqueciendo la música o haciendo que todos los países suenen cada vez más parecidos?',
      '¿Por qué las canciones de protesta aparecen en momentos de crisis política o social?',
      'Explica: Cómo la música puede convertirse en símbolo de una generación.',
      '¿Puede una canción cambiar realmente la sociedad?',
      '¿Por qué ciertos gobiernos han censurado músicos y canciones?',
      '¿Una canción debe separarse de las opiniones o acciones de su intérprete?',
      '¿La música puede ayudar a construir una identidad nacional?',
      'Explica: Por qué los himnos tienen tanta fuerza emocional.',
      '¿Por qué la música está tan presente en rituales religiosos y ceremonias?',
      '¿Una canción puede pertenecer culturalmente a una comunidad aunque tenga un autor concreto?',
      '¿La apropiación cultural en la música es intercambio artístico o puede convertirse en explotación?',
      '¿El Auto-Tune es una herramienta creativa o una forma de ocultar falta de talento?',
      'Explica: Cómo Spotify y el streaming cambiaron nuestra manera de escuchar música.',
      '¿Escuchar canciones sueltas está acabando con el concepto de álbum?',
      '¿Los algoritmos musicales amplían nuestros gustos o nos encierran en una burbuja?',
      '¿La inteligencia artificial podrá crear música capaz de emocionarnos tanto como la creada por humanos?',
      '¿Una canción creada completamente por una IA debería poder ganar un premio musical?',
      '¿La facilidad para producir música desde una computadora ha mejorado o saturado la industria?',
      '¿Los conciertos en vivo seguirán siendo importantes en una época de experiencias virtuales?',
      'Si solo pudieras conservar la música de una década de toda la historia, ¿cuál elegirías y por qué?',
      'Si pudieras asistir a cualquier concierto de la historia, ¿cuál elegirías y por qué?'
    ]),
    musica_category_id,
    'improvisado';
    
  RAISE NOTICE '100 temas de Música insertados correctamente';
END $$;

-- Verificar que se insertaron correctamente
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
WHERE c.name = 'Música'
GROUP BY c.name;
