use akash;
-- Questin 1 :-
DROP TABLE IF EXISTS runners1;
DROP TABLE IF EXISTS races1;


CREATE TABLE runners1 (
    id INT,
    name VARCHAR(255)
);

INSERT INTO runners1 (id, name) VALUES 
(1,'John Doe'),
(2,'Jane Doe'),
(3,'Alice Jones'),
(4,'Bobby Louis'),
(5,'Lisa Romero');

CREATE TABLE races1 (
    id INT,
    event VARCHAR(255),
    winner_id INT
);

INSERT INTO races1 VALUES 
(1,'100 meter dash', 2),
(2,'500 meter dash', 3),
(3,'cross-country', 2),
(4,'triathlon', NULL);

SELECT * FROM runners1 WHERE id NOT IN (SELECT winner_id FROM races1);
-- Answer

/*
The subquery (SELECT winner_id FROM races1) will return the values [2, 3, NULL]. 
So, the main query will select all rows from runners1 where the id is not in this list.
 That means it will return only rows with IDs 1, 4, and 5 because these IDs are not found in the list [2, 3, NULL].

Output :- :
id | name
---|-----------
1  | John Doe
4  | Bobby Louis
5  | Lisa Romero

This query can not behave as expected when dealing with 'none' values because NOT IN with none values 
may not behave as intended. To avoid this issue, we can use the NOT EXISTS instead, which handles none values more reliably

*/
SELECT * FROM runners1 r
WHERE NOT EXISTS (SELECT 1 FROM races1 WHERE winner_id = r.id AND winner_id IS NOT NULL);

