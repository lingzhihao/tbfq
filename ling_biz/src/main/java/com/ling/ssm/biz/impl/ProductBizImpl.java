package com.ling.ssm.biz.impl;

import com.ling.ssm.biz.EmployeeBiz;
import com.ling.ssm.biz.ProductBiz;
import com.ling.ssm.biz.ProductImgBiz;
import com.ling.ssm.dao.EmployeeDao;
import com.ling.ssm.dao.ProductDao;
import com.ling.ssm.entity.Employee;
import com.ling.ssm.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("productBiz")
public class ProductBizImpl implements ProductBiz {

    @Autowired
    private ProductDao productDao;
    public void add(Product product) {
        Product product_1 = productDao.select(product.getpId());
        if (product_1 ==null ){
            productDao.insert(product);
        }
    }

    public void edit(Product product) {
        productDao.update(product);
    }

    public void remove(String pId) {
        productDao.delete(pId);
    }

    public Product get(String pId) {
        return productDao.select(pId);
    }

    public List<Product> getAll() {
        return productDao.selectAll();
    }
}
