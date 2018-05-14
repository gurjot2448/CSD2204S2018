MariaDB [(none)]> USE CSD2204S18;
Database changed
MariaDB [CSD2204S18]> SHOW TABLES
    -> ;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c3                   |
| customer             |
| orders               |
| persons              |
+----------------------+
5 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer ORDER BY name,city ASC;
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.03 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer ORDER BY name desc,city ASC;
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer LIMIT 3;
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c01    | Ashley          | Ash      | WDC      | 321200     |   34 |
| c03    | Cherlies Theron | cher     | New York | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil   | 341020     |   25 |
+--------+-----------------+----------+----------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer;
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer ORDER BY custID desc limit 3;
+--------+--------------+----------+------------+------------+------+
| custid | name         | nickname | city       | postalCode | age  |
+--------+--------------+----------+------------+------------+------+
| co2    | Bob maeley   | Bm       | Toronto    | 100100     |   23 |
| C10    | Jack Sp      | Sparrow  | New Jersey | 102301     |   35 |
| C09    | Tony Special | Specie   | GTA        | 418921     |   62 |
+--------+--------------+----------+------------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer ORDER BY custID asc limit 3;
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c01    | Ashley          | Ash      | WDC      | 321200     |   34 |
| c03    | Cherlies Theron | cher     | New York | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil   | 341020     |   25 |
+--------+-----------------+----------+----------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer ORDER BY age where min(age)=35 limit 3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'where min(age)=35 limit 3' at line 1
MariaDB [CSD2204S18]> SELECT * FROM customer ORDER BY age where min(age)=35  desc limit 3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'where min(age)=35  desc limit 3' at line 1
MariaDB [CSD2204S18]>  SELECT * FROM (SELECT * FROM customer ORDER BY custID desc limit 3 ) t order by cus_id asc;
ERROR 1054 (42S22): Unknown column 'cus_id' in 'order clause'
MariaDB [CSD2204S18]>  SELECT * FROM (SELECT * FROM customer ORDER BY custID desc limit 3 ) t order by cusId asc;
ERROR 1054 (42S22): Unknown column 'cusId' in 'order clause'
MariaDB [CSD2204S18]>  SELECT * FROM (SELECT * FROM customer ORDER BY custID desc limit 3 ) t order by cusID asc;
ERROR 1054 (42S22): Unknown column 'cusID' in 'order clause'
MariaDB [CSD2204S18]> SELECT CITY FROM CUSTOMER GROUP BY CITY;
+------------+
| CITY       |
+------------+
| Brazil     |
| GTA        |
| New Jersey |
| New York   |
| Toronto    |
| USA        |
| WDC        |
+------------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> 
MariaDB [CSD2204S18]> SELECT COUNT(city)"Unique Cities " from customer GROUP by city;
+----------------+
| Unique Cities  |
+----------------+
|              1 |
|              1 |
|              1 |
|              2 |
|              3 |
|              1 |
|              1 |
+----------------+
7 rows in set (0.01 sec)

MariaDB [CSD2204S18]> SELECT city, COUNT(city)"No. of  customers " from customer GROUP by city;
+------------+--------------------+
| city       | No. of  customers  |
+------------+--------------------+
| Brazil     |                  1 |
| GTA        |                  1 |
| New Jersey |                  1 |
| New York   |                  2 |
| Toronto    |                  3 |
| USA        |                  1 |
| WDC        |                  1 |
+------------+--------------------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT city, COUNT(city)"Distinct cities" from customer GROUP by city;
+------------+-----------------+
| city       | Distinct cities |
+------------+-----------------+
| Brazil     |               1 |
| GTA        |               1 |
| New Jersey |               1 |
| New York   |               2 |
| Toronto    |               3 |
| USA        |               1 |
| WDC        |               1 |
+------------+-----------------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT "Distinct cities" from customer GROUP by city;
+-----------------+
| Distinct cities |
+-----------------+
| Distinct cities |
| Distinct cities |
| Distinct cities |
| Distinct cities |
| Distinct cities |
| Distinct cities |
| Distinct cities |
+-----------------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT Distinct city from customer;
+------------+
| city       |
+------------+
| WDC        |
| New York   |
| Brazil     |
| Toronto    |
| USA        |
| GTA        |
| New Jersey |
+------------+
7 rows in set (0.02 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer;
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT city,COUNT(city)"No. of customers" FROM Customer Group by city having city="%New";
Empty set (0.01 sec)

MariaDB [CSD2204S18]> SELECT city,COUNT(city)"No. of customers" FROM Customer Group by city having city like "%New";
Empty set (0.00 sec)

MariaDB [CSD2204S18]> SELECT city,COUNT(city)" customers" FROM Customer Group by city having city like "%New";
Empty set, 1 warning (0.00 sec)

MariaDB [CSD2204S18]> SELECT city, COUNT(city) "customers" FROM customer GROUP BY city HAVING COUNT(city)>2;
+---------+-----------+
| city    | customers |
+---------+-----------+
| Toronto |         3 |
+---------+-----------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT city,COUNT(city)" customers" FROM Customer GROUP BY city having city like "%New";
Empty set, 1 warning (0.00 sec)

MariaDB [CSD2204S18]> SELECT city,COUNT(city)" customers" FROM Customer GROUP BY city having city like "%New";
Empty set, 1 warning (0.00 sec)

MariaDB [CSD2204S18]> SELECT city,COUNT(city)"customers" FROM Customer GROUP BY city having city like "%New";
Empty set (0.00 sec)

MariaDB [CSD2204S18]> SELECT city,COUNT(city)"customers" FROM Customer GROUP BY city having city like "New%";
+------------+-----------+
| city       | customers |
+------------+-----------+
| New Jersey |         1 |
| New York   |         2 |
+------------+-----------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT city,COUNT(city)"customers" FROM Customer GROUP BY city having city like "New%" OR city=Toronto;
ERROR 1054 (42S22): Unknown column 'Toronto' in 'having clause'
MariaDB [CSD2204S18]> SELECT city,COUNT(city)"customers" FROM Customer GROUP BY city having city like "New%" OR city='Toronto';
+------------+-----------+
| city       | customers |
+------------+-----------+
| New Jersey |         1 |
| New York   |         2 |
| Toronto    |         3 |
+------------+-----------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer WHERE name REGEXP '^D';
+--------+--------------+----------+---------+------------+------+
| custid | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C04    | Denial Jack  | DJ       | Brazil  | 341020     |   25 |
| C05    | Donna newman | New      | Toronto | 130120     |   50 |
+--------+--------------+----------+---------+------------+------+
2 rows in set (0.05 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer WHERE name REGEXP 'n$';
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c03    | Cherlies Theron | cher     | New York | 120134     |   20 |
| C05    | Donna newman    | New      | Toronto  | 130120     |   50 |
+--------+-----------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer WHERE name REGEXP '^..';
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer WHERE name REGEXP '^..a;
    '> ;
    '> '
    -> ';
    '> '';
    '> :
    '> ;
    '> ';
Empty set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer WHERE name REGEXP '^..a';
Empty set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer WHERE name REGEXP '^..i';
Empty set (0.00 sec)

MariaDB [CSD2204S18]> 
MariaDB [CSD2204S18]> SELECT * FROM customer WHERE postalCode REGEXP'^[A-Z]';
Empty set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer WHERE postalCode REGEXP' ^[0-9]';
Empty set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM customer WHERE nickname REGEXP' ['^A*'];
    '> '
    -> '';
ERROR 1054 (42S22): Unknown column 'A' in 'where clause'
MariaDB [CSD2204S18]> select * from customer where city REGEXP '^.{4}';
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
+--------+-----------------+----------+------------+------------+------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where postalCode REGEXP '^[0-9]';
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where postalCode REGEXP '^[A-Z]';
Empty set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where nickname REGEXP '[^A+]';
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where nickname REGEXP '[^A?]';
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where nickname REGEXP '[^A*]';
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where city rLIKE '^.{4}';
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
+--------+-----------------+----------+------------+------------+------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer where city rLIKE '^.{5}';
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
+--------+-----------------+----------+------------+------------+------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select curdate();
+------------+
| curdate()  |
+------------+
| 2018-05-14 |
+------------+
1 row in set (0.03 sec)

MariaDB [CSD2204S18]> select now();
+---------------------+
| now()               |
+---------------------+
| 2018-05-14 09:15:27 |
+---------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> alter table customer Add column dob date;
Query OK, 0 rows affected (0.56 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC customer;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custid     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| dob        | date        | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> select * from customer;
+--------+-----------------+----------+------------+------------+------+------+
| custid | name            | nickname | city       | postalCode | age  | dob  |
+--------+-----------------+----------+------------+------------+------+------+
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 | NULL |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 | NULL |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 | NULL |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 | NULL |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 | NULL |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 | NULL |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 | NULL |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 | NULL |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 | NULL |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 | NULL |
+--------+-----------------+----------+------------+------------+------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> update customer set dob ='1991-01-10' where custid ='c01';
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [CSD2204S18]> update customer set dob ='1996-04-15' where custid ='c02';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

MariaDB [CSD2204S18]> update customer set dob ='1994-05-09' where custid ='c03';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [CSD2204S18]> update customer set dob ='1995-11-03' where custid ='c04';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [CSD2204S18]> update customer set dob ='1995-01-16' where custid ='c05';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [CSD2204S18]> update customer set dob ='1995-10-22' where custid ='c06';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [CSD2204S18]> update customer set dob ='1992-11-07' where custid ='c07';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [CSD2204S18]> update customer set dob ='1996-05-07' where custid ='c08';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [CSD2204S18]> update customer set dob ='1985-08-28' where custid ='c09';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [CSD2204S18]> update customer set dob ='1995-07-17' where custid ='c10';
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [CSD2204S18]> select * from customer;
+--------+-----------------+----------+------------+------------+------+------------+
| custid | name            | nickname | city       | postalCode | age  | dob        |
+--------+-----------------+----------+------------+------------+------+------------+
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 | 1991-01-10 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 | 1994-05-09 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 | 1995-11-03 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 | 1995-01-16 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 | 1995-10-22 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 | 1992-11-07 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 | 1996-05-07 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 | 1985-08-28 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 | 1995-07-17 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 | NULL       |
+--------+-----------------+----------+------------+------------+------+------------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> update customer set dob ='1996-04-15' where custid ='c02';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

MariaDB [CSD2204S18]> select * from customer;
+--------+-----------------+----------+------------+------------+------+------------+
| custid | name            | nickname | city       | postalCode | age  | dob        |
+--------+-----------------+----------+------------+------------+------+------------+
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 | 1991-01-10 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 | 1994-05-09 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 | 1995-11-03 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 | 1995-01-16 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 | 1995-10-22 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 | 1992-11-07 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 | 1996-05-07 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 | 1985-08-28 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 | 1995-07-17 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 | NULL       |
+--------+-----------------+----------+------------+------------+------+------------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> update customer set dob ='1996-04-15' where custid ='C02';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

MariaDB [CSD2204S18]> select * from customer;
+--------+-----------------+----------+------------+------------+------+------------+
| custid | name            | nickname | city       | postalCode | age  | dob        |
+--------+-----------------+----------+------------+------------+------+------------+
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 | 1991-01-10 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 | 1994-05-09 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 | 1995-11-03 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 | 1995-01-16 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 | 1995-10-22 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 | 1992-11-07 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 | 1996-05-07 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 | 1985-08-28 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 | 1995-07-17 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 | NULL       |
+--------+-----------------+----------+------------+------------+------+------------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> update customer set dob ='1996-04-15' where custid ='C02';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

MariaDB [CSD2204S18]> select * from customer;
+--------+-----------------+----------+------------+------------+------+------------+
| custid | name            | nickname | city       | postalCode | age  | dob        |
+--------+-----------------+----------+------------+------------+------+------------+
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 | 1991-01-10 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 | 1994-05-09 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 | 1995-11-03 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 | 1995-01-16 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 | 1995-10-22 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 | 1992-11-07 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 | 1996-05-07 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 | 1985-08-28 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 | 1995-07-17 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 | NULL       |
+--------+-----------------+----------+------------+------------+------+------------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> update customer set dob ='1996-04-15' where custid ='CO2';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [CSD2204S18]> select * from customer;
+--------+-----------------+----------+------------+------------+------+------------+
| custid | name            | nickname | city       | postalCode | age  | dob        |
+--------+-----------------+----------+------------+------------+------+------------+
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 | 1991-01-10 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 | 1994-05-09 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 | 1995-11-03 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 | 1995-01-16 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 | 1995-10-22 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 | 1992-11-07 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 | 1996-05-07 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 | 1985-08-28 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 | 1995-07-17 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 | 1996-04-15 |
+--------+-----------------+----------+------------+------------+------+------------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name ,dob,TIMESTAMPDIFF(YEAR,dob,CURDATE())"age" from customer;
+-----------------+------------+------+
| name            | dob        | age  |
+-----------------+------------+------+
| Ashley          | 1991-01-10 |   27 |
| Cherlies Theron | 1994-05-09 |   24 |
| Denial Jack     | 1995-11-03 |   22 |
| Donna newman    | 1995-01-16 |   23 |
| Eston M         | 1995-10-22 |   22 |
| Bobby Chacko    | 1992-11-07 |   25 |
| Ashko Charles   | 1996-05-07 |   22 |
| Tony Special    | 1985-08-28 |   32 |
| Jack Sp         | 1995-07-17 |   22 |
| Bob maeley      | 1996-04-15 |   22 |
+-----------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name ,dob,TIMESTAMPDIFF(day,dob,CURDATE())"age" from customer;
+-----------------+------------+-------+
| name            | dob        | age   |
+-----------------+------------+-------+
| Ashley          | 1991-01-10 |  9986 |
| Cherlies Theron | 1994-05-09 |  8771 |
| Denial Jack     | 1995-11-03 |  8228 |
| Donna newman    | 1995-01-16 |  8519 |
| Eston M         | 1995-10-22 |  8240 |
| Bobby Chacko    | 1992-11-07 |  9319 |
| Ashko Charles   | 1996-05-07 |  8042 |
| Tony Special    | 1985-08-28 | 11947 |
| Jack Sp         | 1995-07-17 |  8337 |
| Bob maeley      | 1996-04-15 |  8064 |
+-----------------+------------+-------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name ,dob,TIMESTAMPDIFF(YEAR,dob,CURDATE())"age" from customer; having age=22;
+-----------------+------------+------+
| name            | dob        | age  |
+-----------------+------------+------+
| Ashley          | 1991-01-10 |   27 |
| Cherlies Theron | 1994-05-09 |   24 |
| Denial Jack     | 1995-11-03 |   22 |
| Donna newman    | 1995-01-16 |   23 |
| Eston M         | 1995-10-22 |   22 |
| Bobby Chacko    | 1992-11-07 |   25 |
| Ashko Charles   | 1996-05-07 |   22 |
| Tony Special    | 1985-08-28 |   32 |
| Jack Sp         | 1995-07-17 |   22 |
| Bob maeley      | 1996-04-15 |   22 |
+-----------------+------------+------+
10 rows in set (0.00 sec)

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'having age=22' at line 1
MariaDB [CSD2204S18]> SELECT name ,dob,TIMESTAMPDIFF(YEAR,dob,CURDATE())"age" from customer having age=22;
+---------------+------------+------+
| name          | dob        | age  |
+---------------+------------+------+
| Denial Jack   | 1995-11-03 |   22 |
| Eston M       | 1995-10-22 |   22 |
| Ashko Charles | 1996-05-07 |   22 |
| Jack Sp       | 1995-07-17 |   22 |
| Bob maeley    | 1996-04-15 |   22 |
+---------------+------------+------+
5 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name ,dob,TIMESTAMPDIFF(YEAR,dob,CURDATE())"age" from customer where TIMESTAMPDIFF(YEAR,dob,CURDATE())=22;
+---------------+------------+------+
| name          | dob        | age  |
+---------------+------------+------+
| Denial Jack   | 1995-11-03 |   22 |
| Eston M       | 1995-10-22 |   22 |
| Ashko Charles | 1996-05-07 |   22 |
| Jack Sp       | 1995-07-17 |   22 |
| Bob maeley    | 1996-04-15 |   22 |
+---------------+------------+------+
5 rows in set (0.00 sec)

MariaDB [CSD2204S18]> EXIT;
