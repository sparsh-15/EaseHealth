package controllers;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.Appointment;
import models.Doctor;
import models.User;

@WebServlet("/collectAppoinmentByDateShift.do")
public class CollectAppoinmentByDateShift extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        Doctor doctor = (Doctor) session.getAttribute("doctor");
        User user = (User) session.getAttribute("user");
        

        String records = "empty";
        
        if (user != null) {
            if (user.getUserType().getUserTypeId() == 2 && doctor != null) {
                Integer clinicShiftId = Integer.valueOf(request.getParameter("clinic_shift_id"));
                Date appDate = Date.valueOf(request.getParameter("date"));

                ArrayList<Appointment> appointments = Appointment.collectAppoinmentByDateShift(clinicShiftId,appDate);
                int totalAppOnDateShift = Appointment.getAppointmentCountGroupedByShift(clinicShiftId, appDate);

                request.setAttribute("totalAppOnDateShift", totalAppOnDateShift);


                records = new Gson().toJson(appointments);
            
            }
        }

        response.getWriter().write(records);
    }
}
