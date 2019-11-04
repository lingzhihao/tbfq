package com.ling.ssm.dao;

import com.ling.ssm.entity.Booking;
import com.ling.ssm.entity.Product;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("bookingDao")
public interface BookingDao {

    void insert(Booking booking);
    void update(Booking booking);
    void updateOver(Booking booking);
    void delete(int bYno);
    Booking select(int bYno);
    List<Booking> selectAll();//未联系
    List<Booking> selectAllByOver();//已联系
    List<Booking> selectAllByUser(String uName);



}
