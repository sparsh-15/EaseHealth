package models;

public class UserType {
    private Integer userTypeId;
    private String type;

    public UserType() {
        
    }

    public UserType(Integer userTypeId) {
        this.userTypeId = userTypeId;
    }

    public void setUserTypeId(Integer userTypeId) {
        this.userTypeId = userTypeId;
    }

    public Integer getUserTypeId() {
        return userTypeId;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    public String getType() {
        return type;
    }

}