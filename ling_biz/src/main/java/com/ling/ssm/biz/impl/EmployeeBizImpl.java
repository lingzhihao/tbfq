package com.ling.ssm.biz.impl;

import com.ling.ssm.biz.EmployeeBiz;
import com.ling.ssm.biz.PhotographerBiz;
import com.ling.ssm.dao.EmployeeDao;
import com.ling.ssm.dao.PhotographerDao;
import com.ling.ssm.entity.Employee;
import com.ling.ssm.entity.Photographer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("employeeBiz")
public class EmployeeBizImpl implements EmployeeBiz {

    @Qualifier("employeeDao")
    @Autowired
    private EmployeeDao employeeDao;

    public void add(Employee employee) {
        //设置默认密码
        employee.setePassword("123456");
        employeeDao.insert(employee);
    }

    public void edit(Employee employee) {
        employeeDao.update(employee);
    }

    public void remove(String eno) {
        employeeDao.delete(eno);
    }

    public Employee get(String eno) {
        return employeeDao.select(eno);
    }

    public List<Employee> getAll() {
        return employeeDao.selectAll();
    }
}
