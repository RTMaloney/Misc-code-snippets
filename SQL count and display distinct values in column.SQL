-- this will count the occurrances of each type of unique (distinct) entry in a column,
-- returning those counts alongside the actual value of the distinct entries (in order).

SELECT col, COUNT(*) AS n_distinct
FROM table
GROUP BY col 
ORDER BY n_distinct
