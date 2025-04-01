package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.MedicineFormat;
import models.PharmaCompany;
import models.User;

@WebServlet("/save_medicine_format.do")
public class SaveMedicineFormat extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException , ServletException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        PharmaCompany pharmaDetails = (PharmaCompany) session.getAttribute("pharma_details");
        String result = "fail";
        if(user!=null) {
            if(user.getUserType().getUserTypeId()==3 && pharmaDetails!=null){
                Integer medicineId = Integer.parseInt(request.getParameter("medicine_id"));
                String[] formats = request.getParameterValues("format_id");
                
                if(MedicineFormat.saveMedicineFormat(medicineId, formats)) {
                    result = "success";
                }
            }
        }
        response.getWriter().write(result);
    }
}
