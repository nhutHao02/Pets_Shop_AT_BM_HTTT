package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.dao.OrderDAO;
import vn.edu.hcmuaf.fit.tool.Hash;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "SaveOrderController", value = "/SaveOrderController")

public class SaveOrderController extends HttpServlet {
    //20130252_Trần Nhựt Hào
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("SAVE");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String notice = request.getParameter("notice");
        String signedHashMessage = request.getParameter("message");
        UserAccount userAccount = (UserAccount) request.getSession().getAttribute("user");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        OrderDAO dao = new OrderDAO();
        String result = dao.insertOrder(userAccount.getId(), fullName, phone, address, email, notice, cart, signedHashMessage);
        request.getSession().setAttribute("cart", new Cart());
        response.setStatus(HttpServletResponse.SC_OK);
        response.sendRedirect("index.jsp");


    }
}
