package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.DBConnect;

public class Clinic {
    private Integer clinicId;
    private String clinicName;
    private Doctor doctor;
    private String address;
    private City city;
    private String contact;
    private Integer consultationFee;

    private ArrayList<ClinicDay> clinicDays;
    private ArrayList<ClinicShift> clinicShifts;

    public static ArrayList<Clinic> collectCityClinics(int cityId){
        ArrayList<Clinic> cityClinics = new ArrayList<>();
        Connection con = DBConnect.getConnection();
        String query = "select * from clinics as c JOIN cities as ct on c.city_id=ct.city_id where c.city_id=?";

        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cityId);
             
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                cityClinics.add(new Clinic(rs.getInt("clinic_id"),rs.getString("clinic_name"),rs.getString("address"),new City(rs.getString("city")),rs.getString("contact"),rs.getInt("consultation_fee")));
            }

        }catch(SQLException e) {
            e.printStackTrace();
        }

        return cityClinics;
    }


    


    public static ArrayList<Clinic> collectClinics(int doctorId){
        ArrayList<Clinic> clinics = new ArrayList<>();
        Connection con = DBConnect.getConnection();
        String query = "select * from clinics as c JOIN cities as ct on c.city_id=ct.city_id where doctor_id=?";

        try{
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, doctorId);
             
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                clinics.add(new Clinic(rs.getInt("clinic_id"),rs.getString("clinic_name"),rs.getString("address"),new City(rs.getString("city")),rs.getString("contact"),rs.getInt("consultation_fee")));
            }

        }catch(SQLException e) {
            e.printStackTrace();
        }

        return clinics;
    }

    
    public int saveClinicDetails(int doctorId){
        Connection con = DBConnect.getConnection();
        String query = "insert into clinics(clinic_name,doctor_id,address,city_id,contact,consultation_fee) values(?,?,?,?,?,?)";
        
        try {
            PreparedStatement ps = con.prepareStatement(query,PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setString(1, clinicName);
            ps.setInt(2, doctorId);
            ps.setString(3, address);
            ps.setInt(4, city.getCityId());
            ps.setString(5, contact);
            ps.setInt(6, consultationFee);

            int res = ps.executeUpdate();
            if(res>0) {
                ResultSet rs = ps.getGeneratedKeys();
                if(rs.next()) {
                    clinicId = rs.getInt(1);
                }
            }
            
        } catch(SQLException e ) {
            e.printStackTrace();
        }
        return clinicId;
    }

    public Boolean deleteClinic(Clinic clinic) {
        Boolean flag = false;
        Connection con = DBConnect.getConnection();
        String query = "delete from clinics where clinic_id=?";

        try {   
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, clinic.getClinicId());

            int res = ps.executeUpdate();
            if(res==1){
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }

    
    
    
    public Clinic(Integer clinicId, String clinicName, String address, City city, String contact,
            Integer consultationFee) {
        this.clinicId = clinicId;
        this.clinicName = clinicName;
        this.address = address;
        this.city = city;
        this.contact = contact;
        this.consultationFee = consultationFee;
    }


    public Clinic(String clinicName, Doctor doctor, String address, City city, String contact,
            Integer consultationFee) {
        this.clinicName = clinicName;
        this.doctor = doctor;
        this.address = address;
        this.city = city;
        this.contact = contact;
        this.consultationFee = consultationFee;
    }

    


    public Clinic(Integer clinicId) {
        this.clinicId = clinicId;
    }




    public Integer getClinicId() {
        return clinicId;
    }
    public void setClinicId(Integer clinicId) {
        this.clinicId = clinicId;
    }
    
    public Doctor getDoctor() {
        return doctor;
    }
    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public City getCity() {
        return city;
    }
    public void setCity(City city) {
        this.city = city;
    }
    public String getContact() {
        return contact;
    }
    public void setContact(String contact) {
        this.contact = contact;
    }
    public Integer getConsultationFee() {
        return consultationFee;
    }
    public void setConsultationFee(Integer consultationFee) {
        this.consultationFee = consultationFee;
    }

    public String getClinicName() {
        return clinicName;
    }

    public void setClinicName(String clinicName) {
        this.clinicName = clinicName;
    }


    public ArrayList<ClinicDay> getClinicDays() {
        return clinicDays;
    }


    public void setClinicDays(ArrayList<ClinicDay> clinicDays) {
        this.clinicDays = clinicDays;
    }


    public ArrayList<ClinicShift> getClinicShifts() {
        return clinicShifts;
    }


    public void setClinicShifts(ArrayList<ClinicShift> clinicShifts) {
        this.clinicShifts = clinicShifts;
    }

    

    
}
