package controllers;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download_media.do")
public class DownloadMediaServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String path = request.getParameter("path");
        String fixedPath = path.replace("\\", "/");
        

        InputStream is = getServletContext().getResourceAsStream("/WEB-INF/uploads/" + fixedPath.trim());
        
        OutputStream os = response.getOutputStream();

        byte[] arr = new byte[512];

        while(is.read(arr) != -1) {
            os.write(arr);
        }
        
        os.flush();
        os.close();
    }
}
