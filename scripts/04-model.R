#### Preamble ####
# Purpose: Models
# Author: Alaina Hu
# Date: 18 April 2024 
# Contact: alaina.hu@utoronto.ca 
# License: MIT
# Pre-requisites: Have analysis data csv and parquet
# Any other information needed? NA


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)
#### Read data ####
analysis_data <- read_parquet("data/analysis_data/analysis_data.parquet")

analysis_data <- analysis_data |>
  mutate(
    GDP = GDP / 1000,
    `Gender Gap` = `Gender Gap` * 100
  )

### Model data ####
first_model <-
  stan_glm(
    formula = `Gender Gap` ~ `Income Attitude` + `Political Attitude` + `Violence Attitude` + GDP,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )

prior_summary(first_model)
prior_details <- prior_summary(first_model)

coefficients_prior <- data.frame(
  Coefficient = names(prior_details$adjusted$scale),
  AdjustedScale = prior_details$adjusted$scale
)

# Print the coefficients and their adjusted prior scales
print(coefficients_prior)

#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)


