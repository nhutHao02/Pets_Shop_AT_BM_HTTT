package vn.edu.hcmuaf.fit.tool;

import javax.swing.*;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.interfaces.DSAPrivateKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.sql.SQLOutput;
import java.util.Base64;

public class DSA {
    private PrivateKey privateKey;
    private PublicKey publicKey;

    // Hàm tạo cặp khóa DSA gồm khóa publice và khóa private
    public KeyPair generateDSAKeyPair() throws NoSuchAlgorithmException {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("DSA");
        keyPairGenerator.initialize(2048);
        return keyPairGenerator.generateKeyPair();
    }

    public void generatekey(KeyPair keyPair) {
        privateKey = keyPair.getPrivate();
        publicKey = keyPair.getPublic();
    }

    // Hàm xuất khóa dưới dạng chuỗi base64
    public static String exportKey(Key key) {
        byte[] keyEncoded = key.getEncoded();
        return Base64.getEncoder().encodeToString(keyEncoded);
    }

    public String exportPrivateKey() {
        byte[] keyEncoded = privateKey.getEncoded();
        return Base64.getEncoder().encodeToString(keyEncoded);
    }

    public String exportPublicKey() {
        byte[] keyEncoded = publicKey.getEncoded();
        return Base64.getEncoder().encodeToString(keyEncoded);
    }

    // Hàm nhập khóa từ chuỗi base64
    public PrivateKey importKey(String keyString, String algorithm) {
        if (!isBase64(keyString)) {
            JOptionPane.showMessageDialog(null, "Key is not base64", "Error", JOptionPane.ERROR_MESSAGE);
            System.out.println("Key không đúng định dạng base64");
            return null;
        }
        try {
            byte[] keyBytes = Base64.getDecoder().decode(keyString);
            KeyFactory keyFactory = KeyFactory.getInstance(algorithm);

            // Print or log the key string to check its format
            System.out.println("Key String: " + keyString);

            if (algorithm.equals("DSA")) {
                try {
                    PrivateKey privateKey1 = keyFactory.generatePrivate(new PKCS8EncodedKeySpec(keyBytes));
                    // Kiểm tra kiểu của khóa
                    if (privateKey1 instanceof PrivateKey) {
                        System.out.println("Private key is valid.");
                        return privateKey1;
                    } else {
                        System.out.println("Private key is not valid DSA private key.");
                        JOptionPane.showMessageDialog(null, "Key is not valid", "Error", JOptionPane.ERROR_MESSAGE);
                        return null;
                    }
                } catch (InvalidKeySpecException e) {
                    // Xử lý ngoại lệ
                    e.printStackTrace();
                    JOptionPane.showMessageDialog(null, "Invalid key format", "Error", JOptionPane.ERROR_MESSAGE);
                    return null;
                }
            } else {
                // Xử lý các loại khác nếu cần
                return null;
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "Algorithm not supported", "Error", JOptionPane.ERROR_MESSAGE);
            return null;
        }
    }

    public boolean isImportKey(String keyString) {  // 2013025_Trần Nhựt Hào
        if (!isBase64(keyString)) {
            System.out.println("key không đúng định dạng base64");
            return false;
        }
        try {
            // Loại bỏ các ký tự không hợp lệ từ chuỗi khóa công khai (nếu có)
            String formattedKey = keyString
                    .replaceAll("\\n", "")
                    .replaceAll("\\r", "")
                    .replaceAll("\\t", "")
                    .replaceAll(" ", "");

            // Giải mã Base64 để lấy mảng byte của khóa công khai
            byte[] publicKeyBytes = Base64.getDecoder().decode(formattedKey);

            X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
            KeyFactory keyFactory = KeyFactory.getInstance("DSA");

            PublicKey publicKey = keyFactory.generatePublic(keySpec);

            // Nếu không có ngoại lệ, khóa công khai hợp lệ
            return true;
        } catch (Exception e) {
            // Nếu có bất kỳ ngoại lệ nào xảy ra, khóa công khai không hợp lệ
            return false;
        }
    }

    // Hàm ký số
    public String sign(String message, PrivateKey privateKey) throws Exception {
        if (!(privateKey instanceof DSAPrivateKey)) {
            // Xử lý trường hợp khóa không phải là privatekey DSA
            throw new InvalidKeyException("Not a DSA private key");
        }
        Signature signature = Signature.getInstance("SHA256withDSA");
        signature.initSign(privateKey);
        signature.update(message.getBytes());
        // Chuyển đổi mảng byte thành chuỗi Base64
        byte[] signatureBytes = signature.sign();
        return Base64.getEncoder().encodeToString(signatureBytes);
    }

    // Hàm xác minh chữ ký
    public boolean verify(String messagehash, String signature, PublicKey publicKey) throws Exception {
        // Chuyển đổi chuỗi Base64 thành mảng byte
        byte[] signatureBytes = Base64.getDecoder().decode(signature);
        Signature sig = Signature.getInstance("SHA256withDSA");
        sig.initVerify(publicKey);
        sig.update(messagehash.getBytes());
        return sig.verify(signatureBytes);
    }

    public boolean isBase64(String str) {
        try {
            Base64.getDecoder().decode(str);
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        }
    }

    public String bytesToBase64(byte[] inputBytes) {
        byte[] base64Bytes = Base64.getEncoder().encode(inputBytes);
        return new String(base64Bytes, StandardCharsets.UTF_8);
    }

    // 20130260-Hoàng Trung Hiếu
    public PrivateKey convertStringToPrivateKey(String privateKeyString) throws Exception {
        byte[] keyBytes = Base64.getDecoder().decode(privateKeyString);

        // Sử dụng PKCS8EncodedKeySpec để tạo đối tượng PrivateKey từ mảng byte
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("DSA");
        return keyFactory.generatePrivate(keySpec);
    }

    // 20130260-Hoàng Trung Hiếu
    public PublicKey convertStringToPublicKey(String publicKeyString) throws Exception {
        byte[] keyBytes = Base64.getDecoder().decode(publicKeyString);

        // Sử dụng X509EncodedKeySpec để tạo đối tượng PublicKey từ mảng byte
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("DSA");
        return keyFactory.generatePublic(keySpec);
    }

    public static void main(String[] args) throws Exception {
        DSA dsa = new DSA();
        dsa.generatekey(dsa.generateDSAKeyPair());
        System.out.println(dsa.exportPrivateKey());
        System.out.println(dsa.exportPublicKey());
        System.out.println(dsa.verify("91931394d81285e1757d13984b29f511",
                "MD4CHQCyMiG+z2p1V6ndd5RkrmXFi0WWnf6z+5VsJiDDAh0AkJrzCsGeZ5r9d8TrhyhXC2OLcMFeO9XWxB0NDQ==",
                dsa.convertStringToPublicKey("MIIDQjCCAjUGByqGSM44BAEwggIoAoIBAQCPeTXZuarpv6vtiHrPSVG28y7FnjuvNxjo6sSWHz79NgbnQ1GpxBgzObgJ58KuHFObp0dbhdARrbi0eYd1SYRpXKwOjxSzNggooi/6JxEKPWKpk0U0CaD+aWxGWPhL3SCBnDcJoBBXsZWtzQAjPbpUhLYpH51kjviDRIZ3l5zsBLQ0pqwudemYXeI9sCkvwRGMn/qdgYHnM423krcw17njSVkvaAmYchU5Feo9a4tGU8YzRY+AOzKkwuDycpAlbk4/ijsIOKHEUOThjBopo33fXqFD3ktm/wSQPtXPFiPhWNSHxgjpfyEc2B3KI8tuOAdl+CLjQr5ITAV2OTlgHNZnAh0AuvaWpoV499/e5/pnyXfHhe8ysjO65YDAvNVpXQKCAQAWplxYIEhQcE51AqOXVwQNNNo6NHjBVNTkpcAtJC7gT5bmHkvQkEq9rI837rHgnzGC0jyQQ8tkL4gAQWDt+coJsyB2p5wypifyRz6Rh5uixOdEvSCBVEy1W4AsNo0fqD7UielOD6BojjJCilx4xHjGjQUntxyaOrsLC+EsRGiWOefTznTbEBplqiuH9kxoJts+xy9LVZmDS7TtsC98kOmkltOlXVNb6/xF1PYZ9j897buHOSXC8iTgdzEpbaiH7B5HSPh++1/et1SEMWsiMt7lU92vAhErDR8C2jCXMiT+J67ai51LKSLZuovjntnhA6Y8UoELxoi34u1DFuHvF9veA4IBBQACggEAQsUb/ol6Mm0hhjljE8cmRxnK6VxgvBimy+Kf3v5NeLHHnO0QU4ECcZYQ3YeiiAInOypUR17lPBUOtHpFxokueuCSJIuC2OawV+SB/qiqcr7Lu1rKmzlkpre5JBjiwzfx4z8a6kK9OjF7lMxEo3rgWvzz3XZnTpQZdnyO3qhZ/MKSL3Yy07hibM5PUa5dErWBQOQtAdVEyFkWrfD318v6Dlb+50yVa4+hzQx3iD4tqym8iKZRBZr3WeRauxmSVsgtZp2e08sISVW0SbQbGqCylzLrWo1lK4y/7KtuH6gexSqae2BlbykTeHrbqvVLBVcX9ELSpThZgnCLhlT4qAG21Q==")));

    }

}
