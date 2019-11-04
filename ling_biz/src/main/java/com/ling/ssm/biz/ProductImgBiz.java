package com.ling.ssm.biz;

import com.ling.ssm.entity.Employee;
import com.ling.ssm.entity.ProductImg;

import java.util.List;

public interface ProductImgBiz {

    void add(ProductImg productImg);
    void edit(ProductImg productImg);
    void remove(int gGno);
    ProductImg get(int gGno);
    List<ProductImg> getAll();
}
