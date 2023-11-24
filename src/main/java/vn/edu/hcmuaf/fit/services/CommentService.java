package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.beans.Comment;
import vn.edu.hcmuaf.fit.dao.CommentDAO;

import java.util.List;

public class CommentService {
    private static CommentService commentService;
    public static CommentService getInstance() {
        if (commentService == null) {
            commentService = new CommentService();
        }
        return commentService;
    }
    public List<Comment> getComments(){
        return new CommentDAO().getComments();
    }

    public void removeComment(String id){
        new CommentDAO().RemoveComment(id);
    }

    public static void main(String[] args) {
        System.out.println(getInstance().getComments());
    }
}
