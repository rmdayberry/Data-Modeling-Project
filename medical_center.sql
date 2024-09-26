--Doctors Table
CREATE TABLE doctors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  specialization VARCHAR(100)
);

-- Patients table
CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE,
  address VARCHAR(255)
);

-- Visits tabble (join doctors and patients)
CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  doctor_id INT REFERENCES doctors(id),
  patient_id INT REFERENCES patients(id),
  visit_date DATE NOT NULL,
  notes TEXT
);

--Diseases table
CREATE TABLE diseases (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT
);

--Diagnoses table (join visits and diseases)
CREATE TABLE diagnoses (
  id SERIAL PRIMARY KEY,
  visit_id INT REFERENCES visits(id),
  disease_id INT REFERENCES diseases(id)
);

--Insert Doctors
INSERT INTO doctors (first_name, last_name, specialization)
VALUES 
('Sarena', 'Leesem', 'OBGYN'),
('Jane', 'Cruise', 'Cardiology'),
('Sarah', 'Michaels', 'Internal Medicine');

--Insert patients
INSERT INTO patients (first_name,last_name, date_of_birth)
VALUES 
('Reagan', 'Danberry', '1993-01-01'),
('Christopher' ,'Smith', '1951-03-11'),
('Liz', 'Preston', '1971-02-01');

--Insert visits
INSERT INTO visits (doctor_id, patient_id, visit_date, notes)
VALUES 
(1,1, '2024-09-12', 'routine checkup'),
(2,2, '2024-07-10','high blood pressure'),
(1,3,'2024-10-10','pap smear'),
(3,3, '2023-01-01', 'high stress');

--Insert diseases 
INSERT INTO diseases (name, description)
VALUES
('Preeclampsia', 'high blood pressure, swelling, abdominal pain, blurred vision, dizziness, headaches'),
('Hypertension','pressure in blood vessels is constantly higher than normal'),
('Pulmonary Disease', 'Chronic Bronchitis and asthma, DVT and pulmonary embolism');

--Insert diagnosis for visits
INSERT INTO diagnoses (visit_id, disease_id)
VALUES 
(1,1), --Reagan Danberry was diagnosed with Preeclampsia on first visit
(2,2), -- Christopher Smith was diagnosed with Hypertension
(3,3), --Reagan Danberry was diagnosed with Pulmonary Disease on 2nd visit
(4,2); -- Liz Preston was diagnosed with Hypertension

--Testing Schema
SELECT d.first_name, d.last_name
FROM doctors d
JOIN visits v ON d.id = v.doctor_id
WHERE v.patient_id = 1;

--Get all diseases diagnosed during a visit
SELECT di.name
FROM diseases di
JOIN diagnoses dg ON di.id =dg.disease_id
WHERE dg.visit_id =1;
