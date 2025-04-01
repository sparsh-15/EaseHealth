package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.PharmaCompany;
import models.User;

@WebServlet("/pharma_company.do")
public class pharmaCompanyServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        String nextPage = "index.do";

        if (user != null) {
            if (user.getUserType().getUserTypeId() == 3) {
                PharmaCompany pharmaDetails = new PharmaCompany();
                
                Boolean dataExists = pharmaDetails.getPharmaCompanyDetails(user);
                
                String detailsReport = request.getParameter("details_report");
                
                if (detailsReport == null) {
                    if (dataExists) {
                        detailsReport = "true";  
                        session.setAttribute("pharma_details", pharmaDetails);
                        
                    } else {
                        detailsReport = "false"; 
                    }
                }
                
                request.setAttribute("details_report", detailsReport);
                
                nextPage = "pharmaCompany.jsp";
            }
        }
        
        // Forward the request to the next page
        request.getRequestDispatcher(nextPage).forward(request, response);
        
    }
}
