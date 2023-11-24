package vn.edu.hcmuaf.fit.beans;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;

public class Cart implements Serializable {
    HashMap<String, Product> data;

    public Cart() {
        this.data = new HashMap<>();
    }

    public Product get(String id) {
        return data.get(id);
    }

    public int getQuantity_cart() {
        int count = 0;
        for (String id : data.keySet()) {
            count += data.get(id).getQuantityCart();
        }
        return count;
    }

    public int put(String id, Product pd) {
        if (data.containsKey(id)) {
            Product temp = data.get(id);
            temp.setQuantityCart(temp.getQuantityCart() + pd.getQuantityCart());
            data.put(id, temp);
        } else {
            data.put(id, pd);
        }
        return data.get(id).getQuantityCart();
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

    public double total() {
        double sum = 0;
        for (Product p : data.values()) {
            if (p.getPromotional()== 1) {
                sum += (p.getQuantityCart() * (p.getPrice()- p.getPrice()*p.getPromotionalPrice()/100 ));
            } else {
                sum += (p.getQuantityCart() * p.getPrice());
            }
        }
        return sum;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "data=" + data +
                '}';
    }
}
