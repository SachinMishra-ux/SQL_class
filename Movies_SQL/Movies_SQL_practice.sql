-- Retrieve the top 10 highest-grossing movies along with their revenue.
SELECT m.title, r.revenue
FROM movies m
INNER JOIN revenue r ON m.movie_id = r.movie_id
ORDER BY r.revenue DESC
LIMIT 10;

-- Calculate the total revenue generated by all the movies in the database.
SELECT SUM(revenue) AS total_revenue
FROM revenue;

-- List the movies that have generated revenue greater than $1 million.

SELECT m.title, r.revenue
FROM movies m
INNER JOIN revenue r ON m.movie_id = r.movie_id
WHERE r.revenue > 1000000;

-- Find the average revenue generated by movies released in each year.

SELECT YEAR(m.release_date) AS release_year, AVG(r.revenue) AS avg_revenue
FROM movies m
INNER JOIN revenue r ON m.movie_id = r.movie_id
GROUP BY release_year;

-- Retrieve the movie titles along with their corresponding directors and total revenue.

SELECT m.title, m.director, SUM(r.revenue) AS total_revenue
FROM movies m
INNER JOIN revenue r ON m.movie_id = r.movie_id
GROUP BY m.title, m.director;

-- Retrieve the title, revenue, and profit (revenue - budget) for movies released after 2000, sorted by profit in descending order.

SELECT m.title, r.revenue, (r.revenue - r.budget) AS profit
FROM movies m
INNER JOIN revenue r ON m.movie_id = r.movie_id
WHERE r.release_year > 2000
ORDER BY profit DESC;

-- Find the average return on investment (ROI) for movies released in the 1990s. ROI is calculated as (revenue - budget) / budget * 100.

SELECT AVG(((r.revenue - r.budget) / r.budget) * 100) AS avg_roi
FROM movies m
INNER JOIN revenue r ON m.movie_id = r.movie_id
WHERE r.release_year BETWEEN 1990 AND 1999;

-- List the directors along with the total revenue and average budget of the movies they directed, for directors who have directed at least 2 movies.

SELECT m.director, SUM(r.revenue) AS total_revenue, AVG(r.budget) AS avg_budget
FROM movies m
INNER JOIN revenue r ON m.movie_id = r.movie_id
GROUP BY m.director
HAVING COUNT(m.movie_id) >= 2;






