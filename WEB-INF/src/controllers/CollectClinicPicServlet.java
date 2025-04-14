package controllers;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import models.ClinicPic;
import models.User;

@WebServlet("/collect_clinic_pic.do")
public class CollectClinicPicServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        Integer clinicId = Integer.parseInt(request.getParameter("clinicId"));


        String records = "empty";
        if (user != null) {
            if (user.getUserType().getUserTypeId() == 2) {
                ArrayList<ClinicPic> clinicPics = ClinicPic.collectClinicPics(clinicId);
                

                Gson gson = new Gson();
                records = gson.toJson(clinicPics);

            }
        }
        response.getWriter().write(records);
    }
}
