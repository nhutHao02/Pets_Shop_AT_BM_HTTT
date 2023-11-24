package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.beans.Wishlist;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteWishlistController", value = "/DeleteWishlistController")
public class DeleteWishlistController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
         Xóa sản phẩm khỏi yêu thích - Nguyễn Sĩ Hoàng 20130267
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idP = request.getParameter("idP");
        Wishlist wishlist = (Wishlist) request.getSession().getAttribute("wishlist");
        System.out.println(idP);
        wishlist.getData().remove(idP);
        request.getSession().setAttribute("wishlist", wishlist);

        LogService logService= new LogService();
        UserAccount user = (UserAccount) request.getSession().getAttribute("user");
        logService.createUserLog(user.getId(), "INFOR", "Người dùng "+user.getUsername()+" đã xóa "+new ProductService().getProductDetail(idP)+" khỏi yêu thích");
        request.getRequestDispatcher("ajax/wishlist.jsp").forward(request, response);
    }
}
