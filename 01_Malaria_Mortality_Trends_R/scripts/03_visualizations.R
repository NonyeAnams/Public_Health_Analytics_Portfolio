# ==========================================
# Malaria Mortality Visualizations
# Script: 03_visualizations.R
# Purpose: Generate charts for reporting
# ==========================================

library(tidyverse)

theme_set(theme_minimal(base_size = 12))

# Load datasets
data <- read_csv("data/processed/malaria_deaths_clean.csv")
nigeria_share <- read_csv("outputs/tables/nigeria_share_africa.csv")
regional_totals <- read_csv("outputs/tables/regional_totals.csv")
trend_classification <- read_csv("outputs/tables/country_trends.csv")

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

ggsave("outputs/charts/nigeria_trend.png", p1, width = 8, height = 5)

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

ggsave("outputs/charts/nigeria_share_africa.png", p2, width = 8, height = 5)


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
ggsave("outputs/charts/top10_countries.png", p3, width = 8, height = 5)

# ------------------------------------------
# 4. Regional Total Chart
# ------------------------------------------
regional_totals <- regional_totals %>%
  mutate(
    total_plot = ifelse(total == 0, 1, total),   # allow log scale
    label_position = ifelse(total_plot < 1000, -0.1, 1.05),  # small bars outside
    label_color = ifelse(total_plot < 1000, "black", "white")
  )

p4 <- ggplot(regional_totals,
            aes(x = reorder(region, total_plot),
                y = total_plot,
                fill = region)) +
  
  geom_col() +
  
  geom_text(aes(label = scales::comma(total),
                hjust = label_position,
                color = label_color),
            fontface = "bold",
            size = 4,
            show.legend = FALSE) +
  
  coord_flip() +
  
  scale_y_log10(
    labels = scales::comma,
    limits = c(1, max(regional_totals$total_plot) * 1.1)
  ) +
  
  scale_fill_brewer(palette = "Set2") +
  scale_color_identity() +
  
  labs(
    title = "Total Reported Malaria Deaths by WHO Region (2000-2024)",
    x = "",
    y = "Total Deaths (log scale)"
  ) +
  
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    legend.position = "none",
    panel.grid.major.y = element_blank()
  )

ggsave("outputs/charts/regional_totals_bar.png", p4, width = 10, height = 6, dpi = 300)

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

ggsave("outputs/charts/trend_classification.png", p5, width = 7, height = 5)

# ------------------------------------------
# End of Script
# ------------------------------------------