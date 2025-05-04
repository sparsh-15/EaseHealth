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
import models.Medicine;
import models.MedicineDenomination;
import models.MedicineFormat;
import models.User;

@WebServlet("/searchMedicineServlet.do")
public class CollectPrescriptionMedicineServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        response.setContentType("application/json");

        Doctor doctor = (Doctor) session.getAttribute("doctor");
        User user = (User) session.getAttribute("user");

        String word = request.getParameter("word");
     

        String records = "[]";

        if (user != null) {
            if (user.getUserType().getUserTypeId() == 2 && doctor != null) {
                ArrayList<Medicine> searchedMedicines = Medicine.searchMedicines(word);
                records = new Gson().toJson(searchedMedicines);



                if (!searchedMedicines.isEmpty()) {
                    ArrayList<MedicineFormat> medFormats = MedicineFormat.collectMedicineFormats(searchedMedicines);
                    boolean denominationAttached = MedicineDenomination.collectAllDenomination(medFormats);
                    if (denominationAttached) {
                        records = new Gson().toJson(searchedMedicines);
                    }
                }
               
            }
        }
        response.getWriter().write(records);
    }
}
