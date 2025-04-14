package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

@WebServlet("/dashboard.do")
public class DashboardServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        String nextPage = "home.jsp";

        if (user != null) {
            int userTypeId = user.getUserType().getUserTypeId();

            switch (userTypeId) {
                case 1:
                    nextPage = "patient.do";
                    break;
                case 2:
                    nextPage = "doctor.do";
                    break;
                case 3:
                    // ----
                    nextPage = "pharma_company.do";
                    break;
             
            }
        }

        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}
