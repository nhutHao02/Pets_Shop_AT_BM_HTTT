package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.SignUp;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.MailService;
import vn.edu.hcmuaf.fit.services.SignUpService;
import vn.edu.hcmuaf.fit.services.Utils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SignUpController", value = "/SignUpController")
public class SignUpController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String user = request.getParameter("user");
        String passwd = request.getParameter("passwd");
        String phone = request.getParameter("phone");
        String confirmpassword = request.getParameter("confirmpassword");
        String code = Utils.getVerifyCode();

        MailService ms = MailService.getInstance();

        if (request.getSession().getAttribute("Singup") == null) {
            SignUp signUp = new SignUp(fullname, email, user, passwd, phone, Utils.maHoaMK(passwd), code);
            request.getSession().setAttribute("Signup", signUp);
        }
        if (fullname == "" || email == "" || user == "" || passwd == "" || confirmpassword == "") {
            request.setAttribute("registerError", "Không được bỏ trống!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);

            LogService logService= new LogService();
            logService.createNonUserLog("ERROR", "Người dùng nhập thiếu thông tin đăng ký");
        } else {
            String exe = SignUpService.getInstance().checkUser(email, user);
            if (exe != null) {
                request.setAttribute("registerError", exe);
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            } else if (!passwd.equals(confirmpassword)) {
                request.setAttribute("registerError", "Mật khẩu nhập lại không đúng!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);

                LogService logService= new LogService();
                logService.createNonUserLog("ERROR", "Người dùng nhập sai mật khẩu nhập lại");
            } else {
                SignUp users = (SignUp) request.getSession().getAttribute("Signup");
                boolean test = ms.sendEmailSignUp(users);
                //check if the email send successfully
                if (test) {
                    HttpSession session = request.getSession();
                    session.setAttribute("authcode", users);
                    response.sendRedirect("verify.jsp");

                    LogService logService= new LogService();
                    logService.createNonUserLog("ERROR", "Người dùng chuyển sang trang xác thực");
                } else {
                    System.out.println("Gửi code đến email không thành công!");

                    LogService logService= new LogService();
                    logService.createNonUserLog("ERROR", "Mã code gửi đến người dùng không thành công");
                }
            }
        }
    }


}

