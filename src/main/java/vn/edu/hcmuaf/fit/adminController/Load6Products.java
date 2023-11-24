package vn.edu.hcmuaf.fit.adminController;

import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Load9Products", value = "/admin/Load6ProductsController")
public class Load6Products extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String amount = request.getParameter("amount");
        int amount_int = 0;
        List<Product> list = new ProductDAO().getNext6ProductAdmin(amount_int);
        List<Product> list1 = new ProductDAO().getFullAdminProduct();
        request.setAttribute("listnext6", list);
        request.setAttribute("numb", list1.size());
        request.getRequestDispatcher("ajax/ajax-loadAdminProduct.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        processRequest(request, response);

    }
}
