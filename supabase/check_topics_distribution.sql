-- Ver distribución de temas por category_id
SELECT 
  category_id,
  COUNT(*) as total_temas
FROM topics
WHERE mode = 'improvisado'
GROUP BY category_id
ORDER BY total_temas DESC;
