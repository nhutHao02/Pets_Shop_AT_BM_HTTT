package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;

public class BlogComment implements Serializable {
    private String ID;
    private String CustomerID;
    private String Description;
    private String CommentDate;
    private String CommentStatus;
    private String BlogID;

    public BlogComment() {
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(String customerID) {
        CustomerID = customerID;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getCommentDate() {
        return CommentDate;
    }

    public void setCommentDate(String commentDate) {
        CommentDate = commentDate;
    }

    public String getCommentStatus() {
        return CommentStatus;
    }

    public void setCommentStatus(String commentStatus) {
        CommentStatus = commentStatus;
    }

    public String getBlogID() {
        return BlogID;
    }

    public void setBlogID(String blogID) {
        BlogID = blogID;
    }
}
