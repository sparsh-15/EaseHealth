package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Patient;
import models.User;

@WebServlet("/patient.do")
public class PatientServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        String nextPage = "index.do";

        if (user != null) {
            if (user.getUserType().getUserTypeId() == 1) {
                Patient patient = new Patient().fetchCheckPatientDetails(user);
                String message = request.getParameter("message");
                if (message != null) {
                    request.setAttribute("message", message); // pass it to JSP explicitly
                }

                if (patient.getPatientId() != null) {
                    session.setAttribute("details_report", "true");
                    session.setAttribute("patient", patient);
                } else {
                    session.setAttribute("details_report", "false");
                }
                nextPage = "patient.jsp";
            }
        }

        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}
