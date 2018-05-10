MariaDB [(none)]> tee C:/Users/736063/Downloads/Day4LogGJ.sql;
MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| csd2204s18         |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
6 rows in set (0.00 sec)

MariaDB [(none)]> USE CSD2204S18;
Database changed
MariaDB [CSD2204S18]> SHOW TABLES;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| customer             |
+----------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer;
Empty set (0.05 sec)

MariaDB [CSD2204S18]> DESC Customer;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custid     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.06 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('c01','Ashley','Ash','WDC','321200',34);
Query OK, 1 row affected (0.09 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer;
+--------+--------+----------+------+------------+------+
| custid | name   | nickname | city | postalCode | age  |
+--------+--------+----------+------+------------+------+
| c01    | Ashley | Ash      | WDC  | 321200     |   34 |
+--------+--------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('co2','Bob maeley','Bm','Toronto','100100',23);
Query OK, 1 row affected (0.06 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('c03','Cherlies Theron','cher','New York','120134,20);
    '> 
    '> ;
    '> ';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('c03','Cherlies Theron','cher','New York','120134',20);
Query OK, 1 row affected (0.01 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C04','Denial Jack','DJ','Brazil','341020',25);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C05','Donna newman','New','Toronto','130120',50);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C06','Eston M','M.','Toronto','201023',65);
Query OK, 1 row affected (0.02 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C07','Bobby Chacko','Chac','New York','320300',70);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C08','Ashko Charles','AK','USA','421044',72);
Query OK, 1 row affected (0.03 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C09','Tony Special','Specie','GTA','418921',62);
Query OK, 1 row affected (0.05 sec)

MariaDB [CSD2204S18]> INSERT INTO Customer VALUES('C10','Jack Sp','Sparrow','New Jersey','102301',35);
Query OK, 1 row affected (0.05 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer;
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

MariaDB [CSD2204S18]> SELECT name,nickname FROM Customer;
+-----------------+----------+
| name            | nickname |
+-----------------+----------+
| Ashley          | Ash      |
| Cherlies Theron | cher     |
| Denial Jack     | DJ       |
| Donna newman    | New      |
| Eston M         | M.       |
| Bobby Chacko    | Chac     |
| Ashko Charles   | AK       |
| Tony Special    | Specie   |
| Jack Sp         | Sparrow  |
| Bob maeley      | Bm       |
+-----------------+----------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT city,postalCode FROM Customer;
+------------+------------+
| city       | postalCode |
+------------+------------+
| WDC        | 321200     |
| New York   | 120134     |
| Brazil     | 341020     |
| Toronto    | 130120     |
| Toronto    | 201023     |
| New York   | 320300     |
| USA        | 421044     |
| GTA        | 418921     |
| New Jersey | 102301     |
| Toronto    | 100100     |
+------------+------------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE name='Ashley';
+--------+--------+----------+------+------------+------+
| custid | name   | nickname | city | postalCode | age  |
+--------+--------+----------+------+------------+------+
| c01    | Ashley | Ash      | WDC  | 321200     |   34 |
+--------+--------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE name='Jack Sp';
+--------+---------+----------+------------+------------+------+
| custid | name    | nickname | city       | postalCode | age  |
+--------+---------+----------+------------+------------+------+
| C10    | Jack Sp | Sparrow  | New Jersey | 102301     |   35 |
+--------+---------+----------+------------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT city FROM Customer WHERE name='Eston M.';
Empty set (0.00 sec)

MariaDB [CSD2204S18]> SELECT CITY from Customer WHERE name='Eston M';
+---------+
| CITY    |
+---------+
| Toronto |
+---------+
1 row in set (0.02 sec)

MariaDB [CSD2204S18]> SELECT name,city FROM Customer WHERE city!='Toronto';
+-----------------+------------+
| name            | city       |
+-----------------+------------+
| Ashley          | WDC        |
| Cherlies Theron | New York   |
| Denial Jack     | Brazil     |
| Bobby Chacko    | New York   |
| Ashko Charles   | USA        |
| Tony Special    | GTA        |
| Jack Sp         | New Jersey |
+-----------------+------------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE age=50;
+--------+--------------+----------+---------+------------+------+
| custid | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C05    | Donna newman | New      | Toronto | 130120     |   50 |
+--------+--------------+----------+---------+------------+------+
1 row in set (0.03 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE age>50;
+--------+---------------+----------+----------+------------+------+
| custid | name          | nickname | city     | postalCode | age  |
+--------+---------------+----------+----------+------------+------+
| C06    | Eston M       | M.       | Toronto  | 201023     |   65 |
| C07    | Bobby Chacko  | Chac     | New York | 320300     |   70 |
| C08    | Ashko Charles | AK       | USA      | 421044     |   72 |
| C09    | Tony Special  | Specie   | GTA      | 418921     |   62 |
+--------+---------------+----------+----------+------------+------+
4 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE name> 'Ashley';
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
+--------+-----------------+----------+------------+------------+------+
8 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE name<'Denial Jack';
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c01    | Ashley          | Ash      | WDC      | 321200     |   34 |
| c03    | Cherlies Theron | cher     | New York | 120134     |   20 |
| C07    | Bobby Chacko    | Chac     | New York | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA      | 421044     |   72 |
| co2    | Bob maeley      | Bm       | Toronto  | 100100     |   23 |
+--------+-----------------+----------+----------+------------+------+
5 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name,city FROM Customer WHERE name='Ashley';
+--------+------+
| name   | city |
+--------+------+
| Ashley | WDC  |
+--------+------+
1 row in set (0.01 sec)

MariaDB [CSD2204S18]> SELECT name.city FROM customer WHERE name='Asley'||city ='Toronto';
ERROR 1054 (42S22): Unknown column 'name.city' in 'field list'
MariaDB [CSD2204S18]> SELECT name,city FROM customer WHERE name='Asley'||city ='Toronto';
+--------------+---------+
| name         | city    |
+--------------+---------+
| Donna newman | Toronto |
| Eston M      | Toronto |
| Bob maeley   | Toronto |
+--------------+---------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name,city FROM customer WHERE name='Asley' OR city ='Toronto';
+--------------+---------+
| name         | city    |
+--------------+---------+
| Donna newman | Toronto |
| Eston M      | Toronto |
| Bob maeley   | Toronto |
+--------------+---------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name,age FROM Customer WHERE city ='Toronto' AND Age>50;
+---------+------+
| name    | age  |
+---------+------+
| Eston M |   65 |
+---------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE city='Toronto';
+--------+--------------+----------+---------+------------+------+
| custid | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C05    | Donna newman | New      | Toronto | 130120     |   50 |
| C06    | Eston M      | M.       | Toronto | 201023     |   65 |
| co2    | Bob maeley   | Bm       | Toronto | 100100     |   23 |
+--------+--------------+----------+---------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT COUNT(*) FROM Customer WHERE city ='Toronto';
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+
1 row in set (0.02 sec)

MariaDB [CSD2204S18]> SELECT COUNT(*) "no. of customers in Torranto" FROM Customer WHERE city ='Toronto';
+------------------------------+
| no. of customers in Torranto |
+------------------------------+
|                            3 |
+------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT COUNT(*) "no. of customers with age more than 50" FROM Customer WHERE age>50;
+----------------------------------------+
| no. of customers with age more than 50 |
+----------------------------------------+
|                                      4 |
+----------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT COUNT(*) "no. of customers with age more than 50" FROM Customer WHERE 30>age>70;
+----------------------------------------+
| no. of customers with age more than 50 |
+----------------------------------------+
|                                      0 |
+----------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT COUNT(*) "no. of customers with age between 30-70" FROM Customer WHERE age>30 age<70;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'age<70' at line 1
MariaDB [CSD2204S18]> 
MariaDB [CSD2204S18]> SELECT COUNT(*) "no. of customers  age between 30-70" FROM Customer WHERE age>30 and age<70;
+-------------------------------------+
| no. of customers  age between 30-70 |
+-------------------------------------+
|                                   5 |
+-------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT COUNT(*) "no. of customers  age between 30-70" FROM Customer WHERE agebetween 30 and 70;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '30 and 70' at line 1
MariaDB [CSD2204S18]> SELECT COUNT(*) "no. of customers  age between 30-70" FROM Customer WHERE age between 30 and 70;
+-------------------------------------+
| no. of customers  age between 30-70 |
+-------------------------------------+
|                                   6 |
+-------------------------------------+
1 row in set (0.02 sec)

MariaDB [CSD2204S18]> SELECT COUNT(*) "no. of customers  age between 30-70" FROM Customer WHERE not age between 30 and 70;
+-------------------------------------+
| no. of customers  age between 30-70 |
+-------------------------------------+
|                                   4 |
+-------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * from customers  age between 30-70" FROM Customer WHERE not age between 30 and 70;30 and 70;
    "> ;
    "> '''';
    "> <;
    "> OR ;
    "> ':
    "> ";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'between 30-70" FROM Customer WHERE not age between 30 and 70;30 and 70;
;
'''';
' at line 1
MariaDB [CSD2204S18]> SELECT * FROM customer order by age;
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.03 sec)

MariaDB [CSD2204S18]> SELECT max(age ) FROM Customer;
+-----------+
| max(age ) |
+-----------+
|        72 |
+-----------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name, max(age ) FROM Customer;
+--------+-----------+
| name   | max(age ) |
+--------+-----------+
| Ashley |        72 |
+--------+-----------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name, min(age ) FROM Customer;
+--------+-----------+
| name   | min(age ) |
+--------+-----------+
| Ashley |        20 |
+--------+-----------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT name, avg(age ) FROM Customer;
+--------+-----------+
| name   | avg(age ) |
+--------+-----------+
| Ashley |   45.6000 |
+--------+-----------+
1 row in set (0.02 sec)

MariaDB [CSD2204S18]> SELECT'list of customers whose name starts with B';
+--------------------------------------------+
| list of customers whose name starts with B |
+--------------------------------------------+
| list of customers whose name starts with B |
+--------------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE name LIKE 'B%';
+--------+--------------+----------+----------+------------+------+
| custid | name         | nickname | city     | postalCode | age  |
+--------+--------------+----------+----------+------------+------+
| C07    | Bobby Chacko | Chac     | New York | 320300     |   70 |
| co2    | Bob maeley   | Bm       | Toronto  | 100100     |   23 |
+--------+--------------+----------+----------+------------+------+
2 rows in set (0.01 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE name ='B%';
Empty set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE name NOT LIKE 'B%';
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
8 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE name LIKE '%n';
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c03    | Cherlies Theron | cher     | New York | 120134     |   20 |
| C05    | Donna newman    | New      | Toronto  | 130120     |   50 |
+--------+-----------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE city like 'new%';
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
+--------+-----------------+----------+------------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer Where name LIKE '--n%';
Empty set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer Where name LIKE '__n%';
+--------+--------------+----------+---------+------------+------+
| custid | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C04    | Denial Jack  | DJ       | Brazil  | 341020     |   25 |
| C05    | Donna newman | New      | Toronto | 130120     |   50 |
| C09    | Tony Special | Specie   | GTA     | 418921     |   62 |
+--------+--------------+----------+---------+------------+------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer Where name LIKE '__n_a%';
+--------+--------------+----------+---------+------------+------+
| custid | name         | nickname | city    | postalCode | age  |
+--------+--------------+----------+---------+------------+------+
| C04    | Denial Jack  | DJ       | Brazil  | 341020     |   25 |
| C05    | Donna newman | New      | Toronto | 130120     |   50 |
+--------+--------------+----------+---------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer LIMIT 2;
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c01    | Ashley          | Ash      | WDC      | 321200     |   34 |
| c03    | Cherlies Theron | cher     | New York | 120134     |   20 |
+--------+-----------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT 'LIST THE customers with age 20,25,65,72';
+-----------------------------------------+
| LIST THE customers with age 20,25,65,72 |
+-----------------------------------------+
| LIST THE customers with age 20,25,65,72 |
+-----------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customers WHERE age IN (20,25,65,72);
ERROR 1146 (42S02): Table 'csd2204s18.customers' doesn't exist
MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE age IN (20,25,65,72);
+--------+-----------------+----------+----------+------------+------+
| custid | name            | nickname | city     | postalCode | age  |
+--------+-----------------+----------+----------+------------+------+
| c03    | Cherlies Theron | cher     | New York | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil   | 341020     |   25 |
| C06    | Eston M         | M.       | Toronto  | 201023     |   65 |
| C08    | Ashko Charles   | AK       | USA      | 421044     |   72 |
+--------+-----------------+----------+----------+------------+------+
4 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE age NOT IN (20,25,65,72);
+--------+--------------+----------+------------+------------+------+
| custid | name         | nickname | city       | postalCode | age  |
+--------+--------------+----------+------------+------------+------+
| c01    | Ashley       | Ash      | WDC        | 321200     |   34 |
| C05    | Donna newman | New      | Toronto    | 130120     |   50 |
| C07    | Bobby Chacko | Chac     | New York   | 320300     |   70 |
| C09    | Tony Special | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp      | Sparrow  | New Jersey | 102301     |   35 |
| co2    | Bob maeley   | Bm       | Toronto    | 100100     |   23 |
+--------+--------------+----------+------------+------------+------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE city IN ('Toronto','GTA','USA','WDC');
+--------+---------------+----------+---------+------------+------+
| custid | name          | nickname | city    | postalCode | age  |
+--------+---------------+----------+---------+------------+------+
| c01    | Ashley        | Ash      | WDC     | 321200     |   34 |
| C05    | Donna newman  | New      | Toronto | 130120     |   50 |
| C06    | Eston M       | M.       | Toronto | 201023     |   65 |
| C08    | Ashko Charles | AK       | USA     | 421044     |   72 |
| C09    | Tony Special  | Specie   | GTA     | 418921     |   62 |
| co2    | Bob maeley    | Bm       | Toronto | 100100     |   23 |
+--------+---------------+----------+---------+------------+------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer WHERE city IN ('G%','T%');
Empty set (0.00 sec)

MariaDB [CSD2204S18]> SELECT 'list unique cities';
+--------------------+
| list unique cities |
+--------------------+
| list unique cities |
+--------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT distinct(city)'Unique Cities' FROM Customer;
+---------------+
| Unique Cities |
+---------------+
| WDC           |
| New York      |
| Brazil        |
| Toronto       |
| USA           |
| GTA           |
| New Jersey    |
+---------------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT distinct(city) AS 'Unique Cities' FROM Customer;
+---------------+
| Unique Cities |
+---------------+
| WDC           |
| New York      |
| Brazil        |
| Toronto       |
| USA           |
| GTA           |
| New Jersey    |
+---------------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT COUNT(distinct(city)) AS 'Unique Cities' FROM Customer;
+---------------+
| Unique Cities |
+---------------+
|             7 |
+---------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer ORDER BY name DESC;
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

MariaDB [CSD2204S18]> SELECT * FROM Customer ORDER BY name ASC;
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
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer ORDER BY age DESC;
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| C08    | Ashko Charles   | AK       | USA        | 421044     |   72 |
| C07    | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| C06    | Eston M         | M.       | Toronto    | 201023     |   65 |
| C09    | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C05    | Donna newman    | New      | Toronto    | 130120     |   50 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM Customer ORDER BY age DESC LIMIT 1;
+--------+---------------+----------+------+------------+------+
| custid | name          | nickname | city | postalCode | age  |
+--------+---------------+----------+------+------------+------+
| C08    | Ashko Charles | AK       | USA  | 421044     |   72 |
+--------+---------------+----------+------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT 'list the customer details with the second highest age';
+-------------------------------------------------------+
| list the customer details with the second highest age |
+-------------------------------------------------------+
| list the customer details with the second highest age |
+-------------------------------------------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FRPOM Customer ORDER BY 65 ASC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FRPOM Customer ORDER BY 65 ASC' at line 1
MariaDB [CSD2204S18]> SELECT * FRPOM Customer ORDER BY  age 65 ASC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FRPOM Customer ORDER BY  age 65 ASC' at line 1
MariaDB [CSD2204S18]> SELECT * FRPOM Customer ORDER BY  age 65;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FRPOM Customer ORDER BY  age 65' at line 1
MariaDB [CSD2204S18]> SELECT * FRPOM Customer ORDER BY age DESC LIMIT 2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FRPOM Customer ORDER BY age DESC LIMIT 2' at line 1
MariaDB [CSD2204S18]> SELECT * FROM Customer ORDER BY age DESC LIMIT 2;
+--------+---------------+----------+----------+------------+------+
| custid | name          | nickname | city     | postalCode | age  |
+--------+---------------+----------+----------+------------+------+
| C08    | Ashko Charles | AK       | USA      | 421044     |   72 |
| C07    | Bobby Chacko  | Chac     | New York | 320300     |   70 |
+--------+---------------+----------+----------+------------+------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM (SELECT * FROM Customer ORDER BY age DESC LIMIT 2)LIMIT 1;
ERROR 1248 (42000): Every derived table must have its own alias
MariaDB [CSD2204S18]> SELECT * FROM (SELECT * FROM Customer ORDER BY age DESC LIMIT 2) AS t ORDER BY age ASC LIMIT 1;
+--------+--------------+----------+----------+------------+------+
| custid | name         | nickname | city     | postalCode | age  |
+--------+--------------+----------+----------+------------+------+
| C07    | Bobby Chacko | Chac     | New York | 320300     |   70 |
+--------+--------------+----------+----------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM (SELECT * FROM Customer ORDER BY age ASC LIMIT 2) AS t ORDER BY age DESC LIMIT 1;
+--------+------------+----------+---------+------------+------+
| custid | name       | nickname | city    | postalCode | age  |
+--------+------------+----------+---------+------------+------+
| co2    | Bob maeley | Bm       | Toronto | 100100     |   23 |
+--------+------------+----------+---------+------------+------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT max(age)*100 FROM Customer;
+--------------+
| max(age)*100 |
+--------------+
|         7200 |
+--------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT max(age)+10*20/2 FROM Customer;
+------------------+
| max(age)+10*20/2 |
+------------------+
|         172.0000 |
+------------------+
1 row in set (0.02 sec)

MariaDB [CSD2204S18]> SELECT max(age)+10*20/2 FROM Customer AS t;
+------------------+
| max(age)+10*20/2 |
+------------------+
|         172.0000 |
+------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> EXIT;
