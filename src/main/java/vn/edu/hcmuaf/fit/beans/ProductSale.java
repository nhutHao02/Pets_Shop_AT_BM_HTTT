package vn.edu.hcmuaf.fit.beans;

import java.sql.Date;

public class ProductSale {
    private String Id_adver;
    private String Id_product;
    private String name_adver;
    private int discount;
    private String Img;
    private String Description;
    private Date date_start;
    private Date date_end;

    public ProductSale() {
    }

    public ProductSale(String id_adver, String id_product, String name_adver, int discount, String img, String description, Date date_start, Date date_end) {
        Id_adver = id_adver;
        Id_product = id_product;
        this.name_adver = name_adver;
        this.discount = discount;
        this.Img = img;
        this.Description = description;
        this.date_start = date_start;
        this.date_end = date_end;
    }

    @Override
    public String toString() {
        return "ProductSale{" +
                "Id_adver='" + Id_adver + '\'' +
                ", Id_product='" + Id_product + '\'' +
                ", name_adver='" + name_adver + '\'' +
                ", discount='" + discount + '\'' +
                ", Img='" + Img + '\'' +
                ", Description='" + Description + '\'' +
                ", date_start=" + date_start +
                ", date_end=" + date_end +
                '}';
    }

    public String getId_adver() {
        return Id_adver;
    }

    public void setId_adver(String id_adver) {
        Id_adver = id_adver;
    }

    public String getId_product() {
        return Id_product;
    }

    public void setId_product(String id_product) {
        Id_product = id_product;
    }

    public String getName_adver() {
        return name_adver;
    }

    public void setName_adver(String name_adver) {
        this.name_adver = name_adver;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getImg() {
        return Img;
    }

    public void setImg(String img) {
        Img = img;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public Date getDate_start() {
        return date_start;
    }

    public void setDate_start(Date date_start) {
        this.date_start = date_start;
    }

    public Date getDate_end() {
        return date_end;
    }

    public void setDate_end(Date date_end) {
        this.date_end = date_end;
    }
}
