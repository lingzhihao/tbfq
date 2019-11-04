package com.ling.ssm.dao;


import com.ling.ssm.entity.User;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public interface UserDao {

    void insert(User user);
    void update(User user);
    void delete(String uName);
    User select(String uName);
    int selectByName(String uName);
    void updateByUname(User user);

}
