#### Preamble ####
# Purpose: Simulates the data for the Gender Gap Analysis Dataset 
# Author: Alaina Hu
# Date: 18 April 2024
# Contact: alaina.hu@utoronto.ca 
# License: MIT
# Pre-requisites: Have access to the 2023 Global Gender Gap Report, OECD Database, and World Bank Data
# Any other information needed?


#### Workspace setup ####

library(tidyverse)
library(countrycode)


#### Simulate data ####
#Generating random country names
country_names <- countrycode::codelist$country.name.en

#Setting seed to get the same simulated results
set.seed(504)

#Simulating dataframe to match the dataset I'm looking for
simulated_analysis_data <- tibble(country = sample(country_names, 100),
                                  income_attitude = round(rnorm(100, mean = 50, sd = 5), 2),
                                  violence_attitude = round(rnorm(100, mean = 50, sd = 5), 2),
                                  political_attitude = round(rnorm(100, mean = 50, sd = 5), 2),
                                  gdp = round(rnorm(100, mean = 12000, sd = 2000), 2),
                                  gender_gap = round(rnorm(100, mean = 0.5, sd = 0.05), 2))

