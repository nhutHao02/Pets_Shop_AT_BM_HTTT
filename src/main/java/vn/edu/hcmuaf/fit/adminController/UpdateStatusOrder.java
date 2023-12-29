package vn.edu.hcmuaf.fit.adminController;

import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateStatusOrder", value = "/admin/UpdateStatusOrder")
public class UpdateStatusOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        int status = Integer.parseInt(request.getParameter("status"));
        int delivery = Integer.parseInt(request.getParameter("delivery"));
        int udstatus = Integer.parseInt(request.getParameter("udstatus"));
        int newstatus=status;
        int newdelivery=delivery;

        if(udstatus==0){
            newdelivery =0;
        }else if(udstatus==1){
            newdelivery=1;
        }else {
            newstatus =0;
        }

        if(status!=newstatus){
            OrderService.getInstance().updateStatus(orderId,newstatus);

            LogService logService= new LogService();
            UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
            logService.createUserLog(userAccount.getId(), "INFOR", "Đã cập nhật thông tin đơn hàng thành công");
        }else if(delivery!=newdelivery){
            OrderService.getInstance().updateDelivery(orderId,newdelivery);

            LogService logService= new LogService();
            UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
            logService.createUserLog(userAccount.getId(), "INFOR", "Đã cập nhật thông tin vận chuyển thành công");
        }
        response.sendRedirect("products-status.jsp");
    }


}
