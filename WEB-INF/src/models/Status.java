package models;

public class Status {
    private Integer statusId;
    private String name;

    public Status() {
        
    }

    

    public Status(Integer statusId) {
        this.statusId = statusId;
    }



    public void setStatusId (Integer statusId){
        this.statusId = statusId;
    }

    public Integer getStatusId () {
        return statusId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}