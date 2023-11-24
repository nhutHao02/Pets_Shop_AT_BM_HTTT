package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ControllerPagging", value = "/ControllerPagging")
public class ControllerPagging extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String orderby = request.getParameter("orderby");
        String size = request.getParameter("size");
        String positionIPage = request.getParameter("page");
        int positionPage = Integer.parseInt(positionIPage);
        request.setAttribute("positionPage",positionPage);
        int index = (positionPage-1) * 9;
        List<Product> list = new ProductDAO().getNext9Product(index,category,price, size, orderby);
        request.setAttribute("listPagging", list);
        request.getRequestDispatcher("ajax/ajax-Pagging.jsp").forward(request, response);
    }
}
