package com.ling.ssm.biz.impl;

import com.ling.ssm.biz.EmployeeBiz;
import com.ling.ssm.biz.UserBiz;
import com.ling.ssm.dao.EmployeeDao;
import com.ling.ssm.dao.UserDao;
import com.ling.ssm.entity.Employee;
import com.ling.ssm.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userBiz")
public class UserBizImpl implements UserBiz {

    @Qualifier("userDao")
    @Autowired
    private UserDao userDao;

    public User login(String uName, String u_password) {
        //根据u_name 用户名进行查询
        User user = userDao.select(uName);
        if (user != null && user.getuPassword().equals(u_password)){
            return user;
        }
        return null;
    }

    public User loginByUname(String uName,String uPhone) {
        User user = userDao.select(uName);
        if (user != null && user.getuPhone().equals(uPhone)){
            return user;
        }
        return null;
    }

    public void changePassword(User user) {
        userDao.update(user);
    }

    public void add(User user) {
        userDao.insert(user);
    }

    public void edit(User user) {
        userDao.update(user);
    }

    public User get(String uName) {
        return userDao.select(uName);
    }

    public int count(String uName) {
        return userDao.selectByName(uName);
    }

    public void editByUname(User user) {
        userDao.updateByUname(user);
    }
}
