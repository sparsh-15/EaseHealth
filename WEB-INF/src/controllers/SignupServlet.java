package controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.City;
import models.User;
import models.UserType;
import utils.ActivationCode;
import utils.EmailSender;
import utils.EmailTemplate;

@WebServlet("/signup.do")
public class SignupServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contact = request.getParameter("contact");
        Integer cityId = Integer.parseInt(request.getParameter("city_id"));
        Integer userTypeId = Integer.parseInt(request.getParameter("user_type_id"));

        String nextPage = "index.do?signup=false";

        String activationCode = ActivationCode.getActivationCode();
        User user = new User(name, email, password, new City(cityId), contact, new UserType(userTypeId),activationCode);
        
        if(user.saveUser()) {

            String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads" );
            File file = new File(uploadPath, user.getUserId() + "_" + user.getEmail());
            file.mkdir();

            String requestURL = new String(request.getRequestURL());
            String baseURL = requestURL.substring(0, requestURL.lastIndexOf("/"));
            String message = EmailTemplate.emailVerificationMail(name, email, activationCode, baseURL);
            EmailSender.sendEmail(email, "Email Authentication", message);

            nextPage = "index.do?signup=true";
        }
        response.sendRedirect(nextPage);
    }
}
