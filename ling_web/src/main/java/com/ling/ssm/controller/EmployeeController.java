package com.ling.ssm.controller;

import com.ling.ssm.biz.EmployeeBiz;
import com.ling.ssm.biz.PhotographerBiz;
import com.ling.ssm.entity.Employee;
import com.ling.ssm.entity.Photographer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller("employeeController")
@RequestMapping("/houtai/employee")
public class EmployeeController {

    @Autowired
    private EmployeeBiz employeeBiz;

    //员工列表
    @RequestMapping("/list")
    public String list(Map<String,Object> map){
        map.put("list",employeeBiz.getAll());
        return "/houtai/employee_list";
    }

    //跳转添加页面
    @RequestMapping("/to_add")
    public String toAdd(Map<String,Object> map){
        map.put("employee",new Employee());
        return "/houtai/employee_add";
    }

    //添加
    @RequestMapping("/add")
    public String add(Employee employee){
        employeeBiz.add(employee);
        return "redirect:list";
    }

    //验证套餐ID是否已存在
    @RequestMapping(value="/findEno", method= RequestMethod.POST)
    public @ResponseBody
    Integer ajaxDemo(@RequestBody Map map) {
        String eno = (String) map.get("account");
        Employee employee = employeeBiz.get(eno);//从数据库查找前端出来的用户
        if(employee == null){//user为空，说明没有找到该用户，可以注册。反之。
            return 1;//然后返回给前端执行success方法。
        }else{
            return 0;
        }
    }


    //跳转修改页面  使用params属性，强制要求 必须传入 eno 员工编号
    @RequestMapping(value = "/to_update",params = "eno")
    public String toUpdate(String eno,Map<String,Object> map){
        map.put("employee",employeeBiz.get(eno));
        return "/houtai/employee_update";
    }

    //添加
    @RequestMapping("/update")
    public String update(Employee employee){
        employeeBiz.edit(employee);
        return "redirect:list";
    }

    //删除员工
    @RequestMapping(value = "/remove",params = "eno")
    public String remove(String eno){
        employeeBiz.remove(eno);
        return "redirect:list";
    }


}
