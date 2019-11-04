package com.ling.ssm.biz;

import com.ling.ssm.entity.ProductImg;
import com.ling.ssm.entity.ProductLunBo;

import java.util.List;

public interface ProductLunBoBiz {

    void add(ProductLunBo productLunBo);
    void edit(ProductLunBo productLunBo);
    void remove(int lLno);
    ProductLunBo get(int lLno);
    List<ProductLunBo> getAll();
}
