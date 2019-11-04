package com.ling.ssm.dao;

import com.ling.ssm.entity.Employee;
import com.ling.ssm.entity.Product;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("peoductDao")
public interface ProductDao {
    void insert(Product product);
    void update(Product product);
    void delete(String pId);
    Product select(String pId);
    List<Product> selectAll();


}
