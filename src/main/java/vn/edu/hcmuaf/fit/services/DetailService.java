package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.beans.Detail;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.dao.DetailDAO;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class DetailService {
    private static DetailService detailService;

    public static DetailService getInstance() {
        if (detailService == null) {
            detailService = new DetailService();
        }
        return detailService;
    }


        public static List<Detail> listProCateClassify(String category) {
            DetailDAO dao = new DetailDAO();
            return dao.listProCateClassify(category);
        }

    public static List<Detail> getData() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM product_category")
                    .mapToBean(Detail.class).stream().collect(Collectors.toList());
        });
    }
    public List<Detail> listCategory(){
        return new DetailDAO().listCategory();
    }

    public List<Detail> listCategoryProduct() {
        return new DetailDAO().listCategoryProduct();
    }

    public List<Detail> listCategoryBlog() {
        return new DetailDAO().listCategoryBlog();
    }

    public Detail getCateProductById(String id) {
        return new DetailDAO().getCateProductById(id);
    }

    public Detail getCateBlogById(String id) {
        return new DetailDAO().getCateBlogById(id);
    }

    public List<Detail> listCategoryParentPd() {
        return new DetailDAO().listCategoryParentPd();
    }

    public List<Detail> listCategoryParentBl() {
        return new DetailDAO().listCategoryParentBl();
    }

    public void insertCateProduct(String idAdmin, String name, String CateParent) {
        new DetailDAO().insertCateProduct(idAdmin, name, CateParent);
    }

    public void insertCateBlog(String idAdmin, String name, String CateParent) {
        new DetailDAO().insertCateBlog(idAdmin, name, CateParent);
    }

    public void updateCateProduct(String idcate, String idAdmin, String name, String CateParent, String status) {
        new DetailDAO().updateCateProduct(idcate, idAdmin, name, CateParent, status);
    }

    public void updateCateBlog(String idcate, String idAdmin, String name, String CateParent, String status) {
        new DetailDAO().updateCateBlog(idcate, idAdmin, name, CateParent, status);
    }

    public void removeCateProduct(String id) {
        new DetailDAO().removeCateProduct(id);
    }

    public void removeCateBlog(String id) {
        new DetailDAO().removeCateBlog(id);
    }
    public List<Product> getListPdByCateId(String id){
        return new DetailDAO().getListPdByCateId(id);
    }

    public Detail getCateProduct(String id){
        return new DetailDAO().getCateProduct(id);
    }

    public Detail getPentCateProduct(String id){
        return  new DetailDAO().getPentCateProduct(id);
    }
    public List<Detail> listCateAccessory(){
        return new DetailDAO().listCateAccessory();
    }
    public static void main(String[] args) {
        new DetailService().listCategoryParentPd();
    }
}


