package models;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import utils.DBConnect;

public class Prescription {
    private Integer prescriptionId;
    private Appointment appointment;
    private String prescriptionCode;
    private Timestamp createdAt;
    private String specialInstructions;

    private ArrayList<PrescriptionItem> prescriptionItems;

    

    public Prescription(Integer prescriptionId, Appointment appointment, String prescriptionCode) {
        this.prescriptionId = prescriptionId;
        this.appointment = appointment;
        this.prescriptionCode = prescriptionCode;
    }

    public int savePrescription() {
        int generatedId = -1;

        Connection con = DBConnect.getConnection();
        String query = "INSERT INTO prescriptions (appointment_id, prescription_code, special_instructions) VALUES (?, ?, ?)";

        try {
            PreparedStatement ps = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setInt(1, appointment.getAppointmentId());
            ps.setString(2, prescriptionCode);
            ps.setString(3, specialInstructions);

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    generatedId = rs.getInt(1);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return generatedId;
    }

    public static ArrayList<Prescription> collectPrescriptionDetails(int appointmentId) {
        Map<Integer, Prescription> prescriptionMap = new HashMap<>();
        Connection con = DBConnect.getConnection();

        String query = "select p.prescription_id, p.appointment_id, p.prescription_code, p.created_at, p.special_instructions, "
                +
                "a.patient_id , a.clinic_shift_id , a.reason, " +
                "pt.patient_id, u_patient.user_id AS patient_user_id, u_patient.name AS patient_name, " +
                "cs.clinic_id, c.clinic_name, c.doctor_id, c.address AS clinic_address, c.city_id, c.contact, " +
                "ct.city, ct.state_id, " +
                "st.state , " +
                "d.doctor_id, u_doctor.user_id AS doctor_user_id, u_doctor.name AS doctor_name, d.specialization_id, d.qualification, d.experience, "
                +
                "sp.specialization, " +
                "pi.item_id, pi.medicine_denomination_id, pi.dosage, " +
                "md.medicine_format_id, md.quantity, md.unit_id, " +
                "u.unit_id , u.name AS unit , " +
                "mf.medicine_id, mf.format_id, m.name AS medicine_name, f.name AS format " +
                "FROM prescriptions p " +
                "JOIN appointments a ON p.appointment_id = a.appointment_id " +
                "JOIN patients pt ON a.patient_id = pt.patient_id " +
                "JOIN users u_patient ON pt.user_id = u_patient.user_id " +

                "JOIN clinic_shifts cs ON a.clinic_shift_id = cs.clinic_shift_id " +
                "JOIN clinics c ON cs.clinic_id = c.clinic_id " +
                "JOIN cities ct ON c.city_id = ct.city_id " +
                "JOIN states st ON ct.state_id = st.state_id " +

                "JOIN doctors d ON c.doctor_id = d.doctor_id " +
                "JOIN users u_doctor ON d.user_id = u_doctor.user_id " +
                "LEFT JOIN specializations sp ON d.specialization_id = sp.specialization_id " +

                "LEFT JOIN prescription_items pi ON pi.prescription_id = p.prescription_id " +
                "LEFT JOIN medicine_denominations md ON pi.medicine_denomination_id = md.medicine_denomination_id " +
                "LEFT JOIN medicine_formats mf ON md.medicine_format_id = mf.medicine_format_id " +
                "LEFT JOIN units u ON md.unit_id = u.unit_id " +
                "LEFT JOIN medicines m ON mf.medicine_id = m.medicine_id " +
                "LEFT JOIN formats f ON mf.format_id = f.format_id " +
                "WHERE p.appointment_id=?";

        try {

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, appointmentId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("prescription_id");
                Prescription prescription = prescriptionMap.get(pid);

                if (prescription == null) {
                    prescription = new Prescription();
                    prescription.setPrescriptionId(pid);
                    prescription.setPrescriptionCode(rs.getString("prescription_code"));
                    prescription.setCreatedAt(rs.getTimestamp("created_at"));
                    prescription.setSpecialInstructions(rs.getString("special_instructions"));

                    // set appointment
                    Appointment appointment = new Appointment();
                    appointment.setAppointmentId(rs.getInt("appointment_id"));
                    appointment.setReason(rs.getString("reason"));
                    prescription.setAppointment(appointment);

                    User patient = new User();
                    patient.setUserId(rs.getInt("patient_user_id"));
                    patient.setName(rs.getString("patient_name"));

                    Patient patientObj = new Patient();
                    patientObj.setPatientId(rs.getInt("patient_id"));
                    patientObj.setUser(patient);
                    appointment.setPatient(patientObj);

                    User doctor = new User();
                    doctor.setUserId(rs.getInt("doctor_user_id"));
                    doctor.setName(rs.getString("doctor_name"));

                    Doctor doctorObj = new Doctor();
                    doctorObj.setDoctorId(rs.getInt("doctor_id"));
                    doctorObj.setUser(doctor);
                    doctorObj.setQualification(rs.getString("qualification"));
                    doctorObj.setExperience(rs.getInt("experience"));

                    Specialization specialization = new Specialization();
                    specialization.setSpecializationId(rs.getInt("specialization_id"));
                    specialization.setspecialization(rs.getString("specialization"));
                    doctorObj.setSpecialization(specialization);

                    Clinic clinic = new Clinic();
                    clinic.setClinicId(rs.getInt("clinic_id"));
                    clinic.setClinicName(rs.getString("clinic_name"));
                    clinic.setAddress(rs.getString("clinic_address"));
                    clinic.setContact(rs.getString("contact"));
                    clinic.setDoctor(doctorObj);

                    City city = new City();
                    city.setCityId(rs.getInt("city_id"));
                    city.setCity(rs.getString("city"));
                    clinic.setCity(city);

                    State state = new State();
                    state.setState(rs.getString("state"));
                    state.setStateId(rs.getInt("state_id"));
                    city.setState(state);

                    ClinicShift clinicShift = new ClinicShift();
                    clinicShift.setClinicShiftId(rs.getInt("clinic_shift_id"));
                    clinicShift.setClinic(clinic);

                    appointment.setClinicShift(clinicShift);
                    prescription.setAppointment(appointment);

                    prescription.setPrescriptionItems(new ArrayList<>());
                    prescriptionMap.put(pid, prescription);
                }

                int itemId = rs.getInt("item_id");
                if (itemId != 0) {
                    PrescriptionItem item = new PrescriptionItem();
                    item.setItemId(itemId);
                    item.setDosage(rs.getInt("dosage"));

                    MedicineDenomination medicineDenomination = new MedicineDenomination();
                    medicineDenomination.setMedicineDenominationId(rs.getInt("medicine_denomination_id"));
                    medicineDenomination.setQuantity(rs.getInt("quantity"));
                    item.setMedicineDenomination(medicineDenomination);

                    MedicineFormat mf = new MedicineFormat();
                    mf.setMedicineFormatId(rs.getInt("medicine_format_id"));
                    medicineDenomination.setMedicineFormat(mf);

                    Unit unit = new Unit();
                    unit.setUnitId(rs.getInt("unit_id"));
                    unit.setName(rs.getString("unit"));
                    medicineDenomination.setUnit(unit);

                    Format format = new Format();
                    format.setFormatId(rs.getInt("format_id"));
                    format.setName(rs.getString("format"));
                    mf.setFormat(format);

                    Medicine medicine = new Medicine();
                    medicine.setName(rs.getString("medicine_name"));
                    mf.setMedicine(medicine);
                    medicineDenomination.setMedicineFormat(mf);

                    prescription.getPrescriptionItems().add(item);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new ArrayList<>(prescriptionMap.values());
    }

    public static ArrayList<Prescription> getPrescriptionsbyPatientId(int patientId) {
        ArrayList<Prescription> prescriptions = new ArrayList<>();

        Connection con = DBConnect.getConnection();

        String query = "SELECT a.appointment_id, a.appointment_date, a.patient_id, a.clinic_shift_id, a.reason, " +
                "cs.clinic_id, cs.clinic_shift_id, c.clinic_name, c.doctor_id, c.address AS clinic_address, " +
                "c.city_id, ct.city, d.doctor_id, d.user_id, u.name AS doctor_name, p.prescription_code, p.prescription_id " +
                "FROM appointments a " +
                "JOIN prescriptions p ON a.appointment_id = p.appointment_id " +
                "JOIN clinic_shifts cs ON a.clinic_shift_id = cs.clinic_shift_id " +
                "JOIN clinics c ON cs.clinic_id = c.clinic_id " +
                "JOIN doctors d ON c.doctor_id = d.doctor_id " +
                "JOIN users u ON d.user_id = u.user_id " +
                "JOIN cities ct ON c.city_id = ct.city_id " +
                "WHERE a.patient_id = ?";

        try {
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, patientId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                prescriptions.add(new Prescription(rs.getInt("prescription_id"),
                                    new Appointment(rs.getInt("appointment_id"),
                                    new Patient(rs.getInt("patient_id")),
                                    rs.getDate("appointment_date"),
                                    new ClinicShift(rs.getInt("clinic_shift_id"),
                                        new Clinic(rs.getInt("clinic_id"),rs.getString("clinic_name"),
                                            new Doctor(new User(rs.getString("doctor_name"))),
                                            rs.getString("clinic_address"),
                                            new City(rs.getString("city")))),
                                    rs.getString("reason")),
                                rs.getString("prescription_code")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return prescriptions;
    }

    public Prescription(Integer prescriptionId) {
        this.prescriptionId = prescriptionId;
    }

    public Prescription() {
    }

    public Integer getPrescriptionId() {
        return prescriptionId;
    }

    public void setPrescriptionId(Integer prescriptionId) {
        this.prescriptionId = prescriptionId;
    }

    public Appointment getAppointment() {
        return appointment;
    }

    public void setAppointment(Appointment appointment) {
        this.appointment = appointment;
    }

    public String getPrescriptionCode() {
        return prescriptionCode;
    }

    public void setPrescriptionCode(String prescriptionCode) {
        this.prescriptionCode = prescriptionCode;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public String getSpecialInstructions() {
        return specialInstructions;
    }

    public void setSpecialInstructions(String specialInstructions) {
        this.specialInstructions = specialInstructions;
    }

    public ArrayList<PrescriptionItem> getPrescriptionItems() {
        return prescriptionItems;
    }

    public void setPrescriptionItems(ArrayList<PrescriptionItem> prescriptionItems) {
        this.prescriptionItems = prescriptionItems;
    }

}
