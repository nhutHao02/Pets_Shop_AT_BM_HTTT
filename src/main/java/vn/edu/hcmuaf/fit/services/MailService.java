package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.beans.ForgotPassword;
import vn.edu.hcmuaf.fit.beans.Mail;
import vn.edu.hcmuaf.fit.beans.SignUp;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailService {
    private Properties properties;
    private Session session;
    private String username;
    //-------------------------------------------------SINGLETON----------------------------------------------------
    private static MailService mailService;

    private MailService() {

        properties = new Properties();

        properties.put(Mail.HOST, Mail.SERVER);

        properties.put(Mail.URL_PORT, Mail.PORT);

        properties.put(Mail.AUTH, Mail.AUTH_STATUS);

        properties.put(Mail.URL_TLS, Mail.TLS_STATUS);

        initializedSesstion(Mail.USERNAME, Mail.PASSWORD);

    }

    public static synchronized MailService getInstance() {
        //  Nếu thể hiện null thì tạo nó
        if (mailService == null) {
            mailService = new MailService();
        }
        //  Trả về thể hiện
        return mailService;

    }


    public void initializedSesstion(String username, String password) {
        session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        //  gán username cho username hiện tại để gửi email
        this.username = username;

    }

    public boolean sendEmailSignUp(SignUp user) {
        boolean test = false;
        String subject = "Xác nhận email tài khoản PETSHOP";
        String text = "<h1 style=\"padding: 0; font-size: 25px;color: #ff0000;font-family:sans-serif\">Xác nhận tài khoản PetShop</h1><p style=\"padding: 0;font-size: 14px;color: #000000;font-family:sans-serif\">Để xác nhận email này đã sử dụng để đăng ký tài khoản PetShop.</p><p style=\"padding: 0;font-size: 14px;color: #000000;font-family:sans-serif\">Để xác minh email của bạn, hãy nhập code: <strong style=\"font-size: 18px; color: #ff0000; font-family:sans-serif\">" + user.getCode() + "</strong></p><p style=\"padding: 0;font-size: 14px;color: #000000;font-family:sans-serif\">Cảm ơn bạn,</p><p style=\"padding: 0;font-size: 14px;color: #00BFFF;font-family:sans-serif\">PetShop.</p>";

        String toEmail = user.getEmail();
        String fromEmail = Mail.USERNAME;
        String password = Mail.PASSWORD;

        try {
            // your host email smtp server details
            Properties pr = new Properties();
            pr.setProperty(Mail.HOST, Mail.SERVER);
            pr.setProperty(Mail.URL_PORT, Mail.PORT);
            pr.setProperty(Mail.AUTH, Mail.AUTH_STATUS);
            pr.setProperty(Mail.URL_TLS, Mail.TLS_STATUS);
            pr.put("mail.smtp.socketFactory.port", "587");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            //get session to authenticate the host email address and password
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            //set email message details
            Message mess = new MimeMessage(session);

            //set from email address
            mess.setFrom(new InternetAddress(fromEmail));
            //set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            //set email subject
            mess.setSubject(subject);

            //set message text
            mess.setContent(text, "text/html; charset=UTF-8");
            //send the message
            Transport.send(mess);
            System.out.println("Đã gửi email!");
            test=true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    public boolean sendEmailForgot(ForgotPassword forgot) {
        boolean test = false;
        String subject = "Đặt lại mật khẩu tài khoản PETSHOP";
        String text = "<h1 style=\"padding: 0; font-size: 25px;color: #ff0000;font-family:sans-serif\">Đặt lại mật khẩu tài khoản PetShop</h1><p style=\"padding: 0;font-size: 14px;color: #000000;font-family:sans-serif\">Để đặt lại mật khẩu cho tài khoản, hãy nhập OTP: <strong style=\"font-size: 18px; color: #ff0000; font-family:sans-serif\">" + forgot.getCode() + "</strong></p><p style=\"padding: 0;font-size: 14px;color: #000000;font-family:sans-serif\">Cảm ơn bạn,</p><p style=\"padding: 0;font-size: 14px;color: #00BFFF;font-family:sans-serif\">PetShop.</p>";

        String toEmail = forgot.getEmail();
        String fromEmail = Mail.USERNAME;
        String password = Mail.PASSWORD;

        try {
            // your host email smtp server details
            Properties pr = new Properties();
            pr.setProperty(Mail.HOST, Mail.SERVER);
            pr.setProperty(Mail.URL_PORT, Mail.PORT);
            pr.setProperty(Mail.AUTH, Mail.AUTH_STATUS);
            pr.setProperty(Mail.URL_TLS, Mail.TLS_STATUS);
            pr.put("mail.smtp.socketFactory.port", "587");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            //get session to authenticate the host email address and password
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            //set email message details
            Message mess = new MimeMessage(session);

            //set from email address
            mess.setFrom(new InternetAddress(fromEmail));
            //set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            //set email subject
            mess.setSubject(subject);

            //set message text
            mess.setContent(text, "text/html; charset=UTF-8");
            //send the message
            Transport.send(mess);
            System.out.println("Đã gửi email!");
            test=true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    public boolean sendEmailContact(String email, String name, String content, String admin) {
        boolean test = false;
        String subject = "Phản hồi liên hệ từ PETSHOP";
        String text = "<div style=\"background-color:#f2f2f2;padding:10px; font-size: 22px\">\n" +
                "  <p>Xin chào <span style=\"font-weight: bold\">"+ name +"</span>,</p>\n" +
                "  <p>Tôi là <span style=\"font-weight: bold\">"+admin+"</span>, đại diện cho <span style=\"font-weight: bold; color: #00BFFF\">PetShop</span>. Tôi muốn gửi email này để trả lời câu hỏi mà bạn đã gửi cho chúng tôi.</p>\n" +
                "  <p>"+content+"</p>\n" +
                "  <p>Cám ơn bạn đã liên hệ với chúng tôi!</p>\n" +
                "  <p>Trân trọng,</p>\n" +
                "  <p><span style=\"font-weight: bold\">"+admin+"</span></p>\n" +
                "</div>";

        String toEmail = email;
        String fromEmail = Mail.USERNAME;
        String password = Mail.PASSWORD;

        try {
            // your host email smtp server details
            Properties pr = new Properties();
            pr.setProperty(Mail.HOST, Mail.SERVER);
            pr.setProperty(Mail.URL_PORT, Mail.PORT);
            pr.setProperty(Mail.AUTH, Mail.AUTH_STATUS);
            pr.setProperty(Mail.URL_TLS, Mail.TLS_STATUS);
            pr.put("mail.smtp.socketFactory.port", "587");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            //get session to authenticate the host email address and password
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            //set email message details
            Message mess = new MimeMessage(session);

            //set from email address
            mess.setFrom(new InternetAddress(fromEmail));
            //set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            //set email subject
            mess.setSubject(subject);

            //set message text
            mess.setContent(text, "text/html; charset=UTF-8");
            //send the message
            Transport.send(mess);
            test=true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }



    public static void main(String[] args) {
        SignUp su = new SignUp("huyhuy","huynguyen.79039@gmail.com","huyhuy12","123","123123232","jdgfhjdgfhdf","123456");
        System.out.println( new MailService().sendEmailSignUp(su));
        System.out.println( new MailService().sendEmailContact("20130281@st.hcmuaf.edu.vn","Huy","dạ không có ạ","admin1"));

    }
}
