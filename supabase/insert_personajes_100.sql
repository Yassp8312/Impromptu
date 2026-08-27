-- Insertar 100 personajes de forma segura
DO $$
DECLARE
  personajes_category_id UUID;
BEGIN
  -- Obtener el ID de la categoría Personajes
  SELECT id INTO personajes_category_id FROM categories WHERE name = 'Personajes';
  
  IF personajes_category_id IS NULL THEN
    RAISE EXCEPTION 'La categoría Personajes no existe. Ejecuta primero create_categories_only.sql';
  END IF;
  
  -- Insertar los 100 personajes
  INSERT INTO topics (title, category_id, mode) 
  SELECT 
    unnest(ARRAY[
      'Leonardo da Vinci',
      'Cleopatra',
      'Julio César',
      'Alejandro Magno',
      'Napoleón Bonaparte',
      'Juana de Arco',
      'Gengis Kan',
      'Marco Polo',
      'Cristóbal Colón',
      'Simón Bolívar',
      'Mahatma Gandhi',
      'Nelson Mandela',
      'Martin Luther King Jr.',
      'Winston Churchill',
      'Abraham Lincoln',
      'George Washington',
      'Marie Curie',
      'Albert Einstein',
      'Isaac Newton',
      'Galileo Galilei',
      'Charles Darwin',
      'Nikola Tesla',
      'Stephen Hawking',
      'Alan Turing',
      'Ada Lovelace',
      'Louis Pasteur',
      'Sigmund Freud',
      'Carl Jung',
      'Sócrates',
      'Platón',
      'Aristóteles',
      'Friedrich Nietzsche',
      'Karl Marx',
      'René Descartes',
      'Immanuel Kant',
      'Confucio',
      'Sun Tzu',
      'William Shakespeare',
      'Miguel de Cervantes',
      'Dante Alighieri',
      'Homero',
      'Víctor Hugo',
      'Fiódor Dostoyevski',
      'León Tolstói',
      'Franz Kafka',
      'George Orwell',
      'Gabriel García Márquez',
      'Jorge Luis Borges',
      'Virginia Woolf',
      'Agatha Christie',
      'Edgar Allan Poe',
      'Oscar Wilde',
      'Ernest Hemingway',
      'Pablo Neruda',
      'Frida Kahlo',
      'Pablo Picasso',
      'Vincent van Gogh',
      'Miguel Ángel',
      'Salvador Dalí',
      'Andy Warhol',
      'Claude Monet',
      'Rembrandt',
      'Ludwig van Beethoven',
      'Wolfgang Amadeus Mozart',
      'Johann Sebastian Bach',
      'Elvis Presley',
      'Michael Jackson',
      'Freddie Mercury',
      'Bob Marley',
      'John Lennon',
      'Madonna',
      'David Bowie',
      'Tupac Shakur',
      'Charlie Chaplin',
      'Marilyn Monroe',
      'Audrey Hepburn',
      'Alfred Hitchcock',
      'Stanley Kubrick',
      'Steven Spielberg',
      'Walt Disney',
      'Bruce Lee',
      'Muhammad Ali',
      'Pelé',
      'Diego Maradona',
      'Michael Jordan',
      'Ayrton Senna',
      'Usain Bolt',
      'Serena Williams',
      'Steve Jobs',
      'Bill Gates',
      'Henry Ford',
      'Coco Chanel',
      'Amelia Earhart',
      'Neil Armstrong',
      'Yuri Gagarin',
      'Jacques Cousteau',
      'Harry Houdini',
      'Che Guevara',
      'Madre Teresa de Calcuta'
    ]),
    personajes_category_id,
    'improvisado';
    
  RAISE NOTICE '100 personajes insertados correctamente';
END $$;

-- Verificar que se insertaron correctamente
SELECT 
  c.name as categoria,
  COUNT(t.id) as temas_count
FROM categories c
LEFT JOIN topics t ON t.category_id = c.id
WHERE c.name = 'Personajes'
GROUP BY c.name;
