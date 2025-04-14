package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Clinic;
import models.Doctor;
import models.User;

@WebServlet("/delete_clinic.do")
public class DeleteClinicServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        


        String result = "no";

        if (user != null) {
            if (user.getUserType().getUserTypeId() == 2){
                Integer clinicId = Integer.parseInt(request.getParameter("clinic_id"));

                Clinic clinic = new Clinic(clinicId);
                
                if(clinic.deleteClinic(clinic)){
                    result = "yes";
                    doctor.updateClinicCount(doctor.getDoctorId());
                }
            }
        }

        response.getWriter().write(result);
    }
}
