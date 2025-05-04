package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConnect;

public class Specialization {
    private Integer specializationId;
    private String specialization;

    

    public Specialization() {
    }



    public Specialization(Integer specializationId, String specialization) {
        this.specializationId = specializationId;
        this.specialization = specialization;
    }

    

    public Specialization(Integer specializationId) {
        this.specializationId = specializationId;
    }

    



    public Specialization(String specialization) {
        this.specialization = specialization;
    }



    public static ArrayList<Specialization> collectAllSpecializations() {
        ArrayList<Specialization> specializations = new ArrayList<>();

        Connection con = DBConnect.getConnection();
        String query = "select * from specializations";

        try {
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                specializations.add(new Specialization(rs.getInt("specialization_id"), rs.getString("specialization")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return specializations;
    }

    public String getspecialization() {
        return specialization;
    }

    public void setspecialization(String specialization) {
        this.specialization = specialization;
    }

    public Integer getSpecializationId() {
        return specializationId;
    }

    public void setSpecializationId(Integer specializationId) {
        this.specializationId = specializationId;
    }
}
