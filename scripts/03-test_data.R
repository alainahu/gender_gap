#### Preamble ####
# Purpose: Tests the real dataset
# Author: Alaina Hu
# Date: 18 April 2024
# Contact: alaina.hu@utoronto.ca 
# License: MIT
# Pre-requisites: Have access to the analysis dataset
# Any other information needed? NA


#### Workspace setup ####
library(tidyverse)
library(countrycode)

#### Test data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")
country_names <- countrycode::codelist$country.name.en

analysis_data$Country |>
  unique() %in% country_names

analysis_data$`Income Attitude` |>
  min() >= 0

analysis_data$`Income Attitude` |>
  max() <= 100

analysis_data$`Violence Attitude` |>
  min() >= 0

analysis_data$`Violence Attitude` |>
  max <= 100

analysis_data$`Political Attitude` |>
  min() >= 0

analysis_data$`Political Attitude` |>
  max <= 100

analysis_data$GDP |>
  min() >= 0

analysis_data$GDP |>
  max() <= 200000

analysis_data$`Gender Gap` |>
  min() >= 0

analysis_data$`Gender Gap` |>
  max() <= 1




