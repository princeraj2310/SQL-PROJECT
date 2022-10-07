CREATE SCHEMA ca_population;

USE ca_population;
drop table pop_proj;
CREATE TABLE pop_proj(
	county_code VARCHAR(45) NOT NULL,
    county_name VARCHAR(45) NOT NULL,
    date_year INT NOT NULL,
    race_code INT NOT NULL,
    race TEXT NOT NULL,
    gender VARCHAR(6) NOT NULL,
    age INT NOT NULL,
    population INT NOT NULL
);

SHOW GLOBAL VARIABLES LIKE 'local_infile';
set global local_infile = 1;

SET SESSION sql_mode = ''
SET SQL_SAFE_UPDATES = 0;
/* Load Data */
/* ignore first header line, delimiter setting, etc*/
load data infile 
'E:/SQL-Data-Analysis-and-Visualization-Projects-master/Database Clinics - MySQL/CA_DRU_proj_2010-2060.csv'
into table pop_proj
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

/* check the loaded data */
SELECT * FROM pop_proj
LIMIT 10;
select count(*) from pop_proj;
/* SIDE NOTE */
/*
If there is any issues with loading local data is disabled, we need to enable it.

Ref: https://stackoverflow.com/questions/59993844/error-loading-local-data-is-disabled-this-must-be-enabled-on-both-the-client

Ref: if you can't access mysql from cmd, add mysql path in path first https://www.qualitestgroup.com/resources/knowledge-center/how-to-guide/add-mysql-path-windows/

1) log into to mysql from command line >> mysql -u <username> -p
2) check local_infile varialbe current status >> show global variables like 'local_infile';
3) if that is OFF,enable it >> SET GLOBAL local_infile=1;
4) quit the server >> quit
5) connect to server again >> mysql --local_infile=1 -u root -p
6) run the load sql statement.
*/