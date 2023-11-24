package vn.edu.hcmuaf.fit.adminController;

import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.dao.CustomerUserDAO;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.SignUpService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditUserCustomerController", value = "/admin/EditUserCustomerController")
public class EditUserCustomerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /*
        Thêm và chỉnh sửa thông tin người dùng - Nguyễn Ngọc Huy 20130281, Nguyễn Sĩ Hoàng 20130267
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String passwd = request.getParameter("passwd");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int status;

        if (request.getParameter("status").equals("Mở khóa")) {
            status = 1;
        } else {
            status = 0;
        }
        System.out.println(status);

        String exe = SignUpService.getInstance().checkUser(email, username);
        if (id.isEmpty()) {
            if (fullname == "" || email == "" || username == "" || passwd == "") {
                request.setAttribute("addUsererror", "Không được bỏ trống!");
                request.getRequestDispatcher("add-admin.jsp").forward(request, response);

                LogService logService = new LogService();
                UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
                logService.createUserLog(userAccount.getId(), "ERROR", "Admin " + userAccount.getUsername() + " nhập thiếu thông tin");
            } else {
                if (exe != null) {
                    request.setAttribute("addUsererror", exe);
                    request.getRequestDispatcher("add-admin.jsp").forward(request, response);
                } else
                    new CustomerUserDAO().insertCustomer(username, passwd, fullname, email, phone, address, status);
                response.sendRedirect("list-user.jsp");

                LogService logService = new LogService();
                UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
                logService.createUserLog(userAccount.getId(), "INFOR", "Admin " + userAccount.getUsername() + " đã thêm " + username + " làm user mới");

            }
        } else {
            if(passwd.equals("")){
                new CustomerUserDAO().updateCustomer(id, username, fullname, email, phone, address, status);
                response.sendRedirect("list-user.jsp");

                LogService logService = new LogService();
                UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
                logService.createUserLog(userAccount.getId(), "INFOR", "Admin " + userAccount.getUsername() + " đã chỉnh sửa thông tin user " + username);
            }else{
                new CustomerUserDAO().updateCustomer(id, username, passwd, fullname, email, phone, address, status);
                response.sendRedirect("list-user.jsp");

                LogService logService = new LogService();
                UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
                logService.createUserLog(userAccount.getId(), "INFOR", "Admin " + userAccount.getUsername() + " đã chỉnh sửa thông tin user " + username);
            }
        }
    }
}
