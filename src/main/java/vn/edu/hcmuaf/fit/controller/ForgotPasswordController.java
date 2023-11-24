package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.ForgotPassword;
import vn.edu.hcmuaf.fit.beans.SignUp;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.services.ForgotPasswordService;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.MailService;
import vn.edu.hcmuaf.fit.services.Utils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ForgotPasswordController", value = "/ForgotPasswordController")
public class ForgotPasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
         Chức năng quên mật khẩu - Nguyễn Ngọc Huy 20130281
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String OTP = Utils.getVerifyCode();
        MailService ms = MailService.getInstance();
        if (request.getSession().getAttribute("forgot") == null) {
            ForgotPassword forgot = new ForgotPassword(email, OTP);
            request.getSession().setAttribute("forgot", forgot);
        }
        if (email == "") {
            request.setAttribute("forgotError", "Hãy nhập email!");
            request.getRequestDispatcher("forget.jsp").forward(request, response);

            LogService logService= new LogService();
            UserAccount user = (UserAccount) request.getSession().getAttribute("user");
            logService.createUserLog(user.getId(), "ERROR", "Người dùng chưa nhập email");
        } else {
            String id_user = ForgotPasswordService.getInstance().checkEmailExits(email);
            if (id_user.equals("")) {
                request.setAttribute("forgotError", "Email chưa được liên kết với tài khoản. Hãy đăng ký!");
                request.getRequestDispatcher("forget.jsp").forward(request, response);

                LogService logService= new LogService();
                UserAccount user = (UserAccount) request.getSession().getAttribute("user");
                logService.createUserLog(user.getId(), "ERROR", "Email người dùng chưa được liên kết với tài khoản");
            } else {
                ForgotPassword forgot = (ForgotPassword) request.getSession().getAttribute("forgot");
                boolean test = ms.sendEmailForgot(forgot);
                //check if the email send successfully
                if (test) {
                    response.sendRedirect("ConfirmOTP.jsp");

                    LogService logService= new LogService();
                    UserAccount user = (UserAccount) request.getSession().getAttribute("user");
                    logService.createUserLog(user.getId(), "INFOR", "Người dùng chuyển sang nhập mã OTP");
                } else {
                    System.out.println("Gửi code đến email không thành công!");

                    LogService logService= new LogService();
                    UserAccount user = (UserAccount) request.getSession().getAttribute("user");
                    logService.createUserLog(user.getId(), "ERROR", "Mã OTP gửi không thành công đến người dùng");
                }
            }
        }


    }

}
