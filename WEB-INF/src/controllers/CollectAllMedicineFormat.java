package controllers;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import java.io.IOException;
import java.util.ArrayList;

import models.MedicineFormat;
import models.PharmaCompany;

@WebServlet("/collect_all_medicine_format.do")
public class CollectAllMedicineFormat extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        HttpSession session = request.getSession();

        String records = "no";
        PharmaCompany pharmaDetails = (PharmaCompany)session.getAttribute("pharma_details");
        if(pharmaDetails!=null) {
            Integer medicineId = Integer.parseInt(request.getParameter("medicine_id"));

            ArrayList<MedicineFormat> medicineFormats = MedicineFormat.collectAllMedicineFormat(medicineId);
            

            Gson gson = new Gson();

            records = gson.toJson(medicineFormats);
        }
        response.getWriter().write(records);
    }
}
