package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.util.List;

public class Detail implements Serializable {
    private String CatID;
    private String CatName;
    private int Status;
    private int Sort;
    private String ParentID;
    private String CreateBy;
    private String CreateDate;
    private String UpdateBy;
    private String UpdateDate;

    private List<Product> productsOfCate;
    private String ViewCount;



    public Detail() {
    }

    public Detail(String catID, String catName, int status, int sort, String parentID, String createBy, String createDate, String updateBy, String updateDate, List<Product> productsOfCate) {
        CatID = catID;
        CatName = catName;
        Status = status;
        Sort = sort;
        ParentID = parentID;
        CreateBy = createBy;
        CreateDate = createDate;
        UpdateBy = updateBy;
        UpdateDate = updateDate;
        productsOfCate = productsOfCate;
    }

    public String getCatID() {
        return CatID;
    }

    public void setCatID(String catID) {
        CatID = catID;
    }

    public String getCatName() {
        return CatName;
    }

    public void setCatName(String catName) {
        CatName = catName;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int status) {
        Status = status;
    }

    public int getSort() {
        return Sort;
    }

    public void setSort(int sort) {
        Sort = sort;
    }

    public String getParentID() {
        return ParentID;
    }

    public void setParentID(String parentID) {
        ParentID = parentID;
    }

    public String getCreateBy() {
        return CreateBy;
    }

    public void setCreateBy(String createBy) {
        CreateBy = createBy;
    }

    public String getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(String createDate) {
        CreateDate = createDate;
    }

    public String getUpdateBy() {
        return UpdateBy;
    }

    public void setUpdateBy(String updateBy) {
        UpdateBy = updateBy;
    }

    public String getUpdateDate() {
        return UpdateDate;
    }

    public void setUpdateDate(String updateDate) {
        UpdateDate = updateDate;
    }

    public List<Product> getProductsOfCate() {
        return productsOfCate;
    }

    public void setProductsOfCate(List<Product> productsOfCate) {
        this.productsOfCate = productsOfCate;
    }

    @Override
    public String toString() {
        return "Detail{" +
                "CatID='" + CatID + '\'' +
                ", CatName='" + CatName + '\'' +
                ", Status=" + Status +
                ", Sort=" + Sort +
                ", ParentID='" + ParentID + '\'' +
                ", CreateBy='" + CreateBy + '\'' +
                ", CreateDate='" + CreateDate + '\'' +
                ", UpdateBy='" + UpdateBy + '\'' +
                ", UpdateDate='" + UpdateDate + '\'' +
                '}';
    }
}