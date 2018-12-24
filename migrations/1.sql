CREATE TABLE `metrics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` DATETIME NOT NULL DEFAULT now(),
  `data` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE FUNCTION `json_extractor` (json_txt TEXT, search_key VARCHAR (255))
    RETURNS TEXT
BEGIN
    RETURN (SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(txt,':',-1), '"', 2), '"', -1)) AS val
    FROM (
        SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX( SUBSTRING_INDEX(json_txt , ',', n), ',',  -1 ), '}', 1), '{', -1)) AS txt
        FROM (SELECT t1.v + t2.v*10 + t3.v*100 AS n
            FROM (SELECT 0 AS v UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t1,
            (SELECT 0 AS v UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t2,
            (SELECT 0 AS v UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t3) numbers
        WHERE CHAR_LENGTH(json_txt ) - CHAR_LENGTH(REPLACE(json_txt , ',', '')) >= n - 1
        AND n>0 ) sp
    WHERE TRIM(SUBSTRING_INDEX(txt,':',1)) = CONCAT('"',search_key,'"')
    LIMIT 1);
END
