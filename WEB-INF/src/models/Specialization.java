package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConnect;

public class Specialization {
    private Integer specializationId;
    private String name;

    

    public Specialization(Integer specializationId, String name) {
        this.specializationId = specializationId;
        this.name = name;
    }

    

    public Specialization(Integer specializationId) {
        this.specializationId = specializationId;
    }



    public static ArrayList<Specialization> collectAllSpecializations() {
        ArrayList<Specialization> specializations = new ArrayList<>();

        Connection con = DBConnect.getConnection();
        String query = "select * from specializations";

        try {
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                specializations.add(new Specialization(rs.getInt("specialization_id"), rs.getString("name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return specializations;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSpecializationId() {
        return specializationId;
    }

    public void setSpecializationId(Integer specializationId) {
        this.specializationId = specializationId;
    }
}
