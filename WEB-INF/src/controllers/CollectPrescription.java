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
import models.Prescription;
import models.User;

@WebServlet("/collect_prescription_details.do")
public class CollectPrescription extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer appointmentId = Integer.parseInt(request.getParameter("appointmentId"));

        HttpSession session = request.getSession();


        User user = (User) session.getAttribute("user");

        String records = "empty";

        if (user != null) {

            ArrayList<Prescription> prescriptions = Prescription.collectPrescriptionDetails(appointmentId);

            records = new Gson().toJson(prescriptions);

        }
        response.getWriter().write(records);
    }
}
