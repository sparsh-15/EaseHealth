package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.MedicineDenomination;
import models.PharmaCompany;

@WebServlet("/save_denomination.do")
public class SaveDenominationServlet extends HttpServlet{
    public void doPost(HttpServletRequest request , HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        PharmaCompany pharmaDetails = (PharmaCompany) session.getAttribute("pharma_details");
        
        

        if(pharmaDetails!= null) {
            Integer medicineFormatId = Integer.parseInt(request.getParameter("medicineFormatId"));
            String[] stringQuantities = request.getParameterValues("quantity[]");
            Integer unitId = Integer.parseInt(request.getParameter("unit"));


            Integer[] intQuantities = new Integer[stringQuantities.length];

            for(int i=0; i<stringQuantities.length; i++) {
                intQuantities[i] = Integer.parseInt(stringQuantities[i]);
            }       

            if(MedicineDenomination.saveMedicineDenomination(medicineFormatId,intQuantities,unitId)){
                response.sendRedirect("pharma_company.do");
            }else{
                System.out.println("nahi hua save");
            }
        }
    }
}
