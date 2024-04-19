#### Preamble ####
# Purpose: Downloads and saves the data from various sources to merge and create the analysis dataset
# Author: Alaina Hu
# Date: 18 April 2024
# Contact: alaina.hu@utoronto.ca 
# License: MIT
# Pre-requisites: Have access to the 2023 Global Gender Gap Report, OECD Database, and World Bank Data
# Any other information needed? Raw datasets downloaded from the sources are available in data/raw_data. Merged and cleaned data for analysis is in data/analysis_data

#### Workspace setup ####
library(tidyverse)
library(haven)

#### Download data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")


#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_data, "data/raw_data/raw_data.csv") 

         
