package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.services.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "SearchMain", value = "/search-main")
public class SearchMain extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String txtSearch = request.getParameter("txt");
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.searchProductByName(txtSearch);
        request.setAttribute("list", list);
        request.getRequestDispatcher("ajax/ajax_searchmain.jsp").forward(request, response);

        LogService logService= new LogService();
        HttpSession session = request.getSession();
        if(!session.getAttributeNames().equals("user")){
            logService.createNonUserLog("INFOR", "Người dùng tìm kiếm tin tức với từ khóa "+txtSearch);
        } else {
            UserAccount user = (UserAccount) request.getSession().getAttribute("user");
            logService.createUserLog(user.getId(), "INFOR", "Người dùng " + user.getUsername() + " tìm kiếm tin tức với từ khóa " + txtSearch);
        }
    }
}
