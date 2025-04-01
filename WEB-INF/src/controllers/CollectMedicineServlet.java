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

import models.Medicine;
import models.MedicineFormat;
import models.PharmaCompany;

@WebServlet("/collect_medicine.do")
public class CollectMedicineServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        PharmaCompany pharmaDetails = (PharmaCompany) session.getAttribute("pharma_details");

        String records = "no";

        if (pharmaDetails != null) {
            ArrayList<Medicine> medicines = Medicine.collectAllMedicines(pharmaDetails);

            MedicineFormat.collectAllMedicineFormat(medicines);

            Gson gson = new Gson();

            records = gson.toJson(medicines);  
            session.setAttribute("medicines", records);

        }

        response.getWriter().write(records);
    }
}
