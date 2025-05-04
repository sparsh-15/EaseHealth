package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConnect;

public class Medicine {
    private Integer medicineId;
    private PharmaCompany pharmaCompany;
    private String name;
    private String description;
    private String ingredients;
    private String effectiveBodypart;
    private String sideEffects;
    private String warnings;

    ArrayList<MedicineFormat> medicineFormats;

    public Medicine() {

    }

    public Medicine(Integer medicineId) {
        this.medicineId = medicineId;
    }

    public Medicine(Integer medicineId, String name, String description, String ingredients, String effectiveBodypart,
            String sideEffects, String warnings) {
        this.medicineId = medicineId;
        this.name = name;
        this.description = description;
        this.ingredients = ingredients;
        this.effectiveBodypart = effectiveBodypart;
        this.sideEffects = sideEffects;
        this.warnings = warnings;
    }

    public Medicine(PharmaCompany pharmaCompany, String name, String description, String ingredients,
            String effectiveBodypart, String sideEffects, String warnings) {
        this.pharmaCompany = pharmaCompany;
        this.name = name;
        this.description = description;
        this.ingredients = ingredients;
        this.effectiveBodypart = effectiveBodypart;
        this.sideEffects = sideEffects;
        this.warnings = warnings;
    }

    // for pharma company
    public static ArrayList<Medicine> collectAllMedicines(PharmaCompany pharmaCompany) {
        ArrayList<Medicine> medicines = new ArrayList<>();

        try {
            Connection con = DBConnect.getConnection();

            String query = "select * from medicines where pharma_company_id=? order by medicine_id desc";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, pharmaCompany.getPharmaCompanyId());

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                medicines.add(new Medicine(rs.getInt("medicine_id"), rs.getString("name"), rs.getString("description"),
                        rs.getString("ingredients"), rs.getString("effective_bodypart"), rs.getString("side_effects"),
                        rs.getString("warnings")));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return medicines;
    }
    // for prescription

    public static ArrayList<Medicine> searchMedicines(String words) {
        ArrayList<Medicine> searchedMedicines = new ArrayList<>();

        String query = "SELECT * FROM medicines WHERE name LIKE ?";
        Connection con = DBConnect.getConnection();

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, words + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Medicine med = new Medicine();
                med.setMedicineId(rs.getInt("medicine_id"));
                med.setName(rs.getString("name"));
                med.setIngredients(rs.getString("ingredients"));
                searchedMedicines.add(med);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return searchedMedicines;
    }

    public Boolean saveMedicine(PharmaCompany pharmaDetails) {
        Boolean flag = false;
        try {
            Connection con = DBConnect.getConnection();

            String query = "insert into medicines(pharma_company_id,name,description,ingredients,effective_bodypart,side_effects,warnings) values (?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, pharmaCompany.getPharmaCompanyId());
            ps.setString(2, name);
            ps.setString(3, description);
            ps.setString(4, ingredients);
            ps.setString(5, effectiveBodypart);
            ps.setString(6, sideEffects);
            ps.setString(7, warnings);

            int res = ps.executeUpdate();
            if (res == 1) {
                PharmaCompany pharmaCompany = new PharmaCompany();
                pharmaCompany.updateMedicineCount(pharmaDetails.getPharmaCompanyId());
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Integer getMedicineId() {
        return medicineId;
    }

    public void setMedicineId(Integer medicineId) {
        this.medicineId = medicineId;
    }

    public PharmaCompany getPharmaCompany() {
        return pharmaCompany;
    }

    public void setPharmaCompany(PharmaCompany pharmaCompany) {
        this.pharmaCompany = pharmaCompany;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public String getEffectiveBodypart() {
        return effectiveBodypart;
    }

    public void setEffectiveBodypart(String effectiveBodypart) {
        this.effectiveBodypart = effectiveBodypart;
    }

    public String getSideEffects() {
        return sideEffects;
    }

    public void setSideEffects(String sideEffects) {
        this.sideEffects = sideEffects;
    }

    public String getWarnings() {
        return warnings;
    }

    public void setWarnings(String warnings) {
        this.warnings = warnings;
    }

    public ArrayList<MedicineFormat> getMedicineFormats() {
        return medicineFormats;
    }

    public void setMedicineFormats(ArrayList<MedicineFormat> medicineFormats) {
        this.medicineFormats = medicineFormats;
    }

}
