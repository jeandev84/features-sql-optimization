-- Использование LEFT JOIN вместе JOIN:
-- Если мы хотим включить в результаты всех разработчиков, даже тех, кто не имеет задач после указанной даты,
-- следует использовать LEFT JOIN вместе JOIN.
-- Если же нас интересуют только разработчики с задачами в Январе, то текущее использование JOIN подходит.

-- Оптимизация JOIN с таблицей specialities: Текущий запрос соединяет таблицу specialities, но не использует данные из этой таблицы.
-- Если данные из таблицы specialities не нужны в результатах, этот JOIN следует убрать для уменьшения объема обрабатываемых данных.

-- Уточнение GROUP BY: В GROUP BY-клаузе скобки вокруг d.id не требуются

SELECT
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



