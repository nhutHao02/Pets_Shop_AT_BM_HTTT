package vn.edu.hcmuaf.fit.beans;
import java.io.Serializable;
public class BlogCategory {
    private String catId;
    private String catName;
    private String status;
    private String sort;
    private String parentID;
    private String createBy;
    private String createDate;
    private String updateBy;
    private String updateDate;

    public BlogCategory() {

    }

    public BlogCategory(String catId, String catName, String status, String sort, String parentID, String createBy, String createDate, String updateBy, String updateDate) {
        this.catId = catId;
        this.catName = catName;
        this.status = status;
        this.sort = sort;
        this.parentID = parentID;
        this.createBy = createBy;
        this.createDate = createDate;
        this.updateBy = updateBy;
        this.updateDate = updateDate;
    }

    public String getCatId() {
        return catId;
    }

    public void setCatId(String catId) {
        this.catId = catId;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getParentID() {
        return parentID;
    }

    public void setParentID(String parentID) {
        this.parentID = parentID;
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

    @Override
    public String toString() {
        return "BlogCategory{" +
                "catId='" + catId + '\'' +
                ", catName='" + catName + '\'' +
                ", status='" + status + '\'' +
                ", sort='" + sort + '\'' +
                ", parentID='" + parentID + '\'' +
                ", createBy='" + createBy + '\'' +
                ", createDate='" + createDate + '\'' +
                ", updateBy='" + updateBy + '\'' +
                ", updateDate='" + updateDate + '\'' +
                '}';
    }
}
