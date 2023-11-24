package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.beans.Detail;

import vn.edu.hcmuaf.fit.dao.DetailDAO;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Category", value = "/Category")
public class Category extends HttpServlet {
    /*
        Hiển thị danh mục sản phẩm - Nguyễn Huy Hoàng 20130266
    */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DetailDAO dao = new DetailDAO();
        List<Detail> list = dao.listCategory();
        request.setAttribute("listD", list);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
