CREATE table employee(
  employee_id int PRIMARY KEY,
  first_name VARCHAR NOT NULL, 
  last_name VARCHAR NOT NULL
  )

INSERT INTO employee (employee_id, first_name, last_name) VALUES
(1, 'John', 'Filan'),
(2, 'Adam', 'Scolan'),
(3, 'Lisa', 'McCafety');

CREATE table projects 
(project_id int PRIMARY KEY, 
 project_name VARCHAR(15) NOT NULL
);

INSERT INTO projects (project_id, project_name) VALUES
(1, 'ПУМЧД'),
(2, 'КРАНЧ'),
(3, 'СКРУДЖ');

CREATE table titles (Id int PRIMARY KEY NOT NULL, 
                     titel_name VARCHAR(15) NOT NULL);
INSERT INTO titles (Id, titel_name) VALUES
(1, 'admin'),
(2, 'lead'),
(3, 'test')

CREATE table positions (
Id int PRIMARY KEY NOT NULL,
employee_id int NOT NULL,
project_id int NOT NULL,
title_id int NOT NULL,
salary int NOT NULL
  )

INSERT INTO positions (Id, employee_id, project_id, title_id, salary) VALUES
(1, 1, 2, 1, 650),
(2, 3, 3, 2, 800),
(3, 2, 1, 3, 700);

1) Вывести среднюю заработную плату всех тестировщиков на проекте “ПУМЧД”.
Ответ должен содержать столбцы:
 Название проекта;
 Название должности;
 Средняя заработная плата.

SELECT projects.project_name AS Project, 
titles.titel_name AS Title, 
AVG(positions.salary) as AvgSalary
from projects, titles, positions 
Where projects.project_id = positions.project_id 
AND titles.Id = positions.title_id
AND projects.project_name = 'ПУМЧД'

2) Вывести всех работников, которые работают сразу на нескольких проектах.
Ответ должен содержать следующие столбцы:
 Имя и фамилия сотрудника;
 Название должности.

SELECT CONCAT (employee.first_name, ' ', employee.last_name) AS FIO, titles.titel_name AS Title
FROM positions
JOIN employee ON positions.employee_id = employee.employee_id
JOIN titles ON positions.title_id = titles.id
GROUP BY FIO, Title
HAVING COUNT (positions.project_id) > 1
