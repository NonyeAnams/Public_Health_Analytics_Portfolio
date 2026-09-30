# Measles Vaccination Coverage & Incidence Analysis — Sub-Saharan Africa (2000–2024)

Analysis of measles vaccination coverage and reported disease incidence across Sub-Saharan Africa, combining WHO immunisation data with population data to examine long-term trends and vaccination gaps.

**Tools:** Excel, Power Query, PivotTables, WHO data, World Bank data

## Key work

* Integrated WHO vaccination coverage and reported measles case data with World Bank population data.
* Used Power Query to clean, reshape, standardise, and merge multiple datasets.
* Filtered the combined dataset to countries in Sub-Saharan Africa.
* Calculated measles incidence per 100,000 population.
* Analysed changes in vaccination coverage and incidence from 2000–2024.
* Identified countries below the 95% vaccination coverage level used as a benchmark for population-level measles protection.
* Built an Excel dashboard for regional trends, disease burden, and vaccination gaps.

## Key findings

* Average measles vaccination coverage across Sub-Saharan Africa reached approximately 76% in 2024.
* Average coverage increased by approximately 15 percentage points between 2000 and 2024.
* Measles incidence declined overall across the study period, although substantial variation and periodic outbreaks remained.
* 42 countries were below the 95% coverage benchmark in 2024.
* Disease burden remained concentrated in a smaller number of higher-incidence countries.

## Dashboard

The Excel dashboard includes:

* Measles incidence trends
* Vaccination coverage trends
* Coverage versus incidence analysis
* Countries with the highest incidence
* Countries with the lowest vaccination coverage
* Key regional indicators

![Dashboard Preview](https://github.com/NonyeAnams/Public_Health_Analytics_Portfolio/blob/main/05_Excel_Immunization_Coverage/figures/dashboard_screenshoot.png)

## Data sources

* **WHO WUENIC** — immunisation coverage estimates and reported measles cases
* **World Bank Open Data** — population data used for incidence calculations
* **UN / World Bank classification** — country and regional classification

**Study period:** 2000–2024

## Project structure

```text
05_Excel_Immunization_Coverage/
│
├─ data/
│   ├─ Measles_Coverage_Incidence_WHO.xlsx
│   ├─ UN_Country_Region_Classification.xlsx
│   └─ WorldBank_TotalPopulation_ByCountry_1960_2024.xls
│
├─ analysis/
│   └─ Measles_Coverage_Analysis.xlsx
│
├─ figures/
│   ├─ dashboard_screenshot.png
│   ├─ power_query_pipeline_screenshot.png
│   ├─ pivot_coverage_vs_incidence.png
│   └─ pivot_top_incidence_least_coverage.png
│
└─ README.md 
```

The Power Query workflow covers data cleaning, reshaping, merging, filtering, and calculation of analytical indicators before dashboard development.
