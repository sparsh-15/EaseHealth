package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;


@WebServlet("/verify_email.do")
public class VerifyEmailServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String verificationCode = request.getParameter("activation_code");

        String nextURL = "index.do?activated=false";

        if(User.verifyEmail(email,verificationCode)) {
            nextURL="index.do?activated=true";
        }
        request.getRequestDispatcher(nextURL).forward(request, response);
    }
}