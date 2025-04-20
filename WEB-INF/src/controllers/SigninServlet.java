package controllers;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

@WebServlet("/signin.do")
public class SigninServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        String nextPage = "index.do?signin_status=";

        String email = request.getParameter("signin_email");
        String password = request.getParameter("signin_password");

        User user = new User(email, password);
        user.signinUser();
        int status = user.getStatus().getStatusId();
        switch(status) {            
            case 4:
                session.setAttribute("user", user);
                nextPage = "dashboard.do?user_type="+user.getUserType().getUserTypeId();
                break;
            default:
                nextPage += (status+"&email="+user.getEmail());
        }

        response.sendRedirect(nextPage);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        response.sendRedirect("home.jsp"); // Recommended
    }
}

