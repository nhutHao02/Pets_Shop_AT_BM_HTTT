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
    public PrivateKey convertStringToPrivateKey(String privateKeyString) throws Exception {
        byte[] keyBytes = Base64.getDecoder().decode(privateKeyString);

        // Sử dụng PKCS8EncodedKeySpec để tạo đối tượng PrivateKey từ mảng byte
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("DSA");
        return keyFactory.generatePrivate(keySpec);
    }
    public PublicKey convertStringToPublicKey(String publicKeyString) throws Exception {
        byte[] keyBytes = Base64.getDecoder().decode(publicKeyString);

        // Sử dụng X509EncodedKeySpec để tạo đối tượng PublicKey từ mảng byte
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("DSA");
        return keyFactory.generatePublic(keySpec);
    }
    public static void main(String[] args) throws Exception {
        DSA dsa = new DSA();
        System.out.println(dsa.verify("8ac0ae5fef7c0c16e7e9ccab29bf9c4a",
                "MDwCHGT9kyAV9SKltrmXKv4Nq 7d3H2dtJuuISXEuOkCHAdXzq34DxtcaoMTnvk07YaI1iMhuom2CYKJ4b0=",
                dsa.convertStringToPublicKey("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")));

    }

}
