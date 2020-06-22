package com.app.project.Common.Interceptor;

import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * <javadoc>
 * Handler 세팅
 *
 * @author 김재일
 * @version 1.0
 * @since 2020-06-22
 **/
@Component
public class Handler extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        HttpSession session = request.getSession();

        Session userData = (Session) session.getAttribute("userData");

        response.setHeader("pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.addHeader("Cache-Control", "No-store");
        response.setDateHeader("Expires", 1L);

        try {
            if (ObjectUtils.isEmpty(userData)) {
                if (!request.getServletPath().equals("/")) {
                    response.setContentType("text/html; charset=UTF-8");
                    PrintWriter out = response.getWriter();
                    out.println("<script>alert(' 회원데이터가 존재하지않습니다.\\n 로그인페이지로 이동합니다.'); location.href='/login';</script>");
                    out.flush();
                    out.close();
                    return false;
                } else {
                    response.setContentType("text/html; charset=UTF-8");
                    PrintWriter out = response.getWriter();
                    out.println("<script>location.href='/login';</script>");
                    out.flush();
                    out.close();
                    return false;
                }
            } else if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {

            } else {
                session.setMaxInactiveInterval(60 * 60 * 24);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }

}