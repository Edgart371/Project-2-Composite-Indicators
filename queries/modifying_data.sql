# we then had to modify our existing table to clean our data
# we found two indicators whose data we wanted combined in one table to have a combined full statement of those indicators about the country

# left joining the two tables, recieiving the country id column and then the two columns of both tables whcih have data about the same year combined in one column

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


# data presentation
select * from indicator_1;
select * from indicator_2;
select * from joined_indicator_3_and_4;
select * from indicator_5;
