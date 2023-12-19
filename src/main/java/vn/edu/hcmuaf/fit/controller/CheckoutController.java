package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.dao.KeyDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.OrderService;
import vn.edu.hcmuaf.fit.services.ProductService;
import vn.edu.hcmuaf.fit.tool.Hash;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CheckoutController", value = "/CheckoutController")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    //20130252_Trần Nhựt Hào
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        UserAccount userAccount = (UserAccount) request.getSession().getAttribute("user");
        boolean isvalid=new KeyDAO().isValidKey(userAccount.getId());
        System.out.println(isvalid);
        if(!isvalid){
            response.getWriter().write("failure");
            return;
        }
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String notice = request.getParameter("notice");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        String valueString=fullName+phone+address+email+notice+cart.total();
        for (Map.Entry key:cart.getData().entrySet()){
            Product pro= (Product) key.getValue();
            valueString+=pro.getProductId()+pro.getProductName()+pro.getPrice()+pro.getPromotionalPrice()+pro.getQuantityCart();
        }
        String mesageHash=new Hash().hashString(valueString);
//        System.out.println(mesageHash);
        System.out.println(valueString);
        response.getWriter().write(mesageHash);

    }
}
