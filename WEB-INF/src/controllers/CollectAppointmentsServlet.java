package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.Appointment;
import models.Patient;
import models.User;

@WebServlet("/collect_appoinments.do")
public class CollectAppointmentsServlet extends HttpServlet{
    public void doGet(HttpServletRequest request , HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        
        Patient patient = (Patient)session.getAttribute("patient");
        User user = (User)session.getAttribute("user");
        String records = "empty";
    

        if (user != null) {
            ArrayList<Appointment> appointments = Appointment.collectAllAppointment(patient.getPatientId());

            Gson gson = new Gson();
            records = gson.toJson(appointments);
        }

        response.getWriter().write(records);
    }
}
