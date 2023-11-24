package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadMoreController", value = "/loadMore")
public class LoadMoreController extends HttpServlet {
    /*
        Chức năng loadmore cho trang danh sách sản phẩm - Nguyễn Ngọc Huy 20130281, Nguyễn Huy Hoàng 20130266
    */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String amount = request.getParameter("amount");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String orderby = request.getParameter("orderby");
        String size = request.getParameter("size");
        int amount_int = Integer.parseInt(amount);
        List<Product> list = new ProductDAO().getNext9Product(amount_int,category,price, size, orderby);
        request.setAttribute("listnext9", list);
        request.getRequestDispatcher("ajax/ajax_loadProduct.jsp").forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        processRequest(request, response);
    }
}
