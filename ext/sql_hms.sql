create database hmsdb;

use hmsdb;
insert into status (name) values ('open'),('close');

create table patients
(
    patient_id int auto_increment primary key,
    user_id int  not null,
    gender char(1)  not null,
    blood_group char(5)  not null,
    weight float not null,
    height int not null,
    uid char(12) not null,
    constraint fk_patient_user foreign key(user_id) references users (user_id)
);

create table status
(
    status_id int auto_increment primary key,
    name char(20) not null
);

insert into status (name) values ('Inactive'),('Active');
alter table status change column name status char(40) not null;


create table specializations
(
    specialization_id int auto_increment primary key,
    name char(45) not null
);

INSERT INTO specializations (name) VALUES 
('General Physician'),
('Cardiologist'),
('Dermatologist'),
('Neurologist'),
('Orthopedic Surgeon'),
('Pediatrician'),
('Gynecologist'),
('Ophthalmologist'),
('ENT Specialist'),
('Psychiatrist'),
('Endocrinologist'),
('Gastroenterologist'),
('Nephrologist'),
('Pulmonologist'),
('Oncologist'),
('Rheumatologist'),
('Urologist'),
('Dentist'),
('Plastic Surgeon'),
('Anesthesiologist'),
('Radiologist'),
('Hematologist'),
('Allergist'),
('Immunologist'),
('Pathologist'),
('Geriatrician'),
('Sports Medicine Specialist'),
('Infectious Disease Specialist'),
('Emergency Medicine Specialist');


create table days 
(
    day_id int auto_increment primary key,
    name char(15) not null
);

INSERT INTO days (name) VALUES 
('Sunday'), 
('Monday'), 
('Tuesday'), 
('Wednesday'), 
('Thursday'), 
('Friday'), 
('Saturday');

create table formats
(
    format_id int auto_increment primary key,
    name char(25) not null
);

INSERT INTO formats (name) VALUES
('Tablet'),
('Capsule'),
('Syrup'),
('Injection'),
('Ointment'),
('Cream'),
('Gel'),
('Drops'),
('Inhaler'),
('Nebulizer');

select * from formats;

create table units
(
    unit_id int auto_increment primary key,
    name char(15) not null
);

INSERT INTO units (name) VALUES
('Tablet'),
('Capsule'),
('mL'),
('mg'),
('Drop'),
('Puff'),
('Vial');

create table states
(
    state_id int auto_increment primary key,
    name char(45) not null
);

INSERT INTO states (state_id, state) VALUES
(1, 'Andhra Pradesh'),
(2, 'Arunachal Pradesh'),
(3, 'Assam'),
(4, 'Bihar'),
(5, 'Chhattisgarh'),
(6, 'Goa'),
(7, 'Gujarat'),
(8, 'Haryana'),
(9, 'Himachal Pradesh'),
(10, 'Jharkhand'),
(11, 'Karnataka'),
(12, 'Kerala'),
(13, 'Madhya Pradesh'),
(14, 'Maharashtra'),
(15, 'Manipur'),
(16, 'Meghalaya'),
(17, 'Mizoram'),
(18, 'Nagaland'),
(19, 'Odisha'),
(20, 'Punjab'),
(21, 'Rajasthan'),
(22, 'Sikkim'),
(23, 'Tamil Nadu'),
(24, 'Telangana'),
(25, 'Tripura'),
(26, 'Uttar Pradesh'),
(27, 'Uttarakhand'),
(28, 'West Bengal'),
(29, 'Andaman and Nicobar Islands'),
(30, 'Chandigarh'),
(31, 'Dadra and Nagar Haveli and Daman and Diu'),
(32, 'Delhi'),
(33, 'Jammu and Kashmir'),
(34, 'Ladakh'),
(35, 'Lakshadweep'),
(36, 'Puducherry');


create table cities
(
    city_id int auto_increment primary key,
    name char(45) not null,
    state_id int not null,
    constraint fk_cities_states foreign key (state_id) references states (state_id)  
);

INSERT INTO cities (city, state_id) VALUES
('Visakhapatnam', 1),
('Vijayawada', 1),
('Itanagar', 2),
('Dispur', 3),
('Patna', 4),
('Raipur', 5),
('Panaji', 6),
('Ahmedabad', 7),
('Surat', 7),
('Chandigarh', 8),
('Shimla', 9),
('Ranchi', 10),
('Bengaluru', 11),
('Thiruvananthapuram', 12),
('Bhopal', 13),
('Indore', 13),
('Mumbai', 14),
('Pune', 14),
('Imphal', 15),
('Shillong', 16),
('Aizawl', 17),
('Kohima', 18),
('Bhubaneswar', 19),
('Amritsar', 20),
('Jaipur', 21),
('Gangtok', 22),
('Chennai', 23),
('Hyderabad', 24),
('Agartala', 25),
('Lucknow', 26),
('Dehradun', 27),
('Kolkata', 28),
('Port Blair', 29),
('Chandigarh', 30),
('Silvassa', 31),
('New Delhi', 32),
('Srinagar', 33),
('Leh', 34),
('Kavaratti', 35),
('Puducherry', 36);


create table user_types
(
    user_type_id int auto_increment primary key,
    type char(15) not null
);

insert into user_types (type) values ('Patient'),('Doctor'),('Pharma Company');

create table users
(
    user_id int auto_increment primary key,
    name char(45) not null,
    email char(255) not null unique,
    password char(255) not null,
    dob date ,
    contact char(10) not null unique,
    address varchar(500),
    profile_pic char(255),
    status_id int default 1,
    user_type_id int not null,
    activation_code char(255),
    constraint fk_users_status foreign key (status_id) references status (status_id),
    constraint fk_users_utype foreign key (user_type_id) references user_types (user_type_id)
);

 alter table users add column city_id int not null after contact;
 alter table users add constraint fk_users_cities foreign key (city_id) references cities (city_id);
 update users set activation_code=null,status_id=4 where email=? and activation_code=?
  update users set status_id=4 where user_id=16;

 select u.*, ct.city AS city_name, s.state AS state_name from users AS u JOIN cities as ct on u.city_id = ct.city_id JOIN states as s on ct.state_id = s.state_id WHERE u.user_id=18;

create table pharma_companies
(
    pharma_company_id int auto_increment primary key,
    user_id int not null,
    details varchar(500) not null,
    license char(255) not null,
    constraint fk_pharma_comp_users foreign key (user_id) references users (user_id)
);

alter table pharma_companies add column medicine_count int default 0;
UPDATE pharma_companies SET medicine_count = (SELECT COUNT(*) FROM medicines WHERE pharma_company_id = ?) WHERE pharma_company_id = ?
create table medicines
(
    medicine_id int auto_increment primary key,
    pharma_company_id int not null,
    name char(100) not null,
    description varchar(500) not null,
    ingredients varchar(500) not null,
    effective_bodypart char(100) not null,
    side_effects char(100) not null,
    warnings char(100) not null ,
    constraint fk_medicines_pharma_comp foreign key (pharma_company_id) references pharma_companies (pharma_company_id) 
);

insert into medicines(pharma_company_id,name,description,ingredients,effective_bodypart,side_effects,warnings) values (?,?,?,?,?,?,?);

select * from medicines where pharma_company_id=? order by medicine_id;

create table medicine_formats 
(
    medicine_format_id int auto_increment primary key,
    medicine_id int not null,
    format_id int not null,
    constraint fk_med_fmt_medicines foreign key (medicine_id) references medicines (medicine_id),
    constraint fk_med_fmt_formats foreign key (format_id) references formats (format_id)
);

insert into medicine_formats (medicine_id,format_id) values (?,?)
SELECT * FROM medicine_formats mf JOIN formats f ON mf.format_id = f.format_id WHERE mf.medicine_id = ?;

create table medicine_denominations 
(
    medicine_denomination_id int auto_increment primary key,
    medicine_format_id int not null,
    quantity int not null,
    unit_id int not null,
    constraint fk_med_denom_med_fmt foreign key (medicine_format_id) references medicine_formats (medicine_format_id),
    constraint fk_med_denom_units foreign key (unit_id) references units (unit_id)
);

insert into medicine_denominations(medicine_format_id,quantity,unit_id) values(?,?,?);
select * from medicine_denominations md join units u on md.unit_id=u.unit_id where medicine_format_id=56;

create table doctors
(
    doctor_id int auto_increment primary key,
    user_id int not null,
    gender int null,
    specialization_id int null,    
    qualification char(100) null,    
    experience int null, 
    certificate char(255) default null,   
    constraint fk_doctors_users foreign key (user_id) references users (user_id),
    constraint fk_doctors_specializations foreign key (specialization_id) references specializations (specialization_id)
);

select * from doctors as d JOIN specializations as s on d.specialization_id=s.specialization_id JOIN users as u on u.user_id=d.user_id order by clinic_count desc
create table clinics
(
    clinic_id int auto_increment primary key,
    doctor_id int not null,
    address varchar(500)  not null,
    city_id int not null,
    contact char(10) not null,
    consultation_fee int not null,
    constraint fk_clinics_doctors foreign key (doctor_id) references doctors (doctor_id),
    constraint fk_clinics_cities foreign key (city_id) references cities (city_id)
);

 insert into clinics(clinic_name,doctor_id,address,city_id,contact,consultation_fee) values(?,?,?,?,?,?);
select * from clinics as c JOIN cities as ct on c.city_id=ct.city_id where doctor_id=?


-- Insert additional Clinic Data
INSERT INTO clinics (clinic_name, doctor_id, address, city_id, contact, consultation_fee) VALUES
-- For Doctor 14 (General Physician)
('Visakha Health Care', 14, 'Opposite YMCA, Visakhapatnam, 530016', 1, '9876543220', 600),
('City Health Clinic', 14, 'Near Railway Station, Vijayawada, 520003', 2, '9876543221', 700),
('Apollo Health Clinic', 14, 'Opposite Petrol Pump, Bhopal, 462002', 15, '9876543222', 900),
('Bhopal City Clinic', 14, 'Near Raja Bhoj Airport, Bhopal, 462003', 15, '9876543223', 800),

-- For Doctor 15 (Cardiologist)
('Cardio Care Clinic', 15, 'Behind Bus Stand, Vijayawada, 520008', 2, '9876543230', 1500),
('Heart & Health Clinic', 15, 'Near Indira Gandhi Park, Indore, 452001', 16, '9876543231', 1800),
('Cardio Plus Clinic', 15, 'Near 10th Mile, Indore, 452002', 16, '9876543232', 2000),
('Heart Health Center', 15, 'Opposite Super Mall, Bhopal, 462004', 15, '9876543233', 1700),

-- For Doctor 16 (Dermatologist)
('Healthy Skin Clinic', 16, 'Near MG Road, Itanagar, 791102', 3, '9876543240', 1200),
('Glowing Skin Care', 16, 'Near IG Park, Dispur, 781010', 4, '9876543241', 1300),
('Skin Rejuvenate Clinic', 16, 'Behind Shankar Market, Indore, 452003', 16, '9876543242', 1500),
('Derma Solutions Clinic', 16, 'Near Bhopal Lake, Bhopal, 462005', 15, '9876543243', 1400),

-- For Doctor 17 (Orthopedic Surgeon)
('Bone & Joint Care Clinic', 17, 'Near Park View Hotel, Dispur, 781005', 4, '9876543250', 1100),
('Indore Bone Clinic', 17, 'Near Chappal Market, Indore, 452004', 16, '9876543251', 1600),
('Ortho Relief Clinic', 17, 'Near Rani Kheda, Bhopal, 462006', 15, '9876543252', 1300),
('Bhopal Bone Clinic', 17, 'Near Upper Lake, Bhopal, 462007', 15, '9876543253', 1200),

-- For Doctor 18 (Pediatrician)
('Kids Health Clinic', 18, 'Near R K Studios, Patna, 800002', 5, '9876543260', 800),
('Child Care Clinic', 18, 'Behind Patna Junction, Patna, 800003', 5, '9876543261', 900),
('Pediatric Care Center', 18, 'Near Sarafa Market, Indore, 452005', 16, '9876543262', 1000),
('Bhopal Child Clinic', 18, 'Near Mandideep, Bhopal, 462008', 15, '9876543263', 950);


create table clinic_shifts
(
    clinic_shift_id int auto_increment primary key,
    clinic_id int not null,
    start_time time not null,
    end_time time not null,
    max_appointment int not null,
    constraint fk_clinic_shifts_clinics foreign key (clinic_id) references clinics (clinic_id)
);

insert into clinic_shifts(clinic_id,start_time,end_time,max_appointment) values(?,?,?,?);

create table clinic_days
(
    clinic_day_id int auto_increment primary key,
    clinic_id int not null,
    day_id int not null,
    constraint fk_clinic_day_clinic foreign key (clinic_id) references clinics (clinic_id),
    constraint fk_clinic_day_days foreign key (day_id) references days (day_id)
);

INSERT INTO clinic_days (clinic_id, day_id) VALUES
-- Clinic 22
(22, 2), (22, 3), (22, 4), (22, 5), (22, 6), (22, 7),
-- Clinic 23
(23, 2), (23, 3), (23, 4), (23, 5), (23, 6),
-- Clinic 24
(24, 1), (24, 2), (24, 3), (24, 5), (24, 6), (24, 7),
-- Clinic 25
(25, 2), (25, 3), (25, 4), (25, 6), (25, 7),
-- Clinic 26
(26, 2), (26, 3), (26, 4), (26, 5), (26, 6), (26, 7),
-- Clinic 27
(27, 2), (27, 4), (27, 5), (27, 6), (27, 7),
-- Clinic 28
(28, 2), (28, 3), (28, 4), (28, 5), (28, 6), (28, 7),
-- Clinic 29
(29, 2), (29, 3), (29, 4), (29, 5),
-- Clinic 30
(30, 1), (30, 2), (30, 3), (30, 5), (30, 6), (30, 7),
-- Clinic 31
(31, 2), (31, 3), (31, 4), (31, 6), (31, 7),
-- Clinic 32
(32, 2), (32, 3), (32, 4), (32, 5), (32, 6),
-- Clinic 33
(33, 2), (33, 3), (33, 5), (33, 6), (33, 7),
-- Clinic 34
(34, 2), (34, 4), (34, 5), (34, 6), (34, 7),
-- Clinic 35
(35, 2), (35, 3), (35, 4), (35, 5), (35, 6),
-- Clinic 36
(36, 2), (36, 3), (36, 4), (36, 5), (36, 6), (36, 7),
-- Clinic 37
(37, 2), (37, 3), (37, 4), (37, 5),
-- Clinic 38
(38, 2), (38, 4), (38, 5), (38, 6), (38, 7),
-- Clinic 39
(39, 2), (39, 3), (39, 4), (39, 5), (39, 6), (39, 7),
-- Clinic 40
(40, 1), (40, 2), (40, 3), (40, 4), (40, 5), (40, 6),
-- Clinic 41
(41, 2), (41, 3), (41, 4), (41, 6), (41, 7);


 insert into clinic_days(clinic_id,day_id) values(?,?);

 select * from clinic_days as cd JOIN days as d on cd.day_id=d.day_id where clinic_id=14;
 
create table clinic_pics
(
    clinic_pic_id int auto_increment primary key,
    clinic_id int not null,
    pic_path char(255) not null,
    constraint fk_clinic_pic_clinics foreign key (clinic_id) references clinics (clinic_id)
);

insert into clinic_pics(clinic_id,pic_path) values(?,?);

create table appointments
(
    appointment_id int auto_increment primary key,
    patient_id int  not null,
    appointment_date date not null,
    clinic_shift_id int not null,
    status_id int not null,
    constraint fk_appointments_patients foreign key (patient_id) references patients (patient_id),   
    constraint fk_appointments_clinic_shift foreign key (clinic_shift_id) references clinic_shifts (clinic_shift_id),   
    constraint fk_appointments_status foreign key (status_id) references status (status_id)  
);


select a.appointment_id,
    a.patient_id,
    a.appointment_date,
    a.clinic_shift_id,
    a.status_id,
    cs.clinic_id,
    c.clinic_name,
    c.doctor_id,
    c.address,
    c.city_id,
    c.contact,
    c.consultation_fee,
    ct.city,
    d.doctor_id,
    d.specialization_id,
    d.user_id,
    s.specialization,
    u.name,
    u.profile_pic
    FROM appointments AS a JOIN clinic_shifts AS cs ON a.clinic_shift_id=cs.clinic_shift_id 
    JOIN clinics AS c ON cs.clinic_id=c.clinic_id 
    JOIN cities AS ct ON c.city_id = ct.city_id
    JOIN doctors AS d ON d.doctor_id=c.doctor_id
    JOIN specializations AS s ON d.specialization_id = s.specialization_id
    JOIN users as u ON d.user_id = u.user_id
    WHERE patient_id = 4;

alter table appointments add column reason text not null ;

SELECT COUNT(*) AS total_appointments FROM appointments a JOIN clinic_shifts cs ON a.clinic_shift_id = cs.clinic_shift_id WHERE cs.clinic_id = ?

SELECT 
    a.appointment_id, a.appointment_date, a.reason, a.status_id, a.patient_id,
    u.name AS patient_name, u.email AS patient_email, u.contact AS patient_contact, u.city_id,
    p.gender, p.blood_group, p.weight, p.height, p.profile_pic,
    c.start_time, c.end_time, 
    s.status,
    ct.city
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN users u ON p.user_id = u.user_id
JOIN cities ct ON u.city_id = ct.city_id
JOIN clinic_shifts c ON a.clinic_shift_id = c.clinic_shift_id
JOIN status s ON a.status_id = s.status_id
WHERE a.appointment_date = '2025-04-09' AND a.clinic_shift_id = 19



insert into appointments(patient_id,appointment_date,clinic_shift_id,status_id) values(?,?,?,?)

-- ~~~~~~~~~~ should normalize this table ~~~~~~~~~~~~~~
-- create table prescriptions
-- (
--     prescription_id int auto_increment primary key,
--     appointment_id int  not null,
--     medicine_denomination_id int not null,
--     dosage char(50) not null,
--     constraint fk_prescription_appointment foreign key (appointment_id) references appointments (appointment_id),   
--     constraint fk_prescription_medicines foreign key (medicine_denomination_id) references medicine_denominations (medicine_denomination_id)   
-- );

-- alter table prescriptions add column special_instructions varchar(500) not null;
-- alter table prescriptions add column prescription_code varchar(50) not null;

-- INSERT INTO prescriptions (prescription_code, appointment_id, medicine_denomination_id, dosage, special_instructions) VALUES (?, ?, ?, ?, ?)

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

CREATE TABLE prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    prescription_code VARCHAR(50) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);


SELECT p.prescription_id, p.appointment_id, p.prescription_code, p.created_at, p.special_instructions,
    a.patient_id, a.clinic_shift_id, a.reason, pt.patient_id, u_patient.user_id AS patient_user_id, u_patient.name AS patient_name, 
       cs.clinic_id, c.clinic_name, c.doctor_id, c.address AS clinic_address, c.city_id, c.contact, ct.city, ct.state_id, st.state, 
       d.doctor_id, u_doctor.user_id AS doctor_user_id, u_doctor.name AS doctor_name, d.specialization_id, d.qualification, d.experience, sp.specialization, 
       pi.item_id, pi.medicine_denomination_id, pi.dosage, md.medicine_format_id, md.quantity, md.unit_id,  u.unit_id, u.name AS unit, 
       mf.medicine_id, mf.format_id, m.name AS medicine_name, f.name AS format 
FROM prescriptions p 
JOIN appointments a ON p.appointment_id = a.appointment_id 
JOIN patients pt ON a.patient_id = pt.patient_id 
JOIN users u_patient ON pt.user_id = u_patient.user_id 
JOIN clinic_shifts cs ON a.clinic_shift_id = cs.clinic_shift_id 
JOIN clinics c ON cs.clinic_id = c.clinic_id 
JOIN cities ct ON c.city_id = ct.city_id 
JOIN states st ON ct.state_id = st.state_id 
JOIN doctors d ON c.doctor_id = d.doctor_id 
JOIN users u_doctor ON d.user_id = u_doctor.user_id 
LEFT JOIN specializations sp ON d.specialization_id = sp.specialization_id 
LEFT JOIN prescription_items pi ON pi.prescription_id = p.prescription_id 
LEFT JOIN medicine_denominations md ON pi.medicine_denomination_id = md.medicine_denomination_id 
LEFT JOIN medicine_formats mf ON md.medicine_format_id = mf.medicine_format_id 
LEFT JOIN units u ON md.unit_id = u.unit_id 
LEFT JOIN medicines m ON mf.medicine_id = m.medicine_id 
LEFT JOIN formats f ON mf.format_id = f.format_id 
WHERE p.appointment_id = 19;

select a.appointment_id, a.appointment_date, a.patient_id, a.clinic_shift_id, a.reason , cs.clinic_id , cs.clinic_shift_id, c.clinic_name , c.doctor_id , c.address AS clinic_address , c.city_id, ct.city,
    d.doctor_id, d.user_id , u.name AS doctor_name ,p.prescription_code
    FROM appointments a 
    JOIN prescriptions p ON a.appointment_id = p.appointment_id
    JOIN clinic_shifts cs ON a.clinic_shift_id = cs.clinic_shift_id
    JOIN clinics c ON cs.clinic_id = c.clinic_id
    JOIN doctors d ON c.doctor_id = d.doctor_id
    JOIN users u ON d.user_id = u.user_id
    JOIN cities ct ON c.city_id = ct.city_id
    WHERE a.patient_id= 5;



CREATE TABLE prescription_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    prescription_id INT NOT NULL,
    medicine_denomination_id INT NOT NULL,
    dosage INT NOT NULL,
    FOREIGN KEY (prescription_id) REFERENCES prescriptions(prescription_id),
    FOREIGN KEY (medicine_denomination_id) REFERENCES medicine_denominations(medicine_denomination_id)
);




 



