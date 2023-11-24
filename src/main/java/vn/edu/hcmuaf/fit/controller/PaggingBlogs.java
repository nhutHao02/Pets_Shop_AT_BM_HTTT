package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Blogs;
import vn.edu.hcmuaf.fit.dao.BlogDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "PaggingBlogs", value = "/PaggingBlogs")
public class PaggingBlogs extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String theloai = request.getParameter("theloai");
        String positionIPage = request.getParameter("page");
        int positionPage = Integer.parseInt(positionIPage);
        int index = (positionPage - 1) * 6;
        List<Blogs> list = new BlogDAO().get6Blog(index, theloai);
        List<Blogs> list1 = new BlogDAO().filterBlog(theloai);
        request.setAttribute("getNext6Blogs",list);
        request.setAttribute("totalProInBlog", list1.size());
        request.getRequestDispatcher("ajax/ajax_loadBlog.jsp").forward(request, response);
    }
}
