package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.DBConnect;

public class Patient {
    private Integer patientId;
    private User user;
    private String gender;
    private String bloodGroup;
    private Float weight;
    private Integer height;
    private String uid;
    private String profilePic;
  
    public Patient(User user, String gender, String bloodGroup, Float weight, Integer height, String uid,
            String profilePic) {
        this.user = user;
        this.gender = gender;
        this.bloodGroup = bloodGroup;
        this.weight = weight;
        this.height = height;
        this.uid = uid;
        this.profilePic = profilePic;
    }    

    public Patient(Integer patientId) {
        this.patientId = patientId;
    }

    public Patient() {
    }


    public Boolean savePatient() {
        Boolean flag = false;
        try {
            Connection con = DBConnect.getConnection();

            String query = "insert into patients (user_id, gender, blood_group, weight, height, uid, profile_pic) value (?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, user.getUserId());
            ps.setString(2, gender);
            ps.setString(3, bloodGroup);
            ps.setFloat(4, weight);
            ps.setInt(5, height);
            ps.setString(6, uid != null && !uid.isEmpty() ? uid : null);
            ps.setString(7, profilePic);

            int res = ps.executeUpdate();
            if (res == 1) {
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Patient fetchCheckPatientDetails(User user) {  
        try {
            Connection con = DBConnect.getConnection();

            String query = "select * from patients where user_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, user.getUserId());

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                patientId = rs.getInt("patient_id");
                gender = rs.getString("gender");
                bloodGroup = rs.getString("blood_group");
                weight = rs.getFloat("weight");
                height = rs.getInt("height");
                uid = rs.getString("uid");
                profilePic = rs.getString("profile_pic");

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return this;
    }


    public Integer getPatientId() {
        return patientId;
    }
    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
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
    public String getBloodGroup() {
        return bloodGroup;
    }
    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }
    public Float getWeight() {
        return weight;
    }
    public void setWeight(Float weight) {
        this.weight = weight;
    }
    public Integer getHeight() {
        return height;
    }
    public void setHeight(Integer height) {
        this.height = height;
    }
    public String getUid() {
        return uid;
    }
    public void setUid(String uid) {
        this.uid = uid;
    }
    public String getProfilePic() {
        return profilePic;
    }
    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }
}