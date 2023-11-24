package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;

public class ImageProduct implements Serializable {
    private String ID_Product;
    private String img;

    public ImageProduct() {

    }

    public ImageProduct(String ID_Product, String img) {
        this.ID_Product = ID_Product;
        this.img = img;
    }

    public String getID_Product() {
        return ID_Product;
    }

    public void setID_Product(String ID_Product) {
        this.ID_Product = ID_Product;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "ImageProduct{" +
                "ID_Product='" + ID_Product + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
