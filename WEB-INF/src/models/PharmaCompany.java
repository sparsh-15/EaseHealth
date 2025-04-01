package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.DBConnect;

public class PharmaCompany {
    private Integer pharmaCompanyId;
    private User user;
    private String details;
    private String license;
    private Integer medicineCount;


    public PharmaCompany() {

    }

    public PharmaCompany(User user, String details, String license) {
        this.user = user;
        this.details = details;
        this.license = license;
    }

    public void updateMedicineCount(int pharmaCompanyId) {
        try {
            Connection con = DBConnect.getConnection();

            String query = "UPDATE pharma_companies SET medicine_count = (SELECT COUNT(*) FROM medicines WHERE pharma_company_id = ?) WHERE pharma_company_id = ?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, pharmaCompanyId);
            ps.setInt(2, pharmaCompanyId);

            ps.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    public Boolean savePharmaCompanyDetails() {
        Boolean flag = false;
        try{
            Connection con = DBConnect.getConnection();
            if(con !=  null) {
                String query = "insert into pharma_companies (user_id, details, license) value (?,?,?)";
                
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, user.getUserId());
                ps.setString(2,details);
                ps.setString(3,license);

                int res = ps.executeUpdate();
                if(res == 1){
                    flag = true;
                }
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Boolean getPharmaCompanyDetails(User user) {
        Boolean flag = false;
        try {
            Connection con = DBConnect.getConnection();

            String query = "select * from pharma_companies where user_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,user.getUserId());

            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                pharmaCompanyId = rs.getInt("pharma_company_id");
                details = rs.getString("details");
                license = rs.getString("license");
                medicineCount = rs.getInt("medicine_count");
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public Integer getPharmaCompanyId() {
        return pharmaCompanyId;
    }

    public void setPharmaCompanyId(Integer pharmaCompanyId) {
        this.pharmaCompanyId = pharmaCompanyId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license;
    }

    public Integer getMedicineCount() {
        return medicineCount;
    }

    public void setMedicineCount(Integer medicineCount) {
        this.medicineCount = medicineCount;
    }
    

}