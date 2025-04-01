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

create table clinic_shifts
(
    clinic_shift_id int auto_increment primary key,
    clinic_id int not null,
    start_time time not null,
    end_time time not null,
    max_appointment int not null,
    constraint fk_clinic_shifts_clinics foreign key (clinic_id) references clinics (clinic_id)
);

create table clinic_days
(
    clinic_day_id int auto_increment primary key,
    clinic_id int not null,
    day_id int not null,
    constraint fk_clinic_day_clinic foreign key (clinic_id) references clinics (clinic_id),
    constraint fk_clinic_day_days foreign key (day_id) references days (day_id)
);

 insert into clinic_days(clinic_id,day_id) values(?,?);
 
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

create table prescriptions
(
    prescription_id int auto_increment primary key,
    appointment_id int  not null,
    medicine_denomination_id int not null,
    dosage char(50) not null,
    constraint fk_prescription_appointment foreign key (appointment_id) references appointments (appointment_id),   
    constraint fk_prescription_medicines foreign key (medicine_denomination_id) references medicine_denominations (medicine_denomination_id)   
);




 



