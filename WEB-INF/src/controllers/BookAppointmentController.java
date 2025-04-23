package controllers;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Appointment;
import models.ClinicShift;
import models.Patient;
import models.User;

@WebServlet("/book_appointment.do")
public class BookAppointmentController extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        Patient patient = (Patient) session.getAttribute("patient");
        User user = (User) session.getAttribute("user");

        if (user != null) {
            if (user.getUserType().getUserTypeId() == 1 && patient != null) {
                Integer patientId = Integer.parseInt(request.getParameter("appointment_patient_id"));
                Integer clinicShiftId = Integer.parseInt(request.getParameter("app_clinic_shift_id"));
                String reason = request.getParameter("reason");
                Date appointmentDate = Date.valueOf(request.getParameter("appointment_date"));

                Appointment appointment = new Appointment(new Patient(patientId), appointmentDate,
                        new ClinicShift(clinicShiftId),reason);
                if (appointment.saveAppointment()) {
                    response.sendRedirect("patient.do?message=Appointment%20booked%20successfully");
                } else {
                    response.sendRedirect("patient.do?message=Failed%20to%20book%20appointment");
                }
            }
        }
    }
}
