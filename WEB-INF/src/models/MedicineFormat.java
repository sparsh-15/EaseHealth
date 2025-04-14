package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConnect;

public class MedicineFormat {
    private Integer medicineFormatId;
    private Medicine medicine;
    private Format format;

    public MedicineFormat(Integer medicineFormatId, Medicine medicine, Format format) {
        this.medicineFormatId = medicineFormatId;
        this.medicine = medicine;
        this.format = format;
    }

    public MedicineFormat(Integer medicineFormatId, Format format) {
        this.medicineFormatId = medicineFormatId;
        this.format = format;
    }

    

    public MedicineFormat(Integer medicineFormatId) {
        this.medicineFormatId = medicineFormatId;
    }

    public static ArrayList<MedicineFormat> collectAllMedicineFormat(Integer medicineId) {
        ArrayList<MedicineFormat> medicineFormats = new ArrayList<>();
        
        String query = "SELECT * FROM medicine_formats mf JOIN formats f ON mf.format_id = f.format_id WHERE mf.medicine_id = ?";
        
        try {
            Connection con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, medicineId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                medicineFormats
                        .add(new MedicineFormat(rs.getInt("medicine_format_id"), new Medicine(rs.getInt("medicine_id")),
                                new Format(rs.getInt("format_id"), rs.getString("name"))));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } 

        return medicineFormats;
    }

    public static Boolean collectAllMedicineFormat(ArrayList<Medicine> medicines) {
        Boolean flag = false;

        String query = "SELECT * FROM medicine_formats where medicine_id=?";

        for (Medicine medicine : medicines) {

            try {
                Connection con = DBConnect.getConnection();
                PreparedStatement ps = con.prepareStatement(query);

                ps.setInt(1, medicine.getMedicineId());
                ResultSet rs = ps.executeQuery();
                ArrayList<MedicineFormat> medicineFormats = new ArrayList<>();
                while (rs.next()) {
                    medicineFormats.add(new MedicineFormat(rs.getInt("medicine_format_id"),
                            new Format(rs.getInt("format_id"))));
                    flag = true;
                }
                medicine.setMedicineFormats(medicineFormats);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return flag;
    }

    public static Boolean saveMedicineFormat(Integer medicineId, String[] formats) {
        Connection con = DBConnect.getConnection();
        Boolean flag = false;
        String query = "insert into medicine_formats (medicine_id,format_id) values (?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, medicineId);
            
            for (String format : formats) {
                ps.setInt(2, Integer.parseInt(format));
                ps.executeUpdate();
                flag = true;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Integer getMedicineFormatId() {
        return medicineFormatId;
    }

    public void setMedicineFormatId(Integer medicineFormatId) {
        this.medicineFormatId = medicineFormatId;
    }

    public Medicine getMedicine() {
        return medicine;
    }

    public void setMedicine(Medicine medicine) {
        this.medicine = medicine;
    }

    public Format getFormat() {
        return format;
    }

    public void setFormat(Format format) {
        this.format = format;
    }

}
