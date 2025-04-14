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
import models.User;

@WebServlet("/collect_clinics.do")
public class CollectClinicsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("application/json");
        User user = (User) session.getAttribute("user");
        Doctor doctor = (Doctor) session.getAttribute("doctor");

        String records = "empty";
        if (user != null) {
            if (user.getUserType().getUserTypeId() == 2 && doctor != null) {
                ArrayList<Clinic> clinics = Clinic.collectClinics(doctor.getDoctorId());


                ClinicDay.collectAllClinicDays(clinics);

                if (ClinicShift.collectClinicShifts(clinics)) {
                    System.out.println("saved clinic shifts");
                    session.setAttribute("clinics", clinics);
                }

                Gson gson = new Gson();

                records = gson.toJson(clinics);

            }
        }
        response.getWriter().write(records);
    }
}
