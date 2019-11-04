package com.ling.ssm.biz;

import com.ling.ssm.entity.Employee;
import com.ling.ssm.entity.Product;

import java.util.List;

public interface ProductBiz {

    void add(Product product);
    void edit(Product product);
    void remove(String pId);
    Product get(String pId);
    List<Product> getAll();
}
