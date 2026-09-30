# DHIS2-Style Malaria Surveillance Analysis

A simulated routine malaria surveillance analysis demonstrating how facility-level reporting data can be cleaned, aggregated, assessed for completeness, and visualised using R.

**Tools:** R, dplyr, ggplot2

**Important:** This project uses simulated data designed to resemble routine health-facility reporting. It does not represent actual Nigerian DHIS2 data or real surveillance estimates.

## Key work

* Cleaned and structured simulated facility-level malaria reporting data.
* Aggregated reported cases by state and month.
* Analysed monthly and state-level malaria trends.
* Calculated reporting completeness across states.
* Compared reporting completeness with reported disease burden.
* Created visualisations for surveillance reporting and data-quality assessment.

## Key findings

* Reported malaria cases were concentrated in a small number of states, with Kano, Kaduna, and Rivers accounting for approximately 70% of reported cases in the simulated dataset.
* Reported cases increased from January to March, with a peak in March.
* Average reporting completeness was approximately 89%, with no state below 80%.
* Reporting completeness varied across states, demonstrating why data-quality indicators should be considered when interpreting routine surveillance data.

## Public health analytics relevance

The project demonstrates a basic workflow for working with routine surveillance data:

**Reporting data → data quality assessment → aggregation → trend analysis → visualisation → interpretation**

## Project structure

```text
DHIS2_Malaria_Surveillance/
│
├── analysis/
├── data/
├── outputs/
└── README.md
```

The analysis is structured as a reproducible R workflow with outputs for trends, state comparisons, and reporting completeness.

