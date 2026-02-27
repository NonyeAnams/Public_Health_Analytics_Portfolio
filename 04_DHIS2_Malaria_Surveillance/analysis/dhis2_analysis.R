# ============================================================
# DHIS2-Style Malaria Surveillance Analysis
# Author: Chinonye Anams
# Description: Exploratory analysis of simulated DHIS2-style
# malaria surveillance data from Nigeria.
# ============================================================

# -----------------------------
# 1. Setup
# -----------------------------

# Load libraries
library(tidyverse)

# -----------------------------
# 2. Load Data
# -----------------------------

data <- read_csv("data/simulated_dhis2_malaria.csv")

# Inspect structure
glimpse(data)

# -----------------------------
# 3. Data Preparation
# -----------------------------

# Convert month to ordered factor 
month_order <- c("Jan", "Feb", "Mar")
data <- data %>%
  mutate(month = factor(month, levels = month_order))

# Create reporting rate metric
data <- data %>%
  mutate(reporting_rate = reports_received / reports_expected)


# -----------------------------
# 4. Monthly Malaria Trends
# -----------------------------

monthly_trend <- data %>%
  group_by(month) %>%
  summarise(total_cases = sum(malaria_cases), .groups = "drop")

print(monthly_trend)

# Plot monthly trend
p1 <- ggplot(monthly_trend, aes(x = month, y = total_cases, group = 1)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  labs(
    title = "Monthly Malaria Cases (Simulated DHIS2 Data)",
    x = "Month",
    y = "Total Malaria Cases"
  ) +
  theme_minimal()

ggsave("outputs/charts/monthly_trend.png", p1, width = 7, height = 5)

# -----------------------------
# 5. State-Level Malaria Burden
# -----------------------------

state_cases <- data %>%
  group_by(state) %>%
  summarise(total_cases = sum(malaria_cases), .groups = "drop") %>%
  arrange(desc(total_cases))

print(state_cases)

# Plot state burden
p2 <- ggplot(state_cases, aes(x = reorder(state, total_cases), y = total_cases)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Total Malaria Cases by State",
    x = "State",
    y = "Total Cases"
  ) +
  theme_minimal()

ggsave("outputs/charts/state_burden.png", p2, width = 7, height = 5)

# -----------------------------
# 6. Reporting Completeness Analysis
# -----------------------------

state_reporting <- data %>%
  group_by(state) %>%
  summarise(
    avg_reporting = mean(reporting_rate),
    missing_reports = sum(reports_received == 0),
    total_facility_months = n(),
    .groups = "drop"
  ) %>%
  arrange(avg_reporting)

print(state_reporting)

# Plot reporting completeness
p3 <- ggplot(state_reporting, aes(x = reorder(state, avg_reporting), y = avg_reporting)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Average Reporting Completeness by State",
    x = "State",
    y = "Reporting Completeness"
  ) +
  theme_minimal()

ggsave("outputs/charts/reporting_completeness.png", p3, width = 7, height = 5)

# -----------------------------
# 7. Facility-Level Data Quality Insights
# -----------------------------

# Identify facilities with missing reports
missing_facilities <- data %>%
  filter(reports_received == 0) %>%
  select(state, facility, month)

print(missing_facilities)

# Count missing reports by state
missing_by_state <- data %>%
  filter(reports_received == 0) %>%
  count(state, name = "missing_reports") %>%
  arrange(desc(missing_reports))

print(missing_by_state)

# -----------------------------
# 8. Potential Underreporting Insight
# -----------------------------

# Compare case burden vs reporting completeness
burden_vs_reporting <- state_cases %>%
  left_join(state_reporting, by = "state")

print(burden_vs_reporting)

# States with high burden but low reporting
high_burden_low_reporting <- burden_vs_reporting %>%
  arrange(desc(total_cases), avg_reporting)

print(high_burden_low_reporting)

# -----------------------------
# 9. Save Summary Tables
# -----------------------------

write_csv(monthly_trend, "outputs/monthly_trend_summary.csv")
write_csv(state_cases, "outputs/state_burden_summary.csv")
write_csv(state_reporting, "outputs/reporting_summary.csv")

