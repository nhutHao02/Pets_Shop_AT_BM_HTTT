package vn.edu.hcmuaf.fit.adminController;

import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.services.DetailService;
import vn.edu.hcmuaf.fit.services.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddCategoryProduct", value = "/admin/AddCategoryProduct")
public class AddCategoryProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String CateName = request.getParameter("catename");
        String cateparent=request.getParameter("cateparent");
        String status = request.getParameter("status");
        String cid = request.getParameter("cid");
        UserAccount AdminUser = (UserAccount) request.getSession().getAttribute("admin");

        if(cid==""){
            DetailService.getInstance().insertCateProduct(AdminUser.getId(),CateName,cateparent);

            LogService logService= new LogService();
            logService.createUserLog(AdminUser.getId(), "INFOR", "Admin "+AdminUser.getUsername()+" đã thêm "+CateName+" làm danh mục sản phẩm mới");
        }else {
            DetailService.getInstance().updateCateProduct(cid,AdminUser.getId(),CateName,cateparent,status);

            LogService logService= new LogService();
            logService.createUserLog(AdminUser.getId(), "INFOR", "Admin "+AdminUser.getUsername()+" đã chỉnh sửa danh mục sản phẩm "+CateName);
        }
        response.sendRedirect("list-category.jsp");
    }
}
