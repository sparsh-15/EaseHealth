package controllers;

import java.io.File;
import java.io.IOException;
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

import models.Doctor;
import models.Specialization;
import models.User;

@WebServlet("/save_doctor.do") 
public class SaveDoctorServlet extends HttpServlet{

      public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
     

        String nextPage = "logout.do";

        if (user != null) {
            if (user.getUserType().getUserTypeId() == 2) {
                String gender = null;
                Integer specializationId = null;
                String qualification = null;
                String experience = null;
                String certificate = null;
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
                                    case "specialization_id":
                                        specializationId = Integer.parseInt(fileItem.getString());
                                        break;
                                    case "qualification":
                                        qualification = fileItem.getString();
                                        break;
                                    case "experience":
                                        experience = fileItem.getString();
                                        break;
                                }
                            } else {
                                String uploadPath = getServletContext().getRealPath("/WEB-INF/uploads/" + user.getUserId() + "_" + user.getEmail());
                                String fileName = fileItem.getName();
                                certificate = uploadPath + "" + fileName;
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

                Specialization specialization = (specializationId != null) ? new Specialization(specializationId) : null;
                Doctor doctor = new Doctor(user,gender, specialization, qualification, experience, certificate);
                if (doctor.savedoctorDetails()) {
                    nextPage = "doctor.do";
                }
            }
        } else {
            nextPage = "index.do";
        }

        response.sendRedirect(nextPage);
    }

}
