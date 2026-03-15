# Malaria Mortality Trends and Geographic Distribution in Africa (2001–2024) 
**Global Malaria Mortality Analysis using WHO Data**


## Live Interactive Dashboard
Explore the interactive dashboard:   
https://chinonyeanams.shinyapps.io/malaria-mortality-dashboard/

The dashboard allows users to:
- Explore malaria mortality trends by country
- Compare country progress against 2024 benchmarks
- Identify high-burden countries
- Visualize spatial patterns of malaria mortality across Africa
  
## Project Overview
This project analyzes global malaria mortality trends from 2001–2024 using data from the WHO World Malaria Report 2025.

The analysis investigates:
- Nigeria’s contribution to malaria mortality
- Regional inequalities in malaria burden
- Long-term mortality trends across countries
- High-burden country clusters
- Geographic distribution of malaria deaths across Africa
  
The project demonstrates end-to-end public health data analytics, including:
- Data cleaning
- Exploratory analysis
- Visualization
- Geospatial mapping
- Interactive dashboard development

All analysis and visualization were conducted in R.


## Objectives
- Clean and standardize WHO malaria datasets
- Analyze global malaria mortality trends (2001–2024)
- Quantify Nigeria’s contribution to global malaria deaths
- Identify high-burden countries
- Explore regional inequalities in malaria mortality
- Visualize malaria mortality using charts and maps
- Build an interactive dashboard for data exploration


## Dataset
Source: 
WHO World Malaria Report 2025  

Dataset used:  
Annex 4L – Long format malaria deaths dataset

Variables used:
- Country
- WHO Region
- Year
- Number of malaria deaths
  

## Tools & Skills Demonstrated
Data Analysis
- tidyverse
- readxl

Data Visualization
- ggplot2
- viridis

Geospatial Analysis
- sf
- rnaturalearth

Interactive Dashboard
- shiny
- shinydashboard
- plotly


## Project Structure
```
01_Malaria_Mortality_Trends_R/
│
├── app.R
├── README.md
├── .gitignore
├── 01_Malaria_Mortality_Trends_R.Rproj
│
├── data
│   ├── raw
│   │   └── wmr2025_annex_4l.xlsx
│   │
│   └── processed
│       └── cleaned_malaria_deaths.csv
│
├── R
│   ├── 01_data_cleaning.R
│   ├── 02_analysis.R
│   ├── 03_visualizations.R
│   └── 04_mapping.R
│
└── outputs
    ├── charts
    ├── maps
    └── tables
```


## Key Findings
### Nigeria’s Malaria Burden
Nigeria remains a major contributor to global malaria mortality.

Key observations:
- Average of ~7,552 deaths per year between 2001–2024
- Mortality declined from 4,317 deaths in 2001 to 3,608 in 2024
- This represents a 16.4% reduction over the study period

Despite progress:
- Nigeria still accounted for ~6.1% of malaria deaths in Africa on average
- The highest proportional burden occurred in 2019, when Nigeria contributed ~19.9% of Africa’s malaria deaths

Interpretation:
While progress is evident, Nigeria remains a priority country for malaria control efforts due to its sustained contribution to regional mortality.

### High-Burden Countries
Malaria mortality is concentrated in a small number of countries.

Top countries in 2024
1. Democratic Republic of the Congo
2. United Republic of Tanzania
3. Angola
4. Niger
5. Chad
Nigeria ranked 7th globally in 2024.

Across the full study period (2001–2024), the countries with the highest cumulative malaria mortality were:
- Democratic Republic of the Congo
- Kenya
- United Republic of Tanzania
- Angola
- Nigeria

Interpretation:
Global malaria mortality is driven by a persistent cluster of high-burden countries, indicating where targeted interventions may have the greatest impact.

### Regional Inequality
Malaria mortality is overwhelmingly concentrated in a single region.
- The WHO African Region accounted for ~3.07 million deaths
- This represents ~96% of global malaria mortality
The second highest region:
- South-East Asia: ~50,270 deaths

Interpretation:
Malaria remains one of the most geographically unequal infectious diseases, with the overwhelming burden concentrated in Africa.

### Long-Term Country Trends
Country-level mortality trajectories vary widely.

Trend classification shows:
- Over 60 countries experienced increasing mortality trends
- Over 20 countries showed declining mortality
- A similar number showed relatively stable trends
  
Interpretation:
Global progress in malaria control is not uniform, with some countries experiencing setbacks despite broader international efforts.

### Spatial Patterns Across Africa
Geographic visualization reveals strong clustering of malaria mortality.

Key spatial patterns:
- High mortality clusters in Central and West Africa
- Significant burden in parts of East Africa
- Southern Africa shows relatively low mortality levels
- Several regions show minimal reported mortality

Interpretation:
Malaria burden is highly spatially concentrated, highlighting geographic hotspots that could inform targeted malaria interventions.


## Example Visualizations
![**Nigeria Trend**](https://github.com/NonyeAnams/Public_Health_Analytics_Portfolio/blob/main/01_Malaria_Mortality_Trends_R/outputs/charts/nigeria_trend.png)
- Line plot showing annual malaria deaths in Nigeria

![**Top 10 Countries**](https://github.com/NonyeAnams/Public_Health_Analytics_Portfolio/blob/main/01_Malaria_Mortality_Trends_R/outputs/charts/top10_countries.png)
- Bar chart ranking countries by total deaths (2001–2024)

![**Africa Malaria Map**](https://github.com/NonyeAnams/Public_Health_Analytics_Portfolio/blob/main/01_Malaria_Mortality_Trends_R/outputs/maps/africa_malaria_map.png)
- Choropleth map of malaria mortality across Africa

---

## Reproducibility
To reproduce the analysis:
```
install.packages(c(
"tidyverse",
"readxl",
"sf",
"rnaturalearth",
"viridis",
"here",
"shiny",
"shinydashboard",
"plotly"
))
```

Run scripts in order:
1. Data cleaning
2. Nigeria analysis
3. Visualizations
4. Mapping


## Why This Project Matters
Malaria remains a major public health challenge globally, particularly in Africa.

Data-driven analysis can support:
- Identification of high-risk countries
- Monitoring progress toward malaria control
- Evidence-based allocation of public health resources

This project demonstrates how data analytics and visualization can support epidemiological insight and public health decision-making.


## Future Improvements
- Population-adjusted mortality rates
- Predictive modeling of malaria mortality trends
- Integration with malaria incidence dataset


## Author
**Chinonye Anams**   
Biochemistry & Molecular Biology    
Public Health & Healthcare Data Analytics   

Interested in: 
- Epidemiological data science
- Interpretable machine learning in healthcare
- Data-driven global health innovation

## License
Open for educational and portfolio use.
