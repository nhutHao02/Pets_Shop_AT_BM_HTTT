package vn.edu.hcmuaf.fit.adminController;

import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.dao.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PaggingProductController", value = "/PaggingProductController")
public class PaggingProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String positionIPage = request.getParameter("page");
        if (positionIPage == null) {
            positionIPage = "1";
        }
        int positionPage = Integer.parseInt(positionIPage);
        request.setAttribute("positionPage",positionPage);
        int index = (positionPage-1) * 9;
        System.out.println(positionPage + "     " + index);

        List<Product> list = new ProductDAO().getNext6ProductAdmin(index);
        request.setAttribute("listProductPagging", list);
        request.getRequestDispatcher("admin/ajax/ajax-ProductAdminPagging.jsp").forward(request, response);
    }
}
