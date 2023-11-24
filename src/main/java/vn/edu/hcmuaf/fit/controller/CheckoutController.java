package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.OrderService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CheckoutController", value = "/CheckoutController")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
         Chức năng thanh toán - Nguyễn Ngọc Huy 20130281
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String notice = request.getParameter("notice");
        String idT = request.getParameter("idT");
        UserAccount userAccount = (UserAccount) request.getSession().getAttribute("user");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        boolean checkInventory= true;
        List<String> insufficient = new ArrayList<>();
        for (String idp: cart.getData().keySet()){
            Product p = ProductDAO.getProductById(idp);
            int quantity=cart.getData().get(idp).getQuantityCart();
            String nameP= p.getProductName();
            if(ProductService.getInstance().getQuantityProduct(idp) < quantity){
                checkInventory=false;
                insufficient.add(nameP);
            }
        }
        if(checkInventory){
            String id = OrderService.getInstance().insertOrder(userAccount.getId(),fullname,phone,address,email,notice,cart,idT);
            request.getSession().setAttribute("cart",new Cart());
            response.getWriter().print(id);
            LogService logService= new LogService();
            UserAccount user = (UserAccount) request.getSession().getAttribute("user");
            logService.createUserLog(user.getId(), "INFOR", "Người dùng "+user.getUsername()+" đã chuyển sang mục thanh toán");
        }

    }
}
