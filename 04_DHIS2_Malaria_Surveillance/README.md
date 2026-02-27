# DHIS2-Style Malaria Surveillance Analysis: A Mini Public Health Data Project

## Background

Routine malaria surveillance systems rely on platforms like DHIS2 to collect facility-level data used for monitoring disease trends and informing interventions.

## Data Source
This project uses a simulated DHIS2-style malaria dataset, designed to mimic real-world routine health facility reporting across Nigerian states. The dataset includes malaria cases, facility-level reporting, and completeness indicators.

## Objective

This mini project explores a simulated DHIS2-style malaria dataset to demonstrate foundational analytics relevant to routine surveillance systems.


## Key Questions

- How do malaria cases vary across time and states?
- What is the level of reporting completeness?
- How might data quality influence malaria burden estimates?


## Skills Demonstrated

- **Data Management:** Cleaned and structured DHIS2-style dataset
- **Analysis:** State-level aggregation, monthly trend assessment, completeness calculation
- **Visualization:** Line plots, bar charts, and reporting completeness charts
- **Public Health Interpretation:** Translated data into actionable programmatic insights
- **Reproducibility:** Structured R workflow, outputting charts and summaries for decision-making

## Key Insights From the Analysis

### 1. Malaria Burden by State

- The top 3 states contributing the highest malaria burden were Kano, Kaduna, and Rivers.
- Together, these states accounted for ~70% of all reported malaria cases, indicating concentrated transmission hotspots.

**Public health implication:**
These states should be prioritized for malaria control interventions such as targeted distribution of insecticide-treated nets, indoor residual spraying, and enhanced case management.

### 2. Monthly Trends

- Malaria cases generally increased from January to March, reflecting the early rainy season in some regions.
- There was a noticeable seasonal spike in March, aligning with expected transmission patterns.

**Public health implication:**
Understanding seasonal trends can inform timing of preventive campaigns and resource allocation.

### 3. Surveillance Quality

- Average reporting completeness across states was high (~0.889), with no state below 80%.
- FCT achieved 100% reporting, indicating strong data coverage.

**Public health implication:** 
Surveillance data is reliable for identifying trends and planning interventions.

### 4. Data Quality Insights

- Reporting completeness was consistent across most states, so lower malaria counts were unlikely due to underreporting.
- FCT had the highest reporting rate, yet relatively low malaria burden, confirming data accuracy.

**Public health interpretation:** 
Data reliability allows confidence in burden estimates and programmatic decisions.

### 5. Programmatic Recommendations

- **States needing focused intervention:** Kano, as the highest-burden state.
- **Primary driver of high case counts:** Transmission rather than reporting gaps.

**Suggested actions:** Strengthen vector control, community engagement, and case management in high-burden areas, while maintaining high-quality surveillance across all states.


## Author
**Chinonye Anams**        
Biochemistry & Molecular Biology | Public Health & Healthcare Data Analytics        
Interested in epidemiological analytics, interpretable AI, and data-driven health innovation.        
