-- =========================
-- Monthly cases per disease
-- =========================
WITH communicable_visits AS (
    SELECT v.*, d.disease_name
    FROM visits v
    JOIN diseases d ON v.disease_id = d.disease_id
    WHERE d.category = 'Communicable'
)
SELECT
    disease_name,
    SUBSTR(visit_date, 1, 7) AS year_month,
    COUNT(*) AS monthly_cases
FROM communicable_visits
GROUP BY disease_name, year_month
ORDER BY disease_name, year_month;

-- ================================
-- Moving average cases per disease
-- ================================
SELECT
    disease_name,
    year_month,
    monthly_cases,
    ROUND(
        AVG(monthly_cases) OVER (
            PARTITION BY disease_name
            ORDER BY year_month
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 2
    ) AS moving_avg_3m
FROM (
    SELECT
        d.disease_name,
        SUBSTR(v.visit_date, 1, 7) AS year_month,
        COUNT(*) AS monthly_cases
    FROM visits v
    JOIN diseases d ON v.disease_id = d.disease_id
	WHERE d.category = 'Communicable'
    GROUP BY d.disease_name, year_month
);

-- =======================================
-- Spike detection: cases > moving average
-- =======================================
WITH monthly_data AS (
    SELECT
        d.disease_name,
        SUBSTR(v.visit_date, 1, 7) AS year_month,
        COUNT(*) AS monthly_cases
    FROM visits v
    JOIN diseases d ON v.disease_id = d.disease_id
	WHERE d.category = 'Communicable'
    GROUP BY d.disease_name, year_month
),
ma AS (
    SELECT
        disease_name,
        year_month,
        monthly_cases,
        AVG(monthly_cases) OVER (
            PARTITION BY disease_name
            ORDER BY year_month
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS moving_avg
    FROM monthly_data
)
SELECT *
FROM ma
WHERE monthly_cases > moving_avg * 1.5
ORDER BY disease_name, year_month;

-- =======================================
-- Alert when cases exceed fixed threshold
-- =======================================
SELECT
    d.disease_name,
    SUBSTR(v.visit_date, 1, 7) AS year_month,
    COUNT(*) AS cases
FROM visits v
JOIN diseases d ON v.disease_id = d.disease_id
WHERE d.category = 'Communicable'
GROUP BY d.disease_name, year_month
HAVING cases >= 20
ORDER BY cases DESC;

-- =========================
-- Cases by state and month
-- =========================
SELECT
    p.state,
    d.disease_name,
    SUBSTR(v.visit_date, 1, 7) AS year_month,
    COUNT(*) AS cases
FROM visits v
JOIN patients p ON v.patient_id = p.patient_id
JOIN diseases d ON v.disease_id = d.disease_id
WHERE d.category = 'Communicable'
GROUP BY p.state, d.disease_name, year_month
ORDER BY cases DESC;

-- ==================
-- Severe cases trend
-- ==================
SELECT
    d.disease_name,
    SUBSTR(v.visit_date, 1, 7) AS year_month,
    COUNT(*) AS severe_cases
FROM visits v
JOIN diseases d ON v.disease_id = d.disease_id
WHERE d.category = 'Communicable' AND severity = 'Severe'
GROUP BY d.disease_name, year_month
ORDER BY severe_cases DESC;

-- ====================
-- Death trend by month
-- ====================
SELECT
    d.disease_name,
    SUBSTR(v.visit_date, 1, 7) AS year_month,
    COUNT(*) AS deaths
FROM visits v
JOIN diseases d ON v.disease_id = d.disease_id
WHERE d.category = 'Communicable' AND outcome = 'Death'
GROUP BY d.disease_name, year_month
ORDER BY deaths DESC;

