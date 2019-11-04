package com.ling.ssm.biz;

import com.ling.ssm.entity.Employee;
import com.ling.ssm.entity.User;


public interface UserBiz {

    User login(String uName, String u_password);
    User loginByUname(String uName,String u_phone);

    void changePassword(User user);

    void add(User user);
    void edit(User user);
    User get(String uName);

    int count(String uName);

    void editByUname(User user);


}
