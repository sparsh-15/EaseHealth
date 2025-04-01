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

import models.MedicineDenomination;
import models.PharmaCompany;

@WebServlet("/collect_medicine_denomination.do")
public class CollectMedicineDenominationServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException {
        HttpSession session = request.getSession();

        PharmaCompany pharmaDetails = (PharmaCompany)session.getAttribute("pharma_details");

        String records = "empty";

        if(pharmaDetails!=null) {
            Integer medicineFormatId = Integer.parseInt(request.getParameter("medicine_format_id"));

            ArrayList<MedicineDenomination> denominations = MedicineDenomination.collectAllDenomination(medicineFormatId);
            Gson gson = new Gson();

            records = gson.toJson(denominations);
        }

        response.getWriter().write(records);
    }
}
