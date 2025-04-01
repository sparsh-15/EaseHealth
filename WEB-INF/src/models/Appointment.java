package models;

import java.sql.Date;

public class Appointment {
    private Integer appointmentId;
    private Patient patient;
    private Date appointmentDate;
    private ClinicShift clinicShift;
    private Status status;
    
    public Integer getAppointmentId() {
        return appointmentId;
    }
    public void setAppointmentId(Integer appointmentId) {
        this.appointmentId = appointmentId;
    }
    public Patient getPatient() {
        return patient;
    }
    public void setPatient(Patient patient) {
        this.patient = patient;
    }
    public Date getAppointmentDate() {
        return appointmentDate;
    }
    public void setAppointmentDate(Date appointmentDate) {
        this.appointmentDate = appointmentDate;
    }
    public ClinicShift getClinicShift() {
        return clinicShift;
    }
    public void setClinicShift(ClinicShift clinicShift) {
        this.clinicShift = clinicShift;
    }
    public Status getStatus() {
        return status;
    }
    public void setStatus(Status status) {
        this.status = status;
    }
}
