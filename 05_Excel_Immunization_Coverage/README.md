#Measles Vaccination Coverage & Incidence Analysis Sub-Saharan Africa (2000–2024)
---


![Dashboard Preview](https://github.com/NonyeAnams/Public_Health_Analytics_Portfolio/blob/main/05_Excel_Immunization_Coverage/figures/dashboard_screenshoot.png)

## Project Overview

Measles remains one of the leading causes of vaccine-preventable deaths globally, particularly in low- and middle-income countries. Sustained immunization coverage of ≥95% is required to achieve herd immunity and prevent outbreaks.

This project analyzes the relationship between measles vaccination coverage and disease burden across Sub-Saharan Africa (SSA) from 2000–2024.

The analysis explores:

- Measles vaccination coverage (WUENIC estimates)

- Reported measles cases

- Measles incidence per 100,000 population

- Long-term regional trends

- Gaps in herd immunity attainment

The goal is to evaluate whether improvements in vaccination coverage are associated with reductions in measles incidence across SSA countries.

---

## Key Highlights

- 76% average measles coverage in SSA (2024)

- +15 percentage point increase since 2000

- 63.7 per 100k reduction in measles incidence

- 42 countries still below the 95% herd immunity threshold

---

## Data Sources

- WHO WUENIC – Immunization coverage estimates and reported measles cases

- World Bank Open Data – Population data (for incidence calculations)

- UN / World Bank Regional Classification – Country-to-region mapping

Time span: 2000–2024

---

## Tools & Skills Demonstrated

- Microsoft Excel (advanced analytics)

- Power Query (ETL pipeline)

- PivotTables for aggregation

- Data normalization (incidence per 100k)

- KPI engineering

- Dashboard design

- Public health data storytelling

---

## Project Structure

```
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
---

## Data Cleaning & Transformation

Data preprocessing was performed using Power Query to ensure analytical consistency and reproducibility.

Key steps:

1. Removed metadata rows and non-tabular formatting.

2. Converted worksheets into structured tables.

3. Unpivoted wide year columns into long format.

4. Merged datasets:

  - Measles coverage + cases
  - Population data (for incidence calculation)
  - Country-to-region classification

5. Filtered dataset to Sub-Saharan Africa countries only.

6. Engineered analytical features:

  - Incidence per 100,000 population
  - Coverage change since 2000
  - Incidence reduction since 2000
  - Countries below herd immunity threshold (95%)
  
---

## 📊 Dashboard Components

The Excel dashboard provides an executive summary of measles epidemiology in SSA:

- Measles incidence trend (2000–2024)

- Coverage vs incidence dual-axis analysis

- Top measles burden countries (latest year)

- Countries with least coverage (latest year)

- KPI summary panel

The dashboard is designed for clarity, interpretability, and rapid insight extraction.

---

## Key Insights

- Measles vaccination coverage has improved substantially since 2000 across SSA.

- Despite progress, most SSA countries remain below the 95% herd immunity threshold.

- Measles incidence has declined overall but remains highly volatile, reflecting periodic outbreaks.

- High-burden countries continue to drive regional incidence, highlighting persistent immunization gaps.

---

## Why This Project Matters

Measles is a highly contagious disease where small declines in vaccination coverage can trigger large outbreaks.

This project demonstrates how publicly available health data can be transformed into actionable epidemiological insights using Excel-based analytics — a common tool in global health organizations and NGOs.

---

## Potential Extensions

- Lagged correlation analysis (coverage vs incidence 1–2 years later)

- Country-level clustering by risk profile

- Expansion to other vaccine-preventable diseases (e.g., DTP3, polio)

- Migration to Power BI or Tableau for interactive dashboards

- Integration with demographic or conflict data

---

## Author
**Chinonye Anams**        
MSc Cell Biology & Genetics        
Public Health & Data Analytics Enthusiast
