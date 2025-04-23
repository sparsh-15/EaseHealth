package controllers;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.Appointment;
import models.Clinic;
import models.ClinicDay;
import models.ClinicShift;
import models.Doctor;
import models.User;

@WebServlet("/appointments.do")
public class AppointmentsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession();

        Doctor doctor = (Doctor) session.getAttribute("doctor");
        User user = (User) session.getAttribute("user");

        String clinicIdParam = request.getParameter("clinic_id");
        if (clinicIdParam == null || clinicIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing clinic_id");
            return;
        }
        Integer clinicId = Integer.parseInt(clinicIdParam);

        if (user != null) {
            if (user.getUserType().getUserTypeId() == 2 && doctor != null) {
                ArrayList<Clinic> clinics = Clinic.collectClinics(doctor.getDoctorId());
                ClinicDay.collectAllClinicDays(clinics);
                ClinicShift.collectClinicShifts(clinics);

                int appByClinic = Appointment.getAppointmentsByClinic(clinicId);
                // Appointment.getAppointmentCountGroupedByShift(clinicId);
                // Appointment.getAppoinmentsByStatus(clinicId);

                Gson gson = new Gson();

                request.setAttribute("clinicId", clinicId);
                request.setAttribute("clinics", gson.toJson(clinics));
                request.setAttribute("appByClinic", appByClinic);
            }
        }
        request.getRequestDispatcher("clinicAppointments.jsp").forward(request, response);
    }
}
