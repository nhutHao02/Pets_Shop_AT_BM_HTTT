package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
public class Blogs implements Serializable {
    private String blogId;
    private String blogName;
    private String Status;
    private String image;
    private String description;
    private String dital;
    private String createBy;
    private String createDate;
    private String updateBy;
    private String updateDate;
    private String catName;
    private String catId;
    private String ViewCount;
    public Blogs() {
    }

    public Blogs(String blogId, String blogName, String status, String image, String description, String dital, String createBy, String createDate, String updateBy, String updateDate, String catName, String catId, String viewCount) {
        this.blogId = blogId;
        this.blogName = blogName;
        Status = status;
        this.image = image;
        this.description = description;
        this.dital = dital;
        this.createBy = createBy;
        this.createDate = createDate;
        this.updateBy = updateBy;
        this.updateDate = updateDate;
        this.catName = catName;
        this.catId = catId;
        ViewCount = viewCount;
    }

    public String getCatName() {
        return catName;
    }

    public String getCatId() {
        return catId;
    }

    public void setCatId(String catId) {
        this.catId = catId;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    public String getBlogId() {
        return blogId;
    }

    public void setBlogId(String blogId) {
        this.blogId = blogId;
    }

    public String getBlogName() {
        return blogName;
    }

    public void setBlogName(String blogName) {
        this.blogName = blogName;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDital() {
        return dital;
    }

    public void setDital(String dital) {
        this.dital = dital;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public String getViewCount() {
        return ViewCount;
    }

    public void setViewCount(String viewCount) {
        ViewCount = viewCount;
    }

    @Override
    public String toString() {
        return "Blogs{" +
                "blogId='" + blogId + '\'' +
                ", blogName='" + blogName + '\'' +
                ", Status='" + Status + '\'' +
                ", image='" + image + '\'' +
                ", description='" + description + '\'' +
                ", dital='" + dital + '\'' +
                ", createBy='" + createBy + '\'' +
                ", createDate='" + createDate + '\'' +
                ", updateBy='" + updateBy + '\'' +
                ", updateDate='" + updateDate + '\'' +
                ", catName='" + catName + '\'' +
                ", catId='" + catId + '\'' +
                ", ViewCount='" + ViewCount + '\'' +
                '}';
    }
}

