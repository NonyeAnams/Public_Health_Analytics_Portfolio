-- =====================
-- Row counts validation
-- =====================

SELECT 'patients' AS table_name, COUNT(*) FROM patients
UNION ALL
SELECT 'facilities', COUNT(*) FROM facilities
UNION ALL
SELECT 'diseases', COUNT(*) FROM diseases
UNION ALL
SELECT 'visits', COUNT(*) FROM visits
UNION ALL
SELECT 'vaccinations', COUNT(*) FROM vaccinations
UNION ALL
SELECT 'treatments', COUNT(*) FROM treatments;

-- ===========================
-- Foreign Key Integrity Check
-- ===========================

-- Check orphan visits (invalid patients)
SELECT COUNT(*) AS orphan_visits
FROM visits v
LEFT JOIN patients p ON v.patient_id = p.patient_id
WHERE p.patient_id IS NULL;

-- Treatments referencing missing visits
SELECT COUNT(*) AS orphan_treatments
FROM treatments t
LEFT JOIN visits v ON t.visit_id = v.visit_id
WHERE v.visit_id IS NULL;

-- ============================
-- Duplicate Primary Keys Check
-- ============================

-- Duplicate patients
SELECT patient_id, COUNT(*)
FROM patients
GROUP BY patient_id
HAVING COUNT(*) > 1;

-- Duplicate diseases
SELECT disease_id, COUNT(*)
FROM diseases
GROUP BY disease_id
HAVING COUNT(*) > 1;

-- Duplicate visits
SELECT visit_id, COUNT(*)
FROM visits
GROUP BY visit_id
HAVING COUNT(*) > 1;

-- Duplicate facilities
SELECT facility_id, COUNT(*)
FROM facilities
GROUP BY facility_id
HAVING COUNT(*) > 1;

-- Duplicate vaccinations
SELECT vaccination_id, COUNT(*)
FROM vaccinations
GROUP BY vaccination_id
HAVING COUNT(*) > 1;

-- Duplicate treatments
SELECT treatment_id, COUNT(*)
FROM treatments
GROUP BY treatment_id
HAVING COUNT(*) > 1;

-- ==========================
-- Null Critical Fields Check
-- ==========================

-- Visits without disease info
SELECT COUNT(*) AS missing_disease
FROM visits
WHERE disease_id IS NULL;

-- Patients without gender
SELECT COUNT(*) AS missing_gender
FROM patients
WHERE gender IS NULL OR gender = '';

-- ==================
-- Date Sanity Check
-- ==================

-- Future visits
SELECT COUNT(*) AS future_visits
FROM visits
WHERE visit_date > DATE('now');

-- Vaccinations before birth 
SELECT COUNT(*) AS impossible_vaccinations
FROM vaccinations v
JOIN patients p ON v.patient_id = p.patient_id
WHERE v.vaccination_date < p.birth_date;

-- =====================
-- Logical Value Checks
-- =====================

-- Negative treatment costs (invalid)
SELECT COUNT(*) AS negative_costs
FROM treatments
WHERE cost < 0;

-- Invalid severity values
SELECT DISTINCT severity
FROM visits
WHERE severity NOT IN ('Mild', 'Moderate', 'Severe');

-- ===================
-- Quick Data Profile
-- ===================

-- Age distribution proxy (birth year)
SELECT SUBSTR(birth_date, 1, 4) AS birth_year, COUNT(*)
FROM patients
GROUP BY birth_year
ORDER BY birth_year;