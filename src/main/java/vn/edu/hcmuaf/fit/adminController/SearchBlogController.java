package vn.edu.hcmuaf.fit.adminController;

import vn.edu.hcmuaf.fit.beans.Blogs;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.dao.BlogDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.services.DetailService;
import vn.edu.hcmuaf.fit.services.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "SearchBlogController", value = "/SearchBlogController")
public class SearchBlogController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txt");
        BlogDAO dao = new BlogDAO();
        List<Blogs> list = dao.searchByNameBlog(txtSearch);
        PrintWriter out = response.getWriter();
        for (Blogs b : list) {
            out.println("<div class=\"col-lg-6 col-md-6 col-sm-6\" style=\"width: min-content;padding-right: 80px;padding-left: 80px;padding-bottom: 20px\">\n" +
                    "                    <div class=\"blog__item\">\n" +
                    "                        <div class=\"blog__item__pic\">\n" +
                    "                            <img src=\"http://localhost:8080/Petshop_website_final_war/"+b.getImage()+"\" alt=\"\" width=\"400px\" height=\"200px\" style=\"object-fit: cover\">\n" +
                    "                        </div>\n" +
                    "                        <div class=\"blog__item__text\">\n" +
                    "                            <ul>\n" +
                    "                                <li><i class=\"fa fa-calendar-o\"></i> "+b.getCreateDate()+"</li>\n" +
                    "                            </ul>\n" +
                    "                            <h5><a href=\"\" style=\"font-size: 22px;font-weight: 600;color: #0b5ed7\">"+b.getBlogName()+"\n" +
                    "                            </a></h5>\n" +
                    "                            <p>"+b.getDescription()+"</p>\n" +
                    "                            <a href=\"add-blog.jsp?id="+b.getBlogId()+"\" class=\"blog_btn\">Chỉnh sửa  <i data-feather=\"arrow-right\"></i></a>\n" +
                    "                            <a href=\"DeleteBlog?id="+b.getBlogId()+"\" class=\"blog_btn\">Xóa  <i data-feather=\"arrow-right\"></i></a>\n" +
                    "                        </div>\n" +
                    "                    </div>\n" +
                    "                </div>");
        }
        LogService logService= new LogService();
        UserAccount userAccount = (UserAccount) request.getSession().getAttribute("admin");
        logService.createUserLog(userAccount.getId(), "INFOR", "Admin "+userAccount.getUsername()+" đã tìm kiếm tin tức với từ khóa "+txtSearch);
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

