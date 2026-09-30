# Diabetes Risk Prediction Using Machine Learning

Machine learning analysis of clinical indicators associated with diabetes risk using the Pima Indians Diabetes dataset.

**Tools:** Python, Pandas, NumPy, Scikit-learn, Matplotlib, Seaborn

## Key work

* Explored and assessed a structured clinical dataset containing 768 records.
* Analysed relationships between clinical variables and diabetes outcomes.
* Built logistic regression and random forest models.
* Compared model performance using accuracy, precision, recall, F1-score, and confusion matrices.
* Examined important clinical features associated with predicted diabetes risk.

## Key findings

* Glucose was the strongest predictive feature in the analysis.
* BMI and age also showed meaningful associations with diabetes outcomes.
* Logistic regression achieved approximately 76% accuracy with 0.65 recall.
* Random forest achieved approximately 88% accuracy with 0.87 recall and 0.84 F1-score on the evaluation data.

## Dataset

**Pima Indians Diabetes Dataset**

The dataset contains 768 records and eight clinical features, including glucose, BMI, age, blood pressure, and insulin measurements.

## Project structure

```text
diabetes-risk-prediction/
│
├── diabetes_analysis.ipynb
├── data/
└── README.md
```

This project is a machine learning demonstration using a benchmark dataset and is not intended for clinical diagnosis or deployment.
