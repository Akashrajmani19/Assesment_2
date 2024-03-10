use akash;
CREATE TABLE users20 (
    user_id INT PRIMARY KEY,
    username VARCHAR(255)
);

CREATE TABLE training_details (
    user_training_id INT PRIMARY KEY,
    user_id INT,
    training_id INT,
    training_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users20 (user_id, username) VALUES
(1, 'John Doe'),
(2, 'Jane Don'),
(3, 'Alice Jones'),
(4, 'Lisa Romero');

INSERT INTO training_details (user_training_id, user_id, training_id, training_date) VALUES
(1, 1, 1234, '2015-08-02'),
(2, 1, 2, '2015-08-03'),
(3, 2, 2, '2015-08-02'),
(4, 2, 2, '2015-08-03'),
(5, 3, 2, '2015-08-04'),
(6, 3, 3, '2015-08-02'),
(7, 3, 2, '2015-08-03'),
(8, 1, 4, '2015-08-03'),
(9, 2, 4, '2015-08-04'),
(10, 3, 1, '2015-08-02'),
(11, 2, 2, '2015-08-04'),
(12, 3, 2, '2015-08-02'),
(13, 1, 2, '2015-08-02'),
(14, 4, 2, '2015-08-03');

/*Write a query to to get the list of users who took the a training lesson more than once in the same day, 
grouped by user and training lesson, each ordered from the most recent lesson date to oldest date.
*/
SELECT u.username,
       td.training_id,
       td.training_date,
       COUNT(*) AS num_of_occurrences
FROM users20 u
JOIN training_details td ON u.user_id = td.user_id
GROUP BY u.username, td.training_id, td.training_date
HAVING COUNT(*) > 1
ORDER BY td.training_date DESC;

