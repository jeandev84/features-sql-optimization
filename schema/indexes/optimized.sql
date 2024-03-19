-- RUN EXPLAIN ANALYSE после добавления индексов
EXPLAIN SELECT
    d.id,
    COUNT(t.id) AS total_tasks_amount,
    SUM(t.story_points) AS total_story_points
FROM developers d
LEFT JOIN tasks t ON d.id = t.developer_id AND EXTRACT(MONTH FROM created_at) = 1
GROUP BY d.id
HAVING SUM(t.story_points) < 5
ORDER BY d.id;



EXPLAIN ANALYSE SELECT
    d.id,
    COUNT(t.id) AS total_tasks_amount,
    SUM(t.story_points) AS total_story_points
FROM developers d
         LEFT JOIN tasks t ON d.id = t.developer_id AND EXTRACT(MONTH FROM created_at) = 1
GROUP BY d.id
HAVING SUM(t.story_points) < 5
ORDER BY d.id;


-- Общая сумма стоимости (cost) : 128,88                  (Explain Plan)
-- Общая сумма времени исполнений (execution):   0,218    (Explain Analyze)


SELECT
    d.id,
    COUNT(t.id) AS total_tasks_amount,
    SUM(t.story_points) AS total_story_points
FROM developers d
         LEFT JOIN tasks t ON d.id = t.developer_id AND EXTRACT(MONTH FROM created_at) = 1
GROUP BY d.id
HAVING SUM(t.story_points) < 5
ORDER BY d.id;

