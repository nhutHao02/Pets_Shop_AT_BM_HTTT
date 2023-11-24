package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.SignUp;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.SignUpService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "VerifyCode ", value = "/VerifyCode")
public class VerifyCode extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
        Gửi mã xác nhận qua mail - Nguyễn Ngọc Huy 20130281
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            SignUp user = (SignUp) session.getAttribute("authcode");

            String code = request.getParameter("authcode").trim();
            if (code.length() != 6) {
                String error = "Mã xác nhận phải điền đủ 6 số";
                request.setAttribute("errorCode", error);
                request.getRequestDispatcher("verify.jsp").forward(request, response);

                LogService logService= new LogService();
                UserAccount userAccount = (UserAccount) request.getSession().getAttribute("user");
                logService.createUserLog(userAccount.getId(), "ERROR", "Người dùng "+userAccount.getUsername()+" nhập thiếu mã xác nhận");
            } else {
                if (code.equals(user.getCode())) {
                    SignUpService.getInstance().insertUser(user.getUserName(), user.getPassMaHoa(), user.getPasswd(), user.getFullName(), user.getEmail(), user.getPhone());
                    response.sendRedirect("login.jsp");

                    LogService logService= new LogService();
                    UserAccount userAccount = (UserAccount) request.getSession().getAttribute("user");
                    logService.createUserLog(userAccount.getId(), "INFOR", "Người dùng "+userAccount.getUsername()+" chuyển sang trang đăng nhập");
                } else {
                    request.setAttribute("errorCode", "Mã xác nhận không đúng");
                    request.getRequestDispatcher("verify.jsp").forward(request, response);

                    LogService logService= new LogService();
                    UserAccount userAccount = (UserAccount) request.getSession().getAttribute("user");
                    logService.createUserLog(userAccount.getId(), "INFOR", "Người dùng "+userAccount.getUsername()+" sai mã xác nhận");
                }
            }

        }
    }
}
