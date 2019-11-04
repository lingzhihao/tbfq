package com.ling.ssm.biz.impl;

import com.ling.ssm.biz.ProductImgBiz;
import com.ling.ssm.biz.ProductLunBoBiz;
import com.ling.ssm.dao.ProductImgDao;
import com.ling.ssm.dao.ProductLunBoDao;
import com.ling.ssm.entity.ProductImg;
import com.ling.ssm.entity.ProductLunBo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("productLunBoBiz")
public class ProductLunBoBizImpl implements ProductLunBoBiz {

    @Qualifier("productLunBoDao")
    @Autowired
    private ProductLunBoDao productLunBoDao;

    public void add(ProductLunBo productLunBo) {
        productLunBoDao.insert(productLunBo);
    }

    public void edit(ProductLunBo productLunBo) {
        productLunBoDao.update(productLunBo);
    }

    public void remove(int lLno) {
        productLunBoDao.delete(lLno);
    }

    public ProductLunBo get(int lLno) {
        return productLunBoDao.select(lLno);
    }

    public List<ProductLunBo> getAll() {
        return productLunBoDao.selectAll();
    }
}
