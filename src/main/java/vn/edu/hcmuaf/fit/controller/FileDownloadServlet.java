package vn.edu.hcmuaf.fit.controller;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@WebServlet(name = "Download", value = "/Download")
public class FileDownloadServlet extends HttpServlet { //20130230-Tran trung dong

//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = resp.getWriter()) {
//            String path = req.getServletContext().getRealPath("/") +File.separator + "tool" + File.separator + "Petshop_website_final_war.jar";
//            System.out.println("path: "+path);
//            System.out.println(req.getServletContext().getRealPath("/") +File.separator + "tool" + File.separator + "Petshop_website_final_war.jar");
//
//            File dwFile = new File(path);
//            if (dwFile.exists()) {
//                resp.setContentType("application/octet-stream");
//                resp.setContentLength((int) dwFile.length());
//                String hkey = "Content-Disposition";
//                String hvelue = String.format("attachment; filenme=\"%s\"", dwFile.getName());
//                resp.setHeader(hkey, hvelue);
//                FileInputStream in = new FileInputStream(dwFile);
//                int i;
//                while ((i = in.read()) != -1) {
//                    out.write(i);
//                }
//                in.close();
//                out.close();
//            } else {
//                System.out.println("file khong ton tai");
//            }
//        }
//    }

    //    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = resp.getWriter()) {
//            String path = "src\\main\\webapp\\tool\\Petshop_website_final_war.jar";
//            File dwFile = new File(path);
//            if (dwFile.exists()) {
//                resp.setContentType("application/octet-stream");
//                resp.setContentLength((int) dwFile.length());
//                String hkey = "Content-Disposition";
//                String hvelue = String.format("attachment; filenme=\"%s\"", dwFile.getName());
//                resp.setHeader(hkey, hvelue);
//                FileInputStream in = new FileInputStream(dwFile);
//                int i;
//                while ((i = in.read()) != -1) {
//                    out.write(i);
//                }
//                in.close();
//                out.close();
//            } else {
//                System.out.println("file khong ton tai");
//            }
//        }
//    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = getServletContext();
        String fpath = request.getServletContext().getRealPath("/") +File.separator + "tool" + File.separator + "Petshop_website_final_war.jar";
        System.out.println(fpath);
        Path path = Paths.get(fpath);
        byte[] data = Files.readAllBytes(path);
        // Thiết lập thông tin trả về
        response.setContentType("application/octet-stream");
        response.setHeader("Content-disposition", "attachment; filename=Petshop_website_final_war.jar");
        response.setContentLength(data.length);
        InputStream inputStream = new BufferedInputStream(new ByteArrayInputStream(data));
        // Ghi file ra response outputstream.
        OutputStream outStream = response.getOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
        inputStream.close();
        outStream.close();
    }

}
