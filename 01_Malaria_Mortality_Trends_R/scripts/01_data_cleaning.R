# ==========================================
# Malaria Mortality Project
# Script: Data Cleaning
# Author: Chinonye Anams
# ==========================================

library(here)
library(tidyverse)
library(readxl)
library(stringr)

# Load raw data
raw_path <- here("data/raw/wmr2025_annex_4l.xlsx")

data <- read_excel(raw_path, sheet = "Long_Format")

# Clean dataset
clean_data <- data %>%
  rename(
    region = `WHO region`,
    malaria_deaths = `Number of malaria deaths`
  ) %>%
  select(region, iso, country, year, malaria_deaths) %>%
  filter(!is.na(malaria_deaths))


# Save processed data
write_csv(clean_data, here("data/processed/malaria_deaths_clean.csv"))

