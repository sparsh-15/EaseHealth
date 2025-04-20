package models;

public class Status {
    private Integer statusId;
    private String status;

    public Status() {
        
    }
    

    

    public Status(String status) {
        this.status = status;
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

    public String getstatus() {
        return status;
    }

    public void setstatus(String status) {
        this.status = status;
    }
}