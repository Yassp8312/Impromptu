-- Insertar 100 temas de Tecnología de forma segura
DO $$
DECLARE
  tecnologia_category_id UUID;
BEGIN
  -- Obtener el ID de la categoría Tecnología
  SELECT id INTO tecnologia_category_id FROM categories WHERE name = 'Tecnología';
  
  IF tecnologia_category_id IS NULL THEN
    RAISE EXCEPTION 'La categoría Tecnología no existe. Ejecuta primero create_categories_only.sql';
  END IF;
  
  -- Insertar los 100 temas de Tecnología
  INSERT INTO topics (title, category_id, mode) 
  SELECT 
    unnest(ARRAY[
      '¿La tecnología nos hace más inteligentes o más dependientes?',
      '¿Podríamos vivir actualmente una semana completa sin Internet?',
      '¿La tecnología realmente nos ahorra tiempo o simplemente nos da más cosas que hacer?',
      '¿Cada nueva tecnología mejora necesariamente nuestra calidad de vida?',
      '¿Por qué algunas tecnologías desaparecen mientras otras transforman completamente la sociedad?',
      '¿Es posible detener una tecnología una vez que demuestra ser útil?',
      '¿Nos adaptamos nosotros a la tecnología o la tecnología termina adaptándonos a nosotros?',
      '¿Cuál ha sido el invento tecnológico más importante de la historia?',
      '¿Una sociedad más tecnológica es necesariamente una sociedad más avanzada?',
      '¿Qué tecnología actual parecerá absurda dentro de cien años?',
      '¿La inteligencia artificial será tan revolucionaria como Internet?',
      '¿Puede una inteligencia artificial llegar a ser más creativa que un ser humano?',
      '¿Deberíamos preocuparnos por máquinas capaces de superar nuestras capacidades intelectuales?',
      '¿La IA eliminará más empleos de los que creará?',
      '¿Debería una persona saber cuándo está hablando con una inteligencia artificial?',
      '¿Puede una IA tomar mejores decisiones que un ser humano?',
      '¿Quién debería ser responsable cuando una inteligencia artificial comete un error?',
      '¿Una obra creada por inteligencia artificial pertenece al usuario, al programador o a la máquina?',
      '¿Deberíamos permitir que una IA tome decisiones importantes sobre nuestras vidas?',
      '¿Puede una sociedad depender demasiado de la inteligencia artificial?',
      '¿Los teléfonos inteligentes nos conectan o nos aíslan?',
      '¿Seríamos más felices con teléfonos menos avanzados?',
      '¿El smartphone es el invento más importante del siglo XXI hasta ahora?',
      '¿Por qué resulta tan difícil dejar de mirar el teléfono?',
      '¿Deberían existir espacios públicos donde los teléfonos estén prohibidos?',
      '¿Un niño debería tener su propio smartphone?',
      '¿Los teléfonos han destruido nuestra capacidad de aburrirnos?',
      '¿Las cámaras de los móviles están acabando con las cámaras tradicionales?',
      '¿Necesitamos realmente cambiar de teléfono cada pocos años?',
      '¿Qué función eliminarías de los smartphones actuales?',
      '¿Las redes sociales han mejorado o empeorado Internet?',
      '¿Los algoritmos deciden demasiado de lo que vemos?',
      '¿Tenemos realmente libertad de elección cuando un algoritmo selecciona nuestro contenido?',
      '¿Las redes sociales deberían mostrar cómo funcionan sus algoritmos?',
      '¿Internet nos permite conocer más opiniones o nos encierra en burbujas?',
      '¿El anonimato en Internet debería desaparecer?',
      '¿Deberíamos poder borrar completamente nuestro pasado digital?',
      '¿Las redes sociales están diseñadas para crear adicción?',
      '¿Una persona debería ser propietaria de todos los datos que genera en Internet?',
      '¿Es posible tener verdadera privacidad en la era digital?',
      '¿Deberíamos sacrificar privacidad a cambio de mayor seguridad?',
      '¿Es correcto que las aplicaciones conozcan nuestra ubicación constantemente?',
      '¿Las cámaras de vigilancia hacen que una ciudad sea más segura?',
      '¿Debería utilizarse reconocimiento facial en espacios públicos?',
      '¿Qué es más peligroso: que una empresa tenga nuestros datos o que los tenga un gobierno?',
      '¿Una contraseña seguirá siendo necesaria dentro de veinte años?',
      '¿La biometría es más segura que las contraseñas?',
      '¿Deberíamos preocuparnos por dispositivos que escuchan constantemente dentro de casa?',
      '¿Existe realmente algo privado una vez que se publica en Internet?',
      '¿Hasta qué punto somos responsables de proteger nuestra propia información digital?',
      '¿Los robots deberían tener apariencia humana?',
      '¿Aceptaríamos mejor a un robot si pareciera una persona?',
      '¿Un robot podría convertirse en un compañero emocional?',
      '¿Deberían los robots cuidar a personas mayores?',
      '¿Es correcto utilizar robots para trabajos peligrosos aunque eliminen empleos humanos?',
      '¿Qué profesión debería ser la última en ser automatizada?',
      '¿Una fábrica completamente automatizada sería algo positivo para la sociedad?',
      '¿Los robots domésticos serán tan comunes como los electrodomésticos?',
      '¿Puede una máquina sustituir completamente el contacto humano en algún servicio?',
      '¿Deberían existir derechos para máquinas extremadamente avanzadas?',
      '¿Los coches autónomos conducirán mejor que los humanos?',
      '¿Quién debería ser responsable de un accidente provocado por un vehículo autónomo?',
      '¿Deberíamos prohibir conducir manualmente si los vehículos autónomos se vuelven mucho más seguros?',
      '¿Los coches eléctricos representan realmente el futuro del transporte?',
      '¿Las ciudades deberían estar diseñadas menos para los automóviles y más para las personas?',
      '¿Los drones transformarán la forma en que recibimos productos?',
      '¿Los taxis voladores llegarán realmente a ser comunes?',
      '¿La tecnología podrá eliminar los accidentes de tráfico?',
      '¿Ser propietario de un coche seguirá siendo importante en el futuro?',
      '¿Cómo cambiarían nuestras ciudades si prácticamente ningún vehículo necesitara conductor?',
      '¿La realidad virtual puede llegar a ser tan importante como el smartphone?',
      '¿Podríamos trabajar normalmente dentro de mundos virtuales?',
      '¿La realidad aumentada terminará sustituyendo parcialmente a las pantallas?',
      '¿Preferirías unas gafas inteligentes capaces de reemplazar tu teléfono?',
      '¿Un mundo virtual puede tener tanto valor como un espacio físico?',
      '¿Pasar varias horas al día en realidad virtual sería necesariamente algo negativo?',
      '¿Podrían los mundos virtuales transformar la educación?',
      '¿Una reunión virtual puede sustituir completamente una reunión presencial?',
      '¿Llegaremos a comprar objetos digitales con el mismo interés que objetos físicos?',
      '¿Dónde debería estar el límite entre nuestra identidad física y nuestra identidad digital?',
      '¿El hogar del futuro debería estar completamente automatizado?',
      '¿Una casa inteligente puede convertirse en un problema si falla Internet?',
      '¿Necesitamos realmente electrodomésticos conectados a Internet?',
      '¿Permitirías que una inteligencia artificial administrara automáticamente tu casa?',
      '¿La impresión 3D cambiará nuestra forma de fabricar productos?',
      '¿Podremos algún día imprimir en casa la mayoría de los objetos que necesitamos?',
      '¿Las baterías son uno de los mayores obstáculos para el progreso tecnológico?',
      '¿La computación cuántica cambiará la vida cotidiana o seguirá siendo una tecnología especializada?',
      '¿Los dispositivos serán cada vez más pequeños o terminarán desapareciendo dentro de nuestro entorno?',
      '¿Implantarías un chip tecnológico en tu cuerpo si aumentara tus capacidades?',
      '¿La tecnología está avanzando más rápido que nuestra capacidad para regularla?',
      '¿Deberían los gobiernos poder prohibir determinadas tecnologías?',
      '¿Las grandes empresas tecnológicas tienen demasiado poder?',
      '¿Debería Internet considerarse un servicio básico como el agua o la electricidad?',
      '¿Existe un derecho humano al acceso a Internet?',
      '¿La brecha digital creará una nueva forma de desigualdad?',
      '¿Deberíamos enseñar tecnología principalmente como consumidores o como creadores?',
      'Si pudieras recuperar una tecnología que desapareció, ¿cuál elegirías?',
      'Si pudieras conocer una tecnología que existirá dentro de cien años, ¿cuál te gustaría ver?',
      'Si pudieras inventar una tecnología capaz de resolver un solo problema de la humanidad, ¿qué problema elegirías?'
    ]),
    tecnologia_category_id,
    'improvisado';
    
  RAISE NOTICE '100 temas de Tecnología insertados correctamente';
END $$;

-- Verificar que se insertaron correctamente
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
WHERE c.name = 'Tecnología'
GROUP BY c.name;
