create database if not exists database_Science_and_Tech_CI;
use database_Science_and_Tech_CI; 
create table Indicator_1 (
country_ID varchar(20),
YR2014 float,
YR2015 float,
YR2016 float,
YR2017 float,
YR2018 float);
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads\indicator_1.csv'
into table Indicator_1
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;


