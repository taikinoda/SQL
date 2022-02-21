SELECT key, (CASE WHEN x >= y THEN x ELSE y END) AS greatest FROM Greatests;

SELECT key,
       (CASE WHEN x >= y AND y >= z THEN x
             WHEN y >= z AND z >= x THEN y
             WHEN z >= x AND x >= y THEN z) AS greatest
FROM Greatests;

SELECT key, MAX(col) AS greatest
FROM (SELECT key, x AS col FROM Greatests
      UNION ALL
      SELECT key, y AS col FROM Greatests
      UNION ALL
      SELECT key, z AS col FROM Greatests) TMP
GROUP BY key;

-- 標準SQLではない
SELECT key, GREATEST(GREATEST(x,y),z) AS greatest FROM Greatests;
