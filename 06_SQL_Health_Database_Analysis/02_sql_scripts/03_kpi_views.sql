-- Disease incidence count
CREATE VIEW vw_disease_incidence AS
SELECT 
    d.disease_name,
    COUNT(v.visit_id) AS total_cases
FROM visits v
JOIN diseases d ON v.disease_id = d.disease_id
GROUP BY d.disease_name
ORDER BY total_cases DESC;

-- Monthly case trend
CREATE VIEW vw_monthly_cases AS
SELECT 
    SUBSTR(visit_date, 1, 7) AS year_month,
    COUNT(*) AS total_cases
FROM visits
GROUP BY year_month
ORDER BY year_month;

-- Vaccination coverage
CREATE VIEW vw_vaccination_coverage AS
SELECT
    COUNT(DISTINCT v.patient_id) * 100.0 /
    (SELECT COUNT(*) FROM patients) AS vaccination_rate_pct
FROM vaccinations v;

-- Vaccination coverage by state
CREATE VIEW vw_vaccination_by_state AS
SELECT
    p.state,
    COUNT(DISTINCT v.patient_id) AS vaccinated_people,
    COUNT(DISTINCT p.patient_id) AS total_population,
    ROUND(
        COUNT(DISTINCT v.patient_id) * 100.0 /
        COUNT(DISTINCT p.patient_id), 2
    ) AS coverage_pct
FROM patients p
LEFT JOIN vaccinations v ON p.patient_id = v.patient_id
GROUP BY p.state
ORDER BY coverage_pct DESC;

-- Case Fatality Rate (CFR)
CREATE VIEW vw_case_fatality_rate AS
SELECT
    d.disease_name,
    COUNT(*) AS total_cases,
    SUM(CASE WHEN outcome = 'Death' THEN 1 ELSE 0 END) AS deaths,
    ROUND(
        SUM(CASE WHEN outcome = 'Death' THEN 1 ELSE 0 END) * 100.0 /
        COUNT(*), 2
    ) AS case_fatality_rate_pct
FROM visits v
JOIN diseases d ON v.disease_id = d.disease_id
GROUP BY d.disease_name
ORDER BY case_fatality_rate_pct DESC;

-- Facility workload
CREATE VIEW vw_facility_workload AS
SELECT
    f.facility_name,
    f.state,
    COUNT(v.visit_id) AS total_visits
FROM visits v
JOIN facilities f ON v.facility_id = f.facility_id
GROUP BY f.facility_name, f.state
ORDER BY total_visits DESC;

-- Average treatment cost by disease
CREATE VIEW vw_avg_treatment_cost_by_disease AS
SELECT
    d.disease_name,
    ROUND(AVG(t.cost), 2) AS avg_treatment_cost
FROM treatments t
JOIN visits v ON t.visit_id = v.visit_id
JOIN diseases d ON v.disease_id = d.disease_id
GROUP BY d.disease_name
ORDER BY avg_treatment_cost DESC;

-- Severity distribution
CREATE VIEW vw_severity_distribution AS
SELECT
    severity,
    COUNT(*) AS case_count
FROM visits
GROUP BY severity
ORDER BY case_count DESC;

-- Top diseases by state
CREATE VIEW vw_top_disease_by_state AS
SELECT
    p.state,
    d.disease_name,
    COUNT(*) AS cases
FROM visits v
JOIN patients p ON v.patient_id = p.patient_id
JOIN diseases d ON v.disease_id = d.disease_id
GROUP BY p.state, d.disease_name
ORDER BY p.state, cases DESC;

-- Disease cases vs vaccination coverage by state
CREATE VIEW vw_cases_vs_vaccinated_by_state AS
SELECT
    p.state,
    d.disease_name,
    COUNT(DISTINCT v.patient_id) AS infected_people,

    COUNT(DISTINCT vac.patient_id) AS vaccinated_people,

    ROUND(
        COUNT(DISTINCT vac.patient_id) * 100.0 /
        COUNT(DISTINCT v.patient_id), 2
    ) AS vaccination_coverage_pct

FROM visits v
JOIN patients p ON v.patient_id = p.patient_id
JOIN diseases d ON v.disease_id = d.disease_id

LEFT JOIN vaccinations vac
    ON vac.patient_id = v.patient_id
    AND LOWER(vac.vaccine_name) LIKE '%' || LOWER(d.disease_name) || '%'

WHERE d.category = 'Communicable'
AND d.is_vaccine_preventable = 1

GROUP BY p.state, d.disease_name
ORDER BY vaccination_coverage_pct ASC;

-- Test views
SELECT * FROM vw_disease_incidence;
SELECT * FROM vw_monthly_cases;
SELECT * FROM vw_vaccination_coverage;
SELECT * FROM vw_vaccination_by_state;
SELECT * FROM vw_case_fatality_rate;
SELECT * FROM vw_facility_workload;
SELECT * FROM vw_avg_treatment_cost_by_disease;
SELECT * FROM vw_severity_distribution;
SELECT * FROM vw_cases_vs_vaccinated_by_state;
