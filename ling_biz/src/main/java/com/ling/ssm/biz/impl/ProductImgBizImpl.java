package com.ling.ssm.biz.impl;

import com.ling.ssm.biz.ProductImgBiz;
import com.ling.ssm.dao.ProductImgDao;
import com.ling.ssm.entity.ProductImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("productImgBiz")
public class ProductImgBizImpl implements ProductImgBiz {

    @Qualifier("productImgDao")
    @Autowired
    private ProductImgDao productImgDao;


    public void add(ProductImg productImg) {
//        productImg.setgName("测试1");
//        productImg.setgImage2("1");
//        productImg.setgImage3("1");
//        productImg.setgImage4("1");
//        productImg.setgImage5("1");
        productImgDao.insert(productImg);
    }

    public void edit(ProductImg productImg) {
        productImgDao.update(productImg);
    }

    public void remove(int gGno) {
        productImgDao.delete(gGno);
    }

    public ProductImg get(int gGno) {
        return productImgDao.select(gGno);
    }

    public List<ProductImg> getAll() {
        return productImgDao.selectAll();
    }
}
