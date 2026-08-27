-- Insertar 100 temas de Finanzas de forma segura
DO $$
DECLARE
  finanzas_category_id UUID;
BEGIN
  -- Obtener el ID de la categoría Finanzas
  SELECT id INTO finanzas_category_id FROM categories WHERE name = 'Finanzas';
  
  IF finanzas_category_id IS NULL THEN
    RAISE EXCEPTION 'La categoría Finanzas no existe. Ejecuta primero create_categories_only.sql';
  END IF;
  
  -- Insertar los 100 temas de Finanzas
  INSERT INTO topics (title, category_id, mode) 
  SELECT 
    unnest(ARRAY[
      '¿Es mejor ahorrar primero o invertir desde el principio?',
      'Explica: Qué es el interés compuesto y por qué puede hacer crecer tanto el dinero.',
      '¿Tener mucho dinero significa necesariamente ser financieramente libre?',
      '¿Es mejor comprar una casa o vivir de alquiler?',
      'Explica: La diferencia entre un activo y un pasivo.',
      '¿Ahorrar demasiado puede ser también una mala decisión financiera?',
      '¿Qué porcentaje de los ingresos debería ahorrar una persona?',
      'Explica: Por qué la inflación hace que el dinero pierda valor con el tiempo.',
      '¿Es posible hacerse rico únicamente con un salario?',
      '¿Qué significa realmente tener libertad financiera?',
      '¿Es mejor pagar todas las deudas antes de empezar a invertir?',
      'Explica: La diferencia entre deuda buena y deuda mala.',
      '¿Las tarjetas de crédito son una herramienta útil o una trampa financiera?',
      '¿Deberíamos comprar algo a crédito si podemos pagarlo en efectivo?',
      'Explica: Cómo funciona una tasa de interés.',
      '¿Es inteligente endeudarse para estudiar?',
      '¿Comprar un coche nuevo es una mala decisión financiera?',
      '¿Por qué algunas personas con ingresos altos siguen teniendo problemas de dinero?',
      '¿Es mejor tener muchas cuotas pequeñas o una sola deuda grande?',
      '¿Hasta qué punto una persona debería evitar las deudas?',
      'Explica: Qué significa diversificar una inversión.',
      '¿Es mejor invertir en acciones individuales o en fondos diversificados?',
      '¿Invertir en bolsa es realmente diferente de apostar?',
      'Explica: La relación entre riesgo y rentabilidad.',
      '¿Es posible invertir sin asumir ningún riesgo?',
      '¿Qué debería hacer un inversor cuando el mercado cae bruscamente?',
      '¿Es mejor invertir poco dinero durante muchos años o mucho dinero durante pocos años?',
      'Explica: Qué es un fondo indexado.',
      '¿Una persona debería invertir en algo que no entiende completamente?',
      '¿Cuándo una inversión deja de ser inversión y se convierte en especulación?',
      '¿Es mejor invertir en bienes raíces o en la bolsa?',
      'Explica: Cómo puede una propiedad generar ingresos sin venderse.',
      '¿Comprar una vivienda debería considerarse una inversión?',
      '¿Es buena idea endeudarse para comprar una propiedad de inversión?',
      'Explica: Qué significa obtener rentabilidad por alquiler.',
      '¿Los bienes raíces son realmente más seguros que las acciones?',
      '¿Es mejor comprar una propiedad pequeña en una buena ubicación o una grande en una peor?',
      '¿Debería una persona invertir en propiedades en otro país?',
      '¿Puede existir una burbuja inmobiliaria?',
      '¿Por qué el precio de una vivienda puede subir mucho más rápido que los salarios?',
      'Explica: Qué es la bolsa de valores y para qué existe.',
      '¿Por qué sube y baja el precio de una acción?',
      '¿Qué significa realmente ser propietario de una acción?',
      '¿Es mejor comprar acciones de empresas famosas o buscar empresas desconocidas con potencial?',
      'Explica: Qué significa que una empresa pague dividendos.',
      '¿Es mejor buscar crecimiento o dividendos al invertir?',
      '¿Por qué una empresa puede valer miles de millones aunque gane poco dinero?',
      '¿Debería venderse una acción cuando duplica su precio?',
      '¿Qué hace que una acción esté sobrevalorada?',
      '¿Puede una empresa excelente ser una mala inversión si se compra demasiado cara?',
      '¿Bitcoin es una inversión, una moneda o un activo especulativo?',
      'Explica: Por qué las criptomonedas pueden tener tanta volatilidad.',
      '¿Las criptomonedas podrían sustituir algún día al dinero tradicional?',
      '¿Es razonable tener una pequeña parte del patrimonio en criptomonedas?',
      'Explica: Qué significa que Bitcoin tenga una oferta limitada.',
      '¿El oro sigue siendo una buena forma de proteger el patrimonio?',
      '¿Es mejor guardar riqueza en dinero, oro, propiedades o acciones?',
      '¿Qué hace que algo tenga valor financiero?',
      '¿Una moneda puede perder completamente la confianza de la población?',
      '¿Por qué algunas personas prefieren activos físicos frente a activos digitales?',
      'Explica: Qué hace un banco con el dinero que depositamos.',
      '¿Por qué los bancos pagan intereses por algunos depósitos?',
      '¿Qué ocurriría si todos intentaran retirar su dinero de un banco al mismo tiempo?',
      '¿Es mejor tener el dinero en un solo banco o repartirlo?',
      'Explica: Qué es un banco central.',
      '¿Por qué los bancos centrales suben o bajan los tipos de interés?',
      '¿Los tipos de interés altos son buenos o malos para una economía?',
      '¿Qué ocurre con las familias cuando suben mucho los intereses?',
      '¿Por qué imprimir más dinero no convierte automáticamente a un país en más rico?',
      '¿Puede una economía funcionar completamente sin efectivo?',
      '¿Es justo que las personas con mayores ingresos paguen más impuestos?',
      'Explica: Para qué sirven los impuestos en una economía.',
      '¿Deberían existir impuestos sobre las grandes fortunas?',
      '¿Pagar menos impuestos siempre beneficia a la economía?',
      '¿Es correcto buscar legalmente pagar la menor cantidad posible de impuestos?',
      '¿Por qué algunos países tienen impuestos muy altos y aun así economías fuertes?',
      '¿Deberían gravarse más las herencias?',
      '¿Es justo pagar impuestos por invertir y asumir riesgos?',
      '¿Los impuestos pueden cambiar el comportamiento financiero de las personas?',
      '¿Qué sería mejor: impuestos bajos con menos servicios públicos o impuestos altos con más servicios?',
      '¿Cuánto dinero necesita una persona para jubilarse?',
      'Explica: Por qué empezar a ahorrar para la jubilación temprano puede marcar una gran diferencia.',
      '¿Es realista retirarse a los 40 años?',
      '¿Qué significa el movimiento FIRE: independencia financiera y retiro temprano?',
      '¿Es mejor disfrutar más del dinero hoy o sacrificar consumo para el futuro?',
      '¿Una persona jubilada debería seguir teniendo parte de su dinero invertido?',
      '¿Es peligroso depender únicamente de una pensión pública?',
      '¿Deberíamos planificar nuestras finanzas suponiendo que viviremos 100 años?',
      '¿Qué es más importante para retirarse: ganar mucho o controlar los gastos?',
      '¿La jubilación tradicional seguirá existiendo dentro de cincuenta años?',
      '¿El dinero compra felicidad?',
      '¿Por qué gastamos más cuando empezamos a ganar más?',
      'Explica: Qué es la inflación del estilo de vida.',
      '¿Es más importante aprender a ganar dinero o aprender a conservarlo?',
      '¿Las personas toman decisiones financieras racionales?',
      '¿Por qué comprar algo con tarjeta puede sentirse diferente a pagarlo en efectivo?',
      '¿Deberían los niños aprender a administrar dinero desde pequeños?',
      '¿Qué es más importante para construir patrimonio: ingresos, ahorro, inversión o tiempo?',
      'Si mañana recibieras un millón de dólares, ¿qué harías para evitar perderlo?',
      'Si solo pudieras dar un consejo financiero a una persona de 18 años, ¿cuál sería?'
    ]),
    finanzas_category_id,
    'improvisado';
    
  RAISE NOTICE '100 temas de Finanzas insertados correctamente';
END $$;

-- Verificar que se insertaron correctamente
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
WHERE c.name = 'Finanzas'
GROUP BY c.name;
