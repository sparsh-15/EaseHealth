package controllers;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.ClinicShift;
import models.Doctor;
import models.User;

// @WebServlet("")
public class SaveClinicShiftServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException ,ServletException{
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        Doctor doctor = (Doctor) session.getAttribute("doctor");

        if (user != null) {
            if (user.getUserType().getUserTypeId() == 2){
                Integer clinicId = doctor.getDoctorId();
                Timestamp startTime = Timestamp.valueOf(request.getParameter("start_time"));
                Timestamp endTime = Timestamp.valueOf(request.getParameter("end_time"));
                Integer maxAppointment = Integer.parseInt(request.getParameter("max_appointment"));

                // ClinicShift shifts = new ClinicShift(doctorId,startTime,endTime,maxAppointment);

            }
        }
    }
}
