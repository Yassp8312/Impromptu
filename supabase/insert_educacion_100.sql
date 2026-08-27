-- Insertar 100 temas de Educación de forma segura
DO $$
DECLARE
  educacion_category_id UUID;
BEGIN
  -- Obtener el ID de la categoría Educación
  SELECT id INTO educacion_category_id FROM categories WHERE name = 'Educación';
  
  IF educacion_category_id IS NULL THEN
    RAISE EXCEPTION 'La categoría Educación no existe. Ejecuta primero create_categories_only.sql';
  END IF;
  
  -- Insertar los 100 temas de Educación
  INSERT INTO topics (title, category_id, mode) 
  SELECT 
    unnest(ARRAY[
      '¿La escuela prepara realmente a los estudiantes para la vida adulta?',
      'Explica: Por qué aprender a aprender puede ser más importante que memorizar contenidos.',
      '¿Deberían desaparecer los exámenes tradicionales?',
      '¿Es mejor aprender de los errores que intentar evitarlos?',
      'Explica: La diferencia entre memorizar y comprender.',
      '¿Deberían las escuelas enseñar educación financiera desde edades tempranas?',
      '¿Las calificaciones reflejan realmente la inteligencia de un estudiante?',
      'Explica: Por qué la curiosidad es fundamental para el aprendizaje.',
      '¿Es posible tener una buena educación sin asistir a una escuela tradicional?',
      '¿Qué debería enseñar la escuela que actualmente casi nunca enseña?',
      '¿Los deberes escolares ayudan realmente a aprender?',
      'Explica: Por qué algunas personas aprenden mejor enseñando a otros.',
      '¿Deberían los estudiantes poder elegir gran parte de las asignaturas que estudian?',
      '¿Es más importante un buen profesor o un buen método de estudio?',
      'Explica: Cómo la motivación afecta al aprendizaje.',
      '¿Un estudiante debería poder avanzar a su propio ritmo?',
      '¿Las escuelas deberían enseñar a hablar en público como asignatura obligatoria?',
      'Explica: Por qué hacer preguntas puede ser más importante que conocer respuestas.',
      '¿Es necesario memorizar información en una época donde existe Internet?',
      '¿Qué significa realmente ser una persona educada?',
      '¿La inteligencia puede desarrollarse o nacemos con un límite determinado?',
      'Explica: Qué significa tener una mentalidad de crecimiento.',
      '¿Deberíamos enseñar pensamiento crítico desde la educación primaria?',
      '¿Un profesor debe ser principalmente experto en su materia o experto en enseñar?',
      'Explica: Por qué recibir feedback ayuda a mejorar.',
      '¿Debería permitirse utilizar inteligencia artificial durante los estudios?',
      '¿La IA hará que los profesores sean menos importantes o más importantes?',
      'Explica: Cómo una inteligencia artificial puede funcionar como tutor personalizado.',
      '¿Usar ChatGPT para estudiar es aprender o hacer trampa?',
      '¿Deberían las escuelas enseñar cómo utilizar correctamente la inteligencia artificial?',
      '¿La tecnología está mejorando la educación o aumentando las distracciones?',
      'Explica: Las ventajas y riesgos de estudiar mediante cursos online.',
      '¿Puede YouTube enseñar mejor algunos temas que una clase tradicional?',
      '¿Los libros de texto seguirán siendo necesarios dentro de veinte años?',
      'Explica: Cómo la realidad virtual podría cambiar la forma de aprender.',
      '¿Aprender mediante videojuegos puede ser tan serio como aprender mediante libros?',
      '¿Debería cada estudiante tener acceso a un tutor de inteligencia artificial?',
      '¿La educación online puede reemplazar completamente a la universidad presencial?',
      'Explica: Por qué tener acceso a información no significa necesariamente tener conocimiento.',
      '¿Internet nos ha hecho mejores estudiantes o más dependientes?',
      '¿Debería enseñarse programación a todos los niños?',
      '¿Las matemáticas deberían enseñarse de una manera más práctica?',
      'Explica: Por qué algunas personas creen que "no sirven" para las matemáticas.',
      '¿Debería enseñarse filosofía desde la escuela primaria?',
      '¿La historia debería centrarse más en comprender causas que en memorizar fechas?',
      'Explica: Por qué aprender ciencias mediante experimentos puede ser más efectivo.',
      '¿La literatura sigue siendo necesaria en una educación moderna?',
      '¿Deberían enseñarse primeros auxilios como asignatura obligatoria?',
      '¿La cocina debería formar parte de la educación básica?',
      '¿Deberían las escuelas enseñar negociación y resolución de conflictos?',
      '¿Es más importante aprender otro idioma o aprender programación?',
      'Explica: Por qué aprender un idioma cambia también nuestra forma de pensar.',
      '¿Cuál es la mejor edad para comenzar a aprender un segundo idioma?',
      '¿Se puede aprender un idioma sin estudiar gramática explícitamente?',
      '¿Cometer errores al hablar otro idioma debería considerarse algo positivo?',
      '¿Por qué algunas personas estudian durante años un idioma y todavía tienen miedo de hablarlo?',
      '¿Es mejor estudiar diez palabras nuevas cada día o aprenderlas dentro de conversaciones?',
      'Explica: Por qué practicar todos los días puede ser mejor que estudiar muchas horas una sola vez.',
      '¿Puede una persona aprender prácticamente cualquier habilidad si practica suficientemente?',
      '¿Qué habilidad debería aprender todo ser humano antes de cumplir 18 años?',
      '¿La universidad sigue siendo necesaria para tener éxito profesional?',
      '¿Vale la pena endeudarse para obtener un título universitario?',
      'Explica: Por qué algunas carreras universitarias tardan tantos años en completarse.',
      '¿Las universidades deberían enseñar más habilidades prácticas?',
      '¿Deberían las empresas valorar más las habilidades que los títulos?',
      '¿Una persona autodidacta puede competir profesionalmente con un graduado universitario?',
      'Explica: Qué aporta una universidad además del conocimiento académico.',
      '¿Las universidades deberían cambiar sus programas cada pocos años para adaptarse al mercado laboral?',
      '¿Debería ser gratuita la educación universitaria?',
      '¿Qué debería pesar más al elegir una carrera: pasión, talento o posibilidades de empleo?',
      '¿Un profesor debería poder suspender a la mayoría de una clase?',
      '¿Cómo sabemos si un mal resultado es responsabilidad del alumno o del profesor?',
      'Explica: Por qué un profesor puede cambiar completamente la relación de un estudiante con una materia.',
      '¿Los profesores deberían ser evaluados por sus estudiantes?',
      '¿Debe existir amistad entre profesor y estudiante o es mejor mantener distancia?',
      '¿Qué hace que recordemos a ciertos profesores durante toda la vida?',
      '¿Un profesor excelente puede enseñar bien cualquier asignatura?',
      '¿Deberían los profesores tener mayor libertad para decidir cómo enseñar?',
      '¿Es mejor un profesor exigente o uno comprensivo?',
      '¿Puede una máquina reemplazar alguna vez completamente a un profesor?',
      '¿Los estudiantes deberían competir entre ellos o colaborar?',
      'Explica: Cómo el trabajo en grupo puede ayudar y también perjudicar el aprendizaje.',
      '¿Deberían eliminarse los rankings entre estudiantes?',
      '¿Es positivo premiar siempre al estudiante con las mejores notas?',
      '¿La presión académica puede mejorar el rendimiento o termina destruyéndolo?',
      '¿Un estudiante debería poder repetir un examen hasta demostrar que aprendió?',
      '¿Deberían existir premios por esfuerzo además de premios por resultados?',
      '¿La educación actual castiga demasiado el fracaso?',
      'Explica: Por qué equivocarse puede ser una parte esencial del aprendizaje.',
      '¿Es posible aprender profundamente algo que no nos interesa?',
      '¿La educación puede reducir realmente la desigualdad social?',
      '¿Todos los niños deberían recibir exactamente la misma educación?',
      '¿Las escuelas privadas producen necesariamente una mejor educación?',
      '¿Debería existir un currículo educativo mundial básico?',
      '¿Quién debería decidir qué aprenden los niños: el Estado, las familias, las escuelas o los propios estudiantes?',
      '¿La educación debería adaptarse más a la personalidad de cada estudiante?',
      '¿Qué es más peligroso para una sociedad: la falta de educación o una mala educación?',
      '¿Cuál debería ser el objetivo principal de la educación: conseguir empleo, formar ciudadanos o desarrollar personas?',
      'Si pudieras cambiar una sola cosa del sistema educativo actual, ¿qué cambiarías y por qué?',
      'Si tuvieras que diseñar una escuela desde cero, ¿qué tendría de diferente respecto a las escuelas actuales?'
    ]),
    educacion_category_id,
    'improvisado';
    
  RAISE NOTICE '100 temas de Educación insertados correctamente';
END $$;

-- Verificar que se insertaron correctamente
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
WHERE c.name = 'Educación'
GROUP BY c.name;
