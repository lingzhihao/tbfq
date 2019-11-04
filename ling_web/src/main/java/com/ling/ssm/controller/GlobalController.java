package com.ling.ssm.controller;

import com.ling.ssm.biz.GlobalBiz;
import com.ling.ssm.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@Controller("globalController")
@RequestMapping("/houtai")
public class GlobalController {

    @Autowired
    private GlobalBiz globalBiz;

    //跳转到后台登录界面
    @RequestMapping("/to_login")
    public String  toLogin(){
        return "/houtai/login";
    }

    //后台登录   多个参数，需要用@RRequestParam 注解 来标明 这两个参数是接收用户的信息
    @RequestMapping("/login")
    public String login(HttpSession session, @RequestParam String eno, @RequestParam String ePassword){
        Employee employee = globalBiz.login(eno,ePassword);
        if (employee == null){
            session.setAttribute("employeeLogin","***用户名或密码错误，请重新输入***");
            return "redirect:to_login";
        }
        //登录成功后保存在 session里，  只需要在参数里声明  HttpSession
        session.setAttribute("employee",employee);
        session.setAttribute("employeeLogin",null);
        return "redirect:self";

    }

    //查看个人信息
    @RequestMapping("/self")
    public String self(){
        return "/houtai/self";
    }

    //退出
    @RequestMapping("/quit")
    public String login(HttpSession session){
        session.setAttribute("employee",null);
        return "redirect:to_login";
    }

    //跳转修改密码页面
    @RequestMapping("/to_change_password")
    public String  toChangePassword(){
        return "/houtai/change_password";
    }

    //修改密码   有三个参数，原密码，新密码，重复新密码
    @RequestMapping("/change_password")
    public String changePassword(HttpSession session, @RequestParam String old,
                                 @RequestParam String new1, @RequestParam String new2)  {
        Employee employee = (Employee) session.getAttribute("employee");
        //判断输入的密码是否是原密码
        if(employee.getePassword().equals(old)){
            //
            if(new1.equals(new2)){
                employee.setePassword(new1);
                globalBiz.changePassword(employee);
                return "redirect:self";
            }
        }
        return "redirect:to_change_password";

    }
}
