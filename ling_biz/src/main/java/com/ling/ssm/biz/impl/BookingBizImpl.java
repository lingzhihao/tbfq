package com.ling.ssm.biz.impl;

import com.ling.ssm.biz.BookingBiz;
import com.ling.ssm.biz.ProductBiz;
import com.ling.ssm.dao.BookingDao;
import com.ling.ssm.dao.ProductDao;
import com.ling.ssm.entity.Booking;
import com.ling.ssm.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.SessionScope;

import java.util.List;

@Service("bookingBiz")
public class BookingBizImpl implements BookingBiz {

    @Qualifier("bookingDao")
    @Autowired
    private BookingDao bookingDao;

    public void add(Booking booking) {
        booking.setbYduty("未联系");
        booking.setEno(null);
        bookingDao.insert(booking);
    }

    public void edit(Booking booking) {
        bookingDao.update(booking);
    }

    public void editOver(Booking booking) {
        bookingDao.updateOver(booking);
    }

    public void remove(int bYno) {
        bookingDao.delete(bYno);
    }

    public Booking get(int bYno) {
        return bookingDao.select(bYno);
    }

    public List<Booking> getAll() {
        return bookingDao.selectAll();
    }

    public List<Booking> getAllByOver() {
        return bookingDao.selectAllByOver();
    }

    public List<Booking> getAllByUser(String uName) {
        return bookingDao.selectAllByUser(uName);
    }
}
