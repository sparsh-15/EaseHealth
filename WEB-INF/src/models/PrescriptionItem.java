package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import utils.DBConnect;

public class PrescriptionItem {
    private Integer itemId;
    private Prescription prescription;
    private MedicineDenomination medicineDenomination;
    private Integer dosage;

    public boolean savePrescriptionItem() {
        boolean isSaved = false;
        Connection con = DBConnect.getConnection();

        String query = "INSERT INTO prescription_items (prescription_id, medicine_denomination_id, dosage) VALUES (?, ?, ?)";
        try{
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, prescription.getPrescriptionId());
            ps.setInt(2, medicineDenomination.getMedicineDenominationId());
            ps.setInt(3, dosage);

            int res = ps.executeUpdate();
            if(res>0){
                isSaved = true;
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return isSaved;
    }


    public Integer getItemId() {
        return itemId;
    }
    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }
    
    public MedicineDenomination getMedicineDenomination() {
        return medicineDenomination;
    }
    public void setMedicineDenomination(MedicineDenomination medicineDenomination) {
        this.medicineDenomination = medicineDenomination;
    }
    public Integer getDosage() {
        return dosage;
    }
    public void setDosage(Integer dosage) {
        this.dosage = dosage;
    }
    public Prescription getPrescription() {
        return prescription;
    }
    public void setPrescription(Prescription prescription) {
        this.prescription = prescription;
    }


    
}   
