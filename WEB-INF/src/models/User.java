package models;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.jasypt.util.password.StrongPasswordEncryptor;

import utils.DBConnect;

public class User {
    private Integer userId;
    private String name;
    private String email;
    private String password;
    private Date dob;
    private String contact;
    private City city;
    private String address;
    private String profilePic;
    private Status status;
    private UserType userType;
    private String activationCode;

    static StrongPasswordEncryptor spe = new StrongPasswordEncryptor();

    
    
    

    public User() {
    }

    public User(String name) {
        this.name = name;
    }

    public User(String name, String email, String contact, City city) {
        this.name = name;
        this.email = email;
        this.contact = contact;
        this.city = city;
    }

    public User(Integer userId, String name, String profilePic) {
        this.userId = userId;
        this.name = name;
        this.profilePic = profilePic;
    }

    public User(String name, String contact, City city, String address, String profilePic) {
        this.name = name;
        this.contact = contact;
        this.city = city;
        this.address = address;
        this.profilePic = profilePic;
    }

    public User(String name, String email, String password, City city, String contact, UserType userType,
            String activationCode) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.city = city;
        this.contact = contact;
        this.userType = userType;
        this.activationCode = activationCode;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public static boolean verifyEmail(String email, String activationCode) {
        boolean flag = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hmsdb?user=root&password=1234");

            String query = "update users set activation_code=null,status_id=4 where email=? and activation_code=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, activationCode);

            int res = ps.executeUpdate();
            if (res == 1)
                flag = true;

            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return flag;
    }

    public Boolean saveUser() {
        Boolean flag = false;
        try {
            Connection con = DBConnect.getConnection();
            if (con != null) {
                String query = "insert into users (name, email, password,city_id,contact ,user_type_id,activation_code) value (?,?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(query);

                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, spe.encryptPassword(password));
                ps.setInt(4, city.getCityId());
                ps.setString(5, contact);
                ps.setInt(6, userType.getUserTypeId());
                ps.setString(7, activationCode);

                int res = ps.executeUpdate();

                if (res == 1)
                    flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public void signinUser() {
        status = new Status(-1); // -1 no account with the given email...

        try {
            Connection con = DBConnect.getConnection();

            // String query = "select * from users where email=?";
            String query = "select u.*, ct.city AS city_name, s.state AS state_name from users AS u JOIN cities as ct on u.city_id = ct.city_id JOIN states as s on ct.state_id = s.state_id WHERE u.email=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                if (spe.checkPassword(password, rs.getString("password"))) {
                    name = rs.getString("name");
                    status = new Status(rs.getInt("status_id"));
                    userId = rs.getInt("user_id");
                    city = new City(rs.getString("city_name"),new State(rs.getString("state_name")));
                    contact = rs.getString("contact");
                    profilePic = rs.getString("profile_pic");
                    userType = new UserType(rs.getInt("user_type_id"));

                } else {
                    status = new Status(0); // password mismatched
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public UserType getUserType() {
        return userType;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }

    public String getActivationCode() {
        return activationCode;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

}