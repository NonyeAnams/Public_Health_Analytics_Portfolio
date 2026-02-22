# ==========================================
# Malaria Mortality Visualizations
# Script: 03_visualizations.R
# Purpose: Generate charts for reporting
# ==========================================

library(here)
library(tidyverse)

theme_set(theme_minimal(base_size = 12))

# Load datasets
data <- read_csv(here("data/processed/malaria_deaths_clean.csv"))
nigeria_share <- read_csv(here("outputs/tables/nigeria_share_africa.csv"))
regional_trends <- read_csv(here("outputs/tables/regional_trends.csv"))
trend_classification <- read_csv(here("outputs/tables/country_trends.csv"))


# ------------------------------------------
# 1. Nigeria Mortality Trend
# ------------------------------------------
nigeria <- data %>% filter(country == "Nigeria")

p1 <- ggplot(nigeria, aes(year, malaria_deaths)) +
  geom_line(color = "darkgreen", linewidth = 1.3) +
  geom_point(color = "darkgreen") +
  labs(
    title = "Malaria Deaths Trend in Nigeria (2001–2024)",
    x = "Year",
    y = "Number of Deaths"
  )

ggsave(here("outputs/charts/nigeria_trend.png"), p1, width = 8, height = 5)

# ------------------------------------------
# 2. Nigeria Share of Africa Burden
# ------------------------------------------
p2 <- ggplot(nigeria_share, aes(year, nigeria_share)) +
  geom_line(color = "darkred", linewidth = 1.2) +
  geom_point(color = "darkred") +
  labs(
    title = "Nigeria's Share of Malaria Deaths in Africa",
    subtitle = "WHO World Malaria Report 2025",
    y = "Share of Africa deaths (%)",
    x = "Year"
  )

ggsave(here("outputs/charts/nigeria_share_africa.png"), p2, width = 8, height = 5)


# ------------------------------------------
# 3. Top 10 High-Burden Countries
# ------------------------------------------
top_countries <- data %>%
  filter(!str_detect(country, "\\(")) %>% 
  group_by(country) %>%
  summarise(total_deaths = sum(malaria_deaths)) %>%
  arrange(desc(total_deaths)) %>%
  slice(1:10)

p3 <- ggplot(top_countries, aes(x = reorder(country, total_deaths), y = total_deaths)) +
  geom_col(fill = "firebrick") +
  coord_flip() +
  labs(
    title = "Top 10 Countries by Malaria Deaths (2001–2024)",
    x = "",
    y = "Total Deaths"
  )
ggsave(here("outputs/charts/top10_countries.png"), p3, width = 8, height = 5)

# ------------------------------------------
# 4. Regional Trends
# ------------------------------------------
p4 <- ggplot(regional_trends, aes(year, total_deaths, color = region)) +
  geom_line(linewidth = 1.2) +
  labs(title = "Malaria Death Trends by WHO Region")

ggsave(here("outputs/charts/regional_trends.png"), p4, width = 8, height = 5)

# ------------------------------------------
# 5. Trend Classification Chart
# ------------------------------------------
trend_summary <- trend_classification %>%
  count(trend)

p5 <- ggplot(trend_summary, aes(trend, n, fill = trend)) +
  geom_col(show.legend = FALSE) +
  labs(
    title = "Country Trend Classification",
    x = "Trend Category",
    y = "Number of Countries"
  )

ggsave(here("outputs/charts/trend_classification.png"), p5, width = 7, height = 5)

# ------------------------------------------
# End of Script
# ------------------------------------------