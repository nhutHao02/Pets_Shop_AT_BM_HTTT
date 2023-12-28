package vn.edu.hcmuaf.fit.adminController;

import vn.edu.hcmuaf.fit.services.ImportService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "AddImportController", value = "/admin/AddImportController")
public class AddImportController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idP = request.getParameter("idP");
        String quantity = request.getParameter("quantity");
        PrintWriter writer = response.getWriter();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/html");

        if (ImportService.getInstance().checkIdp(idP)){
            String nameP = ProductService.getInstance().getProductDetail(idP).getProductName();
            ImportService.getInstance().insertImport(idP,quantity);
            writer.write("Đã nhập hàng thành công sản phẩm "+nameP+" với số lượng "+quantity);
        }else {
            writer.write("Sản phẩm chưa có trong kho, vui lòng thêm sản phẩm sau đó quay lại nhập hàng!");
        }
    }
}
