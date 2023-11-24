package vn.edu.hcmuaf.fit.adminController;

import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PaggingAccessoryController", value = "/PaggingAccessoryController")
public class PaggingAccessoryController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String positionIPage = request.getParameter("page");
        if (positionIPage == null) {
            positionIPage = "1";
        }
        int positionPage = Integer.parseInt(positionIPage);
        request.setAttribute("positionPage",positionPage);
        int index = (positionPage-1) * 9;
        System.out.println(positionPage + "     " + index);

        List<Product> list = new ProductDAO().getNext6AccessoriesAdmin(index);
        request.setAttribute("listAccessoryPagging", list);
        request.getRequestDispatcher("admin/ajax/ajax-AccessoryAdminPagging.jsp").forward(request, response);
    }
}
