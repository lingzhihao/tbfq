package com.ling.ssm.dao;

import com.ling.ssm.entity.Photographer;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("photographerDao")
public interface PhotographerDao {
    void insert (Photographer photographer);
    void update (Photographer photographer);
    void delete (String s_sno);
    Photographer select(String s_sno);
    List<Photographer> selectAll();
}
