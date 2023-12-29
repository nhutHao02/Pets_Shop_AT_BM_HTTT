package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "AddToCartController", value = "/AddCartController")
public class AddToCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idAdd").substring(8);
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        Product product = ProductService.getInstance().getProductDetail(id);
        product.setQuantityCart(quantity);
        cart.put(id, product);
        request.getSession().setAttribute("cart", cart);
        request.setAttribute("total", cart.total());
        request.getRequestDispatcher("ajax/ajax_total.jsp").forward(request, response);

        LogService logService= new LogService();
        UserAccount user = (UserAccount) request.getSession().getAttribute("user");
        logService.createUserLog(user.getId(), "INFOR", "Người dùng "+user.getUsername()+" đã thêm "+product.getProductName()+" vào giỏ hàng");
    }
}
