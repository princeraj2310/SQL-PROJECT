create database ca_population;
USE ca_population;

CREATE TABLE ca_edu(
	date_year TEXT,
    age TEXT,
    gender VARCHAR(6),
    edu_attainment TEXT,
    income TEXT,
    population INT
);
SHOW GLOBAL VARIABLES LIKE 'local_infile';
set global local_infile = 1;

SET SESSION sql_mode = ''
SET SQL_SAFE_UPDATES = 0;

/* Load data
mysql --local_infile=1 -u root -p 
*/
load data infile 
'E:/SQL-Data-Analysis-and-Visualization-Projects-master/Database Clinics - MySQL/04.California Education/datasets/cleaned_CA_Educational_Attainment___Personal_Income_2008-2014.csv'
into table ca_edu
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;
/* for checking data in table 'select * from table name'; */
select * from ca_edu;

