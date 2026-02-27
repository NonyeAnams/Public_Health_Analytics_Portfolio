-- =================
-- Rename Raw Tables
-- =================
ALTER TABLE patients RENAME TO patients_raw;
ALTER TABLE facilities RENAME TO facilities_raw;
ALTER TABLE diseases RENAME TO diseases_raw;
ALTER TABLE visits RENAME TO visits_raw;
ALTER TABLE vaccinations RENAME TO vaccinations_raw;
ALTER TABLE treatments RENAME TO treatments_raw;

-- ======================
-- Recreate Proper Schema
-- ======================
PRAGMA foreign_keys = ON;

-- PATIENTS
CREATE TABLE patients (
    patient_id INTEGER PRIMARY KEY,
    gender TEXT,
    birth_date TEXT,
    state TEXT
);

-- FACILITIES
CREATE TABLE facilities (
    facility_id INTEGER PRIMARY KEY,
    facility_name TEXT,
    state TEXT,
    facility_type TEXT,
    ownership TEXT,
    urban_rural TEXT
);

-- DISEASES
CREATE TABLE diseases (
    disease_id INTEGER PRIMARY KEY,
    disease_name TEXT,
    category TEXT,
    is_vaccine_preventable INTEGER
);

-- VISITS
CREATE TABLE visits (
    visit_id INTEGER PRIMARY KEY,
    patient_id INTEGER,
    facility_id INTEGER,
    visit_date TEXT,
    disease_id INTEGER,
    severity TEXT,
    outcome TEXT,
    FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY(facility_id) REFERENCES facilities(facility_id),
    FOREIGN KEY(disease_id) REFERENCES diseases(disease_id)
);

-- VACCINATIONS
CREATE TABLE vaccinations (
    vaccination_id INTEGER PRIMARY KEY,
    patient_id INTEGER,
    vaccine_name TEXT,
    dose_number INTEGER,
    vaccination_date TEXT,
    facility_id INTEGER,
    FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY(facility_id) REFERENCES facilities(facility_id)
);

-- TREATMENTS
CREATE TABLE treatments (
    treatment_id INTEGER PRIMARY KEY,
    visit_id INTEGER,
    treatment_type TEXT,
    cost REAL,
    FOREIGN KEY(visit_id) REFERENCES visits(visit_id)
);

-- ===========================
-- Insert Data From Raw Tables
-- ===========================

INSERT INTO patients
SELECT 
    CAST(patient_id AS INTEGER),
    gender,
    birth_date,
    state
FROM patients_raw;

INSERT INTO facilities
SELECT 
    CAST(facility_id AS INTEGER),
    facility_name,
    state,
    facility_type,
    ownership,
    urban_rural
FROM facilities_raw;

INSERT INTO diseases
SELECT 
    CAST(disease_id AS INTEGER),
    disease_name,
    category,
    CAST(is_vaccine_preventable AS INTEGER)
FROM diseases_raw;

INSERT INTO visits
SELECT
    CAST(visit_id AS INTEGER),
    CAST(patient_id AS INTEGER),
    CAST(facility_id AS INTEGER),
    visit_date,
    CAST(disease_id AS INTEGER),
    severity,
    outcome
FROM visits_raw;

INSERT INTO vaccinations
SELECT
    CAST(vaccination_id AS INTEGER),
    CAST(patient_id AS INTEGER),
    vaccine_name,
    CAST(dose_number AS INTEGER),
    vaccination_date,
    CAST(facility_id AS INTEGER)
FROM vaccinations_raw;

INSERT INTO treatments
SELECT
    CAST(treatment_id AS INTEGER),
    CAST(visit_id AS INTEGER),
    treatment_type,
    CAST(cost AS REAL)
FROM treatments_raw;

-- =====================
-- Validate Foreign Keys
-- =====================
PRAGMA foreign_key_check;
