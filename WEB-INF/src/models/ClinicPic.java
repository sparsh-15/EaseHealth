package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConnect;

public class ClinicPic {
    private Integer clinicPicId;
    private Clinic clinic;
    private String picPath;

    public static void saveClinicPics(int clinicId, ArrayList<String> picPaths) {
        Connection con = DBConnect.getConnection();
        String query = "insert into clinic_pics(clinic_id,pic_path) values(?,?)";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, clinicId);

            for (String path : picPaths) {
                ps.setString(2, path);
                ps.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<ClinicPic> collectClinicPics(int clinicId) {
        ArrayList<ClinicPic> clinicPics = new ArrayList<>();
        Connection con = DBConnect.getConnection();
        String query = "select * from clinic_pics where clinic_id=?";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, clinicId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                clinicPics.add(new ClinicPic(new Clinic (rs.getInt("clinic_id")),rs.getString("pic_path")));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clinicPics;
    }

    public ClinicPic(Clinic clinic, String picPath) {
        this.clinic = clinic;
        this.picPath = picPath;
    }

    public Integer getClinicPicId() {
        return clinicPicId;
    }

    public void setClinicPicId(Integer clinicPicId) {
        this.clinicPicId = clinicPicId;
    }

    public Clinic getClinic() {
        return clinic;
    }

    public void setClinic(Clinic clinic) {
        this.clinic = clinic;
    }

    public String getPicPath() {
        return picPath;
    }

    public void setPicPath(String picPath) {
        this.picPath = picPath;
    }

}
