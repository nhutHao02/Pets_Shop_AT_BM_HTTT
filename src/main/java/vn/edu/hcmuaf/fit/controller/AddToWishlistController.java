package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.beans.Wishlist;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddToWishlistController", value = "/AddToWishlistController")
public class AddToWishlistController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
        Thêm sản phẩm vào yêu thích sử dụng ajax - Nguyễn Sĩ Hoàng 20130267
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idAdd").substring(12);
        int quantity = 1;
        Wishlist wishlist = (Wishlist) request.getSession().getAttribute("wishlist");
        Product product = ProductService.getInstance().getProductDetail(id);
        product.setQuantityWishlist(quantity);
        wishlist.put(product);
        request.getSession().setAttribute("wishlist", wishlist);
        request.setAttribute("productDetails", product);

        LogService logService= new LogService();
        UserAccount user = (UserAccount) request.getSession().getAttribute("user");
        logService.createUserLog(user.getId(), "INFOR", "Người dùng "+user.getUsername()+" đã thêm "+product.getProductName()+" vào yêu thích");
    }
}
