package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.ForgotPassword;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.services.ForgotPasswordService;
import vn.edu.hcmuaf.fit.services.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "NewPassword", value = "/NewPassword")
public class NewPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newPass = request.getParameter("newpass");
        String confirmNewPass = request.getParameter("confirmpass");

        HttpSession session = request.getSession();
        ForgotPassword forgot = (ForgotPassword) session.getAttribute("forgot");

        if(newPass.equals(confirmNewPass)){
            ForgotPasswordService.getInstance().updatePasswordFromEmail(newPass,forgot.getEmail());
            response.sendRedirect("login.jsp");

            LogService logService= new LogService();
            UserAccount user = (UserAccount) request.getSession().getAttribute("user");
            logService.createUserLog(user.getId(), "INFOR", "Người dùng quay lại trang đăng nhập");
        }else {
            request.setAttribute("errorConfirm", "Mật khẩu nhập lại không đúng! ");
            request.getRequestDispatcher("newPassword.jsp").forward(request, response);

            LogService logService= new LogService();
            UserAccount user = (UserAccount) request.getSession().getAttribute("user");
            logService.createUserLog(user.getId(), "INFOR", "Người dùng nhập sai mật khẩu nhập lại");
        }
    }
}
