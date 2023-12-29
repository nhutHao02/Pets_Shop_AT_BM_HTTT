package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AllProduct", value = "/all-product")
public class AllProduct extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        String price = request.getParameter("price");
        String orderby = request.getParameter("orderby");
        String category = request.getParameter("category");
        String size = request.getParameter("size");
        String amount = request.getParameter("amount");
        String total = request.getParameter("total");
        request.setAttribute("total",total);
        int amount_int = 0;
        List<Product> list = dao.getFullProduct(  category, price,  size,  orderby);
        int totalPro = list.size();
        int totalPa = 0;
        if (totalPro % 9 == 0) {
            totalPa = totalPro/9;
        } else {totalPa = totalPro/9 + 1;}
        request.setAttribute("totalPa", totalPa);
        request.setAttribute("list", list);
        request.setAttribute("numb", list.size());
        request.getRequestDispatcher("all-products.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}