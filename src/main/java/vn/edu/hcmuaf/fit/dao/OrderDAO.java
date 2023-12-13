package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.beans.*;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

public class OrderDAO {
    public String taoOrderID() {
        String numbers = "0123456789";
        StringBuilder stringBuilder = new StringBuilder("O");
        Random rd = new Random();

        for (int i = 0; i < 3; i++) {
            int index = rd.nextInt(numbers.length());
            char rdC = numbers.charAt(index);
            stringBuilder.append(rdC);
        }
        List<String> listId = JDBIConnector.get().withHandle(
                handle -> handle.createQuery("SELECT OrderID FROM orders")
                        .mapTo(String.class)
                        .stream()
                        .collect(Collectors.toList()));
        if (listId.contains(stringBuilder.toString())) return taoOrderID();
        else return stringBuilder.toString();
    }

    public String insertOrder(String CustomerID,String fullname, String phone, String address, String email, String notice, Cart cart,String hashMessage){
        String id = taoOrderID();
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String date = currentDateTime.format(formatter);
        JDBIConnector.get().withHandle(handle -> {
            handle.createUpdate("INSERT INTO orders (OrderID, OrderDate,`Status`,Delivered,CustomerID,Notice,Price,RecipientName,Email,Phone,Address,hashMessage) VALUES(?,?,1,0,?,?,?,?,?,?,?,?)")
                    .bind(0,id)
                    .bind(1,date)
                    .bind(2,CustomerID)
                    .bind(3,notice)
                    .bind(4,cart.total())
                    .bind(5,fullname)
                    .bind(6,email)
                    .bind(7,phone)
                    .bind(8,address)
                    .bind(9,hashMessage)
                    .execute();
            for (Map.Entry key:cart.getData().entrySet()){
                Product p= (Product) key.getValue();
                handle.createUpdate("INSERT INTO orderdetail (OrderID,ProductID,ProductName,Price,Quantity,PricePromotional) VALUES(?,?,?,?,?,?)")
                        .bind(0,id)
                        .bind(1,p.getProductId())
                        .bind(2,p.getProductName())
                        .bind(3,p.getQuantityCart() * p.getPrice())
                        .bind(4,p.getQuantityCart())
                        .bind(5,p.getPromotionalPrice())
                        .execute();
                handle.createUpdate("UPDATE warehouse set quantity=quantity-? where idProduct = ?")
                        .bind(0,p.getQuantityCart())
                        .bind(1,(String) key.getKey())
                        .execute();
            }
            return null;
        });
        return id;
    }

    public List<Orders> ordersList (){
        List<Orders> list = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM orders")
                .mapToBean(Orders.class).stream().collect(Collectors.toList()));
        return  list;
    }

    public List<OrderDetail> getOrderDetailsById (String id){
        List<OrderDetail> list = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT o.idTransport, od.OrderID, od.ProductID, od.ProductName, od.Price, od.Quantity FROM orderdetail od INNER JOIN orders o ON o.OrderID = od.OrderID WHERE o.OrderID = ?")
                .bind(0,id)
                .mapToBean(OrderDetail.class).stream().collect(Collectors.toList())
        );
        return list;
    }

    public void updateDelivery(String orderId, int delivery){
        String date = java.time.LocalDate.now().toString();
        JDBIConnector.get().withHandle(handle -> handle.createUpdate("UPDATE orders SET Delivered=?, DeliveryDate=? WHERE OrderID=?;")
                        .bind(0,delivery)
                        .bind(1,date)
                        .bind(2,orderId)
                        .execute()
                );
    }
    public void updateStatus(String orderId, int status){
        JDBIConnector.get().withHandle(handle -> handle.createUpdate("UPDATE orders SET `Status`=? WHERE OrderID=?")
                .bind(0,status)
                .bind(1,orderId)
                .execute()
            );
    }

    public List<Orders> getOrdersByUser(String id){
        List<Orders> list = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT OrderID, OrderDate, `Status`, Delivered, DeliveryDate, CustomerID, Discount, Notice, Price, RecipientName, Email, Phone, Address, idTransport FROM orders WHERE CustomerID=?")
                .bind(0,id)
                .mapToBean(Orders.class).stream().collect(Collectors.toList())
        );
        return list;
    }

    public Orders getOrderByIdOrder(String id){
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT OrderID, OrderDate, `Status`, Delivered, DeliveryDate, CustomerID, Discount, Notice, Price, RecipientName, Email, Phone, Address, idTransport FROM orders WHERE OrderID=?")
                .bind(0,id)
                .mapToBean(Orders.class).first());
    }

    public int totalCustomer() {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT COUNT(DISTINCT id) FROM user_account WHERE `status` = 1 AND isAdmin = 0")
                .mapTo(Integer.class).first());
    }

    public int totalOrder() {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery(
                        "SELECT count(OrderID) from orders")
                .mapTo(Integer.class).first());
    }

    public int totalRevenue() {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery(
                        "SELECT SUM(Price * Quantity) FROM orderdetail")
                .mapTo(Integer.class).first());
    }

    public int totalOrderCancel() {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery(
                        "SELECT COUNT(OrderID) FROM orders WHERE Status IS Null or Status = 0")
                .mapTo(Integer.class).first());
    }
    public int totalProSold() {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery(
                        "SELECT SUM(Quantity) from orderdetail")
                .mapTo(Integer.class).first());
    }
    public List<Orders> Last5Order() {
        List<Orders> list = JDBIConnector.get().withHandle(handle -> handle.createQuery("" +
                        "SELECT  OrderID,OrderDate,CustomerID FROM orders \n" +
                        "ORDER BY OrderDate DESC\n" +
                        "LIMIT 5 ")
                .mapToBean(Orders.class).stream().collect(Collectors.toList()));
        return list;
    }

    public List<Product> Top10ProductBestSeller() {
        List<Product> list = JDBIConnector.get().withHandle(handle -> handle.createQuery("" +
                        "SELECT  COUNT( * ) AS count, p.productId,p.ProductName FROM product p JOIN orderdetail o " +
                        "ON p.productId = o.ProductID\n" +
                        "GROUP BY ProductID\n" +
                        "ORDER BY count DESC\n" +
                        "LIMIT 10 ")
                .mapToBean(Product.class).stream().collect(Collectors.toList()));
        return list;
    }

    public int totalProduct() {
        return JDBIConnector.get().withHandle(handle -> handle.createQuery(
                        "SELECT SUM(Quantity) from product WHERE `Status` = 1")
                .mapTo(Integer.class).first());
    }


    public List<Map<String, Integer>> StatisticalComment() {
        List<Map<String, Integer>> listMap = new ArrayList<>();
        for (int i = 1; i < 6; i++) {
            int num = i;
            int countVote = JDBIConnector.get().withHandle(handle ->
                    handle.createQuery("SELECT COUNT(DISTINCT ID) FROM productcomment WHERE vote = ?  ").bind(0,num)
                            .mapTo(Integer.class).first());

            // Create a new Map and add it to the List
            Map<String, Integer> map = new HashMap<>();
            map.put("num", num);
            map.put("countVote", countVote);
            listMap.add(map);
        }
        return listMap;
    }

    public List<Map<String, Object>> MonthlyChart() {
        List<Map<String, Object>> list = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/yyyy");

        // Lấy thời điểm hiện tại
        LocalDate currentDate = LocalDate.now();

        // Thêm 6 tháng gần nhất vào list
        for (int i = 6; i > 0; i--) {
            String date = currentDate.format(formatter);
            String month = date.substring(0,2);
            String year = date.substring(3,7);

            String key = JDBIConnector.get().withHandle(handle ->
                    handle.createQuery("" +
                                    "SELECT COUNT(DISTINCT OrderID) FROM orders o  " +
                                    "WHERE MONTH(o.OrderDate) = ? AND YEAR(o.OrderDate) = ?").bind(0,month).bind(1,year)
                            .mapTo(String.class).first());

            String  value = JDBIConnector.get().withHandle(handle ->
                    handle.createQuery("" +
                                    "SELECT SUM(od.Price * od.Quantity) FROM orders o JOIN orderdetail od " +
                                    "on o.OrderID = od.OrderID\n" +
                                    "WHERE MONTH(o.OrderDate) = ? AND YEAR(o.OrderDate) = ?").bind(0,month).bind(1,year)
                            .mapTo(String.class).first());

            Map<String, Object> map = new HashMap<>();
            map.put("key", (key != null ? key : 0));
            map.put("value", (value != null ? value : 0));
            map.put("month", date);
            list.add(map);
            currentDate = currentDate.minusMonths(1);
        }
        return list;
    }


    public List<Map<String, Object>> SaleChartinWeek() {
        List<Map<String, Object>> listMap = new ArrayList<>();
        LocalDateTime now = LocalDateTime.now();
        int dayOfWeek = now.getDayOfWeek().getValue();
        if (dayOfWeek != 7) {
            for (int i = 1; i <= dayOfWeek; i++) {
                int num = i;
                String value = JDBIConnector.get().withHandle(handle ->
                        handle.createQuery("" +
                                        "SELECT  SUM(od.Price * od.Quantity) FROM orders o JOIN orderdetail od " +
                                        "on o.OrderID = od.OrderID\n" +
                                        "WHERE YEARWEEK(o.OrderDate) = YEARWEEK(NOW()) and WEEKDAY(o.OrderDate) = ? -1;\n")
                                .bind(0,num)
                                .mapTo(String.class).first());
                HashMap<String, Object> map = new HashMap<>();
                map.put("num", num);
                map.put("value", value != null ? value : 0);
                listMap.add(map);
            }
        } else {
            for (int i = 1; i < 7; i++) {
                int num = i;
                String value = JDBIConnector.get().withHandle(handle ->
                        handle.createQuery("" +
                                        "SELECT  SUM(od.Price * od.Quantity) FROM orders o JOIN orderdetail od " +
                                        "on o.OrderID = od.OrderID\n" +
                                        "WHERE YEARWEEK(o.OrderDate) = YEARWEEK(NOW() - interval 1 week) and WEEKDAY(o.OrderDate) = ? -1;\n")
                                .bind(0,num)
                                .mapTo(String.class).first());
                HashMap<String, Object> map = new HashMap<>();
                map.put("num", num);
                map.put("value", value != null ? value : 0);
                listMap.add(map);
            }
            String valueAtSun = JDBIConnector.get().withHandle(handle ->
                    handle.createQuery("" +
                                    "SELECT  SUM(od.Price * od.Quantity) FROM orders o JOIN orderdetail od " +
                                    "on o.OrderID = od.OrderID\n" +
                                    "WHERE YEARWEEK(o.OrderDate) = YEARWEEK(NOW()) and WEEKDAY(o.OrderDate) = 6;\n")
                            .mapTo(String.class).first());
            HashMap<String, Object> map = new HashMap<>();
            map.put("num", 7);
            map.put("value", valueAtSun != null ? valueAtSun : 0);
            listMap.add(map);
        }
        return listMap;
    }

    public static void main(String[] args) {
//        System.out.println(new OrderDAO().insertOrder("1101","Hiếu","11111111","HCMMMMM","mail@GMAI","",new Cart(),"AAAAAAAAAA"));
        System.out.println(new OrderDAO().ordersList());
    }
}
