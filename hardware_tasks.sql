-- Задание 1 Вывести суммарное количество единиц техники на складе (не товарных позиций, а товаров!)
SELECT SUM(amount) AS total_amount 
FROM hardware;
-- Задание 2 Вывести какие товары на складе закончились
SELECT * 
FROM hardware
WHERE amount = 0;
-- Задание 3 Вывести среднюю цену монитора
SELECT AVG(price) AS avg_monitor_price
FROM hardware 
WHERE title LIKE 'Монитор%';
-- Задание 4 Вывести все клавиатуры, при этом результаты отсортировать от самой дешевой до самой дорогой
SELECT *
FROM hardware
WHERE title LIKE 'Клавиатура%'
ORDER BY price ASC;
-- Задание 5 ывести в рамках одного запроса количество товарных позиций по каждому тегу с использованием группировки, результаты отсортировать от максимального количества до минимального (товары без тегов не учитываем)
SELECT 
tag, 
COUNT(*) AS total_items
FROM 
hardware
WHERE 
tag IS NOT NULL
GROUP BY 
tag
ORDER BY 
total_items DESC;
-- Задание 6 Вывести количество товарных позиций со скидками на складе
SELECT 
COUNT(*) AS discounted_items
FROM 
hardware
WHERE 
discount > 0;
-- Задание 7 Вывести название и цену самой дорогой новинки
SELECT title, price
FROM hardware
WHERE tag = 'new'
ORDER BY price DESC
LIMIT 1;
-- Задание 8 Добавить в таблицу товар Ноутбук Lenovo 2BXKQ7E9XD как новинку по цене 54500 руб. в единственном экземпляре
INSERT INTO hardware (title, price, amount, tag)
VALUES ('Ноутбук Lenovo 2BXKQ7E9XD', 54500, 1, 'new');
-- Задание 9 Найти и удалить по названию из базы ошибочно добавленный товар Очки PS VR 2
DELETE FROM hardware
WHERE id = 18 AND title = 'Очки PS VR 2';