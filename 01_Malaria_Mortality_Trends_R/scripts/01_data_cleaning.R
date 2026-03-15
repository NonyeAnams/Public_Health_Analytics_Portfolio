# ==========================================
# Malaria Mortality Project
# Script: Data Cleaning
# Author: Chinonye Anams
# ==========================================

library(tidyverse)
library(readxl)

# Load raw data

data <- read_excel("data/raw/wmr2025_annex_4l.xlsx", sheet = "Long_Format")

# Clean dataset
clean_data <- data %>%
  rename(
    region = `WHO region`,
    malaria_deaths = `Number of malaria deaths`
  ) %>%
  select(region, iso, country, year, malaria_deaths) %>%
  filter(!is.na(malaria_deaths))


# Save processed data
write_csv(clean_data, "data/processed/malaria_deaths_clean.csv")

