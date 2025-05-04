package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.Clinic;


@WebServlet("/collect_city_clinics.do")
public class CollectCityClinicsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        
        Integer cityId = Integer.parseInt(request.getParameter("city_id"));
        

        String records  = "empty";
        ArrayList<Clinic> cityClinics = Clinic.collectCityClinics(cityId);
        

        Gson gson = new Gson();
        records = gson.toJson(cityClinics);
      

        response.getWriter().write(records);
    
    }
}
