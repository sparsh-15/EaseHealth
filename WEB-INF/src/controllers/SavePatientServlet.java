package controllers;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import models.Patient;
import models.User;

@WebServlet("/complete_patient_profile.do") 
public class SavePatientServlet extends HttpServlet{

      public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
     

        String nextPage = "logout.do";

        if (user != null) {
            if (user.getUserType().getUserTypeId() == 1) {
                String gender = null;
                String bloodGroup = null;
                Float weight = null;
                Integer height = null;
                String uid = null;
                String profilePic = null;
                Date dob = null;
                if (ServletFileUpload.isMultipartContent(request)) {
                    DiskFileItemFactory dfif = new DiskFileItemFactory();
                    ServletFileUpload sfu = new ServletFileUpload(dfif);
                    try {
                        List<FileItem> dfi = sfu.parseRequest(request);
                        for (FileItem fileItem : dfi) {
                            if (fileItem.isFormField()) {
                                switch (fileItem.getFieldName()) {
                                    case "gender":
                                        gender = fileItem.getString();
                                        break;
                                    case "blood_group":
                                        bloodGroup = fileItem.getString();
                                        break;
                                    case "weight":
                                        weight = Float.parseFloat(fileItem.getString());
                                        break;
                                    case "height":
                                        height = Integer.parseInt(fileItem.getString());
                                        break;
                                    case "uid":
                                        uid = fileItem.getString(); 
                                        break;                                   
                                    case "dob":
                                        dob = Date.valueOf(fileItem.getString());   
                                        break;                                 
                                }
                            } else {
                                String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/" + user.getUserId() + "_" + user.getEmail());
                                String fileName = fileItem.getName();
                                profilePic = uploadPath + "" + fileName;
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

                Patient patient = new Patient(user, gender, bloodGroup, weight, height, uid, dob, profilePic);
                if (patient.savePatient()) {
                    nextPage = "patient.do";
                }
            }
        } else {
            nextPage = "index.do";
        }

        response.sendRedirect(nextPage);
    }

}
