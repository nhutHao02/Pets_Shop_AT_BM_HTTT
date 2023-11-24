package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Comment;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.dao.CommentDAO;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CommentController", value = "/CommentController")
public class CommentController extends HttpServlet {
    /*
        Chức năng bình luận sử dụng ajax - Nguyễn Sĩ Hoàng 20130267
    */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        UserAccount cusID = (UserAccount) request.getSession().getAttribute("user");
        String desc = request.getParameter("desc");
        System.out.println(desc);
        int status = 1;
        String pID = request.getParameter("pID");
        String vote = "5";
        CommentDAO dao = new CommentDAO();
        String id = dao.InsertComment(cusID.getId(), desc, status, pID, vote);
        Comment cmt = dao.getComment(id);
        request.setAttribute("cmt", cmt);

        LogService logService= new LogService();
        UserAccount user = (UserAccount) request.getSession().getAttribute("user");
        logService.createUserLog(user.getId(), "INFOR", "Người dùng "+user.getUsername()+" đã bình luận vào sản phẩm "+new ProductService().getProductDetail(pID).getProductName());

        request.getRequestDispatcher("ajax/ajax-comment.jsp").forward(request,response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
