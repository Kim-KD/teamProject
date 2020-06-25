package com.app.project.util.security;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.user.User_bean;
import com.app.project.user.User_service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component("loginFailureHandler")
public class LoginFailureHandler implements AuthenticationFailureHandler {
	
    @Autowired
	private User_service svc;
    private RedirectStrategy rs = new DefaultRedirectStrategy();
 
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
            throws IOException, ServletException {
    	String username = request.getParameter("user_id");
        String errormsg = null;
        HttpSession session = request.getSession();
        
        if(exception instanceof BadCredentialsException) {
            errormsg = "로그인에 실패했습니다. 입력하신 아이디와 비밀번호를 확인해주세요.";
            loginFail(username);
        } else if(exception instanceof InternalAuthenticationServiceException) {
        	errormsg = "로그인에 실패했습니다. 입력하신 아이디와 비밀번호를 확인해주세요.";
        	loginFail(username);
        } else if(exception instanceof AuthenticationCredentialsNotFoundException) {
        	errormsg = "인증이 거부되었습니다. 관리자에게 문의하세요.";
        } else if(exception instanceof LockedException) {
        	errormsg = "계정이 잠금 상태입니다. 관리자에게 문의하세요.";
        } else if(exception instanceof DisabledException) {
        	errormsg = "계정이 비활성화 상태입니다. 관리자에게 문의하세요.";
        } else if(exception instanceof AccountExpiredException) {
        	errormsg = "계정이 유효기간이 만료되었습니다. 관리자에게 문의하세요.";
        } else if(exception instanceof CredentialsExpiredException) {
            errormsg = "비밀번호 유효기간이 만료되었습니다. 관리자에게 문의하세요.";
        }
        
        session.setAttribute("id", username);
        session.setAttribute("errorMsg", errormsg);
 
        rs.sendRedirect(request, response, "/");

    }
    
    public void loginFail(String user_id) {
    	User_bean user = svc.userInfoRead(user_id);
    	int failCnt = user.getLogin_fail_cnt() + 1;
    	if(failCnt > 5) {
			
			svc.userInfoUpdate(User_bean.builder().user_id(user_id).login_fail_cnt(failCnt)
					.user_status(user.getUser_status()).enabled(false).build());
		} else {
			svc.userInfoUpdate(User_bean.builder().user_id(user_id).user_status(user.getUser_status())
					.login_fail_cnt(failCnt).build());
		}
	}
}






