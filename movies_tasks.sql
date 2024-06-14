-- Задание 1 Вывести сколько фильмов сняла кинокомпания Universal Pictures
SELECT COUNT(*) AS 'Количество фильмов'
FROM movies
JOIN companies ON movies.company_id = companies.id
WHERE companies.name = 'Universal Pictures';
-- Задание 2 Вывести сколько всего фильмов было снято режиссером Фрэнсисом Фордом Копполой
SELECT COUNT(*) AS 'Количество фильмов'
FROM movies
JOIN directors ON movies.director_id = directors.id
WHERE directors.full_name = 'Фрэнсис Форд Коппола';
-- Задание 3 Вывести количество снятых фильмов за последние 20 лет
SELECT COUNT(*) AS 'Количество фильмов'
FROM movies
WHERE year >= YEAR(CURDATE()) - 20;
-- Задание 4 Вывести все жанры фильмов в которых снимал Стивен Спилберг в течении всей своей карьеры
SELECT DISTINCT genres.name AS 'Жанры'
FROM movies
JOIN directors ON movies.director_id = directors.id
JOIN genres ON movies.genre_id = genres.id
WHERE directors.full_name = 'Стивен Спилберг';
-- Задание 5 Вывести названия, жанры и режиссеров 5 самых дорогих фильмов
SELECT title, genres.name AS 'Жанр', directors.full_name AS 'Режиссер'
FROM movies
JOIN genres ON movies.genre_id = genres.id
JOIN directors ON movies.director_id = directors.id
ORDER BY budget DESC
LIMIT 5;
-- Задание 6 Вывести имя режиссера с самым большим количеством фильмов
SELECT directors.full_name AS 'Режиссер', COUNT(*) AS 'Количество фильмов'
FROM movies
JOIN directors ON movies.director_id = directors.id
GROUP BY directors.full_name
ORDER BY COUNT(*) DESC
LIMIT 1;
-- Задание 7 Вывести названия и жанры фильмов, снятые самой большой кинокомпанией (по сумме всех бюджетов фильмов)
SELECT company_id
FROM movies
GROUP BY company_id
ORDER BY SUM(budget) DESC
LIMIT 1;
SELECT title, genres.name AS 'Жанр'
FROM movies
JOIN genres ON movies.genre_id = genres.id
WHERE company_id = (4)
-- Задание 8 Вывести средний бюджет фильмов, снятых кинокомпанией Warner Bros.
SELECT AVG(budget) AS 'Средний бюджет'
FROM movies
JOIN companies ON movies.company_id = companies.id
WHERE companies.name = 'Warner Bros.';
-- Задание 9 Вывести количество фильмов каждого жанра и средний бюджет по жанру
SELECT genres.name AS 'Жанр', COUNT(*) AS 'Количество фильмов', AVG(budget) AS 'Средний бюджет'
FROM movies
JOIN genres ON movies.genre_id = genres.id
GROUP BY genres.name;
-- Задание 10 Найти и удалить комедию "Дикие истории" 2014-го года
DELETE FROM movies
WHERE title = 'Дикие истории' AND year = 2014 and genre = 'комедия';