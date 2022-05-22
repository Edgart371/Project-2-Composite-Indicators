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

# result presentation of countries indices in a descending order

select * from index_table_2014
order by index_value desc;