package vn.edu.hcmuaf.fit.adminController;

import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.services.ContactService;
import vn.edu.hcmuaf.fit.services.DetailService;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.MailService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "replyContact", value = "/admin/replyContact")
public class replyContact extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id= request.getParameter("id");
        String name= request.getParameter("name");
        String email= request.getParameter("email");
        String content= request.getParameter("content");

        UserAccount admin = (UserAccount) request.getSession().getAttribute("admin");
        String nameAdmin = admin.getName();

        //Gửi email
        boolean check = MailService.getInstance().sendEmailContact(email,name,content,nameAdmin);

        if (check) {
            // cập nhật lại trạng thái
            ContactService.getInstance().updateStatus(id);
            response.sendRedirect("list-contact.jsp");

            LogService logService= new LogService();
            UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
            logService.createUserLog(userAccount.getId(), "INFOR", "Admin "+userAccount.getUsername()+" đã phản hồi liên hệ qua email");
        } else {
            System.out.println("Gửi email không thành công!");

            LogService logService= new LogService();
            UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
            logService.createUserLog(userAccount.getId(), "ERROR", "Gửi phản hồi liên hệ không thành công");
        }

    }
}
