package com.app.project.util.security;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.*;
import org.springframework.security.web.*;
import org.springframework.security.web.authentication.*;
import org.springframework.security.web.savedrequest.*;
import org.springframework.stereotype.Component;

import com.app.project.user.User_bean;
import com.app.project.user.User_service;

@Component("loginSuccessHandler")
public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	@Autowired
	private User_service svc;
	
	// 사용자가 가려던 목적지를 저장하는 객체
	private RequestCache cache = new HttpSessionRequestCache();
	// 리다이렉트 해주는 객체
	private RedirectStrategy rs = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession();
		User_bean user = svc.userInfoRead(authentication.getName());
		
		// 로그인 성공하면 실패 횟수 초기화
		user = User_bean.builder().user_id(authentication.getName()).user_status(user.getUser_status())
				.login_fail_cnt(0).build();
		svc.userInfoUpdate(user);
		
		session.setAttribute("error_msg", "");
		
		// 이동. 특별한 목적지가 없으면 /로 이동
		SavedRequest req = cache.getRequest(request, response);
		if(req!=null)
			rs.sendRedirect(request, response, req.getRedirectUrl());
		else
			rs.sendRedirect(request, response, "/");
	}
}






