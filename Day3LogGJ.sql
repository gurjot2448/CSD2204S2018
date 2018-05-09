MariaDB [CSD2204S18]> CREATE TABLE Customer ( custid VARCHAR(5) PRIMARY KEY,
    -> name VARCHAR(50),
    -> nickname VARCHAR(10),
    -> city VARCHAR(20),
    -> postalCode VARCHAR(10),
    -> age INTEGER(3));
ERROR 1050 (42S01): Table 'customer' already exists
MariaDB [CSD2204S18]> SHOW TABLES;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| customer             |
+----------------------+
1 row in set (0.00 sec)

MariaDB [CSD2204S18]> EXIT;
