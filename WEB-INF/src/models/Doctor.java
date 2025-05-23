package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConnect;

public class Doctor {

    // ~~~~~~~~~~~ Field Summary ~~~~~~~~~~~
    private Integer doctorId;
    private User user;
    private String gender;
    private Specialization specialization;
    private String qualification;
    private Integer experience;
    private String certificate;
    private Integer clinicCount;

    

    public Doctor(User user) {
        this.user = user;
    }

    public Doctor(User user, Specialization specialization) {
        this.user = user;
        this.specialization = specialization;
    }

    public Doctor(Integer doctorId) {
        this.doctorId = doctorId;
    }

    public Doctor(User user, String gender, Specialization specialization, String qualification, Integer experience,
            String certificate) {
        this.user = user;
        this.gender = gender;
        this.specialization = specialization;
        this.qualification = qualification;
        this.experience = experience;
        this.certificate = certificate;
    }

    public Doctor(Integer doctorId, User user, String gender, Specialization specialization, String qualification,
            Integer experience, String certificate, Integer clinicCount) {
        this.doctorId = doctorId;
        this.user = user;
        this.gender = gender;
        this.specialization = specialization;
        this.qualification = qualification;
        this.experience = experience;
        this.certificate = certificate;
        this.clinicCount = clinicCount;
    }

    public Doctor() {
    }

    public static ArrayList<Doctor> collectAllDoctors() {
        ArrayList<Doctor> doctors = new ArrayList<>();

        Connection con = DBConnect.getConnection();
        String query = "select * from doctors as d JOIN specializations as s on d.specialization_id=s.specialization_id JOIN users as u on u.user_id=d.user_id JOIN cities as ct on u.city_id=ct.city_id order by clinic_count desc";

        try {
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                doctors.add(new Doctor(rs.getInt("doctor_id"),
                        new User(rs.getString("name"), rs.getString("contact"), new City(rs.getString("city")),
                                rs.getString("address"), rs.getString("profile_pic")),rs.getString("gender"),
                        new Specialization(rs.getInt("specialization_id"), rs.getString("specialization")),
                        rs.getString("qualification"), rs.getInt("experience"), rs.getString("certificate"),
                        rs.getInt("clinic_count")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return doctors;
    }

    public void updateClinicCount(int doctorId) {
        try {
            Connection con = DBConnect.getConnection();

            String query = "UPDATE doctors SET clinic_count = (SELECT COUNT(*) FROM clinics WHERE doctor_id = ?) WHERE doctor_id = ?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, doctorId);
            ps.setInt(2, doctorId);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Boolean savedoctorDetails() {
        Boolean flag = false;
        try {
            Connection con = DBConnect.getConnection();

            String query = "insert into doctors (user_id, gender, specialization_id, qualification, experience,certificate) value (?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, user.getUserId());
            ps.setString(2, gender);
            ps.setInt(3, specialization.getSpecializationId());
            ps.setString(4, qualification);
            ps.setInt(5, experience);
            ps.setString(6, certificate);

            int res = ps.executeUpdate();
            if (res == 1) {
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Doctor fetchCheckDoctorDetails(User user) {
        try {
            Connection con = DBConnect.getConnection();

            String query = "select * from doctors where user_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, user.getUserId());

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                doctorId = rs.getInt("doctor_id");
                gender = rs.getString("gender");
                specialization = new Specialization(rs.getInt("specialization_id"));
                qualification = rs.getString("qualification");
                experience = rs.getInt("experience");
                certificate = rs.getString("certificate");
                clinicCount = rs.getInt("clinic_count");

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return this;
    }

    public Integer getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Specialization getSpecialization() {
        return specialization;
    }

    public void setSpecialization(Specialization specialization) {
        this.specialization = specialization;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public Integer getExperience() {
        return experience;
    }

    public void setExperience(Integer experience) {
        this.experience = experience;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    public Integer getClinicCount() {
        return clinicCount;
    }

    public void setClinicCount(Integer clinicCount) {
        this.clinicCount = clinicCount;
    }
}