SELECT key, (CASE WHEN x >= y THEN x ELSE y END) AS greatest FROM Greatests;

SELECT key,
       (CASE WHEN x >= y AND y >= z THEN x
             WHEN y >= z AND z >= x THEN y
             WHEN z >= x AND x >= y THEN z) AS greatest
FROM Greatests;

-- 標準SQLではない
SELECT key, GREATEST(GREATEST(x,y),z) AS greatest FROM Greatests;
