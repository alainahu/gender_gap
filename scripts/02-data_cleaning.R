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
library(readxl)

#### Clean data ####
attitude_data <- read_csv("data/raw_data/raw_data.csv")

gendergap_data <- read_excel("data/raw_data/global-gender-gap-index-2023.xlsx")

gdp_data <- read_csv("data/raw_data/gdp_data.csv")





attitude_data <-
  attitude_data |>
  select(Region, LOCATION, Country, Variables, Value) |>
  filter(Region == "All regions") |> 
  filter(Variables %in%  c("Attitudes on women's income", "Attitudes justifying intimate-partner violence", "Attitudes on women's ability to be a political leader")) |>
  mutate(Value = as.numeric(Value)) |>
  select(-Region, -Variables) |>
  rename(attitude = Value) 

attitude_data <- attitude_data |>
  group_by(Country) |>
  mutate(attitude_id = row_number()) |>
  ungroup()

attitude_data <- attitude_data |>
  pivot_wider(
    names_from = attitude_id,
    values_from = attitude,
    names_prefix = "attitude_"
    )


attitude_data <- attitude_data |>
  drop_na(wide_data) |>
  rename(
    `Income Attitude` = attitude_1,
    `Violence Attitude` = attitude_2,
    `Political Attitude` = attitude_3
  )


column_names <- names(gendergap_data)
column_names[1] <- "Country"
column_names[2] <- "Gender Gap"
names(gendergap_data) <- column_names


column_names_1 <- names(gdp_data)
column_names_1 <- c("Series", "Series Code", "Country", "Code", "GDP")
names(gdp_data) <- column_names_1

gdp_data <-
  gdp_data |>
  select(Country, Code, GDP)


merged_data <- left_join(attitude_data, gdp_data, by = "Country")  
merged_data <- left_join(merged_data, gendergap_data, by = "Country")
merged_data <- merged_data |>
  select(-LOCATION, -Code)





#### Save data ####
write_csv(cleaned_data, "data/analysis_data.csv")
