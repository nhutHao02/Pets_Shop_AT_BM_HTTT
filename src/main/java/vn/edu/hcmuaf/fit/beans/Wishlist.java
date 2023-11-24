package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;

public class Wishlist implements Serializable {
    HashMap<String, Product> data;

    public Wishlist() {
        this.data = new HashMap<>();
    }

    public Product get(String id) {
        return data.get(id);
    }

    public int getQuantity_wishlist() {
        return data.keySet().size();
    }

    public void put(Product pd) {
        data.put(pd.getProductId(), pd);
    }

    public boolean remove(String id) {
        return data.remove(id) == null;
    }

    public Collection<Product> list() {
        return data.values();
    }

    public HashMap<String, Product> getData() {
        return data;
    }

    @Override
    public String toString() {
        return "Wishlist{" +
                "data=" + data +
                '}';
    }
}