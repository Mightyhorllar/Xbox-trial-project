CREATE TABLE xbox_games(
	Rank INT,
	Name VARCHAR,
	Platform VARCHAR,
	Year TEXT,
	Genre VARCHAR,
	Publisher VARCHAR,
	NA_Sales FLOAT,
	EU_Sales FLOAT,
	JP_Sales FLOAT,
	Other_Sales FLOAT,
	Global_Sales FLOAT
);

SELECT name,  platform, year, publisher
FROM xbox_games;


SELECT publisher, SUM(na_sales) AS sum_of_NAsales, SUM(eu_sales) AS sum_of_EUsales, SUM(jp_sales) AS sum_of_JPsales
FROM xbox_games
GROUP BY 1
ORDER BY 2,3,4 DESC


SELECT publisher, SUM(global_sales) AS sum_of_global_sales
FROM xbox_games
GROUP BY 1
ORDER BY 2 DESC


/* Top 5 publisher by sales in each region, and in global sales. 
/*