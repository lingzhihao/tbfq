package com.ling.ssm.biz.impl;

import com.ling.ssm.biz.PhotographerBiz;
import com.ling.ssm.dao.PhotographerDao;
import com.ling.ssm.entity.Photographer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("photographerBiz")
public class PhotographerBizImpl implements PhotographerBiz {

    @Qualifier("photographerDao")
    @Autowired
    private PhotographerDao photographerDao;

    public void add(Photographer photographer) {
        photographerDao.insert(photographer);
    }

    public void edit(Photographer photographer) {
        photographerDao.update(photographer);
    }

    public void remove(String sno) {
        photographerDao.delete(sno);
    }

    public Photographer get(String sno) {
        return photographerDao.select(sno);
    }

    public List<Photographer> getAll() {
        return photographerDao.selectAll();
    }
}
