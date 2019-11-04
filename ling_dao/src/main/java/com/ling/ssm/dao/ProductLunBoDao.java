package com.ling.ssm.dao;

import com.ling.ssm.entity.ProductImg;
import com.ling.ssm.entity.ProductLunBo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("productLunBoDao")
public interface ProductLunBoDao {
    void insert(ProductLunBo productLunBo);
    void update(ProductLunBo productLunBo);
    void delete(int lLno);
    ProductLunBo select(int lLGno);
    List<ProductLunBo> selectAll();
}
