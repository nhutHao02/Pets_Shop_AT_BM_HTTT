package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;

public class OrderDetail implements Serializable {
    private String OrderID;
    private String ProductID;
    private String ProductName;
    private double Price;
    private int Quantity;
    private int PricePromotional;

    private String idTransport;

    public OrderDetail() {
    }

    public OrderDetail(String orderID, String productID, String productName, double price, int quantity, int pricePromotional, String idTransport) {
        OrderID = orderID;
        ProductID = productID;
        ProductName = productName;
        Price = price;
        Quantity = quantity;
        PricePromotional = pricePromotional;
        this.idTransport = idTransport;
    }

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String orderID) {
        OrderID = orderID;
    }

    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String productID) {
        ProductID = productID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String productName) {
        ProductName = productName;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int quantity) {
        Quantity = quantity;
    }

    public int getPricePromotional() {
        return PricePromotional;
    }

    public void setPricePromotional(int pricePromotional) {
        PricePromotional = pricePromotional;
    }

    public String getIdTransport() {
        return idTransport;
    }

    public void setIdTransport(String idTransport) {
        this.idTransport = idTransport;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "OrderID='" + OrderID + '\'' +
                ", ProductID='" + ProductID + '\'' +
                ", ProductName='" + ProductName + '\'' +
                ", Price=" + Price +
                ", Quantity=" + Quantity +
                ", PricePromotional=" + PricePromotional +
                ", idTransport='" + idTransport + '\'' +
                "}\n";
    }
}
