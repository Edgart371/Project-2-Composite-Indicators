create database if not exists database_Science_and_Tech_CI_test2;
use database_Science_and_Tech_CI_test2; 
create table Indicator_1 (
country_ID varchar(20),
YR2014 float,
YR2015 float,
YR2016 float,
YR2017 float,
YR2018 float);
select * from indicator_2;
create table Indicator_2 (
country_ID varchar(20),
YR2014 float,
YR2015 float,
YR2016 float,
YR2017 float,
YR2018 float);
select * from indicator_2;
create table Indicator_3 (
country_ID varchar(20),
YR2014 float,
YR2015 float,
YR2016 float,
YR2017 float,
YR2018 float);
select * from indicator_3;
create table Indicator_4 (
country_ID varchar(20),
YR2014 float,
YR2015 float,
YR2016 float,
YR2017 float,
YR2018 float);
select * from indicator_4;
create table Indicator_5 (
country_ID varchar(20),
YR2014 float,
YR2015 float,
YR2016 float,
YR2017 float,
YR2018 float);


create table joined_indicator_3_and_4 as 
select indicator_3.country_ID,
indicator_3.YR2014+indicator_4.YR2014 as YR2014,
indicator_3.YR2015+indicator_4.YR2015 as YR2015,
indicator_3.YR2016+indicator_4.YR2016 as YR2016,
indicator_3.YR2017+indicator_4.YR2017 as YR2017,
indicator_3.YR2018+indicator_4.YR2018 as YR2018
from indicator_3
left join indicator_4
on indicator_3.country_ID=indicator_4.country_ID;



# drop the 3 unnecesary tables after joining indicator 3 and 4
drop table indicator_3;
drop table indicator_4;


##creating normalized data

##look for min max and difference between the two because putting those into code when creating normalized data table does not work
select max(YR2014), min(YR2014), max(YR2014)-min(YR2014) from indicator_1;
## max = 4.17398
## min = 0.78306
## max-min = 3.3909202218055725



create table normalized_data_In1 as 
select indicator_1.country_ID,
(indicator_1.YR2014 - 0.78306)/(3.3909202218055725) as YR2014
from indicator_1;
select * from normalized_data_In1;
#update minimum value to 0 because of rounding errors


update normalized_data_In1
set YR2014 = 0
where country_ID = 'HRV';
select * from normalized_data_In1;

update normalized_data_In1
set YR2014 = 1
where country_ID = 'ISR';
select * from normalized_data_In1;

#normalize indicator 2
select * from indicator_2;
select max(YR2014), min(YR2014), max(YR2014)-min(YR2014) from indicator_2;
# max = 27.4407
# min = 4.88064
# max - min = 22.56006622314453


create table normalized_data_In2 as 
select indicator_2.country_ID,
(indicator_2.YR2014 - 4.88064)/(22.56006622314453) as YR2014
from indicator_2;
select * from normalized_data_In2;

update normalized_data_In2
set YR2014 = 0
where country_ID = 'FRA';
select * from normalized_data_In2;

update normalized_data_In2
set YR2014 = 1
where country_ID = 'PRT';
select * from normalized_data_In2; 

## normalize indicator 3/4

select max(YR2014), min(YR2014), max(YR2014)-min(YR2014) from joined_indicator_3_and_4;

create table normalized_data_In3_4 as 
select joined_indicator_3_and_4.country_ID,
(joined_indicator_3_and_4.YR2014 - 200)/(578602) as YR2014
from joined_indicator_3_and_4;
select * from normalized_data_In3_4;


# normalie indicator 5

select max(YR2014), min(YR2014), max(YR2014)-min(YR2014) from indicator_5;
## max = 433192
## min = 4014.91
## max - min = 429177.3713378906

create table normalized_data_In5 as 
select indicator_5.country_ID,
(indicator_5.YR2014 - 4014.91)/(429177.3713378906) as YR2014
from indicator_5;
select * from normalized_data_In5;

update normalized_data_In5
set YR2014 = 0
where country_ID = 'HRV';
select * from normalized_data_In5;

update normalized_data_In5
set YR2014 = 1
where country_ID = 'USA';
select * from normalized_data_In5; 


## creating indicator tables consisting of all the normalized data of all countries and indicators for one specified year

create table Indicators_table_YR2014 as 
SELECT normalized_data_in1.country_id as Country_id,
 normalized_data_in1.YR2014 as Indicator_1,
 normalized_data_in2.YR2014 as Indicator_2, 
 normalized_data_in3_4.YR2014 as Indicator_3,
 normalized_data_in5.YR2014 as Indicator_4
  FROM normalized_data_in1
  LEFT JOIN normalized_data_in2
  ON normalized_data_in1.country_id = normalized_data_in2.country_id
  LEFT JOIN normalized_data_in3_4
  ON normalized_data_in1.country_id = normalized_data_in3_4.country_id
  LEFT JOIN normalized_data_in5
  ON normalized_data_in1.country_id = normalized_data_in5.country_id;
  select * from indicators_table_yr2014;

# now the last step --> creating the index table with the country column and the index value of that country in the year o the table name

create table Index_table_2014 as
select indicators_table_yr2014.Country_id,
indicators_table_yr2014.Indicator_1 * 2.5 + indicators_table_yr2014.Indicator_2 + indicators_table_yr2014.Indicator_3 * 0.5 + indicators_table_yr2014.Indicator_4 as index_value
from indicators_table_yr2014;
select * from Index_table_2014;





