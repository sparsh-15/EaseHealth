package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.ClinicShift;
import models.Doctor;

@WebServlet("/clinicAppointments.do")
public class ClinicAppointmentsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        HttpSession session = request.getSession();

        Doctor doctor = (Doctor)session.getAttribute("doctor");
        Integer clinicId = Integer.parseInt(request.getParameter("clinic_id"));

        if(doctor!=null) {
            ArrayList<ClinicShift> clinicShifts = ClinicShift.collectClinicShifts(clinicId);

                
        }

    }
}
