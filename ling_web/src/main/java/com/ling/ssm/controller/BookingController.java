package com.ling.ssm.controller;

import com.ling.ssm.biz.*;
import com.ling.ssm.entity.Booking;
import com.ling.ssm.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.awt.print.Book;
import java.util.Map;

@Controller("bookingController")
@RequestMapping("/houtai/booking")
public class BookingController {

    @Autowired
    private BookingBiz bookingBiz;
    @Autowired
    private ProductBiz productBiz;

    @Autowired
    private UserBiz userBiz;

    @Autowired
    private EmployeeBiz employeeBiz;
    //未受理套餐列表
    @RequestMapping("/list")
    public String list(Map<String,Object> map){
        map.put("list",bookingBiz.getAll());
        return "/houtai/booking_list";
    }

    //已受理套餐列表
    @RequestMapping("/processed_list")
    public String processed_list(Map<String,Object> map){
        map.put("list",bookingBiz.getAllByOver());
        return "/houtai/booking_processed_list";
    }

    //跳转未受理订单详细信息
    @RequestMapping(value = "/to_detailed",params = "bYno")
    public String to_detailed(int bYno,Map<String,Object> map){
        map.put("detailed",bookingBiz.get(bYno));
        return "/houtai/booking_detailed";
    }
    //跳转已受理订单详细信息
    @RequestMapping(value = "/to_processed_detailed",params = "bYno")
    public String to_processed_detailed(int bYno,Map<String,Object> map){
        map.put("detailed",bookingBiz.get(bYno));
        return "houtai/booking_processed_detailed";
    }

    //联系成功，返回列表
    @RequestMapping("/acceptance")
    public String acceptance(Booking booking, HttpSession session){
        Employee employee = (Employee) session.getAttribute("employee");
        String eno = employee.getEno();
        booking.setbYduty("已联系");
        booking.setEno(eno);
        bookingBiz.edit(booking);
        return "redirect:list";
    }


    //跳转修改页面  使用params属性，强制要求 必须传入
    @RequestMapping(value = "/to_processed_update",params = "bYno")
    public String toProcessedUpdate(int bYno,Map<String,Object> map){
        map.put("booking",bookingBiz.get(bYno));
        map.put("product",productBiz.getAll());
        return "/houtai/booking_processed_update";
    }

    @RequestMapping(value = "/update")
    public String updateProcessed(Booking booking){
        bookingBiz.editOver(booking);
        return "redirect:processed_list";
    }



    //删除套餐
    @RequestMapping(value = "/remove",params = "bYno")
    public String remove(int bYno){
        bookingBiz.remove(bYno);
        return "redirect:processed_list";
    }




}
