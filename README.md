# Hospital Patient Analytics

## Overview

Welcome to the **Hospital Patient Analytics** evaluation lab. A hospital wants to analyze patient visits, doctors, and medical services. The MongoDB database has been pre-configured and populated with realistic healthcare data.

Your objective is to write MongoDB queries to generate reports for the hospital administration.

The database and data have already been seeded. Do not create collections or alter the pre-seeded data. Write your MongoDB queries in the corresponding task files (`task1.js`, `task2.js`, and `task3.js`).

---

## Database Schema & Collections

The MongoDB database contains the following collections:

### 1. `patients`
Stores patient personal and demographic details.
```json
{
  "patient_id": 1001,
  "name": "Aarav Sharma",
  "age": 34,
  "gender": "M",
  "city": "Hyderabad",
  "registered_on": "2024-01-15"
}
```
- `patient_id` (Number): Unique identifier for the patient
- `name` (String): Full name of the patient
- `age` (Number): Patient's age in years
- `gender` (String): Gender (`"M"`, `"F"`, etc.)
- `city` (String): Residential city
- `registered_on` (String): Registration date (YYYY-MM-DD)

### 2. `doctors`
Stores doctor professional and department information.
```json
{
  "doctor_id": 501,
  "name": "Dr. Ananya Rao",
  "specialization": "Cardiology",
  "department": "Cardiology",
  "experience_years": 12
}
```
- `doctor_id` (Number): Unique identifier for the doctor
- `name` (String): Doctor's full name
- `specialization` (String): Medical specialty
- `department` (String): Department name (e.g., Cardiology, Neurology, Orthopedics, Pediatrics, Dermatology, General Medicine)
- `experience_years` (Number): Years of medical practice experience

### 3. `appointments`
Stores records of patient visits and doctor consultations.
```json
{
  "appointment_id": 9001,
  "patient_id": 1001,
  "doctor_id": 501,
  "appointment_date": "2026-01-15",
  "status": "completed",
  "consultation_fee": 1200
}
```
- `appointment_id` (Number): Unique appointment identifier
- `patient_id` (Number): Reference to `patients.patient_id`
- `doctor_id` (Number): Reference to `doctors.doctor_id`
- `appointment_date` (String): Appointment date (YYYY-MM-DD)
- `status` (String): Appointment status (`"completed"`, `"scheduled"`, `"cancelled"`)
- `consultation_fee` (Number): Consultation charge in INR

### 4. `prescriptions`
Stores medical prescriptions written for patients during appointments.
```json
{
  "prescription_id": 7001,
  "appointment_id": 9001,
  "patient_id": 1001,
  "medicines": [
    {
      "name": "Medicine A",
      "dosage": "500mg",
      "days": 5
    },
    {
      "name": "Medicine B",
      "dosage": "10mg",
      "days": 7
    }
  ]
}
```
- `prescription_id` (Number): Unique prescription identifier
- `appointment_id` (Number): Reference to `appointments.appointment_id`
- `patient_id` (Number): Reference to `patients.patient_id`
- `medicines` (Array): List of prescribed medications with name, dosage, and duration in days

---

## Tasks

### Task 1: Patient Appointment Search (`task1.js`)
The hospital reception team wants to identify patients who are from Hyderabad and are older than 30.

Write a MongoDB query that returns patients who satisfy both conditions.

- **Collection:** `patients`
- **Fields to return:**
  - `patient_id`
  - `name`
  - `age`
  - `city`
- **Requirements:**
  1. `city` must be `Hyderabad`.
  2. `age` must be greater than 30.
  3. Do not return MongoDB's default `_id` field.
  4. Sort by `age` descending.
  5. If two patients have the same age, sort by `patient_id` ascending.
  6. Return at most 10 patients.

---

### Task 2: Doctor Appointment Analytics (`task2.js`)
The hospital management team wants to know how many completed appointments each doctor has handled and how much consultation revenue each doctor generated.

- **Collection:** `appointments`
- **Fields to return:**
  - `doctor_id`
  - `completed_appointments`
  - `total_revenue`
  - `average_fee`
- **Requirements:**
  1. Consider only completed appointments (`status = "completed"`).
  2. Group appointments by `doctor_id`.
  3. Calculate the number of completed appointments (`completed_appointments`).
  4. Calculate total consultation revenue (`total_revenue`).
  5. Calculate average consultation fee (`average_fee`).
  6. Sort by `total_revenue` descending.
  7. If revenue is equal, sort by `doctor_id` ascending.

---

### Task 3: Doctor Performance Report (`task3.js`)
The hospital administration wants a department-wise doctor performance report.

For each doctor, calculate the number of completed appointments and total revenue generated. The report must also include the doctor's name, specialization, and department.

- **Collections:** `doctors` and `appointments`
- **Fields to return:**
  - `doctor_id`
  - `doctor_name`
  - `specialization`
  - `department`
  - `completed_appointments`
  - `total_revenue`
- **Requirements:**
  1. Join `doctors` with `appointments` using `doctor_id`.
  2. Consider only completed appointments.
  3. Doctors with no completed appointments must still be included with `completed_appointments: 0` and `total_revenue: 0`.
  4. Calculate completed appointment count.
  5. Calculate total consultation revenue.
  6. Sort by `department` ascending.
  7. Within each department, sort by `total_revenue` descending.
  8. If revenue is equal, sort by `doctor_id` ascending.
  9. Use MongoDB aggregation (`$lookup`, `$unwind`, `$group`, `$project`, `$sort`, etc.).
