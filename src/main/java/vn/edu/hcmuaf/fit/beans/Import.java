package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;

public class Import implements Serializable {
    private String id;
    private String importDay;
    private int quantity;
    private String idProduct;

    public Import() {
    }

    public Import(String id, String importDay, int quantity, String idProduct) {
        this.id = id;
        this.importDay = importDay;
        this.quantity = quantity;
        this.idProduct = idProduct;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImportDay() {
        return importDay;
    }

    public void setImportDay(String importDay) {
        this.importDay = importDay;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }
}
