package com.ling.ssm.biz;

import com.ling.ssm.entity.Employee;

/**
 * 登录业务
 */
public interface GlobalBiz {

    Employee login(String eno,String ePassword);

    void changePassword(Employee employee);
}
