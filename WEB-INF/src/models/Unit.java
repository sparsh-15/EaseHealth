package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConnect;

public class Unit {
    private Integer unitId;
    private String name;

    public Unit(Integer unitId, String name) {
        this.unitId = unitId;
        this.name = name;
    }

    

    public Unit(Integer unitId) {
        this.unitId = unitId;
    }



    public static ArrayList<Unit> collectAllUnits() {
        ArrayList<Unit> units = new ArrayList<>();

        Connection con = DBConnect.getConnection();
        String query = "select * from units";

        try {
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                units.add(new Unit(rs.getInt("unit_id"), rs.getString("name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return units;
    }

    public Integer getUnitId() {
        return unitId;
    }

    public void setUnitId(Integer unitId) {
        this.unitId = unitId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
