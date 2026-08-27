-- Insertar 100 temas de Relaciones de forma segura
DO $$
DECLARE
  relaciones_category_id UUID;
BEGIN
  -- Obtener el ID de la categoría Relaciones
  SELECT id INTO relaciones_category_id FROM categories WHERE name = 'Relaciones';
  
  IF relaciones_category_id IS NULL THEN
    RAISE EXCEPTION 'La categoría Relaciones no existe. Ejecuta primero create_categories_only.sql';
  END IF;
  
  -- Insertar los 100 temas de Relaciones
  INSERT INTO topics (title, category_id, mode) 
  SELECT 
    unnest(ARRAY[
      '¿Qué hace que dos personas se conviertan realmente en amigos?',
      '¿Es mejor tener muchos amigos o pocos amigos muy cercanos?',
      '¿Una amistad verdadera puede sobrevivir años sin contacto?',
      '¿Los amigos deben decirnos siempre la verdad aunque pueda dolernos?',
      '¿Puede existir amistad auténtica entre personas con valores completamente diferentes?',
      '¿Qué hace que una amistad termine?',
      '¿Es correcto alejarse de un amigo que constantemente nos perjudica?',
      '¿Las amistades de la infancia son diferentes de las que hacemos de adultos?',
      '¿Puede una amistad recuperarse después de una traición?',
      '¿Es posible ser amigo de una persona de la que alguna vez estuvimos enamorados?',
      '¿Qué es más importante en una relación de pareja: amor, confianza o compatibilidad?',
      '¿El amor es un sentimiento o también una decisión?',
      '¿Es posible amar a alguien y aun así no ser compatible con esa persona?',
      '¿Los opuestos realmente se atraen?',
      '¿Una buena relación necesita tener intereses en común?',
      '¿Cuánto debería cambiar una persona por su pareja?',
      '¿Es saludable hacer prácticamente todo junto en una relación?',
      '¿Puede una relación funcionar sin admiración mutua?',
      '¿El amor debería sentirse fácil o requiere esfuerzo constante?',
      '¿Cómo sabemos cuándo vale la pena luchar por una relación?',
      '¿Qué significa realmente confiar en alguien?',
      '¿La confianza tarda años en construirse y segundos en destruirse?',
      '¿Una mentira pequeña puede destruir una relación?',
      '¿Es posible recuperar completamente la confianza después de una traición?',
      '¿Deberíamos contar absolutamente todo a nuestra pareja?',
      '¿Existen secretos saludables dentro de una relación?',
      '¿Es peor mentir directamente u ocultar información importante?',
      '¿Perdonar significa volver a confiar?',
      '¿Una persona que traicionó una vez necesariamente volverá a hacerlo?',
      '¿Qué pesa más: las palabras o las acciones cuando queremos confiar en alguien?',
      '¿Por qué la comunicación es tan importante en las relaciones?',
      '¿Escuchar es más importante que saber hablar?',
      '¿Deberíamos decir inmediatamente cuando algo nos molesta?',
      '¿Es mejor discutir un problema en el momento o esperar hasta estar tranquilos?',
      '¿Por qué algunas personas esperan que los demás adivinen lo que sienten?',
      '¿Es posible comunicarse bien sin estar de acuerdo?',
      '¿El silencio puede ser una forma de comunicación?',
      '¿Cómo cambia una conversación cuando intentamos comprender en lugar de ganar?',
      '¿Deberíamos decir siempre exactamente lo que pensamos?',
      '¿Una conversación difícil puede fortalecer una relación?',
      '¿Discutir es necesariamente malo para una pareja?',
      '¿Qué diferencia existe entre una discusión saludable y una pelea destructiva?',
      '¿Es importante saber pedir disculpas?',
      '¿Qué hace que una disculpa sea sincera?',
      '¿Decir "lo siento" tiene valor si el comportamiento nunca cambia?',
      '¿Quién debería dar el primer paso después de una pelea?',
      '¿Es saludable irse a dormir enfadado?',
      '¿Podemos resolver todos los conflictos mediante comunicación?',
      '¿Ceder durante una discusión significa perder?',
      '¿Hay problemas en una relación que simplemente no tienen solución?',
      '¿Qué significa establecer límites en una relación?',
      '¿Decir "no" puede ser una forma de cuidar una relación?',
      '¿Una pareja debería tener acceso al teléfono del otro?',
      '¿Es saludable compartir contraseñas en una relación?',
      '¿Dónde termina la preocupación y comienza el control?',
      '¿Los celos son una demostración de amor o de inseguridad?',
      '¿Es posible no sentir nunca celos?',
      '¿Una pareja debería poder tener amistades muy cercanas con otras personas?',
      '¿Cuánto espacio personal necesita una relación saludable?',
      '¿Poner límites puede hacer que algunas personas se alejen de nosotros?',
      '¿La familia debe estar por encima de todas las demás relaciones?',
      '¿Los padres deben intentar ser amigos de sus hijos?',
      '¿Hasta qué punto los padres deberían intervenir en las decisiones de sus hijos adultos?',
      '¿Los hijos tienen la obligación de cuidar a sus padres cuando envejecen?',
      '¿Es posible tener una buena relación familiar sin estar de acuerdo en temas importantes?',
      '¿Debemos mantener una relación familiar únicamente porque existe un vínculo de sangre?',
      '¿Por qué los hermanos que crecen en la misma casa pueden ser tan diferentes?',
      '¿Los padres deberían tratar a todos sus hijos exactamente igual?',
      '¿Cómo cambia la relación entre padres e hijos cuando estos se convierten en adultos?',
      '¿La familia que elegimos puede llegar a ser tan importante como la familia biológica?',
      '¿Es posible mantener una relación a distancia durante muchos años?',
      '¿Las videollamadas pueden sustituir parcialmente la presencia física?',
      '¿La distancia fortalece una relación o normalmente la debilita?',
      '¿Cuánto contacto diario necesita una relación cercana?',
      '¿Puede una persona sentirse sola incluso estando rodeada de gente?',
      '¿Por qué algunas relaciones sobreviven a grandes distancias y otras no?',
      '¿Es necesario hablar todos los días con alguien para mantener una relación cercana?',
      '¿Las relaciones a distancia requieren más confianza que las presenciales?',
      '¿Puede la ausencia hacer que idealicemos demasiado a otra persona?',
      '¿Qué es más difícil: comenzar una relación a distancia o convertir una relación presencial en una a distancia?',
      '¿Las redes sociales han mejorado o empeorado nuestras relaciones?',
      '¿Mostrar constantemente una relación en redes sociales dice algo sobre su calidad?',
      '¿Debería considerarse una falta de respeto coquetear con otra persona por Internet?',
      '¿Dar "me gusta" a determinadas publicaciones puede causar problemas reales en una pareja?',
      '¿Las aplicaciones de citas nos ayudan a encontrar pareja o nos hacen tratar a las personas como productos?',
      '¿Tener demasiadas opciones hace más difícil comprometerse con alguien?',
      '¿Es posible conocer profundamente a una persona únicamente por Internet?',
      '¿Las redes sociales hacen que comparemos demasiado nuestras relaciones con las de otros?',
      '¿Deberían las parejas publicar sus problemas en Internet?',
      '¿La tecnología nos mantiene conectados o está haciendo más superficiales nuestras relaciones?',
      '¿Qué significa querer a alguien sin intentar cambiarlo?',
      '¿Se puede perdonar sin reconciliarse?',
      '¿Deberíamos dar siempre una segunda oportunidad?',
      '¿Una persona puede cambiar realmente por amor?',
      '¿Es posible amar a dos personas al mismo tiempo?',
      '¿Qué es más doloroso: perder una relación por una traición o porque el amor simplemente terminó?',
      '¿Cómo sabemos cuándo una relación se ha convertido en parte de nuestra identidad?',
      'Si pudieras conocer desde el primer día cuánto durará una relación, ¿querrías saberlo?',
      '¿Preferirías tener una gran historia de amor que termine o una relación tranquila que dure toda la vida?',
      'Si solo pudieras dar un consejo para construir relaciones saludables, ¿cuál sería?'
    ]),
    relaciones_category_id,
    'improvisado';
    
  RAISE NOTICE '100 temas de Relaciones insertados correctamente';
END $$;

-- Verificar que se insertaron correctamente
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
WHERE c.name = 'Relaciones'
GROUP BY c.name;
