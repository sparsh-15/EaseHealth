package models;

public class Prescription {
    private Integer prescriptionId;
    private Appointment appointment;
    private MedicineDenomination medicineDenomination;
    private String dosage;

    public Integer getPrescriptionId() {
        return prescriptionId;
    }
    public void setPrescriptionId(Integer prescriptionId) {
        this.prescriptionId = prescriptionId;
    }
    public Appointment getAppointment() {
        return appointment;
    }
    public void setAppointment(Appointment appointment) {
        this.appointment = appointment;
    }
    public MedicineDenomination getMedicineDenomination() {
        return medicineDenomination;
    }
    public void setMedicineDenomination(MedicineDenomination medicineDenomination) {
        this.medicineDenomination = medicineDenomination;
    }
    public String getDosage() {
        return dosage;
    }
    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

    
}
