-- Preview data
SELECT *
FROM patients
LIMIT 5;

-- show a doctor who have an exps more than 5 years 
SELECT first_name, last_name,specialization, years_experience
FROM doctors
WHERE years_experience > 5
ORDER BY years_experience DESC;

-- show patient name and doctor name make appointment
SELECT patients.first_name || ' ' || patients.last_name AS patient_name,
		doctors.first_name || ' ' || doctors.last_name AS doctor_name,
		appointments.appointment_date
FROM appointments
JOIN patients ON appointments.patient_id = patients.patient_id
JOIN doctors ON appointments.doctor_id = doctors.doctor_id
ORDER BY appointments.appointment_date DESC;

-- summarize how many times, each of appointment in each type 
SELECT treatment_type, count(*) AS treatment_count, sum(cost) AS total_cost
FROM treatments
GROUP BY treatment_type
ORDER BY total_cost DESC;

-- revenue for the month (incloude treatment from billing)
SELECT strftime('%Y-%m', bill_date) AS billing_month,
		sum(amount) AS total_revenue
FROM billing
GROUP BY billing_month
ORDER BY billing_month DESC;

-- total revenue from each doctor
SELECT doctors.first_name || ' ' || doctors.last_name AS doctor_name,
		sum(billing.amount) AS revenue
FROM billing
JOIN treatments ON billing.treatment_id = treatments.treatment_id
JOIN appointments ON treatments.appointment_id = appointments.appointment_id
JOIN doctors ON appointments.doctor_id = doctors.doctor_id
GROUP BY doctors.doctor_id
ORDER BY revenue DESC;

-- patient who have most appointment
SELECT patients.first_name || ' ' || patients.last_name AS patient_name,
		count(*) AS total_appointment
FROM appointments
JOIN patients ON appointments.patient_id = patients.patient_id
GROUP BY patients.patient_id
ORDER BY total_appointment DESC
LIMIT 5;

-- for patient who did appointment but not showing up
SELECT patients.first_name ||' '|| patients.last_name AS patient_name,
		count(*) AS missed
FROM appointments
JOIN patients ON appointments.patient_id = patients.patient_id
WHERE appointments.status = 'No-show'
GROUP BY patients.patient_id
ORDER BY missed DESC
LIMIT 10;

-- view for income per month
DROP VIEW IF EXISTS monthly_revenue;
CREATE VIEW monthly_revenue AS
SELECT strftime('%Y-%m', bill_date) AS month,
		sum(amount) AS total
FROM billing
GROUP BY month;

-- view for doctor_kpi
DROP VIEW IF EXISTS doctor_kpi;
CREATE VIEW doctor_kpi AS
SELECT doctors.first_name || ' ' || doctors.last_name AS doctor_name,
		count(DISTINCT appointments.appointment_id) AS num_appointments,
		COALESCE(SUM(billing.amount), 0) AS total_revenue
FROM billing
LEFT JOIN treatments ON billing.treatment_id = treatments.treatment_id
LEFT JOIN appointments ON treatments.appointment_id = appointments.appointment_id
LEFT JOIN doctors ON appointments.doctor_id = doctors.doctor_id
GROUP BY doctors.doctor_id;

SELECT *
FROM monthly_revenue;

SELECT *
FROM doctor_kpi;

-- No-show rate (%) per doctor
SELECT doctors.first_name || ' ' || doctors.last_name AS doctor_name,
       COUNT(*) AS total_appts,
       SUM(CASE WHEN appointments.status = 'No-show' THEN 1 ELSE 0 END) AS no_shows,
       ROUND(100.0 * SUM(CASE WHEN appointments.status = 'No-show' THEN 1 ELSE 0 END)
             / COUNT(*), 1) AS no_show_pct
FROM appointments
JOIN doctors ON appointments.doctor_id = doctors.doctor_id
GROUP BY doctors.doctor_id
ORDER BY no_show_pct DESC;

-- Month-over-Month (MoM) revenue growth
SELECT month,
       total,
       LAG(total) OVER (ORDER BY month) AS prev_month,
       ROUND(100.0 * (total - LAG(total) OVER (ORDER BY month))
             / LAG(total) OVER (ORDER BY month), 1) AS growth_pct
FROM monthly_revenue
ORDER BY month;
