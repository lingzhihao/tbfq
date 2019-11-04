package com.ling.ssm.dao;

import com.ling.ssm.entity.Employee;
import com.ling.ssm.entity.Photographer;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("employeeDao")
public interface EmployeeDao {
    void insert(Employee employee);
    void update(Employee employee);
    void delete(String eno);
    Employee select(String eno);
    List<Employee> selectAll();
}
