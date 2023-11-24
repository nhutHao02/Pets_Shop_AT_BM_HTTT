package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.util.List;

public class UserAccount implements Serializable {
    private String id;
    private String username;
    private String passMaHoa;
    private String pass;
    private boolean status;
    private String name;
    private String email;
    private String phone;
    private String address;
    private String avt;
    private boolean isAdmin;

    private List<AdminRole> role;

    private int price;

    private int quantity;

    public UserAccount() {
    }

    public UserAccount(String id, String username, String passMaHoa, String pass, boolean status, String name, String email, String phone, String address, String avt, boolean isAdmin,List<AdminRole> role, int price, int quantity) {
        this.id = id;
        this.username = username;
        this.passMaHoa = passMaHoa;
        this.pass = pass;
        this.status = status;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.avt = avt;
        this.isAdmin = isAdmin;
        this.role =role;
        this.price = price;
        this.quantity = quantity;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public List<AdminRole> getRole() {
        return role;
    }

    public void setRole(List<AdminRole> role) {
        this.role = role;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvt() {
        return avt;
    }

    public void setAvt(String avt) {
        this.avt = avt;
    }

    public String getPassMaHoa() {
        return passMaHoa;
    }

    public void setPassMaHoa(String passMaHoa) {
        this.passMaHoa = passMaHoa;
    }


    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "CustomerUser{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", passMaHoa='" + passMaHoa + '\'' +
                ", pass='" + pass + '\'' +
                ", status=" + status +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", avt='" + avt + '\'' +
                ", role=" + isAdmin +
                ", price=" + price +
                ", quantity=" + quantity +
                '}';
    }
}

