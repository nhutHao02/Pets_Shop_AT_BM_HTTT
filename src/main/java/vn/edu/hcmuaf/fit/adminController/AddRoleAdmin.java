package vn.edu.hcmuaf.fit.adminController;

import ch.qos.logback.core.net.SyslogOutputStream;
import vn.edu.hcmuaf.fit.beans.AdminRole;
import vn.edu.hcmuaf.fit.beans.Comment;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.dao.CommentDAO;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddRoleAdmin", value = "/admin/AddRoleAdmin")
public class AddRoleAdmin extends HttpServlet {
    /*
    */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idAdmin");
        String table = request.getParameter("table");
        String perm =request.getParameter("per");
        int per = Integer.parseInt(perm);
        boolean add = UserService.getInstance().addRoleadmin(id,table,per);

    }
}
