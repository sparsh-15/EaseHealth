package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import models.Doctor;
import models.User;

@WebServlet("/doctor.do")
public class DoctorServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        String nextPage = "index.do";

        if (user != null) {
            if (user.getUserType().getUserTypeId() == 2) {
                Doctor doctor = new Doctor();

                doctor = doctor.fetchCheckDoctorDetails(user);

                if(doctor.getDoctorId()!=null) {
                    
                    session.setAttribute("details_report", "true");
                    session.setAttribute("doctor", doctor);
                    doctor.updateClinicCount(doctor.getDoctorId());
                }else{
                    session.setAttribute("details_report", "false");
                }

                nextPage = "doctor.jsp";
            }
        }

        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}
