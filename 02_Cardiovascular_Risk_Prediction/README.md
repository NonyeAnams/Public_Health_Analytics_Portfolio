# Explainable Heart Disease Risk Prediction

Machine learning analysis of structured clinical data, focusing on cardiovascular risk prediction and model interpretability.

**Tools:** Python, Pandas, NumPy, Scikit-learn, SHAP, Matplotlib, Seaborn

## Key work

* Cleaned and analysed the Cleveland Heart Disease dataset.
* Explored clinical variables associated with heart disease.
* Built and compared logistic regression and random forest models.
* Evaluated models using accuracy, precision, recall, F1-score, confusion matrices, and ROC-AUC.
* Applied SHAP to examine global and individual feature contributions.

## Key findings

* Logistic regression achieved approximately 92% accuracy and 0.95 ROC-AUC on the evaluation data.
* Chest pain type, number of affected vessels, ST depression, and maximum heart rate were among the strongest predictive features.
* The random forest model did not substantially outperform the logistic regression baseline.
* SHAP analysis provided an interpretable view of how individual features contributed to model predictions.

## Dataset

**Cleveland Heart Disease Dataset**

The dataset contains structured clinical measurements and a binary heart disease outcome and is widely used for machine learning research and educational analysis.

## Project structure

```text
heart-disease-risk-prediction/
│
├── cardiovascular_risk_prediction.ipynb
├── data/
└── README.md
```

This project focuses on predictive modelling and explainability rather than clinical deployment or diagnosis.
