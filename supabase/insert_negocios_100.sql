-- Insertar 100 temas de Negocios de forma segura
DO $$
DECLARE
  negocios_category_id UUID;
BEGIN
  -- Obtener el ID de la categoría Negocios
  SELECT id INTO negocios_category_id FROM categories WHERE name = 'Negocios';
  
  IF negocios_category_id IS NULL THEN
    RAISE EXCEPTION 'La categoría Negocios no existe. Ejecuta primero create_categories_only.sql';
  END IF;
  
  -- Insertar los 100 temas de Negocios
  INSERT INTO topics (title, category_id, mode) 
  SELECT 
    unnest(ARRAY[
      '¿Qué hace que una idea se convierta realmente en un buen negocio?',
      '¿Es más importante tener una gran idea o saber ejecutarla?',
      'Explica: La diferencia entre una empresa y un modelo de negocio.',
      '¿Es mejor emprender solo o con socios?',
      '¿Un emprendedor debe empezar resolviendo un problema o buscando una oportunidad?',
      'Explica: Qué significa encontrar un "product-market fit".',
      '¿Una empresa necesita ser innovadora para tener éxito?',
      '¿Es mejor entrar en un mercado existente o crear uno completamente nuevo?',
      'Explica: Por qué conocer al cliente es fundamental antes de lanzar un producto.',
      '¿Puede una mala idea convertirse en un gran negocio gracias a una excelente ejecución?',
      '¿Qué es más importante para una empresa nueva: vender rápido o construir una marca?',
      'Explica: Qué es una propuesta de valor.',
      '¿Por qué algunas empresas fracasan aunque tengan un buen producto?',
      '¿Es mejor tener pocos clientes muy fieles o muchos clientes ocasionales?',
      'Explica: La diferencia entre necesidad y deseo desde el punto de vista empresarial.',
      '¿Debería una empresa intentar satisfacer a todos los tipos de clientes?',
      '¿Por qué algunas personas pagan más por productos aparentemente similares?',
      'Explica: Qué significa diferenciarse de la competencia.',
      '¿Competir por precio es una buena estrategia a largo plazo?',
      '¿Una empresa puede sobrevivir sin tener ninguna ventaja competitiva clara?',
      '¿Qué hace que una marca sea poderosa?',
      'Explica: Por qué Apple puede cobrar más que muchos de sus competidores.',
      '¿Una gran marca puede ser más valiosa que el propio producto?',
      '¿Por qué las personas desarrollan lealtad hacia determinadas marcas?',
      'Explica: La diferencia entre marketing y publicidad.',
      '¿Es mejor invertir en publicidad o dejar que el producto hable por sí mismo?',
      '¿Puede una campaña de marketing salvar un producto mediocre?',
      'Explica: Qué significa posicionar una marca.',
      '¿Por qué contar una historia ayuda a vender un producto?',
      '¿Las marcas deberían tomar posiciones sobre temas sociales?',
      '¿Vender es convencer o ayudar al cliente a tomar una decisión?',
      'Explica: Por qué escuchar puede ser más importante que hablar durante una venta.',
      '¿Un buen vendedor nace o puede aprenderse?',
      '¿Es correcto crear sensación de urgencia para cerrar una venta?',
      'Explica: Qué significa conocer las objeciones de un cliente.',
      '¿Qué pesa más en una compra: la lógica o la emoción?',
      '¿Es mejor vender un producto barato a muchas personas o uno caro a pocas?',
      'Explica: Por qué el precio puede cambiar la percepción de calidad.',
      '¿Regalar una prueba gratuita ayuda a vender o reduce el valor percibido?',
      '¿Una empresa debería rechazar alguna vez a un cliente?',
      '¿Qué convierte a una persona en un buen líder empresarial?',
      '¿Es mejor un jefe exigente o un jefe comprensivo?',
      'Explica: La diferencia entre liderar y mandar.',
      '¿Un fundador debe seguir siendo CEO cuando la empresa crece mucho?',
      '¿Es necesario que un líder sea carismático?',
      'Explica: Por qué delegar es fundamental para hacer crecer una empresa.',
      '¿Un jefe debería contratar personas mejores que él?',
      '¿Qué es más importante en un equipo: talento individual o capacidad de trabajar juntos?',
      '¿Una empresa debería despedir a un trabajador excelente si perjudica la cultura del equipo?',
      '¿Los mejores trabajadores deben recibir siempre mejores salarios que sus compañeros?',
      'Explica: Qué significa tener una buena cultura empresarial.',
      '¿La cultura de una empresa puede ser una ventaja competitiva?',
      '¿Trabajar muchas horas demuestra compromiso con una empresa?',
      '¿Las reuniones son necesarias o suelen ser una pérdida de tiempo?',
      'Explica: Por qué una mala contratación puede resultar muy costosa.',
      '¿Es mejor contratar por experiencia o por potencial?',
      '¿Las empresas deberían permitir trabajar completamente desde casa?',
      '¿Un buen ambiente laboral puede compensar un salario menor?',
      '¿Las empresas deberían revelar públicamente los salarios de todos sus empleados?',
      '¿Qué hace que una persona quiera permanecer durante años en una empresa?',
      '¿Crecer rápidamente siempre es bueno para un negocio?',
      'Explica: Qué significa escalar una empresa.',
      '¿Una pequeña empresa debería intentar convertirse siempre en una gran empresa?',
      '¿Es mejor crecer lentamente con estabilidad o rápidamente asumiendo riesgos?',
      'Explica: Por qué una empresa puede crecer en ventas y aun así tener problemas.',
      '¿Debería una empresa expandirse internacionalmente lo antes posible?',
      '¿Abrir más sucursales significa necesariamente que un negocio está funcionando bien?',
      'Explica: Qué es una franquicia y por qué permite crecer rápidamente.',
      '¿Es mejor crear una franquicia o mantener el control total de un negocio?',
      '¿Cuándo debería una empresa dejar de crecer?',
      '¿La competencia beneficia más al consumidor que a las empresas?',
      'Explica: Por qué algunas compañías prefieren comprar a sus competidores.',
      '¿Un monopolio puede alguna vez ser beneficioso?',
      '¿Es mejor ser líder de un mercado pequeño o competir en un mercado enorme?',
      'Explica: Qué son las barreras de entrada en un mercado.',
      '¿Una empresa pequeña puede competir realmente contra una multinacional?',
      '¿Copiar una buena idea empresarial es necesariamente algo malo?',
      '¿Por qué algunas empresas llegan tarde a un mercado y aun así terminan dominándolo?',
      '¿Es más peligroso para una empresa ignorar a sus competidores o prestarles demasiada atención?',
      '¿Qué debería hacer una empresa cuando aparece un competidor con un producto mucho más barato?',
      '¿Amazon transformó los negocios para mejor o destruyó demasiado comercio tradicional?',
      'Explica: Cómo Netflix cambió su modelo de negocio desde el alquiler de DVDs hasta el streaming.',
      '¿Por qué Kodak no consiguió dominar la fotografía digital pese a haber desarrollado tecnología relacionada con ella?',
      'Explica: Cómo Airbnb creó un negocio utilizando propiedades que no posee.',
      '¿Uber es principalmente una empresa tecnológica o una empresa de transporte?',
      '¿Por qué algunas empresas que fueron líderes mundiales terminan desapareciendo?',
      'Explica: Qué podemos aprender del fracaso de Blockbuster frente a Netflix.',
      '¿McDonald"s vende principalmente comida o un sistema empresarial?',
      '¿Tesla cambió más la industria automovilística por sus coches o por su modelo empresarial?',
      '¿Qué empresa actual crees que será estudiada dentro de cien años y por qué?',
      '¿La inteligencia artificial reemplazará empresas completas o simplemente cambiará cómo funcionan?',
      '¿Una empresa debería automatizar cualquier tarea que pueda ser automatizada?',
      '¿Puede una compañía funcionar algún día con muy pocos empleados gracias a la IA?',
      '¿Las empresas que no adopten inteligencia artificial desaparecerán?',
      '¿Es ético utilizar algoritmos para personalizar precios según cada cliente?',
      '¿Una empresa tiene responsabilidad únicamente con sus propietarios o también con trabajadores, clientes y sociedad?',
      '¿Debe una empresa rechazar una oportunidad muy rentable si considera que es moralmente incorrecta?',
      '¿Qué es más importante para construir una empresa duradera: innovación, confianza o capacidad de adaptación?',
      'Si mañana tuvieras que crear un negocio con muy poco capital, ¿qué problema intentarías resolver?',
      'Si pudieras recibir durante una hora consejos de cualquier empresario de la historia, ¿a quién elegirías y qué le preguntarías?'
    ]),
    negocios_category_id,
    'improvisado';
    
  RAISE NOTICE '100 temas de Negocios insertados correctamente';
END $$;

-- Verificar que se insertaron correctamente
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
WHERE c.name = 'Negocios'
GROUP BY c.name;
