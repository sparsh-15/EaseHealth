package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Appointment;
import models.Doctor;
import models.MedicineDenomination;
import models.Prescription;
import models.PrescriptionItem;
import models.User;

@WebServlet("/save_prescription.do")
public class SavePrescriptionServlet extends HttpServlet {
    private String generateUniquePrescriptionCode() {
        return "RX" + System.currentTimeMillis(); // e.g., RX1714403957000
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("application/json");

        Doctor doctor = (Doctor) session.getAttribute("doctor");
        User user = (User) session.getAttribute("user");
        String nextPage = "appointments.do";
        Integer appointmentId = null;
        if (user != null) {
            if (user.getUserType().getUserTypeId() == 2 && doctor != null) {

                ArrayList<Prescription> prescriptions = new ArrayList<>();
                appointmentId = Integer.parseInt(request.getParameter("appointment_id"));
                request.setAttribute("appointmentId", appointmentId);
                String specialInstructions = request.getParameter("special_instructions");

                Prescription prescription = new Prescription();
                prescription.setAppointment(new Appointment(appointmentId));
                prescription.setSpecialInstructions(specialInstructions);
                prescription.setPrescriptionCode(generateUniquePrescriptionCode());

                int prescriptionId = prescription.savePrescription();

                String[] denominationIds = request.getParameterValues("denominationIds");

                if (denominationIds != null) {
                    for (String denomIdStr : denominationIds) {
                        int denomId = Integer.parseInt(denomIdStr);
                        String dosageParam = "dosage-" + denomIdStr;
                        String dosageStr = request.getParameter(dosageParam);

                        if (dosageStr != null && !dosageStr.trim().isEmpty()) {
                            int dosage = Integer.parseInt(dosageStr.trim());
                            PrescriptionItem item = new PrescriptionItem();
                            item.setPrescription(new Prescription(prescriptionId)); // minimal object
                            item.setMedicineDenomination(new MedicineDenomination(denomId));
                            item.setDosage(dosage);

                            if (item.savePrescriptionItem()) {
                                nextPage = "prescription.jsp";
                            }
                        }
                    }
                }
            }
        }
        response.sendRedirect(nextPage + "?appointment_id=" + appointmentId);

    }
}
