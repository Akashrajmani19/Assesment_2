use akash;
-- Question 2
create table test_a(id numeric);

create table test_b(id numeric);

insert into test_a values (10),(20),(38),(48),(58);

insert into test_b(id) values (10), (38), (50);

select * from  test_a;
select * from  test_b;
/*
Write a query to fetch values in table test_a that are and not in test b without using the NOT keyword.
*/
SELECT test_a.id FROM test_a
LEFT JOIN test_b ON test_a.id = test_b.id
WHERE test_b.id IS NULL;
