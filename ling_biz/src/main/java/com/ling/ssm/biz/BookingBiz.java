package com.ling.ssm.biz;

import com.ling.ssm.entity.Booking;
import com.ling.ssm.entity.Product;

import java.util.List;

public interface BookingBiz {

    void add(Booking booking);
    void edit(Booking booking);
    void editOver(Booking booking);
    void remove(int bYno);
    Booking get(int bYno);
    List<Booking> getAll();
    List<Booking> getAllByOver();
    List<Booking> getAllByUser(String uName);

}
