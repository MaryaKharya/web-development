CREATE DATABASE lw10;

USE lw10;

CREATE TABLE studentFaculty
(
    id                  INT AUTO_INCREMENT NOT NULL,
    faculty_name        VARCHAR(255)       NOT NULL,
    number_of_groups    INT                NOT NULL,
    PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8mb4
  COLLATE 'utf8mb4_unicode_ci'
  ENGINE = InnoDB;

INSERT INTO studentFaculty (faculty_name, number_of_groups) VALUES
    ('ФИиВТ', '3'),
    ('ФСТ', '3'),
    ('ИММ', '3');

CREATE TABLE studentGroup 
(
    id                    INT AUTO_INCREMENT NOT NULL,
    group_name            VARCHAR(255)       NOT NULL,
    faculty               INT                NOT NULL,
    number_of_students    INT                NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (faculty) REFERENCES studentFaculty (id)
) DEFAULT CHARACTER SET utf8mb4
  COLLATE 'utf8mb4_unicode_ci'
  ENGINE = InnoDB;

INSERT INTO studentGroup (group_name, faculty, number_of_students) VALUES
    ('ПС-11', '1', '5'),
    ('ПС-12', '1', '5'),
    ('ПС-13', '1', '5'),
    ('СР-11', '2', '5'),
    ('СР-12', '2', '5'),
    ('СР-13', '2', '5'),
    ('МС-11', '3', '5'),
    ('МС-12', '3', '5'),
    ('МС-13', '3', '5');

CREATE TABLE student
(
    id              INT AUTO_INCREMENT NOT NULL,
    last_name       VARCHAR(255)       NOT NULL,
    first_name      VARCHAR(255)       NOT NULL,
    middle_name     VARCHAR(255)       NOT NULL,
    age             INT                NOT NULL,
    id_group    INT                NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_group) REFERENCES studentGroup (id)
) DEFAULT CHARACTER SET utf8mb4
  COLLATE 'utf8mb4_unicode_ci'
  ENGINE = InnoDB;
  
INSERT INTO student(last_name, first_name, middle_name, age, id_group) VALUES
    ('Алафузов', 'Даниил', 'Сергеевич', '20', '5'),
    ('Алгаев', 'Яков', 'Вадимович', '18', '6'),
    ('Арсибеков', 'Андрей', 'Артурович', '19', '4'),
    ('Васильев', 'Руслан', 'Геннадьевич', '19', '7'),
    ('Вязов', 'Родион', 'Валерьевич', '18', '3'),
    ('Веревкин', 'Александр', 'Иванович', '18', '8'),
    ('Галкин', 'Алексей', 'Алексееваич', '19', '2'),
    ('Глушков', 'Кирилл', 'Вячеславоваич', '19', '9'),
    ('Дроздов', 'Алексей', 'Рустамович', '19', '1'),
    ('Ельмекеев', 'Валерий', 'Анатольевич', '18', '1'),
    ('Ерофеев', 'Геннадий', 'Альбертович', '18', '2'),
    ('Золотарев', 'Егор', 'Сергеевич', '18', '3'),
    ('Корчемкина', 'Мария', 'Вячеславовна', '20', '4'),
    ('Кугергин', 'Артемий', 'Васильев', '18', '5'),
    ('Мосунова', 'Анна', 'Николаевна', '18', '6'),
    ('Мосунова', 'Людмила', 'Юрьевна', '19', '7'),
    ('Муравьев', 'Евгений', 'Андреевич', '19', '8'),
    ('Небогатиков', 'Владислав', 'Вячеславович', '18', '9'),
    ('Николаева', 'Наталия', 'Николаевна', '19', '1'),
    ('Пирогов', 'Даниил', 'Никитич', '20', '2'),
    ('Попова', 'Татьяна', 'Максимовна', '18', '3'),
    ('Речкин', 'Александр', 'Эдуардович', '18', '4'),
    ('Речкин', 'Дмитрий', 'Вадимович', '18', '5'),
    ('Смирнов', 'Евгений', 'Олегович', '17', '6'),
    ('Смирнова', 'Анна', 'Васильевна', '19', '7'),
    ('Трегубова', 'Анастасия', 'Александровна', '21', '8'),
    ('Тумбочкин', 'Вадимир', 'Владимирович', '23', '9'),
    ('Филипов', 'Андрей', 'Михайлович', '18', '9'),
    ('Хлебов', 'Денис', 'Дмитриевич', '17', '8'),
    ('Хлыбов', 'Алексей', 'Викторович', '18', '7'),
    ('Царегородцев', 'Максим', 'Марселевич', '21', '6'),
    ('Циганков', 'Самхат', 'Тахирович', '20', '5'),
    ('Чапаев', 'Иван', 'Романович', '18', '4'),
    ('Чепайкин', 'Юрий', 'Константинович', '19', '3'),
    ('Шестаков', 'Евгений', 'Михайлович', '19', '2'),
    ('Шестакова', 'Александра', 'Михайловна',  '18', '1'),
    ('Шуй', 'Лин', 'Мэй', '19', '9'),
    ('Эстонов', 'Муген', 'Коренович',  '22', '8'),
    ('Юн', 'Мэнь', 'Цзян', '18', '7'),
    ('Юркин', 'Роман', 'Юрьевич', '18', '6'),
    ('Юртиков', 'Сергей', 'Сергеевич',  '19', '5'),
    ('Якимова', 'Яна', 'Кирилловна', '17', '4'),
    ('Яковлева', 'Лариса', 'Николаевна', '20', '3'),
    ('Янаев', 'Владимир', 'Владиславович', '18', '2'),
    ('Ярин', 'Боярин', 'Дворянинович',  '18', '1');


SELECT
    *
FROM
    student
WHERE
    age = 19;


SELECT
    student.last_name,
    student.first_name,
    student.middle_name,
    studentGroup.group_name
FROM
    student
    JOIN studentGroup ON student.id_group = studentGroup.id
WHERE
    studentGroup.group_name = 'СР-11';


SELECT
    student.last_name,
    student.first_name,
    student.middle_name,
    studentFaculty.faculty_name 
FROM
    student
    JOIN studentGroup ON student.id_group = studentGroup.id
    JOIN studentFaculty ON studentGroup.faculty = studentFaculty.id
WHERE
    studentFaculty.faculty_name = 'ФИиВТ';


SELECT
    student.last_name,
    student.first_name,
    student.middle_name,
    studentGroup.group_name,
    studentFaculty.faculty_name
FROM
    student
    JOIN studentGroup ON student.id_group = studentGroup.id
    JOIN studentFaculty ON studentGroup.faculty = studentFaculty.id
WHERE
    student.id = 'студент';
