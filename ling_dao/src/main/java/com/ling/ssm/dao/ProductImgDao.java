package com.ling.ssm.dao;

import com.ling.ssm.entity.Employee;
import com.ling.ssm.entity.ProductImg;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("productImgDao")
public interface ProductImgDao {
    void insert(ProductImg productImg);
    void update(ProductImg employee);
    void delete(int gGno);
    ProductImg select(int gGno);
    List<ProductImg> selectAll();
}
