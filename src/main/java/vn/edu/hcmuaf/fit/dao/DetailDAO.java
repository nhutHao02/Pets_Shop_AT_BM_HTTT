package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.beans.Detail;
import vn.edu.hcmuaf.fit.beans.ImageProduct;
import vn.edu.hcmuaf.fit.beans.Product;
import vn.edu.hcmuaf.fit.beans.UserAccount;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class DetailDAO {
    private List<Detail> listDetail;

    public DetailDAO() {
    }

    public static String taoIDCatePd() {
        String numbers = "0123456789";
        StringBuilder stringBuilder = new StringBuilder("CP");
        Random rd = new Random();

        for (int i = 0; i < 3; i++) {
            int index = rd.nextInt(numbers.length());
            char rdC = numbers.charAt(index);
            stringBuilder.append(rdC);
        }
        List<String> listId = JDBIConnector.get().withHandle(
                handle -> handle.createQuery("SELECT CatId FROM product_category")
                        .mapTo(String.class)
                        .stream()
                        .collect(Collectors.toList()));
        if (listId.contains(stringBuilder.toString())) return taoIDCatePd();
        else return stringBuilder.toString();
    }

    public static String taoIDCateBl() {
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
        if (listId.contains(stringBuilder.toString())) return taoIDCateBl();
        else return stringBuilder.toString();
    }

    public List<Detail> listCategory() {
        List<Detail> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select CatId,CatName,`Status`,Sort,ParentID,CreateBy,CreateDate,UpdateBy,UpdateDate from product_category where ParentID IS NOT NULL")
                    .mapToBean(Detail.class).stream().collect(Collectors.toList());
        });
        return list;
    }

    public static List<Detail> listProCateClassify(String category) {
        String query = "SELECT DISTINCT pc.CatId,pc.CatName,pc.`Status`,pc.Sort,pc.ParentID,pc.CreateBy,pc.CreateDate,pc.UpdateBy,pc.UpdateDate FROM  product_category pc join product_from_cate pfc on pfc.cate_id = pc.CatId JOIN product p on p.productId = pfc.product_id Where p.`Status` =1";
        if (category != null)
        {
            switch (category) {
                case "all" -> query += " and pc.ParentID != \"null\"  ";
                case "1" -> query += " and pc.ParentID = 1";
                case "2" -> query += " and pc.ParentID = 2";
                case "3" -> query += " and pc.ParentID = 3";
                default -> query+=" and pc.ParentID != \"null\"  ";
            }
        }
        String finalquery = query;
        List<Detail> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery(finalquery).mapToBean(Detail.class).stream().collect(Collectors.toList());
        });
        return list;
    }

    public List<Detail> listCategoryProduct() {
        List<Detail> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select CatId,CatName,`Status`,Sort,ParentID,CreateBy,CreateDate,UpdateBy,UpdateDate from product_category ")
                    .mapToBean(Detail.class).stream().collect(Collectors.toList());
        });
        return list;
    }

    public List<Detail> listCategoryBlog() {
        List<Detail> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select CatId,CatName,`Status`,Sort,ParentID,CreateBy,CreateDate,UpdateBy,UpdateDate from blogcategory ")
                    .mapToBean(Detail.class).stream().collect(Collectors.toList());
        });
        return list;
    }

    public Detail getCateProductById(String id) {
        Detail cate = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select CatId,CatName,`Status`,Sort,ParentID,CreateBy,CreateDate,UpdateBy,UpdateDate from product_category where CatId = ?")
                    .bind(0, id).mapToBean(Detail.class).one();
        });
        return cate;
    }

    public Detail getCateBlogById(String id) {
        Detail cate = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select CatId,CatName,`Status`,Sort,ParentID,CreateBy,CreateDate,UpdateBy,UpdateDate from blogcategory where CatId = ?")
                    .bind(0, id).mapToBean(Detail.class).one();
        });
        return cate;
    }

    public List<Detail> listCategoryParentPd() {
        List<Detail> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT CatId,CatName,`Status`,Sort,ParentID,CreateBy,CreateDate,UpdateBy,UpdateDate FROM product_category WHERE ParentID is null ")
                    .mapToBean(Detail.class).stream().collect(Collectors.toList());
        });
        return list;
    }

    public List<Detail> listCategoryParentBl() {
        List<Detail> list = JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT CatId,CatName,`Status`,Sort,ParentID,CreateBy,CreateDate,UpdateBy,UpdateDate FROM blogcategory WHERE ParentID is null ")
                    .mapToBean(Detail.class).stream().collect(Collectors.toList());
        });
        return list;
    }

    public void insertCateProduct(String idAdmin, String name, String CateParent) {
        String id = taoIDCatePd();
        String date = java.time.LocalDate.now().toString();
        if (CateParent != "0") {
            JDBIConnector.get().withHandle(handle -> handle.createUpdate("INSERT INTO product_category (CatId,CatName,`Status`,ParentID, CreateBy,CreateDate) VALUES(?,?,1,?,?,?);")
                    .bind(0, id)
                    .bind(1, name)
                    .bind(2, CateParent)
                    .bind(3, idAdmin)
                    .bind(4, date)
                    .execute());
        } else {
            JDBIConnector.get().withHandle(handle -> handle.createUpdate("INSERT INTO product_category (CatId,CatName,`Status`, CreateBy,CreateDate) VALUES(?,?,1,?,?);")
                    .bind(0, id)
                    .bind(1, name)
                    .bind(2, idAdmin)
                    .bind(3, date)
                    .execute());
        }
    }

    public void insertCateBlog(String idAdmin, String name, String CateParent) {
        String id = taoIDCateBl();
        String date = java.time.LocalDate.now().toString();
        if (CateParent != "0") {
            JDBIConnector.get().withHandle(handle -> handle.createUpdate("INSERT INTO blogcategory (CatId,CatName,`Status`,ParentID, CreateBy,CreateDate) VALUES(?,?,1,?,?,?);")
                    .bind(0, id)
                    .bind(1, name)
                    .bind(2, CateParent)
                    .bind(3, idAdmin)
                    .bind(4, date)
                    .execute());
        } else {
            JDBIConnector.get().withHandle(handle -> handle.createUpdate("INSERT INTO blogcategory (CatId,CatName,`Status`, CreateBy,CreateDate) VALUES(?,?,1,?,?);")
                    .bind(0, id)
                    .bind(1, name)
                    .bind(2, idAdmin)
                    .bind(3, date)
                    .execute());
        }
    }

    public void updateCateProduct(String idcate, String idAdmin, String name, String CateParent, String status) {
        String date = java.time.LocalDate.now().toString();
        if (CateParent != "0") {
            JDBIConnector.get().withHandle(handle -> handle.createUpdate("UPDATE product_category SET CatName=?,`Status`=?,ParentID=?,UpdateBy=?,UpdateDate=? WHERE CatId=?")
                    .bind(0, name)
                    .bind(1, Integer.parseInt(status))
                    .bind(2, CateParent)
                    .bind(3, idAdmin)
                    .bind(4, date)
                    .bind(5, idcate)
                    .execute());
        } else {
            JDBIConnector.get().withHandle(handle -> handle.createUpdate("UPDATE blogcategory SET CatName=?,`Status`=?,UpdateBy=?,UpdateDate=? WHERE CatId=?")
                    .bind(0, name)
                    .bind(1, Integer.parseInt(status))
                    .bind(2, idAdmin)
                    .bind(3, date)
                    .bind(4, idcate)
                    .execute());
        }
    }

    public void updateCateBlog(String idcate, String idAdmin, String name, String CateParent, String status) {
        String date = java.time.LocalDate.now().toString();
        if (CateParent != "0") {
            JDBIConnector.get().withHandle(handle -> handle.createUpdate("UPDATE blogcategory SET CatName=?,`Status`=?,ParentID=?,UpdateBy=?,UpdateDate=? WHERE CatId=?")
                    .bind(0, name)
                    .bind(1, Integer.parseInt(status))
                    .bind(2, CateParent)
                    .bind(3, idAdmin)
                    .bind(4, date)
                    .bind(5, idcate)
                    .execute());
        } else {
            JDBIConnector.get().withHandle(handle -> handle.createUpdate("UPDATE product_category SET CatName=?,`Status`=?,UpdateBy=?,UpdateDate=? WHERE CatId=?")
                    .bind(0, name)
                    .bind(1, Integer.parseInt(status))
                    .bind(2, idAdmin)
                    .bind(3, date)
                    .bind(4, idcate)
                    .execute());
        }
    }

    public void removeCateProduct(String id) {
        JDBIConnector.get().withHandle(handle -> {
                    handle.createUpdate("SET FOREIGN_KEY_CHECKS = 0").execute();
                    handle.createUpdate("DELETE FROM product_category WHERE CatId=?")
                            .bind(0, id)
                            .execute();
                    handle.createUpdate("SET FOREIGN_KEY_CHECKS = 1").execute();
                    return null;
                }
        );
    }

    public void removeCateBlog(String id) {
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("SET FOREIGN_KEY_CHECKS = 0").execute();
                    handle.createUpdate("DELETE FROM blogcategory WHERE CatId=?")
                            .bind(0, id)
                            .execute();
            handle.createUpdate("SET FOREIGN_KEY_CHECKS = 1").execute();
                    return null;
                }

        );
    }


    public List<Product> getListPdByCateId(String id) {
        List<Product> list = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT p.productId, p.ProductName, p.`Status`,p.Image,p.Price,p.PromotionalPrice,p.Quantity,p.Warranty,p.Description,p.Dital,p.CreateBy,p.CreateDate,p.UpdateBy,p.UpdateDate,p.giong,p.mausac,p.cannang \n" +
                "FROM product p INNER JOIN product_from_cate pc ON p.productId = pc.product_id \n" +
                "WHERE pc.cate_id = ?;").bind(0,id).mapToBean(Product.class).stream().collect(Collectors.toList()));
        return list;
    }

    public Detail getCateProduct(String id){
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT c.CatId, c.CatName,c.`Status`,c.Sort,c.ParentID,c.CreateBy,c.CreateDate,c.UpdateBy,c.UpdateDate FROM product_category c INNER JOIN product_from_cate pc ON c.CatId=pc.cate_id\n" +
                "WHERE c.ParentID IS NOT NULL AND pc.product_id=?").bind(0,id).mapToBean(Detail.class).first());
    }

    public Detail getPentCateProduct(String id){
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT c.CatId, c.CatName,c.`Status`,c.Sort,c.ParentID,c.CreateBy,c.CreateDate,c.UpdateBy,c.UpdateDate FROM product_category c INNER JOIN product_from_cate pc ON c.CatId=pc.cate_id\n" +
                "WHERE c.ParentID IS NULL AND pc.product_id=?").bind(0,id).mapToBean(Detail.class).first());
    }

    public List<Detail> listCateAccessory(){
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT c.CatId, c.CatName,c.`Status`,c.Sort,c.ParentID,c.CreateBy,c.CreateDate,c.UpdateBy,c.UpdateDate FROM product_category c \n" +
                "WHERE c.ParentID IS NOT NULL AND ParentID=3").mapToBean(Detail.class).stream().collect(Collectors.toList()));
    }


}