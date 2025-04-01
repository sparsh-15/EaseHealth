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

import java.util.List;
import java.io.File;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.FileUploadException;

@WebServlet("/save_pharma.do")
public class SavePharmaServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        String nextPage = "index.do";

        if (user != null) {
            if (user.getUserType().getUserTypeId() == 3) {
                PharmaCompany pharmaDetails = new PharmaCompany();
                if (pharmaDetails.getPharmaCompanyDetails(user)) {
                    session.setAttribute("pharmaDetails", pharmaDetails);
                }
                nextPage = "pharmaCompany.do";
            }
        }
        request.getRequestDispatcher(nextPage).forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        String nextPage = "pharma_company.do";
        User user = (User) session.getAttribute("user");
        if (user != null) {
            if (user.getUserType().getUserTypeId() == 3) {
                String details = null;
                String license = null;
                if (ServletFileUpload.isMultipartContent(request)) {
                    DiskFileItemFactory dfif = new DiskFileItemFactory();
                    ServletFileUpload sfu = new ServletFileUpload(dfif);
                    try {
                        List<FileItem> dfi = sfu.parseRequest(request);
                        for (FileItem fileItem : dfi) {
                            if (fileItem.isFormField()) {
                                if (fileItem.getFieldName().equals("details"))
                                    details = fileItem.getString();
                            } else {
                                String uploadPath = getServletContext()
                                        .getRealPath("/WEB-INF/uploads/" + user.getUserId() + "_" + user.getEmail());
                                String fileName = fileItem.getName();
                                license = uploadPath + "" + fileName;
                                File file = new File(uploadPath, fileName);
                                try {
                                    fileItem.write(file);
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                        }

                    } catch (FileUploadException e) {
                        e.printStackTrace();
                    }
                }
                PharmaCompany pharmaCompany = new PharmaCompany(user, details, license);
                if (pharmaCompany.savePharmaCompanyDetails()) {
                    nextPage = "pharma_company.do?details_report=true";
                }
            }
        } else {
            nextPage = "index.do";
        }
        response.sendRedirect(nextPage);
    }

}