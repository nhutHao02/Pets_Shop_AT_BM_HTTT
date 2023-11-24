package vn.edu.hcmuaf.fit.adminController;

import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.services.DetailService;
import vn.edu.hcmuaf.fit.services.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddCategoryBlog", value = "/admin/AddCategoryBlog")
public class AddCategoryBlog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
        Thêm danh mục tin tức - Nguyễn Ngọc Huy 20130281
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String CateName = request.getParameter("catename");
        String cateparent = request.getParameter("cateparent");
        String status = request.getParameter("status");
        String cbid = request.getParameter("cbid");
        UserAccount AdminUser = (UserAccount) request.getSession().getAttribute("admin");

        if (cbid == "") {
            DetailService.getInstance().insertCateBlog(AdminUser.getId(), CateName, cateparent);

            LogService logService= new LogService();
            logService.createUserLog(AdminUser.getId(), "INFOR", "Admin "+AdminUser.getUsername()+" đã thêm "+CateName+" làm danh mục tin tức mới");
        } else {
            DetailService.getInstance().updateCateBlog(cbid, AdminUser.getId(), CateName, cateparent, status);

            LogService logService= new LogService();
            logService.createUserLog(AdminUser.getId(), "INFOR", "Admin "+AdminUser.getUsername()+" đã chỉnh sửa danh mục tin tức "+CateName);
        }
        response.sendRedirect("list-category.jsp");
    }
}
