SELECT
    t.id AS table_id,
    t.capacity,
    COALESCE(SUM(t.capacity), 0) AS count_clients,
    CASE
        WHEN t.capacity > COALESCE(SUM(t.capacity), 0) THEN 'Free seats'
        WHEN t.capacity = COALESCE(SUM(t.capacity), 0) THEN 'Full'
        ELSE 'Extra seats'
    END AS availability
FROM
    tables t
LEFT JOIN
    orders o ON t.id = o.table_id
WHERE
    t.floor = 1
GROUP BY
    t.id
ORDER BY
    table_id DESC;
