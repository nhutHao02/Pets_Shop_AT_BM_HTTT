package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.beans.BlogCategory;
import vn.edu.hcmuaf.fit.beans.Blogs;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class BlogDAO {
    public List<Blogs> getListBlogs() {
        List<Blogs> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select BlogId, BlogName, `Status`, Image, Description, Dital, CreateBy, CreateDate, UpdateBy, UpdateDate, ViewCount from blogs WHERE `Status` = 1")
                    .mapToBean(Blogs.class).stream().collect(Collectors.toList());
        });
        return list;
    }

    public  Blogs getContent(String id) {
        Blogs blog = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select BlogId, BlogName, `Status`, Image, Description, Dital, CreateBy, CreateDate, UpdateBy, UpdateDate, ViewCount from blogs b where b.BlogId = ?\n" +
                                    "and `Status` =1"
                            ).bind(0, id)
                    .mapToBean(Blogs.class).one();
        });
        return blog;
    }

    public List<Blogs> Theloai() {
        List<Blogs> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT DISTINCT CatName, CatId\n" +
                            "from blogs b join blog_from_cate bfc on b.BlogId = bfc.BlogId\n" +
                            "JOIN blogcategory bc on bc.CatId = bfc.CateId\n " +
                            "Where b.`Status` = 1  \n"
                    )
                    .mapToBean(Blogs.class).stream().collect(Collectors.toList());
        });
        return list;
    }

    public List<Blogs> NewBlogs() {
        List<Blogs> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT  BlogId, BlogName, `Status`, Image, Description, Dital, CreateBy, CreateDate, UpdateBy, UpdateDate, ViewCount from blogs b\n" +
                            "Where b.`Status` = 1 \n" +
                            "ORDER BY CreateDate DESC \n" +
                            "LIMIT 3;")
                    .mapToBean(Blogs.class).stream().collect(Collectors.toList());
        });
        return list;
    }

    public List<Blogs> AdminListBlog() {
        List<Blogs> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT  BlogId, BlogName, `Status`, Image, Description, Dital, CreateBy, CreateDate, UpdateBy, UpdateDate, ViewCount FROM blogs")
                    .mapToBean(Blogs.class).stream().collect(Collectors.toList());
        });
        return list;
    }

    public Blogs getBlog(String id) {
        Blogs blog =   JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT  BlogId, BlogName, `Status`, Image, Description, Dital, CreateBy, CreateDate, UpdateBy, UpdateDate, ViewCount FROM blogs where BlogId = ?").bind(0,id)
                    .mapToBean(Blogs.class).first();
        });
        return blog;
    }

    public List<BlogCategory> listBlogCate() {
        List<BlogCategory> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT CatId, CatName, `Status`, Sort, ParentID, CreateBy, CreateDate, UpdateBy, UpdateDate from blogcategory;")
                    .mapToBean(BlogCategory.class).stream().collect(Collectors.toList());
        });
        return list;
    }
    public List<Blogs> listBlogCateById(String id) {
        List<Blogs> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT b.BlogId, b.BlogName, bfc.CateId\n" +
                            "from blogs b join blog_from_cate bfc on b.BlogId = bfc.BlogId\n" +
                            "join blogcategory bc on bc.CatId = bfc.CateId\n" +
                            "where bc.CatId = ?;"
                    ).bind(0,id)
                    .mapToBean(Blogs.class)
                    .stream().collect(Collectors.toList());
        });
        return list;
    }
    public Blogs getBlogCateById(String id) {
            return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT b.CatId, b.CatName,b.`Status`,b.Sort,b.ParentID,b.CreateBy,b.CreateDate,b.UpdateBy,b.UpdateDate FROM blogcategory b INNER JOIN blog_from_cate bfc ON b.CatId = bfc.CateId \n" +
                            "where bfc.BlogId = ?;"
                    ).bind(0,id)
                    .mapToBean(Blogs.class)
                    .first());
    }

    public List<Blogs> searchByNameBlog(String txtSearch) {
        List<Blogs> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select BlogId, BlogName, `Status`, Image, Description, Dital, CreateBy, CreateDate, UpdateBy, UpdateDate, ViewCount from blogs where BlogName like ?")
                    .bind(0, "%" + txtSearch + "%")
                    .mapToBean(Blogs.class).stream().collect(Collectors.toList());
        });
        return list;
    }
    public List<Blogs> filterBlog(String theloai) {
        String query = "SELECT b.BlogId, b.BlogName, b.CreateDate,b.Description,b.Image from blogs b JOIN blog_from_cate bfc on b.BlogId = bfc.BlogId\n" +
                "join blogcategory bc on bc.CatId = bfc.CateId\n" +
                "WHERE b.`Status` = 1\n";
        if (theloai != null) {
            if (!theloai.equals("-1")) {
                query += "and bc.CatId = ?\n";
            } else {
                query += "\n ";
            }
        }
        String finalquery = query;
        List<Blogs> list = null;
        if (theloai.equals("-1")) {
            list = JDBIConnector.get().withHandle(handle -> {
                return handle.createQuery(finalquery)
                        .mapToBean(Blogs.class).stream().collect(Collectors.toList());
            });
        } else {
            list = JDBIConnector.get().withHandle(handle -> {
                return handle.createQuery(finalquery).bind(0, theloai)
                        .mapToBean(Blogs.class).stream().collect(Collectors.toList());
            });
        }
        return list;
    }
    public int allBlog() {
        int total = JDBIConnector.get().withHandle(handle -> handle.createQuery("" +
                "SELECT COUNT(DISTINCT BlogId) FROM `blogs` WHERE `Status` = 1").mapTo(Integer.class).first());
        return total;
    }
    public List<Blogs> get6Blog(int count, String theloai) {
        String query = "SELECT b.BlogId, b.BlogName, b.CreateDate,b.Description,b.Image from blogs b JOIN blog_from_cate bfc on b.BlogId = bfc.BlogId\n" +
                "join blogcategory bc on bc.CatId = bfc.CateId\n" +
                "WHERE b.`Status` = 1\n";
            if (!theloai.equals("-1")) {
                query += "and bc.CatId = ?\n";
            } else {
                query += " \n";
            }

            String finalquery = query + "limit ?, 6 ";
            List<Blogs> list = null;
            if (theloai.equals("-1")) {
                list = JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery(finalquery).bind(0, count)
                            .mapToBean(Blogs.class).stream().collect(Collectors.toList());
                });
            } else {
                list = JDBIConnector.get().withHandle(handle -> {
                    return handle.createQuery(finalquery).bind(0, theloai).bind(1, count)
                            .mapToBean(Blogs.class).stream().collect(Collectors.toList());
                });
            }
        return list;
    }
    public static String taoIDBlog() {
        String numbers = "0123456789";
        StringBuilder stringBuilder = new StringBuilder("CB");
        Random rd = new Random();

        for (int i = 0; i < 3; i++) {
            int index = rd.nextInt(numbers.length());
            char rdC = numbers.charAt(index);
            stringBuilder.append(rdC);
        }
        List<String> listId = JDBIConnector.get().withHandle(
                handle -> handle.createQuery("SELECT CatId FROM blogcategory")
                        .mapTo(String.class)
                        .stream()
                        .collect(Collectors.toList()));
        if (listId.contains(stringBuilder.toString())) return taoIDBlog();
        else return stringBuilder.toString();
    }

    public static String insertBlog(String name, int status, String image, String description, String dital, String cate, String createBy) {
        String id = taoIDBlog();
        String date = java.time.LocalDate.now().toString();
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("insert into blogs (BlogId, BlogName, Status, Image, Description, Dital, CreateBy, CreateDate, ViewCount) values(?,?,?,?,?,?,?,?,?)")
                    .bind(0, id)
                    .bind(1, name)
                    .bind(2, status)
                    .bind(3, "http://localhost:8080/Petshop_website_final_war/img/blog/"+image)
                    .bind(4, description)
                    .bind(5, dital)
                    .bind(6, createBy)
                    .bind(7, date)
                    .bind(8, 0)
                    .execute();
            handle.createUpdate("insert into blog_from_cate values (?,?)")
                    .bind(0,id)
                    .bind(1,cate)
                    .execute();
            return true;
        });
        return id;
    }

    public static void deleteBlog(String id) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("SET FOREIGN_KEY_CHECKS = 0").execute();
            handle.createUpdate("delete from blogs where BlogId = ?")
                    .bind(0, id)
                    .execute();
            handle.createUpdate("SET FOREIGN_KEY_CHECKS = 1").execute();
            return true;
        });
    }

    public static void updateBlog(String id, String name, int status, String image, String description,String dital, String cate) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("update blogs set BlogName = ?, Status = ?, Image = ?, Description = ?, Dital = ? where BlogId = ?")
                    .bind(5, id)
                    .bind(0, name)
                    .bind(1, status)
                    .bind(2, "http://localhost:8080/Petshop_website_final_war/img/blog/"+image)
                    .bind(3, description)
                    .bind(4, dital)
                    .execute();
            handle.createUpdate("update blog_from_cate set values CateId = ? where BlogId = ?")
                    .bind(1,id)
                    .bind(0,cate)
                    .execute();
            return true;
        });
    }

    //kiem tra danh muc co chua blog nao khong
    public boolean isCateContainBl(String cateId) {
        List<String> idCates = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select bc.CateId from blogcategory c inner join blog_from_cate bc on c.CatId = bc.CateId where c.CatId=?")
                        .bind(0, cateId).mapTo(String.class).stream().collect(Collectors.toList()));
        if (idCates.contains(cateId)) return true;
        else return false;
    }

    public void AddViewCountBlog(String id) {
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("UPDATE blogs SET ViewCount = ViewCount + 1 WHERE BlogId=?")
                        .bind(0, id)
                        .execute());
    }

    public static void main(String[] args) {
//        System.out.println(new BlogDAO().test("0","1"));
//        System.out.println(new BlogDAO().getContent(null));
//        System.out.println(new BlogDAO().allBlog());
        System.out.println(new BlogDAO().AdminListBlog());
    }
}
