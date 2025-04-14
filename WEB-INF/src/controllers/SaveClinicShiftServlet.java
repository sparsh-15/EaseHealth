package controllers;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Clinic;
import models.ClinicShift;
import models.Doctor;
import models.User;

@WebServlet("/save_clinic_shifts.do")
public class SaveClinicShiftServlet extends HttpServlet{
    private Timestamp convertToTimestamp(String time) {
        String currentDate = java.time.LocalDate.now().toString(); // "2025-04-02"
        String fullDateTime = currentDate + " " + time + ":00";     // "2025-04-02 09:30:00"
        return Timestamp.valueOf(fullDateTime);
    }
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException ,ServletException{
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        Doctor doctor = (Doctor) session.getAttribute("doctor");

        String result = "failed";

        if (user != null) {
            if (user.getUserType().getUserTypeId() == 2 && doctor!= null){
                
                Integer clinicId = Integer.parseInt(request.getParameter("clinic_id"));
                
                Timestamp startTime = convertToTimestamp(request.getParameter("start_time"));
                System.out.println(startTime);
                Timestamp endTime = convertToTimestamp(request.getParameter("end_time"));                
                Integer maxAppointment = Integer.parseInt(request.getParameter("max_appointment"));

                ClinicShift shifts = new ClinicShift(new Clinic(clinicId),startTime,endTime,maxAppointment);
                
                
                if(shifts.SaveClinicShift()){
                    
                    result = "saved";
                }
            }
        }

        response.getWriter().write(result);
    }
}
