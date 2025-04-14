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

import models.Doctor;
import models.Patient;
import models.User;

@WebServlet("/collect_doctors.do")
public class CollectDoctorsServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        Patient patient = (Patient)session.getAttribute("patient");
        User user = (User)session.getAttribute("user");
        String records = "empty";

        if (user != null) {
            if (user.getUserType().getUserTypeId() == 1 && patient != null) {
                ArrayList<Doctor> doctors = Doctor.collectAllDoctors();
    
                records = new Gson().toJson(doctors);
                System.out.println(records);
            }
        }

        response.getWriter().write(records);
    }
}
