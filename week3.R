library(dplyr)
library(nycflights13)
flights
?flights
View(flights)

filter(flights,carrier=="AA",month==12,day==1)
filter(flights,carrier=="UA",month==2,day==6)
filter(flights,carrier=="AA"|carrier=="UA")
filter(flights,carrier=="UA"&dep_delay>0)
filter(flights,carrier=="UA"|carrier=="AA",month==2,day!=6)
filter(flights,carrier=="AA",dep_delay>60,month<7)
filter(flights,dep_delay<0,arr_delay>0)
filter(flights,dep_delay>0|arr_delay>0)

x < -NA

is.na(x)
is.na("abby")

#1 had an arrival delay of two or more hours
filter(flights,arr_delay>=2)

#2 flew to houston (IAH or HOU)
filter(flights,dest=="IAH"|dest=="HOU")

#3 were operated by united,american,or delta
filter(flights,carrier=="UA"|carrier=="AA"|carrier=="DL")


#4 departed in summer (july, august, september)
filter(flights,month==7|month==8|month==9)

#5 arrived more than two hours late, but didn't leave 
filter(flights,arr_delay>120&dep_delay<0)

#6 were delayed by at least an hour, but made up over 30 minutes in flight
filter(flights,dep_delay>=60,arr_delay>=30)

#7 departed between midnight and 6am
filter(flights,dep_time==000&dep_time==600)

arrange(flights,year)
arrange(flights,dep_delay)
arrange(flights,desc(dep_delay))
arrange(flights,month,dep_delay)

df <- tibble(col1=c(1,2,3),col2=c("h","l","o"))
df

rnorm(5)
df <- tibble(col1=c(1,2,3),col2=c("h","l","o"),col3=rnorm(3))

df3 <- tibble(name=c("ben","amy","jim","rat","dog","cat"),age=c(20,NA,35,0.5,NA,10),net_worth=rnorm(6))
df3

arrange(df3,age)
arrange(df3,is.na(age))
arrange(df3,!is.na(age))

#8 sort flights to find the most delayed flights
arrange(flights,desc(dep_delay))

#9 find the flight that left earliest 
arrange(flights,desc(dep_time))

#10 which flights traveled the furthest
arrange(flights,desc(distance))

#11 arrange the flights data set so all the departure times values that are missing are on top of the table
arrange(flights,!is.na(dep_time))

tail(flights)


select(flights,year,month,day)        

select(flights,dep_time,arr_time)

select(flights,sched_arr_time:tailnum)
select(flights,-(sched_arr_time:tailnum))

#MUTATE
mutate(df3,profit=net_worth+1)

my_data<-mutate(flights,speed=distance/air_time)
select(my_data,speed,air_time,distance)

mutate(flights,speed=distance/air_time) %>% select(distance,air_time,speed)

filter(df3,!is.na(age)) %>% mutate(profit=net_worth+1) %>% arrange(name)
