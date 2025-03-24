CREATE TABLE users (
   id serial not null,
   user_name varchar(50) not null,
   level_id integer,
   skill integer,
   PRIMARY KEY (id)
   );

INSERT INTO users (id, user_name, level_id, skill)  
VALUES (default, 'Anton', 1, 900000), (default, 'Denis', 3, 4000), (default, 'Petr', 2, 50000), (default, 'Andrey', 4, 20), (default, 'Olga', 1, 600000), (default, 'Anna', 1, 1600000)

CREATE TABLE levels (
   id serial not null,
   level_name varchar(50) not null,
   PRIMARY KEY (id)
   );

INSERT INTO levels (id, level_name)  
VALUES (default, 'admin'), (default, 'power_user'), (default, 'user'), (default, 'guest')

DELETE FROM users WHERE skill<100000

INSERT INTO users (id, user_name, level_id, skill)  
VALUES (default, 'Oleg', 4, 10)
Задание 1 по SQL

1.1 отобрать из таблицы users всех пользователей, у которых level_id=1, skill > 799000 и в имени встречается буква а

Ответ: SELECT user_name FROM users WHERE level_id=1 AND skill>799000 AND user_name LIKE '%a%'

1.2 удалить всех пользователей, у которых skill меньше 100000

Ответ: DELETE FROM users WHERE skill<100000

1.3 вывести все данные из таблицы user в порядке убывания по полю skill

Ответ: SELECT user_name, level_id, skill FROM users ORDER BY skill DESC

1.4 добавить в таблицу user нового пользователя по имени Oleg, с уровнем 4 и skill =10

Ответ: INSERT INTO users (id, user _name, level_id, skill) VALUES (default, 'Oleg', 4, 10)

1.5 обновить данные в таблице user -  для пользователей с level_id меньше 2 проставить skill 2000000

Ответ: UPDATE users SET skill = 2000000 WHERE level_id < 2

1.6 выбрать user_name всех пользователей уровня admin используя подзапрос

Ответ: SELECT user_name, (SELECT level_name FROM levels WHERE levels.id = users.level_id) FROM users

1.7 выбрать user_name всех пользователей уровня admin используя join

Ответ: SELECT user_name, levels.level_name FROM users JOIN levels ON levels.id = users.level_id
