package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConnect;

public class ClinicDay {
    private Integer clinicDay;
    private Clinic clinic;
    private Day day;

    public static void saveClinicDays(int clinicId, ArrayList<Integer> days) {
        Connection con = DBConnect.getConnection();
        String query = " insert into clinic_days(clinic_id,day_id) values(?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, clinicId);

            for(Integer day : days) {
                ps.setInt(2, day);
                ps.executeUpdate();
            }

        }catch(SQLException e){
            e.printStackTrace();
        }

    }

    public Integer getClinicDay() {
        return clinicDay;
    }
    public void setClinicDay(Integer clinicDay) {
        this.clinicDay = clinicDay;
    }
    public Clinic getClinic() {
        return clinic;
    }
    public void setClinic(Clinic clinic) {
        this.clinic = clinic;
    }
    public Day getDay() {
        return day;
    }
    public void setDay(Day day) {
        this.day = day;
    }
}
