package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.beans.Wishlist;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.LoginService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginController", value = "/LoginController")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
        Chức năng đăng nhập - Nguyễn Ngọc Huy 20130281
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String pass = request.getParameter("password");

        UserAccount account = LoginService.getInstance().getAccountCustomer(username, pass);
        if (account != null) {
            if(account.isAdmin()){
                account.setRole(LoginService.getInstance().getListRoleAdmin(account.getId()));
                HttpSession session = request.getSession();
                session.setAttribute("admin", account);
                response.sendRedirect("admin/index.jsp");

                LogService logService= new LogService();
                UserAccount user = (UserAccount) request.getSession().getAttribute("admin");
                logService.createAdminLog(user.getId(), "INFOR", "Admin "+user.getUsername()+" đăng nhập vào hệ thống");
            }else {
                HttpSession session = request.getSession();
                session.setAttribute("user", account);
                session.setAttribute("cart", new Cart());
                session.setAttribute("wishlist", new Wishlist());
                response.sendRedirect("index.jsp");

                LogService logService= new LogService();
                UserAccount user = (UserAccount) request.getSession().getAttribute("user");
                logService.createUserLog(user.getId(), "INFOR", "Người dùng "+user.getUsername()+" đăng nhập vào hệ thống");
            }
        } else {
            request.setAttribute("loginStatus", LoginService.getInstance().getStatus());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    public static void main(String[] args) {

    }
}
