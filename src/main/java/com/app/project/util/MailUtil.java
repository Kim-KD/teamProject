package com.app.project.util;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

public class MailUtil {
	public static void sendMail(String sender, String receiver, String subject, String content) {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "false");
		Authenticator auth = new SMTPAuthenticator();
		Session sess = Session.getDefaultInstance(props, auth);
		MimeMessage msg = new MimeMessage(sess);
		try {
			msg.setFrom(new InternetAddress(sender));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			msg.setSubject(subject, "UTF-8");
			msg.setContent(content, "text/html; charset=UTF-8");
			msg.setHeader("Content-type", "text/html; charset=UTF-8");
			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}
}
