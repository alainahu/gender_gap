#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(haven)

#### Download data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")


#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_data, "data/raw_data/raw_data.csv") 

         
