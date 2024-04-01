#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")
gdp_raw_data <- read_csv("data/raw_data/gdp_raw_data.csv")
edu_raw_data <- read_csv("data/raw_data/edu_raw_data.csv")
wagegap_raw_data <- read_csv("data/raw_data/wagegap_raw_data.csv")

attitude_data <-
  raw_data |>
  select(Region, LOCATION, Country, Variables, Value) |>
  filter(Region == "All regions") |> 
  filter(Variables == "Attitudes on women's income") |>
  mutate(Value = as.numeric(Value)) |>
  select(-Region, -Variables) |>
  rename(attitude = Value) 

gdp_data <-
  gdp_raw_data |>
  select(LOCATION, Country, Year, Value) |>
  filter(Year == "2022") |>
  mutate(Value = as.numeric(Value)) |>
  rename(gdp = Value) |>
  select(-Year)

edu_data <- 
  edu_raw_data |>
  select(LOCATION, TIME, Value) |>
  filter(TIME == "2022") |>
  mutate(Value = as.numeric(Value)) |>
  rename(education = Value) |>
  select(-TIME)
  
wagegap_data <- 
  wagegap_raw_data |> 
  select(LOCATION, SUBJECT, TIME, Value) |>
  filter(TIME == "2020") |>
  filter(SUBJECT == "EMPLOYEE") |>
  mutate(Value = as.numeric(Value)) |>
  rename(wagegap = Value) |>
  select(-TIME, -SUBJECT)

merged_data <- left_join(attitude_data, gdp_data)  
merged_data <- left_join(merged_data, edu_data)
merged_data <- left_join(merged_data, wagegap_data)
merged_data <- na.omit(merged_data)
#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
