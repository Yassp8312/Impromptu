-- Insertar 100 temas de Literatura de forma segura
DO $$
DECLARE
  literatura_category_id UUID;
BEGIN
  -- Obtener el ID de la categoría Literatura
  SELECT id INTO literatura_category_id FROM categories WHERE name = 'Literatura';
  
  IF literatura_category_id IS NULL THEN
    RAISE EXCEPTION 'La categoría Literatura no existe. Ejecuta primero create_categories_only.sql';
  END IF;
  
  -- Insertar los 100 temas de Literatura
  INSERT INTO topics (title, category_id, mode) 
  SELECT 
    unnest(ARRAY[
      '¿Por qué La Ilíada sigue siendo una de las grandes historias sobre guerra, honor y destino?',
      'Explica: Qué hace de La Odisea una historia universal sobre el regreso a casa.',
      '¿Aquiles es un héroe admirable o una figura dominada por su orgullo?',
      'Explica: Por qué los mitos griegos siguen apareciendo constantemente en la literatura moderna.',
      '¿Qué hace que una historia escrita hace miles de años todavía pueda emocionarnos?',
      'Explica: La importancia de La epopeya de Gilgamesh en la historia de la literatura.',
      '¿Por qué la búsqueda de la inmortalidad aparece en tantas obras literarias?',
      'Explica: El papel del destino en las tragedias griegas.',
      '¿Edipo es culpable de sus actos si desconocía la verdad?',
      '¿Por qué las tragedias antiguas siguen funcionando para públicos modernos?',
      'Explica: Por qué Don Quijote de la Mancha cambió la historia de la novela.',
      '¿Don Quijote está loco o simplemente ve el mundo de una manera diferente?',
      'Explica: La relación entre realidad y ficción en Don Quijote.',
      '¿Sancho Panza representa el sentido común frente al idealismo de Don Quijote?',
      '¿Puede una persona vivir mejor gracias a sus ilusiones?',
      'Explica: Por qué Shakespeare sigue siendo representado más de cuatro siglos después.',
      '¿Hamlet piensa demasiado y actúa demasiado poco?',
      'Explica: El conflicto entre amor y odio en Romeo y Julieta.',
      '¿Romeo y Julieta es realmente una historia de amor o una tragedia sobre impulsividad?',
      '¿Macbeth habría cometido sus crímenes sin la ambición de Lady Macbeth?',
      'Explica: Por qué Hamlet es una obra sobre la duda.',
      '¿Qué hace que un personaje literario se convierta en universal?',
      'Explica: Cómo Shakespeare utilizaba personajes imperfectos para hablar de la naturaleza humana.',
      '¿Un villano literario puede ser más interesante que el héroe?',
      '¿Por qué seguimos sintiendo fascinación por personajes moralmente ambiguos?',
      'Explica: La importancia de Las mil y una noches para la literatura universal.',
      '¿Por qué contar historias puede convertirse literalmente en una forma de supervivencia?',
      'Explica: La estructura de historias dentro de historias en Las mil y una noches.',
      '¿Qué tiene el cuento tradicional que permite que sobreviva durante siglos?',
      '¿Las historias populares pertenecen a un autor o a toda una cultura?',
      'Explica: Por qué La divina comedia de Dante tuvo tanta influencia en la imaginación occidental.',
      '¿Por qué las representaciones del infierno suelen ser más memorables que las del paraíso?',
      'Explica: El viaje de Dante como una transformación moral y espiritual.',
      '¿La literatura necesita hablar de grandes temas para convertirse en un clásico?',
      '¿Qué convierte a una obra en un "clásico"?',
      'Explica: Por qué Fausto representa el deseo humano de conocimiento y poder.',
      '¿Aceptarías un pacto como el de Fausto a cambio de obtener todo lo que deseas?',
      '¿Existe un conocimiento que sería mejor no poseer?',
      'Explica: Cómo la ambición puede convertirse en una fuerza destructiva en la literatura.',
      '¿Por qué las historias sobre pactos con fuerzas oscuras aparecen en tantas culturas?',
      'Explica: Por qué Frankenstein es mucho más que una historia de terror.',
      '¿Quién es el verdadero monstruo en Frankenstein: la criatura o su creador?',
      '¿Victor Frankenstein tenía la obligación moral de cuidar de su creación?',
      '¿La ciencia sin responsabilidad es uno de los temas principales de Frankenstein?',
      '¿Puede una criatura artificial desarrollar una humanidad auténtica?',
      'Explica: Por qué Drácula se convirtió en el modelo del vampiro moderno.',
      '¿Por qué los monstruos literarios reflejan los miedos de cada sociedad?',
      '¿Qué monstruo de la literatura representa mejor los temores humanos?',
      '¿Por qué nos atraen las historias de terror aunque nos produzcan miedo?',
      '¿El terror funciona mejor cuando muestra al monstruo o cuando lo oculta?',
      'Explica: La crítica social presente en Los miserables de Victor Hugo.',
      '¿Jean Valjean demuestra que una persona puede cambiar completamente?',
      '¿Javert es un villano o alguien demasiado fiel a sus principios?',
      '¿Debe respetarse una ley cuando cumplirla produce una injusticia?',
      'Explica: Por qué Victor Hugo convirtió a los marginados en protagonistas.',
      '¿La literatura puede cambiar la forma en que una sociedad ve la pobreza?',
      'Explica: Por qué Crimen y castigo de Dostoyevski explora la culpa más que el crimen.',
      '¿Raskólnikov demuestra que nadie puede escapar completamente de su conciencia?',
      '¿Puede una persona justificar moralmente un crimen si cree que producirá un bien mayor?',
      '¿Por qué Dostoyevski sigue siendo relevante para comprender la psicología humana?',
      'Explica: El conflicto entre libertad y responsabilidad en la literatura de Dostoyevski.',
      '¿Por qué personajes atormentados suelen resultar tan atractivos literariamente?',
      'Explica: La importancia de Anna Karenina como retrato de la sociedad y las relaciones humanas.',
      '¿Puede una sociedad destruir a alguien simplemente mediante sus expectativas?',
      '¿Por qué el adulterio ha sido un tema tan frecuente en la literatura?',
      'Explica: Qué hace diferente a Madame Bovary de una simple historia romántica.',
      '¿Emma Bovary es víctima de la sociedad o de sus propias decisiones?',
      '¿Puede leer demasiadas historias románticas crear expectativas irreales sobre la vida?',
      '¿La literatura debe mostrarnos modelos de conducta o personajes profundamente imperfectos?',
      '¿Por qué las novelas sobre relaciones continúan siendo tan populares?',
      'Explica: Por qué 1984 de George Orwell continúa siendo una referencia política y cultural.',
      '¿Qué es más peligroso: controlar lo que las personas hacen o controlar lo que pueden pensar?',
      'Explica: El concepto del "Gran Hermano" en 1984.',
      '¿Puede un gobierno controlar la realidad controlando el lenguaje?',
      'Explica: Por qué Rebelión en la granja funciona como una alegoría del poder.',
      '¿Las revoluciones están destinadas a repetir los abusos que intentaban destruir?',
      'Explica: La diferencia entre la distopía de 1984 y la de Un mundo feliz.',
      '¿Qué sociedad sería más peligrosa: una que nos controla mediante el miedo o mediante el placer?',
      '¿Las redes sociales nos acercan más a 1984 o a Un mundo feliz?',
      '¿Por qué las distopías suelen decir más sobre el presente que sobre el futuro?',
      'Explica: Por qué Cien años de soledad convirtió a Gabriel García Márquez en una figura universal.',
      '¿Qué aporta el realismo mágico que una narración completamente realista no puede ofrecer?',
      'Explica: Cómo la familia Buendía representa ciclos que se repiten entre generaciones.',
      '¿Estamos condenados a repetir los errores de nuestra familia y nuestra sociedad?',
      '¿Por qué lo extraordinario puede sentirse completamente normal dentro del realismo mágico?',
      'Explica: La importancia de Jorge Luis Borges en la literatura del siglo XX.',
      '¿Por qué Borges estaba tan fascinado por los laberintos, los espejos y el infinito?',
      '¿Una biblioteca infinita contendría todo el conocimiento posible o solo produciría caos?',
      'Explica: Cómo la literatura puede jugar con nuestra percepción de la realidad.',
      '¿Una historia necesita ser larga para contener una idea profunda?',
      '¿Por qué El principito puede ser leído de manera diferente por niños y adultos?',
      'Explica: Qué significa la frase de El principito sobre que lo esencial no es visible a los ojos.',
      '¿Los libros infantiles pueden contener ideas más profundas que muchas novelas para adultos?',
      '¿Por qué algunas historias aparentemente simples permanecen con nosotros toda la vida?',
      '¿Es mejor una historia con un mensaje claro o una que permite muchas interpretaciones?',
      '¿Debe separarse una obra literaria de la vida y las opiniones de su autor?',
      '¿Una traducción puede transmitir completamente la belleza de una obra escrita en otro idioma?',
      '¿La inteligencia artificial podría escribir algún día una obra considerada un clásico de la literatura?',
      'Si solo pudieras conservar diez libros de toda la literatura universal, ¿qué criterio utilizarías para elegirlos?',
      'Si pudieras conversar durante una hora con cualquier escritor de la historia, ¿a quién elegirías y qué le preguntarías?'
    ]),
    literatura_category_id,
    'improvisado';
    
  RAISE NOTICE '100 temas de Literatura insertados correctamente';
END $$;

-- Verificar que se insertaron correctamente
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
WHERE c.name = 'Literatura'
GROUP BY c.name;
