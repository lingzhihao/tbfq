package com.ling.ssm.global;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 后台登录 拦截器
 */
public class LoginInterceptor implements HandlerInterceptor{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取请求路径
        String url = request.getRequestURI();
        //如果请求的地址中，有 login 关键字，则不拦截
        if(url.toLowerCase().indexOf("login") >= 0 ){
            return true;
        }

        //通过session来判断是否登录
        HttpSession session = request.getSession();
        if(session.getAttribute("employee")!=null){
            return true;
        }

        //没有登录过的，就直接终止，跳回登录界面
        response.sendRedirect("/ling/houtai/to_login");
        return false;

        //拦截器写完后，需要在配置文件中配置才能生效
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
