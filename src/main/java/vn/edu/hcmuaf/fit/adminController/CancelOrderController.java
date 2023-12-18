package vn.edu.hcmuaf.fit.adminController;

import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CancelOrderController", value = "/CancelOrderController")
public class CancelOrderController extends HttpServlet {
    // 20130260-Hoàng Trung Hiếu
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        OrderService orderService = new OrderService();
        orderService.updateStatus(orderId, 0);
        orderService.updateDelivery(orderId, 0);
//        response.sendRedirect("/Petshop_website_final_war/admin/products-status.jsp");
        response.sendRedirect("/Petshop_website_final_war/ajax/admin-ajax-loadOrder.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}