package com.ling.ssm.controller;

import com.ling.ssm.biz.PhotographerBiz;
import com.ling.ssm.biz.impl.PhotographerBizImpl;
import com.ling.ssm.entity.Photographer;
import com.ling.ssm.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller("photographerController")
@RequestMapping("/houtai/photographer")
public class PhotographerController {

    @Autowired
    private PhotographerBiz photographerBiz;

    //摄影师列表
    @RequestMapping("/list")
    public String list(Map<String,Object> map){
        map.put("list",photographerBiz.getAll());
        return "/houtai/photographer_list";
    }

    //跳转添加页面
    @RequestMapping("/to_add")
    public String toAdd(Map<String,Object> map){
        map.put("photographer",new Photographer());
        return "/houtai/photographer_add";
    }

    //验证套餐ID是否已存在
    @RequestMapping(value="/findSno", method= RequestMethod.POST)
    public @ResponseBody Integer ajaxDemo(@RequestBody Map map) {
        String sno = (String) map.get("account");
        Photographer photographer = photographerBiz.get(sno);//从数据库查找前端出来的用户
        if(photographer == null){//user为空，说明没有找到该用户，可以注册。反之。
            return 1;//然后返回给前端执行success方法。
        }else{
            return 0;
        }
    }

    //添加
    @RequestMapping("/add")
    public String add(Photographer photographer){
        photographerBiz.add(photographer);
        return "redirect:list";
    }

    //跳转修改页面  使用params属性，强制要求 必须传入 sSno  摄影师编号
    @RequestMapping(value = "/to_update",params = "sSno")
    public String toUpdate(String sSno,Map<String,Object> map){
        map.put("photographer",photographerBiz.get(sSno));
        return "/houtai/photographer_update";
    }

    //添加
    @RequestMapping("/update")
    public String update(Photographer photographer){
        photographerBiz.edit(photographer);
        return "redirect:list";
    }

    //删除摄影师
    @RequestMapping(value = "/remove",params = "sSno")
    public String remove(String sSno){
        try {
            photographerBiz.remove(sSno);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:list";
    }


}
