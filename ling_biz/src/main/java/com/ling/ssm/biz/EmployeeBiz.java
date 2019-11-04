package com.ling.ssm.biz;

import com.ling.ssm.entity.Employee;
import com.ling.ssm.entity.Photographer;

import java.util.List;

public interface EmployeeBiz {

    void add(Employee employee);
    void edit(Employee employee);
    void remove(String eno);
    Employee get(String eno);
    List<Employee> getAll();
}
