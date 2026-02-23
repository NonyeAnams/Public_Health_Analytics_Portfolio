---
# Malaria Mortality Trends and Geographic Distribution in Africa (2001–2024) (WHO Data, R)
---

## Overview

This project analyzes global malaria mortality trends using data from the WHO World Malaria Report 2025.
The analysis focuses on:

- Nigeria’s malaria burden
- Africa-wide mortality patterns
- High-burden country comparisons
- Regional trends and spatial mapping

Built entirely in R, this project demonstrates end-to-end data analytics skills for public health.

---

## Objectives

- Clean and standardize WHO malaria datasets
- Analyze malaria mortality trends (2001–2024)
- Quantify Nigeria’s contribution to global malaria deaths
- Identify high-burden countries
- Visualize malaria burden using maps and charts

---

## Dataset
Source: WHO World Malaria Report 2025
File: Annex 4L – Long format malaria deaths dataset

---

## Variables used:
- Country
- WHO Region
- Year
- Number of malaria deaths

---

## Tools & Skills Demonstrated
- **Data Cleaning**: tidyverse, readxl
- **Exploratory Analysis**: dplyr, summarise
- **Visualization**: ggplot2
- **Geospatial Mapping**: sf, rnaturalearth
- **Reproducible Workflows**: here

---

## Project Structure
```
01_Malaria_Mortality_Trends_R/
│
│
│── 01_Malaria_Mortality_Trends_R.Rproj 
│    
├── data/
│   ├── raw/
│   │     └── wmr2025_annex_4l.xlsx
│   │
│   └── processed/
│          └── cleaned_malaria_deaths.csv
│
├── R/
│   ├── 01_data_cleaning.R
│   ├── 02_analysis.R
│   ├── 03_visualizations.R
│   └── 04_mapping.R
│
├── outputs/
│   ├── charts/
│   └── maps/
│
│── README.md
│
└── .gitignore
```
---

## Key Findings
### Nigeria’s Malaria Burden
- Nigeria remains a major contributor to malaria mortality, although trends suggest gradual improvement.
- Nigeria recorded an average of ~7,552 malaria deaths per year across the study period (2001–2024).
- Mortality declined from 4,317 deaths in 2001 to 3,608 in 2024, representing a 16.4% reduction.
- Despite this decline, Nigeria still accounted for an average of ~6.1% of malaria deaths in Africa, highlighting its continued public health importance.
- Nigeria’s highest proportional burden occurred in 2019, when it contributed ~19.9% of Africa’s malaria deaths, indicating periods of concentrated impact.

**Interpretation:**
While progress is evident, Nigeria remains a priority country for malaria control due to sustained high mortality and regional influence.

###High-Burden Countries
Malaria mortality is heavily concentrated in a small number of countries.

**Top countries in 2024:**
1. Democratic Republic of the Congo
2. United Republic of Tanzania
3. Angola
4. Niger
5. Chad
  ***Nigeria ranked 7th globally in 2024.***

Across the full study period (2001–2024), the highest cumulative burden countries were:
- Democratic Republic of the Congo
- Kenya
- United Republic of Tanzania
- Angola
- Nigeria

**Interpretation:**
This confirms a persistent cluster of high-burden countries driving global malaria mortality.

###Regional Inequality
Malaria deaths are overwhelmingly concentrated in one region.
- The WHO African Region accounted for ~3.07 million deaths, representing ~96% of global malaria mortality.
- The second highest region (South-East Asia) contributed only ~50,270 deaths, a tiny fraction by comparison.

**Interpretation:**
Malaria remains a profoundly unequal disease, with the global burden overwhelmingly concentrated in Africa.

##Long-Term Country Trends

Country-level trends reveal mixed progress.
- Over 60 countries showed increasing mortality trends, suggesting emerging or persistent control challenges.
- Slightly over 20 countries showed declining trends, reflecting successful interventions.
- A similar number of countries showed relatively stable trends.

**Interpretation:**
Despite global progress narratives, malaria trajectories vary widely across countries.

### Spatial Patterns Across Africa
Geographic visualization reveals strong clustering of malaria mortality.

Key patterns from the Africa map:

- High mortality clusters in West Africa, which appears consistently bright on the map.
- Parts of South-East Africa also show intense localized burden.
- Southern Africa shows very low mortality, reflecting successful control or elimination.
- Several regions appear pale or unshaded, indicating minimal or no reported deaths.

**Interpretation:**
Malaria burden is not evenly distributed across Africa, with clear geographic hotspots that could guide targeted interventions.

---

## Example Visualizations
**Nigeria Trend**
- Line plot showing annual malaria deaths in Nigeria

**Top 10 Countries**
- Bar chart ranking countries by total deaths (2015–2024)

**Africa Malaria Map**
- Choropleth map of malaria mortality across Africa

---

## Reproducibility
To reproduce the analysis:
```
install.packages(c(
  "tidyverse", "readxl", "sf",
  "rnaturalearth", "viridis", "here"
))
```

Run scripts in order:
1. Data cleaning
2. Nigeria analysis
3. Visualizations
4. Mapping

---

## Why This Project Matters
Malaria remains a major public health challenge, especially in Africa.
This project demonstrates how data analytics can:
- Inform public health decision-making
- Identify high-risk regions
- Support malaria elimination strategies

---

## Future Improvements
- Interactive dashboards (Tableau / Power BI)
- Malaria incidence + mortality combined analysis
- Predictive modeling of malaria trends
- Integration with population-adjusted rates

---

## Author

**Chinonye Anams**
Biochemistry & Molecular Biology | Public Health & Healthcare Data Analytics
Interested in epidemiological analytics, interpretable AI, and data-driven health innovation.

---

##License
Open for educational and portfolio use.
