package com.ling.ssm.biz.impl;

import com.ling.ssm.biz.GlobalBiz;
import com.ling.ssm.dao.EmployeeDao;
import com.ling.ssm.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("globalBiz")
public class GlobalBizImpl implements GlobalBiz {

    @Qualifier("employeeDao")
    @Autowired
    private EmployeeDao employeeDao;

    public Employee login(String eno, String ePassword) {
        //根据eno 员工编号进行查询
        Employee employee = employeeDao.select(eno);
        //如果查询出来的信息不为空  以及等于数据库密码，返回employee对象
        if(employee != null && employee.getePassword().equals(ePassword)){
            return  employee;
        }
        return null;
    }

    //修改密码
    public void changePassword(Employee employee) {
        employeeDao.update(employee);
    }
}
