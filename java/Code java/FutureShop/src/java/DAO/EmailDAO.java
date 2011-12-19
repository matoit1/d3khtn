/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Nguyen Anh Tri
 */
public class EmailDAO {
    //<editor-fold defaultstate="collapsed" desc="Gửi email">

    public static void send(String to, String subject, String body) throws Exception {
        // Code provide by congdongjava.com
        String smtpServer = "smtp.gmail.com";
        String from = "0812546@gmail.com";
        String psw = "futureshop";
        Properties props = System.getProperties();
        props.put("mail.smtp.host", smtpServer);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");
        final String login = from;
        final String pwd = psw;
        Authenticator pa = null;
        if (login != null && pwd != null) {
            props.put("mail.smtp.auth", "true");
            pa = new Authenticator() {

                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(login, pwd);
                }
            };
        }//else: no authentication
        Session session = Session.getInstance(props, pa);
        // — Create a new message –
        Message msg = new MimeMessage(session);
        // — Set the FROM and TO fields –
        msg.setFrom(new InternetAddress(from));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(
                to, false));

        // — Set the subject and body text –
        msg.setSubject(subject);
        msg.setText(body);
        // — Set some other header information –
        msg.setHeader("X-Mailer", "LOTONtechEmail");
        msg.setSentDate(new Date());
        msg.saveChanges();
        // — Send the message –
        Transport.send(msg);
        System.out.println("Email have been sent!");
    }
    //</editor-fold>
}
