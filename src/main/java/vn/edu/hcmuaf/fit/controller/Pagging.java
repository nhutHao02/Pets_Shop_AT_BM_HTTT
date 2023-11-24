package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Pagging", value = "/pagging")
public class Pagging extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        String price = request.getParameter("price");
        String orderby = request.getParameter("orderby");
        String category = request.getParameter("category");
        String size = request.getParameter("size");

        int total = Integer.parseInt(request.getParameter("total"));
        int page = Integer.parseInt(request.getParameter("page"));
        int endPage = total/9;
        int positionProduct = page*9;
        if (total % 9 != 0) {
            endPage++;
        }

        List<Product> list = dao.getNext9Product(positionProduct, category, price,  size,  orderby);
        request.setAttribute("listPagging",list);
        request.getRequestDispatcher("all-products.jsp").forward(request,response);
    }
}
