package hcmute.edu.vn.utils;

import java.util.Properties;
import java.util.Random;

public class OTP {

    public String getRandom() {
        return String.format("%06d", new Random().nextInt(999999));
    }

    public static void main(String[] args) {
        OTP generator = new OTP();
        System.out.println(generator.getRandom());
    }

//    public boolean sendEmail(User user) {
//        boolean test = false;
//        String toEmail = user.getEmail();
//        String fromEmail = "nghianhanta@gmail.com";
//        String password = "kpyv popu ietq ulww";
//        try {
//
//            Properties pr = configEmail(new Properties());
//            Session session = Session.getInstance(pr, new Authenticator() {
//                protected PasswordAuthentication getPasswordAuthentication() {
//                    return new PasswordAuthentication(fromEmail, password);
//                }
//            });
//            Message mess = new MimeMessage(session);
//            mess.setHeader("Content-Type", "text/plain; charset=UTF-8");
//            mess.setFrom(new InternetAddress(fromEmail));
//            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
//            mess.setSubject("Tài khoản tham gia của quý khách đã được đăng ký thành công.");
//            mess.setText("Cảm ơn bạn đã tham gia! Đây là mã kích hoạt tài khoản của bạn : " + user.getCode());
//            Transport.send(mess);
//            test = true;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return test;
//    }

    public Properties configEmail(Properties pr) {
        pr.setProperty("mail.smtp.host", "smtp.gmail.com");
        pr.setProperty("mail.smtp.port", "587");
        pr.setProperty("mail.smtp.auth", "true");
        pr.setProperty("mail.smtp.starttls.enable", "true");
        pr.put("mail.smtp.socketFactory.port", "587");
        pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        return pr;
    }

}
