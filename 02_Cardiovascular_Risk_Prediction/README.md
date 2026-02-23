# Explainable Heart Disease Risk Prediction
## Interpretable Machine Learning for Cardiovascular Risk Assessment

## Overview

Cardiovascular disease (CVD) remains one of the leading causes of morbidity and mortality globally, posing a significant burden on healthcare systems and public health programs. Early identification of high-risk individuals is critical for preventive care, resource allocation, and targeted intervention strategies.

This project develops an interpretable machine learning pipeline to predict heart disease using structured clinical data. Beyond predictive performance, the emphasis is on transparency, clinical plausibility, and healthcare applicability. 

Explainable AI techniques are used to ensure that model outputs align with established cardiovascular risk factors and support informed clinical and public health decision-making.
---

## Objectives

- Identify key clinical drivers associated with heart disease risk
- Build and compare interpretable machine learning models
- Evaluate predictive performance using robust metrics (ROC-AUC)
- Apply SHAP for global and patient-level explainability
- Translate findings into actionable insights relevant to healthcare and risk stratification

---

## Dataset

The project uses the Cleveland Heart Disease dataset, a widely studied benchmark in cardiovascular machine learning research.

### Features include:

* Demographics (age, sex)
* Symptom indicators (chest pain type)
* Physiological metrics (blood pressure, cholesterol)
* Functional markers (max heart rate, exercise-induced angina)
* Structural indicators (number of affected vessels, thalassemia defects)

### Target:
Binary classification of heart disease presence.

---

## Key Insights
### 1. Clinically Meaningful Predictors
Strong predictors included:

* Chest pain type (symptom-driven signal)
* Number of affected vessels (structural burden)
* ST depression (ischemic stress marker)
* Maximum heart rate (functional capacity)

These findings align closely with established cardiovascular risk factors.

### 2. Interpretable Models Perform Strongly
A logistic regression model achieved:
* Accuracy: 92%
* ROC-AUC: 0.95

Interestingly, More complex models (e.g., Random Forest) did not significantly outperform the simpler baseline. This suggests that dominant clinical signals were largely linearly separable and supports the use of transparent models in healthcare settings.

In public health and clinical environments, interpretability and reliability are often prioritized over marginal performance gains.

### 3. Explainable AI with SHAP

To enhance transparency, SHAP was used to analyze feature contributions.

#### Global explanations revealed:

* Chest pain, vessel count, and max heart rate as dominant predictors.

#### Patient-level explanations demonstrated:

* Predictions arise from a balance of symptomatic, functional, and structural signals rather than single-feature dominance.

This level of interpretability is essential for clinical adoption and integration into healthcare decision-support systems..

---

## Why This Project Matters

This project highlights an important principle in healthcare analytics:

Effective models must support clinical reasoning and public health decision-making — not function as black boxes.

By combining strong predictive performance with explainability, this work demonstrates how machine learning can contribute to:

- Early risk identification
- Preventive health strategies
- Evidence-based clinical decision support
- Population-level risk stratification

---

## Tech Stack

* Python (Pandas, NumPy)
* Scikit-learn
* Matplotlib / Seaborn
* SHAP (Explainable AI)

---

## Evaluation Metrics

* Accuracy
* Precision / Recall
* Confusion Matrix Analysis
* ROC Curve & AUC
* Model comparison (Logistic vs Random Forest)

---

## Key Takeaways

* Interpretable models can achieve excellent performance in structured clinical datasets.
* Explainability techniques like SHAP add critical transparency for healthcare use cases.
* Combining domain knowledge with ML improves both credibility and insight quality.

---

## Future Improvements
- External validation using independent clinical datasets
- Model calibration analysis for screening vs diagnostic use cases
- Threshold optimization for population-level screening programs
- Integration into a lightweight clinical decision-support prototype

---

## Project Structure

```
diabetes-risk-prediction/
│
├── cardiovascular_risk_prediction.ipynb
├── data/
└── README.md
```

---

## Author

**Chinonye Anams**      
Biochemistry & Molecular Biology | Public Health & Healthcare Data Analytics      
Passionate about interpretable AI, epidemiological analytics, and data-driven healthcare innovation.
