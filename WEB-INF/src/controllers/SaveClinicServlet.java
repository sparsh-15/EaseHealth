package controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import models.City;
import models.Clinic;
import models.ClinicDay;
import models.ClinicPic;
import models.Doctor;
import models.User;

@WebServlet("/save_clinic.do")
public class SaveClinicServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");
        Doctor doctorExist = (Doctor) session.getAttribute("doctor");

        String flag = "no";

        if (user != null) {
            if (user.getUserType().getUserTypeId() == 2 && doctorExist != null) {
                String clinicName = null;
                String clinicAddress = null;
                Integer cityId = null;
                String contactNumber = null;
                Integer consultationFee = null;
                Integer doctorId = null;
                ArrayList<Integer> clinicDays = new ArrayList<>();
                ArrayList<String> clinicPics = new ArrayList<>();

                if (ServletFileUpload.isMultipartContent(request)) {
                    DiskFileItemFactory dfif = new DiskFileItemFactory();
                    ServletFileUpload sfu = new ServletFileUpload(dfif);
                    try {
                        List<FileItem> dfi = sfu.parseRequest(request);

                        for (FileItem fileItem : dfi) {
                            if (fileItem.isFormField()) {
                                switch (fileItem.getFieldName()) {
                                    case "clinic_name":
                                        clinicName = fileItem.getString();
                                        System.out.println(clinicName);
                                        break;
                                    case "address":
                                        clinicAddress = fileItem.getString();
                                        // System.out.println(clinicAddress);
                                        break;
                                    case "city_id":
                                        cityId = Integer.parseInt(fileItem.getString());
                                        break;
                                    case "contact":
                                        contactNumber = fileItem.getString();
                                        break;
                                    case "consultation_fee":
                                        consultationFee = Integer.parseInt(fileItem.getString());
                                        break;
                                    case "doctor_id":
                                        doctorId = Integer.parseInt(fileItem.getString());
                                        break;
                                    case "clinic_days[]":
                                        clinicDays.add(Integer.parseInt(fileItem.getString()));
                                        break;
                                }
                            } else if(fileItem.getFieldName().equals("clinic_image[]")) {
                                String uploadPath = getServletContext()
                                        .getRealPath("/WEB-INF/uploads/" + user.getUserId() + "_" + user.getEmail());

                                String fileName = new File(fileItem.getName()).getName(); // Extract filename

                                if (fileName != null && !fileName.isEmpty()) {
                                    File file = new File(uploadPath , fileName);

                                    try {
                                        // Save the file
                                        fileItem.write(file);

                                        // Store the saved file path
                                        clinicPics.add(file.getAbsolutePath());

                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }
                            }
                        }
                        System.out.println("Uploaded Files: " + clinicPics);

                        Clinic clinic = new Clinic(clinicName,new Doctor(doctorId), clinicAddress, new City(cityId), contactNumber, consultationFee);
                        int clinicId = clinic.saveClinicDetails(doctorId);
                        System.out.println(clinicId);

                        ClinicPic.saveClinicPics(clinicId, clinicPics);

                        ClinicDay.saveClinicDays(clinicId, clinicDays);
                    } catch (FileUploadException e) {
                        e.printStackTrace();
                    }
                }
            }
        }

        request.getRequestDispatcher("doctor.do").forward(request, response);
    }
}
