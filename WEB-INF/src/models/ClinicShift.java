package models;

import java.sql.Timestamp;

public class ClinicShift {
    private Integer clinicShiftId;
    private Clinic clinic;
    private Timestamp startTime;
    private Timestamp endTime;
    private Integer maxAppointment;

    


    public ClinicShift(Clinic clinic, Timestamp startTime, Timestamp endTime, Integer maxAppointment) {
        this.clinic = clinic;
        this.startTime = startTime;
        this.endTime = endTime;
        this.maxAppointment = maxAppointment;
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
