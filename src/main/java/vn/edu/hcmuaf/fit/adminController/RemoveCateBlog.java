package vn.edu.hcmuaf.fit.adminController;

import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.services.DetailService;
import vn.edu.hcmuaf.fit.services.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveCateBlog", value = "/admin/RemoveCateBlog")
public class RemoveCateBlog extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("cbid");
        LogService logService= new LogService();
        UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
        logService.createUserLog(userAccount.getId(), "INFOR", "Admin "+userAccount.getUsername()+" đã xóa danh mục tin tức "+DetailService.getInstance().getCateBlogById(id).getCatName());
        DetailService.getInstance().removeCateBlog(id);
        response.sendRedirect("list-category.jsp");
    }
}
