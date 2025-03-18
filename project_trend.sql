SELECT 
  term, 
  SUM(frequency) AS total_frequency, 
  COUNT(DISTINCT week) AS trending_weeks,  
  MIN(first_appearance) AS first_seen,  
  MAX(latest_appearance) AS last_seen  
FROM (
  SELECT 
    term, 
    week,  
    COUNT(*) AS frequency,  
    MIN(week) AS first_appearance,  
    MAX(week) AS latest_appearance  
  FROM `bigquery-public-data.google_trends.top_rising_terms`
  WHERE EXTRACT(YEAR FROM week) >= 2022  
  GROUP BY term, week  
)
GROUP BY term
ORDER BY total_frequency DESC
LIMIT 500;
