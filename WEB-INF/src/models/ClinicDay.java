package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConnect;

public class ClinicDay {
    private Integer clinicDay;
    private Clinic clinic;
    private Day day;

    

    public ClinicDay(Integer clinicDay, Day day) {
        this.clinicDay = clinicDay;
        this.day = day;
    }

    public static void saveClinicDays(int clinicId, ArrayList<Integer> days) {
        Connection con = DBConnect.getConnection();
        String query = " insert into clinic_days(clinic_id,day_id) values(?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, clinicId);

            for (Integer day : days) {
                ps.setInt(2, day);
                ps.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static Boolean collectAllClinicDays(ArrayList<Clinic> clinics) {
        Boolean flag = false;
        String query = "select * from clinic_days as cd JOIN days as d on cd.day_id=d.day_id where clinic_id=?";

        for (Clinic clinic : clinics) {
            try {
                Connection con = DBConnect.getConnection();
                PreparedStatement ps = con.prepareStatement(query);

                ps.setInt(1, clinic.getClinicId());
                ResultSet rs = ps.executeQuery();
                ArrayList<ClinicDay> clinicDays = new ArrayList<>();
                while (rs.next()) {
                    clinicDays.add(new ClinicDay(rs.getInt("clinic_day_id"),
                            new Day(rs.getInt("day_id"),rs.getString("name"))));
                    flag = true;
                }
                clinic.setClinicDays(clinicDays);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return flag;

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
