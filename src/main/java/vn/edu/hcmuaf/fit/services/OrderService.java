package vn.edu.hcmuaf.fit.services;

import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;
import vn.edu.hcmuaf.fit.beans.Cart;
import vn.edu.hcmuaf.fit.beans.OrderDetail;
import vn.edu.hcmuaf.fit.beans.Orders;
import vn.edu.hcmuaf.fit.dao.OrderDAO;

import java.util.List;

public class OrderService {
    private static OrderService orderService;

    public static OrderService getInstance() {
        if (orderService == null) {
            orderService = new OrderService();
        }
        return orderService;
    }

    public String insertOrder(String CustomerID, String fullname, String phone, String address, String email, String notice, Cart cart,String idT) {
      return   new OrderDAO().insertOrder(CustomerID, fullname, phone, address, email, notice, cart, idT);
    }

    public List<Orders> ordersList() {
        return new OrderDAO().ordersList();
    }

    public List<OrderDetail> getOrderDetailsById(String id) {
        return new OrderDAO().getOrderDetailsById(id);
    }
    public void changeStatusVerify(String orderId, int verify){
        new OrderDAO().changeStatusVerify(orderId, verify);
    }

    public void updateDelivery(String orderId, int delivery) {
        new OrderDAO().updateDelivery(orderId, delivery);
    }

    public void updateStatus(String orderId, int status) {
        new OrderDAO().updateStatus(orderId, status);
    }

    public List<Orders> getOrdersByUser(String id) {
        return new OrderDAO().getOrdersByUser(id);
    }

    public Orders getOrderByIdOrder(String id) {
        return new OrderDAO().getOrderByIdOrder(id);
    }

    public double getPriceOrder(List<Orders> od) {
        double price = 0;
        for (Orders o : od) {
            price += o.getPrice();
        }
        return price;
    }

    private static final Logger LOGGER = LoggerFactory.getLogger("Order");

    public void logOrder(String orderId, int approver, int status) {
        if (LOGGER.isDebugEnabled()) {
            MDC.put("order", new Gson().toJson(getOrderByIdOrder(orderId)));
            MDC.put("approver", String.valueOf(approver));
            MDC.put("status", String.valueOf(status));
            switch (status) {
                case 0: {
                    LOGGER.info("Order created");
                    break;
                }
                case 1: {
                    LOGGER.info("Order confirmed");
                    break;
                }
                case 2: {
                    LOGGER.info("Order shipped");
                    break;
                }
                case 3: {
                    LOGGER.info("Order successful");
                    break;
                }
                case 4: {
                    LOGGER.info("Order canceled");
                    break;
                }
                default: {
                    System.out.println("status: " + status);
                    break;
                }
            }
            MDC.remove("order");
            MDC.remove("approver");
            MDC.remove("status");

        }
    }
}

