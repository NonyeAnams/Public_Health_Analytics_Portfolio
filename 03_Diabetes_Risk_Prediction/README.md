# Diabetes Risk Prediction Using Machine Learning

## Overview

Diabetes is a major non-communicable disease (NCD) and a growing global public health challenge, contributing significantly to morbidity, mortality, and healthcare system burden. Early identification of individuals at high risk is essential for prevention, timely intervention, and improved long-term health outcomes.

This project analyzes clinical health indicators and develops machine learning models to predict diabetes risk using the Pima Indians Diabetes dataset. 

The goal is to identify key risk factors and build predictive models that can support early screening, population health monitoring, and data-driven decision-making in healthcare settings.

---

## Objectives

- Explore clinical patterns associated with diabetes risk
- Perform exploratory data analysis (EDA)
- Build predictive machine learning models
- Compare model performance across approaches
- Extract medically and epidemiologically meaningful insights

---

## Dataset

- **Source:** Pima Indians Diabetes Dataset (Kaggle)
- **Size:** 768 patient records, 8 clinical features
- **Target Variable:** Outcome (0 = No diabetes, 1 = Diabetes)

### Features

* Pregnancies
* Glucose level
* Blood pressure
* Skin thickness
* Insulin level
* Body Mass Index (BMI)
* Diabetes pedigree function
* Age

---

## Tools & Technologies

* Python
* Pandas, NumPy
* Seaborn, Matplotlib
* Scikit-learn
* Jupyter Notebook

---

## Methodology

**1. Data Exploration**
- Examined dataset structure and variable distributions
- Assessed class balance (~35% diabetic cases), relevant for screening contexts

**2. Data Quality Assessment**
- Reviewed summary statistics for anomalies
- No physiologically implausible values observed, suggesting prior preprocessing
- Ensured dataset suitability for downstream modeling and interpretation

**3. Exploratory Data Analysis**
- Compared feature distributions across diabetic and non-diabetic groups
- Generated boxplots and correlation heatmaps
- Identified potential clinical and metabolic risk signals

**4. Modeling**
- Logistic Regression (interpretable baseline model)
- Random Forest (ensemble model for improved predictive performance)

**5. Model Evaluation**
- Accuracy
- Precision, Recall, F1-score
- Confusion matrix analysis
- Emphasis on recall for diabetic cases (important in screening scenarios)

---

## Key Findings

### Target Distribution

- 34.9% of individuals were diabetic
- Mild class imbalance but suitable for predictive modeling and risk analysis

---

### Feature Insights

**1. Glucose**

- Strongest predictor of diabetes
- Diabetic individuals showed significantly higher glucose levels
- Aligns with established clinical diagnostic criteria

**2. BMI**

- Moderately elevated among diabetic individuals
- Reinforces the well-known link between obesity and diabetes risk

**3. Age**

- Higher average age among diabetic individuals
- Reflects known epidemiological patterns in type 2 diabetes progression

---

### Correlation Analysis

* Glucose showed the strongest correlation with diabetes
* Insulin, BMI, and skin thickness exhibited moderate relationships
* Age showed a weaker but positive association

---

## Model Performance

### Logistic Regression (Baseline)

- Accuracy: ~76%
- Recall (diabetes): 0.65
- Provided a solid interpretable baseline

---

### Random Forest (Final Model)

- **Accuracy:** 88%
- **Recall (diabetes): 0.87**
- **F1-score (diabetes): 0.84**

The random forest model significantly outperformed logistic regression, particularly in identifying diabetic patients.

---

## Model Comparison

| Model               | Accuracy | Recall (Diabetes) |
| ------------------- | -------- | ----------------- |
| Logistic Regression | ~0.76    | 0.65              |
| Random Forest       | **0.88** | **0.87**          |

The ensemble model demonstrated superior performance across all evaluation metrics.

---

## Key Insights

* Glucose is the dominant predictor of diabetes
* BMI and age contribute moderate risk signals
* Ensemble methods significantly improve predictive performance
* Machine learning can effectively support early diabetes screening

---

## Conclusion

This project demonstrates how machine learning can be applied to structured clinical data to identify individuals at elevated risk of diabetes. The random forest model achieved strong performance, particularly in detecting diabetic cases, highlighting its potential value for early screening and risk stratification.

These findings illustrate how data-driven methods can support preventive healthcare, population health monitoring, and clinical decision support.

---

## Public Health Relevance

While based on a benchmark dataset, this project reflects real-world applications in:

- Population-level risk stratification
- Preventive health screening programs
- Non-communicable disease surveillance
- Data-informed healthcare planning

The analytical workflow is transferable to broader public health datasets, including infectious disease surveillance and health system analytics.

---

## Future Improvements

- Hyperparameter tuning for improved performance
- Feature importance and explainability analysis
- Cross-validation for model robustness
- Integration with real-world clinical datasets
- Deployment as a lightweight risk assessment tool

---

## Project Structure

```
diabetes-risk-prediction/
│
├── diabetes_analysis.ipynb
├── data/
└── README.md
```

---

## Author

**Chinonye Anams**
Biochemistry & Molecular Biology | Public Health & Healthcare Data Analytics 
Interested in epidemiological analytics, interpretable AI, and data-driven health innovation.
