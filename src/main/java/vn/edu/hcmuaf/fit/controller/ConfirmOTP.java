package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.ForgotPassword;
import vn.edu.hcmuaf.fit.beans.SignUp;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.SignUpService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ConfirmOTP", value = "/ConfirmOTP")
public class ConfirmOTP extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    /*
        Xác nhận mã OTP để đổi mật khẩu - Nguyễn Ngọc Huy 20130281
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            ForgotPassword forgot = (ForgotPassword) session.getAttribute("forgot");

            String code = request.getParameter("OTP").trim();
            if (code.length() != 6) {
                String error = "Mã xác nhận phải điền đủ 6 số";
                request.setAttribute("errorOTP", error);
                request.getRequestDispatcher("ConfirmOTP.jsp").forward(request, response);

                LogService logService= new LogService();
                UserAccount user = (UserAccount) request.getSession().getAttribute("user");
                logService.createUserLog(user.getId(), "ERROR", "Người dùng điền thiếu mã OTP");
            } else {
                if (code.equals(forgot.getCode())) {
                    response.sendRedirect("newPassword.jsp");

                    LogService logService= new LogService();
                    UserAccount user = (UserAccount) request.getSession().getAttribute("user");
                    logService.createUserLog(user.getId(), "INFOR", "Người dùng đã chuyển sang mục đổi mật khẩu");
                } else {
                    request.setAttribute("errorOTP", "Mã xác nhận không đúng");
                    request.getRequestDispatcher("ConfirmOTP.jsp").forward(request, response);

                    LogService logService= new LogService();
                    UserAccount user = (UserAccount) request.getSession().getAttribute("user");
                    logService.createUserLog(user.getId(), "ERROR", "Người dùng nhập sai mã xác nhận");
                }
            }

        }
    }
}
