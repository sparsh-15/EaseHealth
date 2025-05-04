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

import models.Clinic;
import models.ClinicDay;
import models.ClinicShift;
import models.Doctor;

@WebServlet("/collect_clinics.do")
public class CollectClinicsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        HttpSession session = request.getSession();

        String doctorIdParam = request.getParameter("doctor_id");
        Doctor doctor = null;

        if (doctorIdParam != null) {
            try {
                int doctorId = Integer.parseInt(doctorIdParam);
                doctor = new Doctor(doctorId);
            } catch (NumberFormatException e) {
                response.getWriter().write("[]");
                return;
            }
        } else {
            doctor = (Doctor) session.getAttribute("doctor");
        }

        String records = "empty";

        if (doctor != null) {
            ArrayList<Clinic> clinics = Clinic.collectClinics(doctor.getDoctorId());
            ClinicDay.collectAllClinicDays(clinics);

            if (ClinicShift.collectClinicShifts(clinics)) {
                session.setAttribute("clinics", clinics);
            }

            Gson gson = new Gson();
            records = gson.toJson(clinics);
        }

        response.getWriter().write(records);
    }
}
