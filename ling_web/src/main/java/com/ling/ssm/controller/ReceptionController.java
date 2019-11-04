package com.ling.ssm.controller;



import com.ling.ssm.biz.BookingBiz;
import com.ling.ssm.biz.ProductBiz;
import com.ling.ssm.biz.ProductImgBiz;
import com.ling.ssm.entity.Booking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@Controller("receptionController")
@RequestMapping("/ling")
public class ReceptionController {

    @Autowired
    private ProductBiz productBiz;

    @Autowired
    private ProductImgBiz productImgBiz;

    @Autowired
    private BookingBiz bookingBiz;

    //关于我们
    @RequestMapping("/about")
    public String contact(){
        return "about";
    }


    //套餐首页
    @RequestMapping("/taocan_index")
    public String taocan_index(Map<String,Object> map){
        map.put("product",productBiz.getAll());
        return "taocan_index";
    }
    //套餐详情页
    @RequestMapping(value = "/to_taocan",params = "pId")
    public String taocan(String pId,Map<String,Object> map){
        map.put("taocan",productBiz.get(pId));
        return "taocan";
    }


    //团队
    @RequestMapping("/team")
    public String about(){
        return "team";
    }

    //订单页面
    @RequestMapping(value = "/order",params = "pId")
    public String order(String pId,Map<String,Object> map){
        map.put("product",productBiz.get(pId));
        return "order";
    }
    //提交订单
    @RequestMapping(value = "/add_order",params = "pId")
    public String addOrder(String pId,Booking booking, HttpSession session,Map<String,Object> map){
        bookingBiz.add(booking);
        String str = "预定成功";
        session.setAttribute("ok",str);
        map.put("product",productBiz.get(pId));
        return "redirect:taocan_index";
    }


    //查询我的订单
    @RequestMapping(value ="/myorder",params = "uName")
    public String myOrder(String uName,Map<String,Object> map){
        map.put("order",bookingBiz.getAllByUser(uName));
        return "my_order";
    }
    //跳转订单详细信息
    @RequestMapping(value = "/to_detailed",params = "bYno")
    public String to_detailed(int bYno,Map<String,Object> map){
        map.put("detailed",bookingBiz.get(bYno));
        return "/my_order_detailed";
    }


    //客片首页
    @RequestMapping("/kepian_index")
    public String kepian_index(Map<String,Object> map){
        map.put("productImg",productImgBiz.getAll());
        return "kepian_index";
    }
    //客片详情页
    @RequestMapping(value = "/kepian",params = "gGno")
    public String kepian(int gGno,Map<String,Object> map){
        map.put("kepian",productImgBiz.get(gGno));
        return "kepian";
    }

}
