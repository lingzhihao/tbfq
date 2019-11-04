package com.ling.ssm.biz;

import com.ling.ssm.entity.Photographer;

import java.util.List;

public interface PhotographerBiz {

    void add(Photographer photographer);
    void edit(Photographer photographer);
    void remove(String sno);
    Photographer get(String sno);
    List<Photographer> getAll();
}
