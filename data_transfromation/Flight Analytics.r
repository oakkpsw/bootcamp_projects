# -*- coding: utf-8 -*-

# -- Sheet --

# Flight Analytics


library(dplyr)
library(tidyverse)

flights <- read.csv("flights.csv")
airlines <- read.csv("airlines.csv")
weathers <- read.csv("weather.csv")
planes <- read.csv("planes.csv")
airports <- read.csv("airports.csv")

flights %>% 
    head(10)

# check null value
check_na <- function(col) {
  sum(is.na(col))
}
apply(flights, MARGIN=2,check_na)

flights %>%
    filter(is.na(arr_time))

clean_flight <- drop_na(flights)

clean_flight

apply(clean_flight, MARGIN=2,check_na)

glimpse(clean_flight)

glimpse(airlines)

glimpse(planes)

# Q1 : Which carrier has most flights in feb 2013 ?


clean_flight %>% 
    filter( month == 2 , year == 2013)  %>%
    group_by (carrier) %>%
    summarise (number_of_flight = n()) %>%
    arrange(desc(number_of_flight)) %>%
    left_join (airlines , by = "carrier") %>%
    head(10)

# United Airline is the most flights in 2013


Q2 : Which Airports has the most fight destination in mar 2013 ?

clean_flight %>%
    filter( month == 3 , year == 2013) %>%
    group_by (dest) %>%
    summarise (number_of_flight = n()) %>%
    arrange(desc(number_of_flight)) %>%
    left_join (airports, by=c("dest" = "faa")) %>%
    select (name , number_of_flight) %>%
    head(10)

# ANS: Hatsafield Jackson Atlanta Intl


Q3: Top 5 Flights Carrier has the most Departure Delay in 2013 ?

clean_flight %>% 
    group_by(carrier) %>%
    filter (dep_delay > 0) %>%
    select (carrier , dep_delay) %>%
    summarise(total_delay_minutes = sum(dep_delay)) %>%
    arrange (desc(total_delay_minutes)) %>%
    left_join (airlines) %>%
    head(5)
    

# Q4: Which the longest flights in oct 2013 ?


clean_flight %>%
    filter ( month == 3 , year == 2013) %>%
    left_join (airports, by=c("origin" = "faa")) %>%
    left_join (airports , by=c("dest" = "faa")) %>%
    select ( flight , air_time ,tailnum ,origin_airport = name.x , dest_airport = name.y) %>%
    arrange (desc(air_time)) %>%
    head (1)

# the longest flight is form Newark Liberty Intl to Honolulu Intl


# Q5: Which flights are most flying on the same route?


clean_flight %>%
    filter ( year == 2013 ) %>%
    group_by (tailnum , origin , dest)  %>%
    summarise (number_of_flight = n() , .groups = 'drop' ) %>%
    arrange (desc(number_of_flight)) %>%
    head(1)
    
    

