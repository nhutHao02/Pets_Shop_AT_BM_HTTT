package vn.edu.hcmuaf.fit.adminController;

import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.dao.CustomerUserDAO;
import vn.edu.hcmuaf.fit.services.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "UpdateInforAdminController", value = "/admin/UpdateInforAdminController")
public class UpdateInforAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String newpass = request.getParameter("newpass");
        String newpassconfirm = request.getParameter("newpassconfirm");
        String image = request.getParameter("avt");
        String oldImg = request.getParameter("oldImg");
        System.out.println(image);

        UserAccount user = (UserAccount) request.getSession().getAttribute("admin");
        if (image != "") {
            if (newpass.equals(newpassconfirm)) {
                new CustomerUserDAO().updateInforUser(user.getId(), fullname, phone, address, newpass, image);
                HttpSession session = request.getSession();
                session.setAttribute("admin", user);
                user.setName(fullname);
                user.setPhone(phone);
                user.setAddress(address);
                user.setPass(newpass);
                user.setAvt("img/user/" + image);
                request.setAttribute("updateInforSusses", "Cập nhật thông tin thành công!");
                request.getRequestDispatcher("infor-admin.jsp").forward(request, response);
                removeOldImg(oldImg, request);
                copyImage(request, image);

                LogService logService= new LogService();
                UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
                logService.createUserLog(userAccount.getId(), "INFOR", "Admin "+userAccount.getUsername()+" cập nhật thông tin thành công");
            } else {
                request.setAttribute("passError", "Nhập lại mật khẩu không chính xác!");
                request.getRequestDispatcher("infor-admin.jsp").forward(request, response);

                LogService logService= new LogService();
                UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
                logService.createUserLog(userAccount.getId(), "INFOR", "Admin "+userAccount.getUsername()+" nhập sai mật khẩu nhập lại");
            }
        } else {
            user.setAvt("img/user/"+ image);
            new CustomerUserDAO().updateInforUser(user.getId(), fullname, phone, address, newpass);
            user.setName(fullname);
            user.setPhone(phone);
            user.setAddress(address);
            user.setPass(newpass);
            request.setAttribute("updateInforSusses", "Cập nhật thông tin thành công!");
            request.getRequestDispatcher("infor-admin.jsp").forward(request, response);

            LogService logService= new LogService();
            UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
            logService.createUserLog(userAccount.getId(), "INFOR", "Admin "+userAccount.getUsername()+" cập nhật thông tin thành công");
        }
    }

    private void removeOldImg(String oldImg, HttpServletRequest request) {
        if (oldImg.length() > 0) {
            String[] splited = oldImg.split(",");
            System.out.println(Arrays.toString(splited));
            for (String split : splited) {
                File fileInServer = new File(request.getServletContext().getAttribute("TEMPAVATARUSER_DIR") + File.separator + split);
                if (fileInServer.exists())
                    fileInServer.delete();
                File fileInLocal = new File(request.getServletContext().getAttribute("FILEAVATARUSER_DIR") + File.separator + split);
                if (fileInLocal.exists())
                    fileInLocal.delete();
            }
        }
    }

    public void copyImage(HttpServletRequest request, String imgFile) throws IOException {
        if (imgFile != null) {
            File file = new File(request.getServletContext().getAttribute("TEMPAVATARUSER_DIR") + File.separator + imgFile);
            FileInputStream fis = new FileInputStream(file);
            File local = new File(request.getServletContext().getAttribute("FILEAVATARUSER_DIR") + File.separator + imgFile);
            FileOutputStream fos = new FileOutputStream(local);
            byte[] bytes = new byte[1024];
            int read;
            while ((read = fis.read(bytes)) != -1) {
                fos.write(bytes, 0, read);
            }
            fis.close();
            fos.close();
        }
    }
}
