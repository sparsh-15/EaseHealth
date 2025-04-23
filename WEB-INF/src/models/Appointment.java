package models;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConnect;

public class Appointment {
    private Integer appointmentId;
    private Patient patient;
    private Date appointmentDate;
    private ClinicShift clinicShift;
    private Status status;
    private String reason;

    public Appointment(Integer appointmentId, Date appointmentDate, ClinicShift clinicShift,
            Status status) {
        this.appointmentId = appointmentId;
        this.appointmentDate = appointmentDate;
        this.clinicShift = clinicShift;
        this.status = status;
    }

    public Appointment(Patient patient, Date appointmentDate, ClinicShift clinicShift, String reason) {
        this.patient = patient;
        this.appointmentDate = appointmentDate;
        this.clinicShift = clinicShift;
        this.reason = reason;
    }


    public static ArrayList<Appointment> collectAppoinmentByDateShift(int clinicShiftId, Date appDate){
        ArrayList<Appointment> appointments = new ArrayList<>();

        Connection con = DBConnect.getConnection();
        
        String query = "";

        return appointments;
    }

    public static int getAppointmentsByClinic(int clinicId) {
        int appByClinic = 0;
        Connection con = DBConnect.getConnection();

        String query = "SELECT COUNT(*) AS total_appointments FROM appointments a JOIN clinic_shifts cs ON a.clinic_shift_id = cs.clinic_shift_id WHERE cs.clinic_id = ?";

        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, clinicId);

            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                appByClinic = rs.getInt("total_appointments");
            }
            
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return appByClinic;
    }

    // public static int getAppointmentCountGroupedByShift(int clinicId) {
    //     int appByClinic = 0;
    //     Connection con = DBConnect.getConnection();

    //     String query = "SELECT COUNT(*) AS total_appointments FROM appointments a JOIN clinic_shifts cs ON a.clinic_shift_id = cs.clinic_shift_id WHERE cs.clinic_id = ?";

    //     try{
    //         PreparedStatement ps = con.prepareStatement(query);
    //         ps.setInt(1, clinicId);

    //         ResultSet rs = ps.executeQuery();
    //         if(rs.next()) {
    //             appByClinic = rs.getInt("total_appointments");
    //         }
            
    //     }catch (SQLException e) {
    //         e.printStackTrace();
    //     }
    //     return appByClinic;
    // }


    public Boolean saveAppointment() {
        Boolean flag = false;
        Connection con = DBConnect.getConnection();
        String query = "insert into appointments(patient_id,appointment_date,clinic_shift_id,status_id,reason) values(?,?,?,?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, patient.getPatientId());
            ps.setDate(2, appointmentDate);
            ps.setInt(3, clinicShift.getClinicShiftId());
            ps.setInt(4, 1);
            ps.setString(5, reason);

            int res = ps.executeUpdate();

            if (res == 1) {
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }

    public static ArrayList<Appointment> collectAllAppointment(Integer patientId) {
        ArrayList<Appointment> appointments = new ArrayList<>();
        Connection con = DBConnect.getConnection();

        String query = "SELECT a.appointment_id, a.patient_id, a.appointment_date, a.clinic_shift_id, a.status_id, " +
                "cs.clinic_shift_id, cs.clinic_id, cs.start_time, cs.end_time, " +
                "c.clinic_name, c.doctor_id, c.address, c.city_id, c.contact, c.consultation_fee, " +
                "ct.city, d.doctor_id, d.specialization_id, d.user_id, " +
                "s.specialization, u.name, u.profile_pic, st.status " +
                "FROM appointments AS a " +
                "JOIN clinic_shifts AS cs ON a.clinic_shift_id = cs.clinic_shift_id " +
                "JOIN status AS st ON a.status_id = st.status_id " +
                "JOIN clinics AS c ON cs.clinic_id = c.clinic_id " +
                "JOIN cities AS ct ON c.city_id = ct.city_id " +
                "JOIN doctors AS d ON d.doctor_id = c.doctor_id " +
                "JOIN specializations AS s ON d.specialization_id = s.specialization_id " +
                "JOIN users AS u ON d.user_id = u.user_id " +
                "WHERE a.patient_id = ?";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, patientId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                appointments.add(new Appointment(rs.getInt("appointment_id"),
                        rs.getDate("appointment_date"),
                        new ClinicShift(
                                new Clinic(rs.getString("clinic_name"),
                                        new Doctor(
                                                new User(rs.getInt("user_id"), rs.getString("name"),
                                                        rs.getString("profile_pic")),
                                                new Specialization(rs.getString("specialization"))),
                                        rs.getString("address"), new City(rs.getString("city")),
                                        rs.getString("contact"), rs.getInt("consultation_fee")),
                                rs.getTimestamp("start_time"), rs.getTimestamp("end_time")),
                        new Status(rs.getString("status"))));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return appointments;
    }

    public Integer getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(Integer appointmentId) {
        this.appointmentId = appointmentId;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Date getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(Date appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public ClinicShift getClinicShift() {
        return clinicShift;
    }

    public void setClinicShift(ClinicShift clinicShift) {
        this.clinicShift = clinicShift;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    
}
