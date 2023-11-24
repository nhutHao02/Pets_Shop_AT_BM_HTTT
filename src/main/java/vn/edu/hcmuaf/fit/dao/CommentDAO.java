package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.beans.BlogComment;
import vn.edu.hcmuaf.fit.beans.Comment;
import vn.edu.hcmuaf.fit.beans.BlogComment;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class CommentDAO  {
    private List<Comment> comments = new ArrayList<>();

    public static List<Comment> getListComment() {
        List<Comment> cmt = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select pcmt.ID, pcmt.CustomerID, pcmt.Description, pcmt.CommentDate, pcmt.CommentStatus, pcmt.ProductID, pcmt.ParentID, pcmt.vote from productcomment pcmt inner join infor_user iu on pcmt.CustomerID = iu.id_user")
                    .mapToBean(Comment.class).stream().collect(Collectors.toList());
        });
        return cmt;
    }
    public static List<Comment> getListCommentByProductID(String id) {
        List<Comment> cmt = JDBIConnector.get().withHandle(handle -> {
           return handle.createQuery("select ID, CustomerID, Description, CommentDate, CommentStatus, ProductID, ParentID, vote from productcomment where ProductID = ?")
                   .bind(0,id)
                   .mapToBean(Comment.class).stream().collect(Collectors.toList());
        });
        return cmt;
    }
    public static List<BlogComment> getListCommentByBlogID(String id) {
        List<BlogComment> cmt = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select ID, CustomerID, Description, CommentDate, CommentStatus, BlogID from blogcomment where BlogID = ?")
                    .bind(0,id)
                    .mapToBean(BlogComment.class).stream().collect(Collectors.toList());
        });
        return cmt;
    }
    public static Comment getComment(String id){
        Comment cmt = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select ID, CustomerID, Description, CommentDate, CommentStatus, ProductID, ParentID, vote from productcomment where ID = ?")
                    .bind(0,id)
                    .mapToBean(Comment.class).first();
        });
        return cmt;
    }
    public List<Comment> getComments() {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("select ID, CustomerID, Description, CommentDate, CommentStatus, ProductID, ParentID, vote from productcomment")
                .mapToBean(Comment.class).stream().collect(Collectors.toList()));
    }
    public static BlogComment getCommentBlog(String id){
        BlogComment cmt = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select ID, CustomerID, Description, CommentDate, CommentStatus, BlogID from blogcomment where ID = ?")
                    .bind(0,id)
                    .mapToBean(BlogComment.class).first();
        });
        return cmt;
    }
    public static String taoIDComment() {
        String numbers = "0123456789";
        StringBuilder stringBuilder = new StringBuilder("P");
        Random rd = new Random();

        for (int i = 0; i < 4; i++) {
            int index = rd.nextInt(numbers.length());
            char rdC = numbers.charAt(index);
            stringBuilder.append(rdC);
        }
        List<String> listId = JDBIConnector.get().withHandle(
                handle -> handle.createQuery("SELECT ID FROM productcomment")
                        .mapTo(String.class)
                        .stream()
                        .collect(Collectors.toList()));
        if (listId.contains(stringBuilder.toString())) return taoIDComment();
        else return stringBuilder.toString();
    }
    public static String InsertComment(String cusID, String desc, int status, String pID, String vote){
        String id = taoIDComment();
        String date = java.time.LocalDate.now().toString();
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("insert into productcomment (ID ,CustomerID , Description , CommentDate, CommentStatus, ProductID, vote) " +
                            "values (?,?,?,?,?,?,?)")
                    .bind(0,id)
                    .bind(1, cusID)
                    .bind(2, desc)
                    .bind(3, date)
                    .bind(4, status)
                    .bind(5, pID)
                    .bind(6, vote)
                    .execute();
            return true;
        });
        return id;
    }
    public static String InsertCommentBlog(String cusID, String desc, int status, String bID){
        String id = taoIDComment();
        String date = java.time.LocalDate.now().toString();
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("insert into blogcomment (ID ,CustomerID , Description , CommentDate, CommentStatus, BlogID) " +
                            "values (?,?,?,?,?,?)")
                    .bind(0,id)
                    .bind(1, cusID)
                    .bind(2, desc)
                    .bind(3, date)
                    .bind(4, status)
                    .bind(5, bID)
                    .execute();
            return true;
        });
        return id;
    }
    public void RemoveComment(String id) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("DELETE FROM productcomment WHERE ID = ?")
                            .bind(0, id)
                            .execute();
                    return true;
                }
        );
    }
    public void RemoveCommentBlog(String id) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("DELETE FROM blogcomment WHERE ID = ?")
                            .bind(0, id)
                            .execute();
                    return true;
                }
        );
    }
}
