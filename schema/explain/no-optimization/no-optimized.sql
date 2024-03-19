-- Общая сумма стоимости (cost) : 178,65                  (Explain Plan)
-- Общая сумма времени исполнений (execution):   0,346    (Explain Analyze)
SELECT
    d.id,
    COUNT(t.id) AS total_tasks_amount,
    SUM(t.story_points) AS total_story_points
FROM developers d
JOIN tasks t ON d.id = t.developer_id
JOIN specialities s ON s.id = d.speciality_id
WHERE EXTRACT(MONTH FROM created_at) = 1
GROUP BY (d.id)
HAVING SUM(t.story_points) < 5
ORDER BY d.last_name;

-- EXPLAIN PLAN    (permet d' evaluer le temps d' execution de la requette)
-- EXPLAIN ANALYSE (permet d' evaluer le temps d' execution et execute la requette en renvoyant le temps d' execution)

-- Sort  (cost=27.74..27.75 rows=1 width=238) :
-- Plus cost est eleve plus la requette est mauvaise

-- Au moment de l' execution choisir EXPLAIN PLAN RAW ou EXPLAIN ANALYSE RAW

-- Planning Time: 0.118 ms   (На планировании запроса потрачено 0.118 ms)
-- Execution Time: 0.070 ms  (На исполнении запроса потрачено 0.070 ms)


