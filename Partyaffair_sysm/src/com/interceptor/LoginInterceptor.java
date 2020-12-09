package com.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取请求的url
        String url=request.getRequestURI();
        //login.jsp或登录请求放行，不拦截
        if(url.indexOf("tologin")>=0||url.indexOf("/login")>=0){
            return true;
        }
        //获取session
        HttpSession session=request.getSession();
        Object obj=session.getAttribute("user");
        if(obj!=null) return true;
        //没有登录且不是登录请求
        request.setAttribute("msg","还没登录，请先登录!");
        request.getRequestDispatcher("WEB-INF/jsp/login.jsp").forward(request,response);
        return false;

    }


}
