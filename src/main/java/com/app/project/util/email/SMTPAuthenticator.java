package com.app.project.util.email;

import javax.mail.*;

public class SMTPAuthenticator extends Authenticator {
    public SMTPAuthenticator() {
        super();
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        String username = "wkdql789@gmail.com";
        String password = "ebdjf0258";
        return new PasswordAuthentication(username, password);
    }
}
