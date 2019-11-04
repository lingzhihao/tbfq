package com.ling.ssm.dao;

import com.ling.ssm.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 报销单
 */
@Repository("claimVoucherDao")
public interface TestDao {

    void insert(User user);
    void update(User user);
}
