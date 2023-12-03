package vn.edu.hcmuaf.fit.dao;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class KeyDAO {
    public KeyDAO() {
    }
    private Connection connectDB() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/petshopdb", "root", "Haomqst01");
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
            throw new SQLException("Unable to connect to the database.", e);
        }
    }
    public boolean isValidKey(String userID) { // 20130252-Trần Nhựt Hào
        Map<String, String> map = new HashMap<>();
        try (Connection connection = connectDB()) {
            // Tạo câu truy vấn SQL với PreparedStatement
            String sql = "SELECT pk.publicKey, pk.expired_at FROM public_key pk WHERE pk.user_id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                // Thiết lập giá trị cho tham số trong câu truy vấn
                preparedStatement.setString(1, userID);

                // Thực hiện truy vấn và lấy kết quả
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    // Kiểm tra xem có kết quả hay không
                    while (resultSet.next()) {
                        map.put(resultSet.getString("publicKey"), resultSet.getString("expired_at"));
                    }
                }
            }

            for (Map.Entry<String, String> entry : map.entrySet()) {
                String date = entry.getValue().split("\\s+")[0];
                if (date.equals("9999-12-31")) {
                    return true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
    public boolean insertPublicKey(String userID, String publicKey){  //20130252-Trần Nhựt Hào
        try (Connection connection = connectDB()) {
            // Tạo câu truy vấn SQL với PreparedStatement
            String sql = "INSERT INTO public_key (user_id, publicKey, created_at, expired_at) VALUES (?, ?, CURRENT_TIMESTAMP, '9999-12-31')";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                // Thiết lập giá trị cho tham số trong câu truy vấn
                preparedStatement.setString(1, userID);
                preparedStatement.setString(2, publicKey);
                preparedStatement.executeUpdate();
            }catch (Exception e){
                return false;
            }
        } catch (SQLException e) {
            return false;
//            throw new RuntimeException(e);
        }
        return true;
    }

    public static void main(String[] args) {
        String key="MIIDQzCCAjUGByqGSM44BAEwggIoAoIBAQCPeTXZuarpv6vtiHrPSVG28y7FnjuvNxjo6sSWHz79NgbnQ1GpxBgzObgJ58KuHFObp0dbhdARrbi0eYd1SYRpXKwOjxSzNggooi/6JxEKPWKpk0U0CaD+aWxGWPhL3SCBnDcJoBBXsZWtzQAjPbpUhLYpH51kjviDRIZ3l5zsBLQ0pqwudemYXeI9sCkvwRGMn/qdgYHnM423krcw17njSVkvaAmYchU5Feo9a4tGU8YzRY+AOzKkwuDycpAlbk4/ijsIOKHEUOThjBopo33fXqFD3ktm/wSQPtXPFiPhWNSHxgjpfyEc2B3KI8tuOAdl+CLjQr5ITAV2OTlgHNZnAh0AuvaWpoV499/e5/pnyXfHhe8ysjO65YDAvNVpXQKCAQAWplxYIEhQcE51AqOXVwQNNNo6NHjBVNTkpcAtJC7gT5bmHkvQkEq9rI837rHgnzGC0jyQQ8tkL4gAQWDt+coJsyB2p5wypifyRz6Rh5uixOdEvSCBVEy1W4AsNo0fqD7UielOD6BojjJCilx4xHjGjQUntxyaOrsLC+EsRGiWOefTznTbEBplqiuH9kxoJts+xy9LVZmDS7TtsC98kOmkltOlXVNb6/xF1PYZ9j897buHOSXC8iTgdzEpbaiH7B5HSPh++1/et1SEMWsiMt7lU92vAhErDR8C2jCXMiT+J67ai51LKSLZuovjntnhA6Y8UoELxoi34u1DFuHvF9veA4IBBgACggEBAIdqogluJSr/oujPSLYjJN4s8QwFj2CU/4u5sYGgX17nqTt+mV0Fmh1Jvp4Xxj8RhyYnmIGy2oWpjXYJ9K0qvJlqkNdGiximOEv2zHbjDWBls3YSpZiLsIeD0KsyA6aXOLGeKlmE9zsAU6DkkSYGAiCguHrlcYdX6Zy1zEvTuvHJvotyIea6I8TVKG21bXtjLxdtpMe7t9STmBGaJJvwthTNvk4WVW7n0e8b0e4qEnILf1RNtNCqt3iZM7EdECgayTJKfgEojM4Ki8NKJf8OYDQV1nxptazl2o6aRHhjVVnImf/hlZFLvD7d507l4T8R4TGZAKA3oWcmg4yueEpqCUc=";

        new KeyDAO().insertPublicKey("C8724",key);
    }
}
