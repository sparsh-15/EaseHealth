package models;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConnect;

public class MedicineDenomination {
    private Integer medicineDenominationId;
    private MedicineFormat medicineFormat;
    private Integer quantity;
    private Unit unit;
    
    public MedicineDenomination() {

    }


    public MedicineDenomination(Integer medicineDenominationId, MedicineFormat medicineFormat, Integer quantity,
            Unit unit) {
        this.medicineDenominationId = medicineDenominationId;
        this.medicineFormat = medicineFormat;
        this.quantity = quantity;
        this.unit = unit;
    }



    public static ArrayList<MedicineDenomination> collectAllDenomination(Integer medicineFormatId){
        ArrayList<MedicineDenomination> denominations = new ArrayList<>();
        Connection con = DBConnect.getConnection();   
        
        String query = "select * from medicine_denominations md join units u on md.unit_id=u.unit_id where medicine_format_id=?";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, medicineFormatId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                denominations.add(new MedicineDenomination(rs.getInt("medicine_denomination_id"),
                                    new MedicineFormat(rs.getInt("medicine_format_id")),
                                        rs.getInt("quantity"),new Unit(rs.getInt("unit_id"),rs.getString("name"))));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return denominations;
    }

    public static Boolean saveMedicineDenomination(Integer selectedFormatId,Integer[] quantities, Integer selectedUnit ) {
        Boolean flag = false;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hmsdb?user=root&password=1234");
            
            String query = "insert into medicine_denominations(medicine_format_id,unit_id,quantity) values(?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,selectedFormatId);
            ps.setInt(2,selectedUnit);
            
            for (Integer quantity : quantities) {
                ps.setInt(3, quantity);
                ps.executeUpdate();
                flag = true;
            }

        } catch(ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Integer getMedicineDenominationId() {
        return medicineDenominationId;
    }
    public void setMedicineDenominationId(Integer medicineDenominationId) {
        this.medicineDenominationId = medicineDenominationId;
    }
    
    public Integer getQuantity() {
        return quantity;
    }
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Unit getUnit() {
        return unit;
    }
    public void setUnit(Unit unit) {
        this.unit = unit;
    }

    public MedicineFormat getMedicineFormat() {
        return medicineFormat;
    }

    public void setMedicineFormat(MedicineFormat medicineFormat) {
        this.medicineFormat = medicineFormat;
    }

    

}