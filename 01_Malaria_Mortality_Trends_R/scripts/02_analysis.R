# ==========================================
# Malaria Mortality Analysis
# Script: 02_analysis.R
# Purpose: Core epidemiological analysis
# ==========================================

library(tidyverse)

# ------------------------------------------
# Load cleaned dataset
# ------------------------------------------

data <- read_csv("data/processed/malaria_deaths_clean.csv")

data <- data %>% arrange(country, year)

# -----------------------------
# Nigeria Overview
# -----------------------------
nigeria <- data %>% filter(country == "Nigeria")

nigeria_summary <- nigeria %>%
  summarise(
    avg_deaths = mean(malaria_deaths, na.rm = TRUE),
    max_deaths = max(malaria_deaths, na.rm = TRUE),
    min_deaths = min(malaria_deaths, na.rm = TRUE),
    max_deaths_year = year[which.max(malaria_deaths)],
    min_deaths_year = year[which.min(malaria_deaths)]
  )

write_csv(nigeria_summary, "outputs/tables/nigeria_summary.csv")

# ------------------------------------------
# Nigeria Share of Africa Malaria Deaths
# ------------------------------------------
africa <- data %>% filter(region == "AFRO")

africa_totals <- africa %>%
  group_by(year) %>%
  summarise(africa_deaths = sum(malaria_deaths), .groups = "drop")

nigeria_totals <- nigeria %>%
  group_by(year) %>%
  summarise(nigeria_deaths = sum(malaria_deaths), .groups = "drop")

nigeria_share <- left_join(africa_totals, nigeria_totals, by = "year") %>%
  mutate(nigeria_share = nigeria_deaths / africa_deaths * 100)

nigeria_share <- nigeria_share %>% filter(!is.na(nigeria_share))

write_csv(nigeria_share, "outputs/tables/nigeria_share_africa.csv")

# -----------------------------------------
# Africa share of global malaria deaths
# -----------------------------------------

global_totals <- data %>%
  group_by(year) %>%
  summarise(global_deaths = sum(malaria_deaths), .groups = "drop")

africa_totals <- data %>%
  filter(region == "AFRO") %>%
  group_by(year) %>%
  summarise(africa_deaths = sum(malaria_deaths), .groups = "drop")

africa_share_global <- left_join(global_totals, africa_totals, by = "year") %>%
  mutate(africa_share = africa_deaths / global_deaths * 100)

write_csv(africa_share_global, "outputs/tables/africa_share_global.csv")

# ------------------------------------------
# Percent Change in Nigeria Mortality
# ------------------------------------------
nigeria_change <- nigeria %>%
  summarise(
    first_year = min(year),
    last_year = max(year),
    first_deaths = malaria_deaths[year == first_year],
    last_deaths = malaria_deaths[year == last_year],
    percent_change = (last_deaths - first_deaths) / first_deaths * 100
  )

write_csv(nigeria_change, "outputs/tables/nigeria_percent_change.csv")


# ------------------------------------------
# High-Burden Countries (Latest Year)
# ------------------------------------------
latest_year <- max(data$year)

latest_burden <- data %>%
  filter(year == latest_year) %>%
  arrange(desc(malaria_deaths)) %>%
  slice_head(n = 10)

write_csv(latest_burden, "outputs/tables/top10_latest_burden.csv")


# ------------------------------------------
# Regional Burden Trends
# ------------------------------------------
regional_trends <- data %>%
  group_by(region, year) %>%
  summarise(total_deaths = sum(malaria_deaths), .groups = "drop")


regional_totals <- regional_trends %>%
  group_by(region) %>%
  summarise(total = sum(total_deaths)) %>%
  arrange(desc(total))

write_csv(regional_totals, "outputs/tables/regional_totals.csv")

# ------------------------------------------
# Country Trend Classification
# ------------------------------------------
trend_classification <- data %>%
  group_by(country) %>%
  summarise(
    start = malaria_deaths[year == min(year)],
    end = malaria_deaths[year == max(year)],
    change = end - start,
    .groups = "drop"
  ) %>%
  mutate(
    trend = case_when(
      change > 0 ~ "Increasing",
      change < 0 ~ "Decreasing",
      TRUE ~ "Stable"
    )
  )

write_csv(trend_classification, "outputs/tables/country_trends.csv")


# ------------------------------------------
# End of Script
# ------------------------------------------