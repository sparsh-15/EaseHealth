package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.Doctor;


@WebServlet("/collect_doctors.do")
public class CollectDoctorsServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
   
        response.setContentType("application/json");

        String records = "[]";

   
                ArrayList<Doctor> doctors = Doctor.collectAllDoctors();
    
                records = new Gson().toJson(doctors);
                
    
        response.getWriter().write(records);
    }
}
