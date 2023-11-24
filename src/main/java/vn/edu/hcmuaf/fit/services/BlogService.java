package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.beans.BlogCategory;
import vn.edu.hcmuaf.fit.beans.Blogs;
import vn.edu.hcmuaf.fit.dao.BlogDAO;

import java.util.List;

public class BlogService {



    private static BlogService blogService;
    public static BlogService getInstance() {
        if (blogService == null) {
            blogService = new BlogService();
        }
        return blogService;
    }

    public static List<Blogs> getListBlogs() {
        BlogDAO dao = new BlogDAO();
        return dao.getListBlogs();
    }
    public static Blogs getContent(String id) {
        BlogDAO dao = new BlogDAO();
        return dao.getContent(id);
    }
    public static  List<Blogs> Theloai() {
        BlogDAO dao = new BlogDAO();
        return dao.Theloai();
    }

    public static  List<Blogs> NewBlogs() {
        BlogDAO dao = new BlogDAO();
        return dao.NewBlogs();
    }

    public  static List<Blogs> AdminListBlog() {
        BlogDAO dao = new BlogDAO();
        return dao.AdminListBlog();
    }

    public static Blogs getBlog(String id) {
        BlogDAO dao = new BlogDAO();
        return dao.getBlog(id);
    }
    public  static List<BlogCategory> listBlogCate() {
        BlogDAO dao = new BlogDAO();
        return dao.listBlogCate();
    }
    public  static List<Blogs> listBlogCateById(String id) {
        BlogDAO dao = new BlogDAO();
        return dao.listBlogCateById(id);
    }
    public static Blogs getBlogCateById(String id) {
        BlogDAO dao = new BlogDAO();
        return dao.getBlogCateById(id);
    }
    public static List<Blogs> filterBlog(String theloai) {
        BlogDAO dao = new BlogDAO();
        return dao.filterBlog(theloai);
    }

    public static void deleteBlog(String id) {
        BlogDAO dao = new BlogDAO();
        dao.deleteBlog(id);
    }

    public static List<Blogs> get6Blog(int count, String theloai) {
        return new BlogDAO().get6Blog(count,theloai);
    }

    public boolean isCateContainBl(String cateId){
        return new BlogDAO().isCateContainBl(cateId);
    }

    public void AddViewCountBlog(String id) {
        new BlogDAO().AddViewCountBlog(id);
    }
}
