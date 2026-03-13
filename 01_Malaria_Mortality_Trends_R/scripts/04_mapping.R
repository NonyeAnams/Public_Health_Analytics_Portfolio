# ============================================
# Script 04: Africa Malaria Burden Map
# Purpose: Create choropleth map of malaria deaths across Africa
# Author: Chinonye Anams
# ============================================

library(here)
library(tidyverse)
library(sf)
library(rnaturalearth)
library(viridis)

# -----------------------------
# Load cleaned data
# -----------------------------
data <- read_csv(here("data/processed/malaria_deaths_clean.csv"))

# -----------------------------
# Get Africa map shapefile
# -----------------------------
world <- ne_countries(scale = "medium", returnclass = "sf")
africa_map <- world %>% filter(continent == "Africa")

world %>% filter(continent == "Africa")

names(africa_map)

# -----------------------------
# Use most recent year
# -----------------------------
latest_year <- max(data$year)

latest_data <- data %>%
  filter(year == latest_year)

# -----------------------------
# Merge spatial + malaria data
# -----------------------------
map_data <- africa_map %>%
  left_join(latest_data, by = c("iso_a3" = "iso"))
# -----------------------------
# Plot map
# -----------------------------
map_plot <- ggplot(map_data) +
  geom_sf(aes(fill = malaria_deaths), color = "white", size = 0.2) +
  scale_fill_viridis(
    option = "plasma",
    trans = "sqrt",
    na.value = "grey90",
    name = "Malaria Deaths"
  ) +
  labs(
    title = paste("Malaria Deaths Across Africa (", latest_year, ")", sep = ""),
    subtitle = "Source: WHO World Malaria Report 2025",
    caption = "Analysis by Chinonye Anams"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    legend.position = "right"
  )

map_plot

# -----------------------------
# Save output
# -----------------------------
output_path <- here("outputs/maps", "africa_malaria_map.png")
ggsave(output_path, width = 9, height = 6, dpi = 300)
