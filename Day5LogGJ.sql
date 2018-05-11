MariaDB [(none)]> CREATE TABLE persons(
    -> ID integer(3)'
    '> ID integer(3),
    '> LastName varchar(255) NOT NULL,
    '> ,;
    '> '';
    '> ,,;
    '> );
    '> ';
ERROR 1046 (3D000): No database selected
MariaDB [(none)]> USE CSD2204S18
Database changed
MariaDB [CSD2204S18]> CREATE TABLE persons(
    -> ID integer(3),
    -> LastName varchar(255) NOT NULL,
    -> FirstName varchar(255) NOT NULL,
    -> Age integer(3),
    -> CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
    -> );
Query OK, 0 rows affected (0.47 sec)

MariaDB [CSD2204S18]> desc persons;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| ID        | int(3)       | NO   | PRI | NULL    |       |
| LastName  | varchar(255) | NO   | PRI | NULL    |       |
| FirstName | varchar(255) | NO   |     | NULL    |       |
| Age       | int(3)       | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.05 sec)

MariaDB [CSD2204S18]> SHOW INDEX FROM persons;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| persons |          0 | PRIMARY  |            1 | ID          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| persons |          0 | PRIMARY  |            2 | LastName    | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.01 sec)

MariaDB [CSD2204S18]> CREATE TABLE Orders(
    -> OrderNumber integer(3) NOT NULL,
    -> OrderID integer(3) NOT NULL,
    -> personID integer(3),
    -> PRIMARY KEY (OrderID),
    -> CONSTRAINT FK_PersonOrder FOREIGN KEY(personID)
    -> REFERENCES persons(ID)
    -> );
Query OK, 0 rows affected (0.23 sec)

MariaDB [CSD2204S18]> SHOW CREATE TABLE Orders;
+--------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table  | Create Table                                                                                                                                                                                                                                                                                                      |
+--------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Orders | CREATE TABLE `orders` (
  `OrderNumber` int(3) NOT NULL,
  `OrderID` int(3) NOT NULL,
  `personID` int(3) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_PersonOrder` (`personID`),
  CONSTRAINT `FK_PersonOrder` FOREIGN KEY (`personID`) REFERENCES `persons` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
+--------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.01 sec)

MariaDB [CSD2204S18]> SHOW INDEX FROM Orders;
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table  | Non_unique | Key_name       | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| orders |          0 | PRIMARY        |            1 | OrderID     | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| orders |          1 | FK_PersonOrder |            1 | personID    | A         |           0 |     NULL | NULL   | YES  | BTREE      |         |               |
+--------+------------+----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

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
6 rows in set (0.03 sec)

MariaDB [CSD2204S18]> CREATE TABLE c1 AS SELECT * FROM Customer;
Query OK, 10 rows affected (0.34 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> CREATE TABLE c2 AS SELECT name,postalCode FROM Customer WHERE city='Toronto';
Query OK, 3 rows affected (0.28 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> desc c1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custid     | varchar(5)  | NO   |     | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> desc c2;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| name       | varchar(50) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c1;
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

MariaDB [CSD2204S18]> SELECT * FROM c2;
+--------------+------------+
| name         | postalCode |
+--------------+------------+
| Donna newman | 130120     |
| Eston M      | 201023     |
| Bob maeley   | 100100     |
+--------------+------------+
3 rows in set (0.00 sec)

MariaDB [CSD2204S18]> CREATE TABLE c3 LIKE Customer;
Query OK, 0 rows affected (0.25 sec)

MariaDB [CSD2204S18]> DESC c3;
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
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c3;
Empty set (0.00 sec)

MariaDB [CSD2204S18]> INSERT INTO c SELECT * FROM Customer;
ERROR 1146 (42S02): Table 'csd2204s18.c' doesn't exist
MariaDB [CSD2204S18]> INSERT INTO c3 SELECT * FROM Customer;
Query OK, 10 rows affected (0.04 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> SELECT * FROM c3;
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

MariaDB [CSD2204S18]> ALTER TABLE c3 add column Country VARCHAR
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [CSD2204S18]> ALTER TABLE c3 add column Country VARCHAR(100);
Query OK, 0 rows affected (0.57 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c3;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| custid     | varchar(5)   | NO   | PRI | NULL    |       |
| name       | varchar(50)  | YES  |     | NULL    |       |
| nickname   | varchar(10)  | YES  |     | NULL    |       |
| city       | varchar(20)  | YES  |     | NULL    |       |
| postalCode | varchar(10)  | YES  |     | NULL    |       |
| age        | int(3)       | YES  |     | NULL    |       |
| Country    | varchar(100) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> alter table C3 MODIFY COLUMN Country VARCHAR(40);
Query OK, 10 rows affected (0.51 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custid     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| Country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> alter table C3 MODIFY COLUMN country VARCHAR(40);
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custid     | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

MariaDB [CSD2204S18]> alter table c3 CHANGE COLUMN custID customerID VARCHAR(5);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerID | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

MariaDB [CSD2204S18]> ALTER TABLE c3 DROP COLUMN nickname;
Query OK, 0 rows affected (0.26 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerID | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c3 MODIFY name VARCHAR(50) NOT NULL; 
Query OK, 10 rows affected (1.37 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerID | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | NO   |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.01 sec)

MariaDB [CSD2204S18]> alter table c1 ADD PRIMARY KEY(custID);
Query OK, 0 rows affected (0.35 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC c1;
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
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SHOW VARIABLES IKE 'version';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'IKE 'version'' at line 1
MariaDB [CSD2204S18]> SHOW VARIABLES LIKE 'version';
+---------------+-----------------+
| Variable_name | Value           |
+---------------+-----------------+
| version       | 10.1.21-MariaDB |
+---------------+-----------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> alter table c1 DROP PRIMARY KEY(custID);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(custID)' at line 1
MariaDB [CSD2204S18]> alter table c1 DROP INDEX(custID);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '(custID)' at line 1
MariaDB [CSD2204S18]> alter table c1 DROP INDEX;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [CSD2204S18]> alter table c1 DROP PRIMARY KEY;
Query OK, 10 rows affected (0.75 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> DESC C1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custid     | varchar(5)  | NO   |     | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SHOW INDEX FROM persons;
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| persons |          0 | PRIMARY  |            1 | ID          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| persons |          0 | PRIMARY  |            2 | LastName    | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> drop index PK_person ON persons;
ERROR 1091 (42000): Can't DROP 'PK_person'; check that column/key exists
MariaDB [CSD2204S18]> DESC c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerID | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | NO   |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c3;
+------------+-----------------+------------+------------+------+---------+
| customerID | name            | city       | postalCode | age  | country |
+------------+-----------------+------------+------------+------+---------+
| c01        | Ashley          | WDC        | 321200     |   34 | NULL    |
| c03        | Cherlies Theron | New York   | 120134     |   20 | NULL    |
| C04        | Denial Jack     | Brazil     | 341020     |   25 | NULL    |
| C05        | Donna newman    | Toronto    | 130120     |   50 | NULL    |
| C06        | Eston M         | Toronto    | 201023     |   65 | NULL    |
| C07        | Bobby Chacko    | New York   | 320300     |   70 | NULL    |
| C08        | Ashko Charles   | USA        | 421044     |   72 | NULL    |
| C09        | Tony Special    | GTA        | 418921     |   62 | NULL    |
| C10        | Jack Sp         | New Jersey | 102301     |   35 | NULL    |
| co2        | Bob maeley      | Toronto    | 100100     |   23 | NULL    |
+------------+-----------------+------------+------------+------+---------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> UPDATE c3 SET country = 'USA';
Query OK, 10 rows affected (0.09 sec)
Rows matched: 10  Changed: 10  Warnings: 0

MariaDB [CSD2204S18]> DESC c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerID | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | NO   |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c3;
+------------+-----------------+------------+------------+------+---------+
| customerID | name            | city       | postalCode | age  | country |
+------------+-----------------+------------+------------+------+---------+
| c01        | Ashley          | WDC        | 321200     |   34 | USA     |
| c03        | Cherlies Theron | New York   | 120134     |   20 | USA     |
| C04        | Denial Jack     | Brazil     | 341020     |   25 | USA     |
| C05        | Donna newman    | Toronto    | 130120     |   50 | USA     |
| C06        | Eston M         | Toronto    | 201023     |   65 | USA     |
| C07        | Bobby Chacko    | New York   | 320300     |   70 | USA     |
| C08        | Ashko Charles   | USA        | 421044     |   72 | USA     |
| C09        | Tony Special    | GTA        | 418921     |   62 | USA     |
| C10        | Jack Sp         | New Jersey | 102301     |   35 | USA     |
| co2        | Bob maeley      | Toronto    | 100100     |   23 | USA     |
+------------+-----------------+------------+------------+------+---------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> UPDATE c3 SET country ='canada' WHERE city IN ('Toronto','GTA');
Query OK, 4 rows affected (0.10 sec)
Rows matched: 4  Changed: 4  Warnings: 0

MariaDB [CSD2204S18]> DESC c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerID | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | NO   |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c3;
+------------+-----------------+------------+------------+------+---------+
| customerID | name            | city       | postalCode | age  | country |
+------------+-----------------+------------+------------+------+---------+
| c01        | Ashley          | WDC        | 321200     |   34 | USA     |
| c03        | Cherlies Theron | New York   | 120134     |   20 | USA     |
| C04        | Denial Jack     | Brazil     | 341020     |   25 | USA     |
| C05        | Donna newman    | Toronto    | 130120     |   50 | canada  |
| C06        | Eston M         | Toronto    | 201023     |   65 | canada  |
| C07        | Bobby Chacko    | New York   | 320300     |   70 | USA     |
| C08        | Ashko Charles   | USA        | 421044     |   72 | USA     |
| C09        | Tony Special    | GTA        | 418921     |   62 | canada  |
| C10        | Jack Sp         | New Jersey | 102301     |   35 | USA     |
| co2        | Bob maeley      | Toronto    | 100100     |   23 | canada  |
+------------+-----------------+------------+------------+------+---------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> UPDATE c3 SET country = 'SOUTH AMERICA' WHERE city IN (Brazil);
ERROR 1054 (42S22): Unknown column 'Brazil' in 'where clause'
MariaDB [CSD2204S18]> UPDATE c3 SET country = 'BRAZIL' WHERE city IN (Soth America);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'America)' at line 1
MariaDB [CSD2204S18]> UPDATE c3 SET country = 'BRAZIL' WHERE city ='Soth America';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

MariaDB [CSD2204S18]> desc c3;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| customerID | varchar(5)  | NO   | PRI | NULL    |       |
| name       | varchar(50) | NO   |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
| country    | varchar(40) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c3;
+------------+-----------------+------------+------------+------+---------+
| customerID | name            | city       | postalCode | age  | country |
+------------+-----------------+------------+------------+------+---------+
| c01        | Ashley          | WDC        | 321200     |   34 | USA     |
| c03        | Cherlies Theron | New York   | 120134     |   20 | USA     |
| C04        | Denial Jack     | Brazil     | 341020     |   25 | USA     |
| C05        | Donna newman    | Toronto    | 130120     |   50 | canada  |
| C06        | Eston M         | Toronto    | 201023     |   65 | canada  |
| C07        | Bobby Chacko    | New York   | 320300     |   70 | USA     |
| C08        | Ashko Charles   | USA        | 421044     |   72 | USA     |
| C09        | Tony Special    | GTA        | 418921     |   62 | canada  |
| C10        | Jack Sp         | New Jersey | 102301     |   35 | USA     |
| co2        | Bob maeley      | Toronto    | 100100     |   23 | canada  |
+------------+-----------------+------------+------------+------+---------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> DELETE FROM c2 WHERE name LIKE 'Bob%';
Query OK, 1 row affected (0.07 sec)

MariaDB [CSD2204S18]> SELECT * FROM c2;
+--------------+------------+
| name         | postalCode |
+--------------+------------+
| Donna newman | 130120     |
| Eston M      | 201023     |
+--------------+------------+
2 rows in set (0.00 sec)

MariaDB [CSD2204S18]> DELETE FROM c2;
Query OK, 2 rows affected (0.06 sec)

MariaDB [CSD2204S18]> SELECT * FROM c2;
Empty set (0.00 sec)

MariaDB [CSD2204S18]> Drop table C2;
Query OK, 0 rows affected (0.17 sec)

MariaDB [CSD2204S18]> SHOW tables;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c3                   |
| customer             |
| orders               |
| persons              |
+----------------------+
5 rows in set (0.01 sec)

MariaDB [CSD2204S18]> SELECT * from c1;
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

MariaDB [CSD2204S18]> UPDATE c1 SET custID = 1 WHERE age>=50;
Query OK, 5 rows affected (0.05 sec)
Rows matched: 5  Changed: 5  Warnings: 0

MariaDB [CSD2204S18]> desc c1;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| custid     | varchar(5)  | NO   |     | NULL    |       |
| name       | varchar(50) | YES  |     | NULL    |       |
| nickname   | varchar(10) | YES  |     | NULL    |       |
| city       | varchar(20) | YES  |     | NULL    |       |
| postalCode | varchar(10) | YES  |     | NULL    |       |
| age        | int(3)      | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c1 WHERE custID IS NULL;
Empty set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c1 WHERE custID IS NOT NULL;
+--------+-----------------+----------+------------+------------+------+
| custid | name            | nickname | city       | postalCode | age  |
+--------+-----------------+----------+------------+------------+------+
| c01    | Ashley          | Ash      | WDC        | 321200     |   34 |
| c03    | Cherlies Theron | cher     | New York   | 120134     |   20 |
| C04    | Denial Jack     | DJ       | Brazil     | 341020     |   25 |
| 1      | Donna newman    | New      | Toronto    | 130120     |   50 |
| 1      | Eston M         | M.       | Toronto    | 201023     |   65 |
| 1      | Bobby Chacko    | Chac     | New York   | 320300     |   70 |
| 1      | Ashko Charles   | AK       | USA        | 421044     |   72 |
| 1      | Tony Special    | Specie   | GTA        | 418921     |   62 |
| C10    | Jack Sp         | Sparrow  | New Jersey | 102301     |   35 |
| co2    | Bob maeley      | Bm       | Toronto    | 100100     |   23 |
+--------+-----------------+----------+------------+------------+------+
10 rows in set (0.00 sec)

MariaDB [CSD2204S18]> SELECT * FROM c1 WHERE custID = NULL;
Empty set (0.00 sec)

MariaDB [CSD2204S18]> ALTER TABLE c1 MODIFY COLUMN age FLOAT(10,2);
Query OK, 10 rows affected (0.78 sec)
Records: 10  Duplicates: 0  Warnings: 0

MariaDB [CSD2204S18]> EXIT;
