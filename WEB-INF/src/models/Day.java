package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConnect;

public class Day {
    private Integer dayId;
    private String name;

    

    public Day(Integer dayId, String name) {
        this.dayId = dayId;
        this.name = name;
    }

    public static ArrayList<Day> collectAllDays() {
        ArrayList<Day> days = new ArrayList<>();

        Connection con = DBConnect.getConnection();
        String query = "select * from days";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                days.add(new Day(rs.getInt("day_id"), rs.getString("name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return days;
    }
    
    public Integer getDayId() {
        return dayId;
    }
    public void setDayId(Integer dayId) {
        this.dayId = dayId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
