-- Задание 1 Найти автора с самым большим числом книг и вывести его имя
SELECT a.name
FROM authors a
JOIN authors_books ab ON a.id = ab.authors_id
GROUP BY a.name
ORDER BY COUNT(ab.books_id) DESC
LIMIT 1;
-- Задание 2 Вывести пять самых старых книг у которых указан год издания
SELECT *
FROM books
WHERE year IS NOT NULL
ORDER BY year ASC
LIMIT 5;
-- Задание 3 Вывести общее количество книг на полке в кабинете
SELECT COUNT(*)
FROM books
JOIN shelves ON books.shelves_id = shelves.id
WHERE shelves.title = 'полка в кабинете';
-- Задание 4 Вывести названия, имена авторов и годы издания книг, которые находятся на полке в спальне
SELECT b.title, a.name, b.year
FROM books b
JOIN shelves s ON b.shelves_id = s.id
JOIN authors_books ab ON b.id = ab.books_id
JOIN authors a ON ab.authors_id = a.id
WHERE s.title = 'полка в спальне';
-- Задание 5 Вывести названия и годы издания книг, написанных автором 'Лев Толстой'
SELECT b.title, b.year
FROM books b
JOIN authors_books ab ON b.id = ab.books_id
JOIN authors a ON ab.authors_id = a.id
WHERE a.name = 'Лев Толстой';
-- Задание 6 Вывести название книг, которые написали авторы, чьи имена начинаются на букву "А"
SELECT b.title
FROM books b
JOIN authors_books ab ON b.id = ab.books_id
JOIN authors a ON ab.authors_id = a.id
WHERE a.name LIKE 'А%';
-- Задание 7 Вывести название книг и имена авторов для книг, которые находятся на полках, названия которых включают слова «верхняя» или «нижняя»
SELECT b.title, a.name
FROM books b
JOIN authors_books ab ON b.id = ab.books_id
JOIN authors a ON ab.authors_id = a.id
JOIN shelves s ON b.shelves_id = s.id
WHERE s.title LIKE '%верхняя%' OR s.title LIKE '%нижняя%';
-- Задание 8 Книгу «Божественная комедия» автора «Данте Алигьери» одолжили почитать другу Ивану Иванову, необходимо написать один или несколько запросов которые отразят это событие в БД
UPDATE books
SET friends_id = (
    SELECT id
    FROM friends
    WHERE name = 'Иванов Иван'
)
WHERE title = 'Божественная комедия' AND books.id = (
    SELECT books_id
    FROM authors_books
    JOIN authors
    ON authors_books.authors_id = authors.id
    WHERE authors.name = 'Данте Алигьери'
);
-- Задание 9 Добавить в базу книгу «Краткие ответы на большие вопросы», год издания 2020, автор «Стивен Хокинг», положить ее на полку в кабинете
INSERT INTO books (title, year, shelves_id, friends_id)
VALUES ('Краткие ответы на большие вопросы', 2020, 
    (SELECT id FROM shelves WHERE title = 'полка в кабинете' LIMIT 1), NULL);
INSERT INTO authors_books (books_id, authors_id)
VALUES (
    (SELECT id FROM books WHERE title = 'Краткие ответы на большие вопросы' LIMIT 1), 
    (SELECT id FROM authors WHERE name = 'Стивен Хокинг' LIMIT 1)
);
 WHERE name = 'Стивен Хокинг')
