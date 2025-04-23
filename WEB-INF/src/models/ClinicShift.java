package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import utils.DBConnect;

public class ClinicShift {
    private Integer clinicShiftId;
    private Clinic clinic;
    private Timestamp startTime;
    private Timestamp endTime;
    private Integer maxAppointment;

    public ClinicShift(Integer clinicShiftId, Clinic clinic, Timestamp startTime, Timestamp endTime,
            Integer maxAppointment) {
        this.clinicShiftId = clinicShiftId;
        this.clinic = clinic;
        this.startTime = startTime;
        this.endTime = endTime;
        this.maxAppointment = maxAppointment;
    }
     
    public ClinicShift(Integer clinicShiftId) {
        this.clinicShiftId = clinicShiftId;
    }

    public ClinicShift(Clinic clinic, Timestamp startTime, Timestamp endTime, Integer maxAppointment) {
        this.clinic = clinic;
        this.startTime = startTime;
        this.endTime = endTime;
        this.maxAppointment = maxAppointment;
    }

    public ClinicShift(Clinic clinic, Timestamp startTime, Timestamp endTime) {
        this.clinic = clinic;
        this.startTime = startTime;
        this.endTime = endTime;
    }


    
    public Boolean SaveClinicShift() {
        Boolean flag = false;
        Connection con = DBConnect.getConnection();
        String query = "insert into clinic_shifts(clinic_id,start_time,end_time,max_appointment) values(?,?,?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, clinic.getClinicId());
            ps.setTimestamp(2, startTime);
            ps.setTimestamp(3, endTime);
            ps.setInt(4, maxAppointment);

            int res = ps.executeUpdate();
            if (res > 0) {
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static Boolean collectClinicShifts(ArrayList<Clinic> clinics) {
        Boolean flag = false;
        String query = "select * from clinic_shifts where clinic_id=?";

        for (Clinic clinic : clinics) {
            try {
                Connection con = DBConnect.getConnection();
                PreparedStatement ps = con.prepareStatement(query);

                ps.setInt(1, clinic.getClinicId());
                ResultSet rs = ps.executeQuery();
                ArrayList<ClinicShift> clinicShifts = new ArrayList<>();
                while (rs.next()) {
                    clinicShifts.add(new ClinicShift(rs.getInt("clinic_shift_id"), new Clinic(rs.getInt("clinic_id")),
                            rs.getTimestamp("start_time"), rs.getTimestamp("end_time"), rs.getInt("max_appointment")));
                    flag = true;
                }
                clinic.setClinicShifts(clinicShifts);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return flag;
    }
     

    public static ArrayList<ClinicShift> collectClinicShifts(int clinicId) {
        ArrayList<ClinicShift> clinicShifts = new ArrayList<>();
        String query = "select * from clinic_shifts where clinic_id=?";

            try {
                Connection con = DBConnect.getConnection();
                PreparedStatement ps = con.prepareStatement(query);

                ps.setInt(1, clinicId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    clinicShifts.add(new ClinicShift(rs.getInt("clinic_shift_id"), new Clinic(rs.getInt("clinic_id")),
                            rs.getTimestamp("start_time"), rs.getTimestamp("end_time"), rs.getInt("max_appointment")));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        
        return clinicShifts;
    }

    public Integer getClinicShiftId() {
        return clinicShiftId;
    }

    public void setClinicShiftId(Integer clinicShiftId) {
        this.clinicShiftId = clinicShiftId;
    }

    public Clinic getClinic() {
        return clinic;
    }

    public void setClinic(Clinic clinic) {
        this.clinic = clinic;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public Integer getMaxAppointment() {
        return maxAppointment;
    }

    public void setMaxAppointment(Integer maxAppointment) {
        this.maxAppointment = maxAppointment;
    }

}
