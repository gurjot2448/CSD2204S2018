MariaDB [(none)]> use csd2204s18;
Database changed
MariaDB [csd2204s18]> creat view v1 as select * from products;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'creat view v1 as select * from products' at line 1
MariaDB [csd2204s18]> create view v1 as select * from products;
Query OK, 0 rows affected (0.16 sec)

MariaDB [csd2204s18]> show tables;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c3                   |
| countries            |
| customer             |
| departments          |
| employees            |
| job_history          |
| jobs                 |
| locations            |
| manu                 |
| movie                |
| orders               |
| p1                   |
| persons              |
| products             |
| regions              |
| v1                   |
+----------------------+
17 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from v1;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
|   11 | Printer         |    40 |            7 |
|   12 | Toner cartridge |    54 |            7 |
|   13 | DVD burner      |    78 |            7 |
+------+-----------------+-------+--------------+
13 rows in set (0.01 sec)

MariaDB [csd2204s18]> select * from product;
ERROR 1146 (42S02): Table 'csd2204s18.product' doesn't exist
MariaDB [csd2204s18]> select * from products;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
|   11 | Printer         |    40 |            7 |
|   12 | Toner cartridge |    54 |            7 |
|   13 | DVD burner      |    78 |            7 |
+------+-----------------+-------+--------------+
13 rows in set (0.00 sec)

MariaDB [(none)]> use csd2204s18;
Database changed
MariaDB [csd2204s18]> create view v1 as select * from poducts;
ERROR 1146 (42S02): Table 'csd2204s18.poducts' doesn't exist
MariaDB [csd2204s18]> create view v1 as select * from products;
ERROR 1050 (42S01): Table 'v1' already exists
MariaDB [csd2204s18]> create view v1 as select * from products where price>100;
ERROR 1050 (42S01): Table 'v1' already exists
MariaDB [csd2204s18]> create  or replace  view v1 as select * from products where price>100;
Query OK, 0 rows affected (0.06 sec)

MariaDB [csd2204s18]> select * from v1;
+------+------------+-------+--------------+
| Code | Name       | Price | Manufacturer |
+------+------------+-------+--------------+
|    1 | Hard drive |   240 |            5 |
|    2 | Memory     |   120 |            6 |
|    3 | ZIP drive  |   150 |            4 |
|    5 | Monitor    |   240 |            1 |
|    6 | DVD drive  |   180 |            2 |
|    8 | Printer    |   270 |            3 |
|   10 | DVD burner |   180 |            2 |
+------+------------+-------+--------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> insert into v1 values(12,'USB port',89,2)
    -> ;
ERROR 1062 (23000): Duplicate entry '12' for key 'PRIMARY'
MariaDB [csd2204s18]> insert into v1 values(13,'USB port',89,2);
ERROR 1062 (23000): Duplicate entry '13' for key 'PRIMARY'
MariaDB [csd2204s18]> insert into v1 values(20,'USB port',89,2);
Query OK, 1 row affected (0.13 sec)

MariaDB [csd2204s18]> select * from v1;
+------+------------+-------+--------------+
| Code | Name       | Price | Manufacturer |
+------+------------+-------+--------------+
|    1 | Hard drive |   240 |            5 |
|    2 | Memory     |   120 |            6 |
|    3 | ZIP drive  |   150 |            4 |
|    5 | Monitor    |   240 |            1 |
|    6 | DVD drive  |   180 |            2 |
|    8 | Printer    |   270 |            3 |
|   10 | DVD burner |   180 |            2 |
+------+------------+-------+--------------+
7 rows in set (0.00 sec)

MariaDB [csd2204s18]> select * from products;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
|   11 | Printer         |    40 |            7 |
|   12 | Toner cartridge |    54 |            7 |
|   13 | DVD burner      |    78 |            7 |
|   20 | USB port        |    89 |            2 |
+------+-----------------+-------+--------------+
14 rows in set (0.00 sec)

MariaDB [csd2204s18]> delete from v1 where code =20;
Query OK, 0 rows affected (0.03 sec)

MariaDB [csd2204s18]> select * from products;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
|   11 | Printer         |    40 |            7 |
|   12 | Toner cartridge |    54 |            7 |
|   13 | DVD burner      |    78 |            7 |
|   20 | USB port        |    89 |            2 |
+------+-----------------+-------+--------------+
14 rows in set (0.00 sec)

MariaDB [csd2204s18]> select name,price from products where name like '%drive%';
+------------+-------+
| name       | price |
+------------+-------+
| Hard drive |   240 |
| ZIP drive  |   150 |
| DVD drive  |   180 |
| CD drive   |    90 |
+------------+-------+
4 rows in set (0.00 sec)

MariaDB [csd2204s18]> create  or replace  view v2 as select name,price from products where name like '%drive%';
Query OK, 0 rows affected (0.05 sec)

MariaDB [csd2204s18]> select * from v2;
+------------+-------+
| name       | price |
+------------+-------+
| Hard drive |   240 |
| ZIP drive  |   150 |
| DVD drive  |   180 |
| CD drive   |    90 |
+------------+-------+
4 rows in set (0.00 sec)

MariaDB [csd2204s18]> select products.code,products.name,manu.name from manu inner join products on products.manufacturer = manu.code;
+------+-----------------+-------------------+
| code | name            | name              |
+------+-----------------+-------------------+
|    1 | Hard drive      | Fujitsu           |
|    2 | Memory          | Winchester        |
|    3 | ZIP drive       | Iomega            |
|    4 | Floppy disk     | Winchester        |
|    5 | Monitor         | Sony              |
|    6 | DVD drive       | Creative Labs     |
|    7 | CD drive        | Creative Labs     |
|    8 | Printer         | Hewlett-Packard   |
|    9 | Toner cartridge | Hewlett-Packard   |
|   10 | DVD burner      | Creative Labs     |
|   11 | Printer         | moxDroid Labs Inc |
|   12 | Toner cartridge | moxDroid Labs Inc |
|   13 | DVD burner      | moxDroid Labs Inc |
|   20 | USB port        | Creative Labs     |
+------+-----------------+-------------------+
14 rows in set (0.03 sec)

MariaDB [csd2204s18]> select products.code,products.name "products",manu.name "manufacturer" from manu inner join products on products.manufacturer = manu.code;
+------+-----------------+-------------------+
| code | products        | manufacturer      |
+------+-----------------+-------------------+
|    1 | Hard drive      | Fujitsu           |
|    2 | Memory          | Winchester        |
|    3 | ZIP drive       | Iomega            |
|    4 | Floppy disk     | Winchester        |
|    5 | Monitor         | Sony              |
|    6 | DVD drive       | Creative Labs     |
|    7 | CD drive        | Creative Labs     |
|    8 | Printer         | Hewlett-Packard   |
|    9 | Toner cartridge | Hewlett-Packard   |
|   10 | DVD burner      | Creative Labs     |
|   11 | Printer         | moxDroid Labs Inc |
|   12 | Toner cartridge | moxDroid Labs Inc |
|   13 | DVD burner      | moxDroid Labs Inc |
|   20 | USB port        | Creative Labs     |
+------+-----------------+-------------------+
14 rows in set (0.00 sec)

MariaDB [csd2204s18]> create or replace v3 view as select products.code,products.name "products",manu.name "manufacturer" from manu inner join products on products.manufacturer = manu.code;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'v3 view as select products.code,products.name "products",manu.name "manufacturer' at line 1
MariaDB [csd2204s18]> create or replace v3 as view select products.code,products.name "products",manu.name "manufacturer" from manu inner join products on products.manufacturer = manu.code;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'v3 as view select products.code,products.name "products",manu.name "manufacturer' at line 1
MariaDB [csd2204s18]> create or replace view v3 as select products.code,products.name "products",manu.name "manufacturer" from manu inner join products on products.manufacturer = manu.code;
Query OK, 0 rows affected (0.08 sec)

MariaDB [csd2204s18]> select * from v3;
+------+-----------------+-------------------+
| code | products        | manufacturer      |
+------+-----------------+-------------------+
|    1 | Hard drive      | Fujitsu           |
|    2 | Memory          | Winchester        |
|    3 | ZIP drive       | Iomega            |
|    4 | Floppy disk     | Winchester        |
|    5 | Monitor         | Sony              |
|    6 | DVD drive       | Creative Labs     |
|    7 | CD drive        | Creative Labs     |
|    8 | Printer         | Hewlett-Packard   |
|    9 | Toner cartridge | Hewlett-Packard   |
|   10 | DVD burner      | Creative Labs     |
|   11 | Printer         | moxDroid Labs Inc |
|   12 | Toner cartridge | moxDroid Labs Inc |
|   13 | DVD burner      | moxDroid Labs Inc |
|   20 | USB port        | Creative Labs     |
+------+-----------------+-------------------+
14 rows in set (0.00 sec)

MariaDB [csd2204s18]> select first_name,last_name,salary from employees where salary>all(select avg(salary) rom employees group by department_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'employees group by department_id)' at line 1
MariaDB [csd2204s18]> select first_name,last_name,salary from employees where salary>all(select avg(salary) from employees group by department_id);
+------------+-----------+----------+
| first_name | last_name | salary   |
+------------+-----------+----------+
| Steven     | King      | 24000.00 |
+------------+-----------+----------+
1 row in set (0.06 sec)

MariaDB [csd2204s18]> crate or replace view v4 as select first_name,last_name,salary from employees where salary>all(select avg(salary) from employees group by department_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'crate or replace view v4 as select first_name,last_name,salary from employees wh' at line 1
MariaDB [csd2204s18]> create or replace view v4 as select first_name,last_name,salary from employees where salary>all(select avg(salary) from employees group by department_id);
Query OK, 0 rows affected (0.05 sec)

MariaDB [csd2204s18]> select * from v4;
+------------+-----------+----------+
| first_name | last_name | salary   |
+------------+-----------+----------+
| Steven     | King      | 24000.00 |
+------------+-----------+----------+
1 row in set (0.00 sec)

MariaDB [csd2204s18]> drop view v5;
ERROR 1051 (42S02): Unknown table 'csd2204s18.v5'
MariaDB [csd2204s18]> drop view  if exists v5;
Query OK, 0 rows affected, 1 warning (0.00 sec)

MariaDB [csd2204s18]> drop view  if exists v1;
Query OK, 0 rows affected (0.00 sec)

MariaDB [csd2204s18]> show tables;
+----------------------+
| Tables_in_csd2204s18 |
+----------------------+
| c1                   |
| c3                   |
| countries            |
| customer             |
| departments          |
| employees            |
| job_history          |
| jobs                 |
| locations            |
| manu                 |
| movie                |
| orders               |
| p1                   |
| persons              |
| products             |
| regions              |
| v2                   |
| v3                   |
| v4                   |
+----------------------+
19 rows in set (0.00 sec)

MariaDB [csd2204s18]> exit;
