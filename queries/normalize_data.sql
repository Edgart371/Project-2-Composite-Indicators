##creating normalized data

##look for min max and difference between the two because putting those into code when creating normalized data table does not work
select max(YR2014), min(YR2014), max(YR2014)-min(YR2014) from indicator_1;
## max = 4.17398
## min = 0.78306
## max-min = 3.3909202218055725


# creating the table and applying the normalization function

create table normalized_data_In1 as 
select indicator_1.country_ID,
(indicator_1.YR2014 - 0.78306)/(3.3909202218055725) as YR2014
from indicator_1;
select * from normalized_data_In1;
#update minimum value to 0 because of rounding errors


# because we had to extract and add the values manually, the results can have rounding incorrections, we therefor update the normalized data table by setting the normalized data value of the country with the lowest indicator value equal to zero and the normalized data value of the country with the highest indicator value equal to 1 to have a clean normalized data set

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