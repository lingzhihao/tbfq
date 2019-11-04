package com.ling.ssm.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ling.ssm.biz.ProductBiz;
import com.ling.ssm.biz.ProductImgBiz;
import com.ling.ssm.biz.ProductLunBoBiz;
import com.ling.ssm.biz.UserBiz;
import com.ling.ssm.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@Controller("userController")
@RequestMapping("/ling")
public class UserController {

    @Autowired
    private UserBiz userBiz;

    @Autowired
    private ProductImgBiz productImgBiz;
    @Autowired
    private ProductBiz productBiz;
    @Autowired
    private ProductLunBoBiz  productLunBoBiz;

    @RequestMapping("/test")
    public String  test(){
        return "/test";
    }

    //验证用户名是否已存在
    @RequestMapping(value="/findUser", method=RequestMethod.POST)
    public @ResponseBody Integer ajaxDemo(@RequestBody Map map) {
        String username = (String) map.get("account");
//        System.out.println(username);
        User user = userBiz.get(username);//从数据库查找前端出来的用户
//        System.out.println(user);
        if(user == null){//user为空，说明没有找到该用户，可以注册。反之。
            return 1;//然后返回给前端执行success方法。
        }else{
            return 0;
        }
    }



    @RequestMapping("/back_user")
    @ResponseBody
    public String backUser(String uName) {
        boolean flag = false;
        String stringJson = null;
        int count = userBiz.count(uName);
        if(count == 0) {
            flag = true;
        }
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("valid", flag);
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            stringJson = objectMapper.writeValueAsString(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return stringJson;
    }

    //跳转到登录界面
    @RequestMapping("/to_login")
    public String  toLogin(HttpSession session){
        session.setAttribute("forget",null);
        return "/login";
    }
    //登录   多个参数，需要用@RRequestParam 注解 来标明 这两个参数是接收用户的信息
    @RequestMapping("/login")
    public String login(HttpSession session, @RequestParam String u_name, @RequestParam String u_password,Map<String,Object> map){
        User user = userBiz.login(u_name,u_password);
        if (user == null){
            session.setAttribute("userLogin","***用户名或密码错误，请重新输入***");
            return "redirect:to_login";
        }
        //登录成功后保存在 session里，  只需要在参数里声明  HttpSession
        session.setAttribute("user",user);
        session.setAttribute("userLogin",null);
        return "redirect:index";
    }


    //跳转到忘记密码界面
    @RequestMapping("/to_forget")
    public String  toForget(){
        return "/forget_password";
    }

    @RequestMapping("/forget_password")
    public String forgetPassword(HttpSession session, @RequestParam String uName, @RequestParam String uPhone){
        User user = userBiz.loginByUname(uName,uPhone);
        if (user == null){
            session.setAttribute("forget","***用户名不存在或联系电话有误，请重新输入***");
            return "redirect:to_forget";
        }
        userBiz.editByUname(user);
        session.setAttribute("forget",null);
        session.setAttribute("forget","***修改成功***");
        return "redirect:to_forget";
    }

    //跳转到首页
    @RequestMapping("/index")
    public String index(Map<String,Object> map){
        map.put("product",productBiz.getAll());
        map.put("product_img",productImgBiz.getAll());
        map.put("product_lunbo",productLunBoBiz.getAll());
        return "/index";
    }

    //退出
    @RequestMapping("/quit")
    public String login(HttpSession session){
        session.setAttribute("user",null);
        return "redirect:index";
    }

    //跳转修改密码页面
    @RequestMapping("/to_change_password")
    public String  toChangePassword(){
        return "/change_password";
    }

    //修改密码   有三个参数，原密码，新密码，重复新密码
    @RequestMapping("/change_password")
    public String changePassword(HttpSession session, @RequestParam String old,
                                 @RequestParam String new1, @RequestParam String new2)  {
        User user = (User) session.getAttribute("user");
        //判断输入的密码是否是原密码
        if(user.getuPassword().equals(old)){
            //
            if(new1.equals(new2)){
                user.setuPassword(new1);
                userBiz.changePassword(user);
                return "redirect:myself";
            }
        }
        return "redirect:to_change_password";
    }

    //查看个人信息
    @RequestMapping(value = "/myself")
    public String self(){
        return "/myself";
    }
    //跳转修改页面  使用params属性，强制要求 必须传入
    @RequestMapping(value = "/user/to_update",params = "uName")
    public String toUpdate(String uName, Map<String,Object> map){
        map.put("user",userBiz.get(uName));
        return "/myself_update";
    }

    //修改
    @RequestMapping("/update")
    public String update(User user){

        userBiz.edit(user);
        return "redirect:myself";
    }

    //跳转注册页面
    @RequestMapping("/to_register")
    public String toAdd(Map<String,Object> map){
        map.put("user",new User());
        return "/register";
    }
    //添加
    @RequestMapping("/register")
    public String add(User user){
        userBiz.add(user);
        return "redirect:to_login";
    }
}
