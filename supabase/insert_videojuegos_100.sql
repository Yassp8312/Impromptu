-- Insertar 100 temas de Videojuegos de forma segura
DO $$
DECLARE
  videojuegos_category_id UUID;
BEGIN
  -- Obtener el ID de la categoría Videojuegos
  SELECT id INTO videojuegos_category_id FROM categories WHERE name = 'Videojuegos';
  
  IF videojuegos_category_id IS NULL THEN
    RAISE EXCEPTION 'La categoría Videojuegos no existe. Ejecuta primero create_categories_only.sql';
  END IF;
  
  -- Insertar los 100 temas de Videojuegos
  INSERT INTO topics (title, category_id, mode) 
  SELECT 
    unnest(ARRAY[
      '¿Los videojuegos son principalmente entretenimiento o pueden considerarse arte?',
      '¿Qué hace que un videojuego siga siendo divertido décadas después de su lanzamiento?',
      '¿Los gráficos importan menos que una buena jugabilidad?',
      '¿Es mejor un videojuego corto e inolvidable que uno enorme con cientos de horas?',
      '¿La dificultad hace que un videojuego sea más satisfactorio?',
      '¿Un videojuego necesita contar una historia para ser excelente?',
      '¿Qué es más importante: jugabilidad, historia, gráficos o música?',
      '¿Los videojuegos modernos dan demasiadas instrucciones al jugador?',
      '¿La libertad total mejora un videojuego o puede hacer que pierda dirección?',
      '¿Qué videojuego utilizarías para convencer a alguien de que los videojuegos son arte?',
      '¿Los videojuegos generan violencia en la vida real?',
      '¿Por qué este debate continúa existiendo después de tantos años?',
      '¿Los padres deberían controlar cuánto tiempo juegan sus hijos?',
      '¿Los videojuegos pueden mejorar habilidades cognitivas?',
      '¿Jugar muchas horas es siempre una pérdida de tiempo?',
      '¿Los videojuegos pueden ayudar a desarrollar perseverancia?',
      '¿Es posible aprender habilidades reales jugando?',
      '¿Un videojuego puede cambiar nuestra forma de pensar sobre un tema?',
      '¿Los videojuegos deberían utilizarse más en las escuelas?',
      '¿Qué puede enseñar un videojuego que resulta difícil enseñar mediante un libro?',
      '¿Por qué Super Mario Bros. fue tan importante para la historia de los videojuegos?',
      '¿Qué hizo revolucionario al primer The Legend of Zelda?',
      '¿Por qué Tetris continúa funcionando después de tantas décadas?',
      '¿Qué convirtió a Pac-Man en un ícono cultural?',
      '¿Por qué Doom fue tan importante para los juegos de disparos?',
      '¿Qué cambió Super Mario 64 en los videojuegos tridimensionales?',
      '¿Por qué Half-Life transformó la manera de contar historias en los shooters?',
      '¿Qué hizo especial a Metal Gear Solid cuando apareció?',
      '¿Por qué Minecraft se convirtió en uno de los videojuegos más influyentes de la historia?',
      '¿Qué videojuego moderno crees que será considerado un clásico dentro de cincuenta años?',
      '¿Nintendo entiende la diversión mejor que otras compañías?',
      '¿PlayStation o Xbox: qué filosofía ha aportado más a la industria?',
      '¿Por qué Sega perdió su lugar como fabricante de consolas?',
      '¿Qué hizo que la PlayStation original tuviera tanto éxito?',
      '¿Por qué la Nintendo Wii logró atraer a personas que normalmente no jugaban?',
      '¿Las consolas seguirán existiendo cuando el juego en la nube sea suficientemente avanzado?',
      '¿Es mejor jugar en PC o en consola?',
      '¿Las exclusividades benefician o perjudican a los jugadores?',
      '¿Una consola necesita grandes juegos exclusivos para triunfar?',
      '¿Qué compañía ha tenido mayor impacto en la historia de los videojuegos?',
      '¿Los mundos abiertos han mejorado los videojuegos o se utilizan demasiado?',
      '¿Por qué explorar un mundo virtual puede ser tan satisfactorio?',
      '¿Es mejor un mapa pequeño lleno de detalles o uno gigantesco?',
      '¿Los marcadores constantes en el mapa destruyen la sensación de exploración?',
      '¿Qué hace que un mundo virtual parezca realmente vivo?',
      '¿Los juegos de mundo abierto deberían permitir entrar en todos los edificios?',
      '¿Por qué algunos jugadores pasan horas haciendo actividades secundarias?',
      '¿Un mapa demasiado grande puede perjudicar un videojuego?',
      '¿Qué mundo de un videojuego elegirías para vivir durante un año?',
      '¿Qué mundo de videojuego sería el peor lugar posible para vivir?',
      '¿Un protagonista silencioso permite identificarse mejor con el personaje?',
      '¿Por qué algunos personajes de videojuegos generan vínculos emocionales tan fuertes?',
      '¿Un villano necesita tener motivos comprensibles para ser memorable?',
      '¿Qué hace que una muerte dentro de un videojuego pueda afectarnos emocionalmente?',
      '¿Es más fácil conectar con un personaje que controlamos que con uno que simplemente vemos en una película?',
      '¿Las decisiones morales mejoran una historia interactiva?',
      '¿Un videojuego debería permitir que nuestras decisiones cambien realmente el final?',
      '¿Es frustrante descubrir que muchas decisiones de un juego conducen al mismo resultado?',
      '¿Un personaje personalizable puede ser tan memorable como uno completamente definido?',
      '¿Quién es el personaje más icónico de la historia de los videojuegos?',
      '¿Por qué los juegos tipo Dark Souls hicieron popular una dificultad muy exigente?',
      '¿Debería todo videojuego tener un modo fácil?',
      '¿Reducir la dificultad significa experimentar una versión inferior del juego?',
      '¿Por qué perder repetidamente puede resultar divertido?',
      '¿Un jefe difícil debe poner a prueba habilidad, paciencia o ambas?',
      '¿Los tutoriales deberían poder omitirse siempre?',
      '¿Es mejor que un videojuego enseñe sus reglas sin explicarlas directamente?',
      '¿Qué convierte un sistema de combate en satisfactorio?',
      '¿Los videojuegos deberían respetar más el tiempo del jugador?',
      '¿Es justo abandonar un juego porque se vuelve demasiado difícil?',
      '¿Los videojuegos multijugador son mejores cuando existe competencia o cooperación?',
      '¿Por qué disfrutamos compitiendo contra desconocidos?',
      '¿Los rankings hacen que un videojuego sea más adictivo?',
      '¿El juego online perdió parte de la magia de jugar juntos en la misma habitación?',
      '¿Los esports deberían considerarse deportes?',
      '¿Un jugador profesional de videojuegos puede considerarse un atleta?',
      '¿Por qué algunos videojuegos competitivos sobreviven durante décadas?',
      '¿El matchmaking basado en habilidad mejora o empeora las partidas casuales?',
      '¿Los jugadores tóxicos pueden destruir una buena comunidad?',
      '¿Qué hace que una comunidad de videojuegos sea saludable?',
      '¿Los DLC son una buena forma de ampliar un juego o contenido que antes habría venido incluido?',
      '¿Las microtransacciones deberían existir en videojuegos de precio completo?',
      '¿Los pases de batalla son mejores que las cajas de botín?',
      '¿Los juegos gratuitos terminan siendo más caros que los juegos tradicionales?',
      '¿Es ético vender objetos digitales extremadamente caros dentro de un videojuego?',
      '¿Los videojuegos como servicio están acabando con los juegos tradicionales?',
      '¿Deberíamos poder seguir jugando un videojuego online después de que la empresa cierre sus servidores?',
      '¿Comprar un videojuego digital significa realmente ser su propietario?',
      '¿Las suscripciones como Game Pass cambian nuestra percepción del valor de un videojuego?',
      '¿La industria debería preservar todos los videojuegos antiguos?',
      '¿La inteligencia artificial hará que los NPC parezcan verdaderas personas?',
      '¿Sería mejor un videojuego donde cada conversación con un personaje fuera completamente diferente gracias a la IA?',
      '¿La IA podría crear mundos infinitos sin que terminen sintiéndose repetitivos?',
      '¿Los videojuegos generados parcialmente por inteligencia artificial perderían identidad artística?',
      '¿La realidad virtual es el futuro de los videojuegos o seguirá siendo un nicho?',
      '¿Qué tendría que mejorar la realidad virtual para convertirse en una tecnología masiva?',
      '¿Llegarán los videojuegos a ser prácticamente indistinguibles de la realidad?',
      'Si pudieras olvidar completamente un videojuego para experimentarlo otra vez por primera vez, ¿cuál elegirías?',
      'Si solo pudieras jugar un único videojuego durante el resto de tu vida, ¿qué características tendría?',
      'Si pudieras entrar durante 24 horas en cualquier videojuego de la historia, ¿cuál elegirías y qué harías primero?'
    ]),
    videojuegos_category_id,
    'improvisado';
    
  RAISE NOTICE '100 temas de Videojuegos insertados correctamente';
END $$;

-- Verificar que se insertaron correctamente
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
WHERE c.name = 'Videojuegos'
GROUP BY c.name;
