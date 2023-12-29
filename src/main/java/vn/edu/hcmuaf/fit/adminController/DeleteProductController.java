package vn.edu.hcmuaf.fit.adminController;

import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.services.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteProductController", value = "/admin/delete-product")
public class DeleteProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("pid");
        ProductDAO dao = new ProductDAO();
        LogService logService= new LogService();
        UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
        logService.createUserLog(userAccount.getId(), "INFOR", "Admin "+userAccount.getUsername()+" đã xóa sản phẩm thú cưng "+dao.getProductDetail(id).getProductName());
        dao.deleteProduct(id);
        response.sendRedirect("list-products");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
