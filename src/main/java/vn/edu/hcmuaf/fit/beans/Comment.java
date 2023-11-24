package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;

public class Comment implements Serializable {
    private String ID;
    private String CustomerID;
    private String Description;
    private String CommentDate;
    private String CommentStatus;
    private String ProductID;
    private String ParrentID;
    private int vote;

    public Comment() {
    }

    public Comment(String ID, String customerID, String description, String commentDate, String commentStatus, String productID, String parrentID, int vote) {
        this.ID = ID;
        CustomerID = customerID;
        Description = description;
        CommentDate = commentDate;
        CommentStatus = commentStatus;
        ProductID = productID;
        ParrentID = parrentID;
        this.vote = vote;
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

    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String productID) {
        ProductID = productID;
    }

    public String getParrentID() {
        return ParrentID;
    }

    public void setParrentID(String parrentID) {
        ParrentID = parrentID;
    }

    public int getVote() {
        return vote;
    }

    public void setVote(int vote) {
        this.vote = vote;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "ID='" + ID + '\'' +
                ", CustomerID='" + CustomerID + '\'' +
                ", Description='" + Description + '\'' +
                ", CommentDate='" + CommentDate + '\'' +
                ", CommentStatus='" + CommentStatus + '\'' +
                ", ProductID='" + ProductID + '\'' +
                ", ParrentID='" + ParrentID + '\'' +
                ", vote=" + vote +
                '}';
    }
}
