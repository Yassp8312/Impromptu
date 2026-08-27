-- Insertar 100 temas de Productividad de forma segura
DO $$
DECLARE
  productividad_category_id UUID;
BEGIN
  -- Obtener el ID de la categoría Productividad
  SELECT id INTO productividad_category_id FROM categories WHERE name = 'Productividad';
  
  IF productividad_category_id IS NULL THEN
    RAISE EXCEPTION 'La categoría Productividad no existe. Ejecuta primero create_categories_only.sql';
  END IF;
  
  -- Insertar los 100 temas de Productividad
  INSERT INTO topics (title, category_id, mode) 
  SELECT 
    unnest(ARRAY[
      '¿Trabajar más horas significa ser más productivo?',
      '¿Es mejor empezar el día con la tarea más difícil?',
      '¿La disciplina es más importante que la motivación?',
      'Explica: La diferencia entre estar ocupado y ser productivo.',
      '¿Es posible ser demasiado productivo?',
      '¿Deberíamos planificar cada hora del día?',
      '¿Qué es más importante: gestionar el tiempo o gestionar la energía?',
      '¿La multitarea funciona realmente?',
      'Explica: Por qué cambiar constantemente de tarea reduce la concentración.',
      '¿Es mejor terminar una tarea antes de comenzar otra?',
      '¿Por qué procrastinamos incluso cuando sabemos que una tarea es importante?',
      '¿La procrastinación es siempre falta de disciplina?',
      'Explica: La regla de los dos minutos.',
      '¿Empezar una tarea es normalmente más difícil que continuarla?',
      '¿Es mejor trabajar bajo presión o con mucha anticipación?',
      '¿Los plazos ayudan a ser productivos?',
      '¿Un poco de estrés puede mejorar el rendimiento?',
      '¿Por qué dejamos para después las tareas que más nos incomodan?',
      '¿Es útil dividir una tarea grande en acciones muy pequeñas?',
      '¿Cómo vencerías la procrastinación sin depender de la motivación?',
      '¿Es necesario tener una rutina diaria?',
      'Explica: Cómo se forma un hábito.',
      '¿Cuánto puede cambiar una persona mediante pequeños hábitos diarios?',
      '¿Es mejor cambiar muchos hábitos a la vez o uno por uno?',
      '¿Por qué es más fácil eliminar un mal hábito si cambiamos nuestro entorno?',
      '¿La fuerza de voluntad puede entrenarse?',
      '¿Es mejor depender de hábitos o de objetivos?',
      'Explica: La idea de mejorar un 1 % cada día.',
      '¿Un hábito sigue siendo útil cuando deja de requerir esfuerzo?',
      '¿Qué hábito cotidiano tiene mayor impacto en la productividad?',
      '¿Las listas de tareas ayudan realmente?',
      '¿Es mejor tener tres prioridades importantes o veinte tareas pequeñas?',
      'Explica: La matriz de Eisenhower entre urgente e importante.',
      '¿Por qué solemos atender primero lo urgente aunque no sea lo más importante?',
      '¿Deberíamos planificar el día la noche anterior?',
      '¿Es mejor utilizar una agenda digital o una agenda en papel?',
      '¿Cuánto tiempo debería dedicarse a planificar antes de empezar a trabajar?',
      '¿Una planificación demasiado detallada puede convertirse en procrastinación?',
      '¿Es necesario establecer objetivos diarios?',
      '¿Qué debería hacerse cuando un día no sale según lo planificado?',
      '¿Trabajar con música mejora o perjudica la concentración?',
      'Explica: Qué significa entrar en un estado de "flow".',
      '¿Es posible entrenar la capacidad de concentración?',
      '¿El teléfono móvil es el mayor enemigo moderno de la productividad?',
      '¿Deberíamos trabajar con las notificaciones completamente desactivadas?',
      '¿Por qué resulta tan difícil permanecer concentrado durante una hora?',
      'Explica: La técnica Pomodoro.',
      '¿Trabajar en bloques cortos es mejor que trabajar durante varias horas seguidas?',
      '¿El silencio absoluto ayuda realmente a concentrarse?',
      '¿Qué debería hacerse cuando nuestra mente comienza a distraerse constantemente?',
      '¿Descansar puede considerarse una actividad productiva?',
      '¿Dormir ocho horas puede producir mejores resultados que trabajar dos horas adicionales?',
      'Explica: Por qué nuestro cerebro necesita pausas.',
      '¿Es útil tomar una siesta durante el día?',
      '¿Trabajar siete días a la semana reduce finalmente el rendimiento?',
      '¿Las vacaciones mejoran la productividad?',
      '¿Por qué algunas buenas ideas aparecen cuando no estamos trabajando?',
      '¿Es necesario aburrirse de vez en cuando?',
      '¿Puede el exceso de productividad conducir al agotamiento?',
      '¿Cómo distinguir entre descanso necesario y procrastinación?',
      '¿Los objetivos deben ser muy ambiciosos o fáciles de alcanzar?',
      'Explica: La diferencia entre un objetivo y un sistema.',
      '¿Es mejor concentrarse en el resultado o en el proceso?',
      '¿Deberíamos escribir nuestros objetivos?',
      '¿Contar nuestros objetivos a otras personas ayuda o perjudica?',
      '¿Qué ocurre cuando perseguimos demasiados objetivos al mismo tiempo?',
      '¿Es útil establecer fechas límite para objetivos personales?',
      '¿Deberíamos abandonar un objetivo que ya no parece importante?',
      '¿Cómo sabemos cuándo perseverar y cuándo cambiar de dirección?',
      '¿Es más importante la constancia que la intensidad?',
      '¿Decir "no" es una habilidad esencial para ser productivo?',
      '¿Por qué aceptar demasiados compromisos reduce nuestro rendimiento?',
      '¿Deberíamos eliminar actividades buenas para poder concentrarnos en actividades excelentes?',
      'Explica: El principio de Pareto o regla 80/20.',
      '¿El 20 % de nuestras actividades produce realmente la mayoría de nuestros resultados?',
      '¿Cómo decidir qué tareas no hacer?',
      '¿Delegar es una forma de productividad?',
      '¿Por qué algunas personas tienen dificultades para delegar?',
      '¿Es mejor hacer algo imperfectamente hoy o perfectamente dentro de una semana?',
      '¿El perfeccionismo ayuda o destruye la productividad?',
      '¿Las reuniones reducen la productividad de las empresas?',
      '¿Deberían existir días sin reuniones?',
      '¿Trabajar desde casa aumenta la productividad?',
      '¿Es mejor trabajar solo o acompañado?',
      '¿Un horario flexible produce mejores resultados que un horario fijo?',
      '¿Por qué algunas personas trabajan mejor por la mañana y otras por la noche?',
      '¿Deberíamos organizar nuestro trabajo según nuestros momentos de mayor energía?',
      '¿Responder inmediatamente todos los mensajes es una buena práctica?',
      '¿El correo electrónico debería revisarse solo unas pocas veces al día?',
      '¿Una semana laboral de cuatro días podría aumentar la productividad?',
      '¿La inteligencia artificial nos hará más productivos o más dependientes?',
      '¿Qué tareas personales deberían automatizarse?',
      '¿Utilizar demasiadas aplicaciones de productividad puede volvernos menos productivos?',
      '¿La tecnología nos ahorra tiempo o simplemente llena el tiempo que libera?',
      '¿Un asistente de inteligencia artificial podría organizar mejor tu día que tú mismo?',
      '¿Cómo medirías tu productividad sin contar las horas trabajadas?',
      '¿Qué es más importante para avanzar: hacer más cosas o hacer menos cosas mejor?',
      'Si solo pudieras trabajar tres horas al día, ¿cómo organizarías tu tiempo?',
      'Si solo pudieras eliminar para siempre una distracción de tu vida, ¿cuál sería?',
      'Si tuvieras que dar una sola regla de productividad a otra persona, ¿cuál sería?'
    ]),
    productividad_category_id,
    'improvisado';
    
  RAISE NOTICE '100 temas de Productividad insertados correctamente';
END $$;

-- Verificar que se insertaron correctamente
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
WHERE c.name = 'Productividad'
GROUP BY c.name;
