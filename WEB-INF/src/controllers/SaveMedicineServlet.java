package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Medicine;
import models.PharmaCompany;
import models.User;

@WebServlet("/save_medicine.do")
public class SaveMedicineServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        PharmaCompany pharmaDetails = (PharmaCompany) session.getAttribute("pharma_details");



        String flag = "no";
        if(user!=null) {
            if(user.getUserType().getUserTypeId()==3 && pharmaDetails!=null){
                String name = request.getParameter("medicine_name");
                String description = request.getParameter("description");
                String ingredients = request.getParameter("ingredients");
                String effectiveBodypart = request.getParameter("effective_body_part");
                String sideEffects = request.getParameter("side_effects");
                String warnings = request.getParameter("warnings");

                Medicine medicine = new Medicine(pharmaDetails, name, description, ingredients, effectiveBodypart, sideEffects, warnings);
                if(medicine.saveMedicine(pharmaDetails)){
                    flag = "yes";
                }
            }
        }
        response.getWriter().write(flag);
    }
}