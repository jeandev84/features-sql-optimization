-- DROP TABLE specialities;
-- DROP TABLE developers;
-- DROP TABLE tasks;

CREATE TABLE IF NOT EXISTS specialities (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS developers (
   id SERIAL PRIMARY KEY,
   first_name VARCHAR(100),
   last_name VARCHAR(100),
   speciality_id INT,
   salary     DECIMAL,

   CONSTRAINT fk_developers_speciality_id FOREIGN KEY (speciality_id) REFERENCES specialities (id)
);



CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    story_points INT,
    developer_id INT,
    created_at TIMESTAMPTZ,

    CONSTRAINT fk_tasks_developer_id FOREIGN KEY (developer_id) REFERENCES developers (id)
);


INSERT INTO specialities (id, name)
VALUES
(1, 'Java Developer'),
(2, 'C++ Developer'),
(3, 'Go Developer'),
(4, 'JS Developer'),
(5, 'Rust Developer');


INSERT INTO developers (id, first_name, last_name, speciality_id, salary)
VALUES
(1, 'John', 'Doe', 1, 3000.00),
(2, 'Mike', 'Smith', 1, 3000.00),
(3, 'Phil', 'Flaps', 1, 3000.00),
(4, 'Nick', 'Pointer', 4, 5000.00),
(5, 'Adam', 'MacFlow', 5, 6000.00);



INSERT INTO tasks (title, story_points, developer_id, created_at)
VALUES
('TASK 1', 2, 1, '2023-01-01'),
('TASK 2', 5, 1, '2023-02-01'),
('TASK 3', 8, 1, '2023-03-01'),
('TASK 4', 1, 4, '2023-02-01'),
('TASK 5', 3, 4, '2023-04-01'),
('TASK 6', 5, 5, '2023-02-01'),
('TASK 7', 1, 5, '2023-05-01');
