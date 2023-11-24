package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;

public class Orders implements Serializable {
    private String OrderID;
    private String OrderDate;
    private int Status;
    private int Delivered;
    private String DeliveryDate;
    private String CustomerID;
    private double Discount;
    private String Notice;
    private double Price;
    private String RecipientName;
    private String Email;
    private String Phone;
    private String Address;
    private String idTransport;

    public Orders() {
    }


    public Orders(String orderID, String orderDate, int status, int delivered, String deliveryDate, String customerID, double discount, String notice, double price, String recipientName, String email, String phone, String address, String idTransport) {
        OrderID = orderID;
        OrderDate = orderDate;
        Status = status;
        Delivered = delivered;
        DeliveryDate = deliveryDate;
        CustomerID = customerID;
        Discount = discount;
        Notice = notice;
        Price = price;
        RecipientName = recipientName;
        Email = email;
        Phone = phone;
        Address = address;
        this.idTransport = idTransport;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public String getRecipientName() {
        return RecipientName;
    }

    public void setRecipientName(String recipientName) {
        RecipientName = recipientName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String orderID) {
        OrderID = orderID;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String orderDate) {
        OrderDate = orderDate;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int status) {
        Status = status;
    }

    public int getDelivered() {
        return Delivered;
    }

    public void setDelivered(int delivered) {
        Delivered = delivered;
    }

    public String getDeliveryDate() {
        return DeliveryDate;
    }

    public void setDeliveryDate(String deliveryDate) {
        DeliveryDate = deliveryDate;
    }

    public String getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(String customerID) {
        CustomerID = customerID;
    }

    public double getDiscount() {
        return Discount;
    }

    public void setDiscount(double discount) {
        Discount = discount;
    }

    public String getNotice() {
        return Notice;
    }

    public void setNotice(String notice) {
        Notice = notice;
    }

    public String getIdTransport() {
        return idTransport;
    }

    public void setIdTransport(String idTransport) {
        this.idTransport = idTransport;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "OrderID='" + OrderID + '\'' +
                ", OrderDate='" + OrderDate + '\'' +
                ", Status=" + Status +
                ", Delivered=" + Delivered +
                ", DeliveryDate='" + DeliveryDate + '\'' +
                ", CustomerID='" + CustomerID + '\'' +
                ", Discount=" + Discount +
                ", Notice='" + Notice + '\'' +
                ", Price=" + Price +
                ", RecipientName='" + RecipientName + '\'' +
                ", Email='" + Email + '\'' +
                ", Phone='" + Phone + '\'' +
                ", Address='" + Address + '\'' +
                ", idTransport='" + idTransport + '\'' +
                '}';
    }
}
