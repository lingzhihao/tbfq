package com.ling.ssm.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Booking {
    private Integer bYno;//预约编号

    private String uName;//用户名

    private String pId;//套餐编号


    private String bMname;//男方姓名

    private String bWname;//女方姓名

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date bDate;//到店日期

    private String bPhone;//联系电话

    private String bYduty;//预约状态

    private String eno;//管理员编号

    private Employee employee;

    private Product product;

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public String getEno() {
        return eno;
    }

    public void setEno(String eno) {
        this.eno = eno;
    }

    public String getbPhone() {
        return bPhone;
    }

    public void setbPhone(String bPhone) {
        this.bPhone = bPhone;
    }

    public Integer getbYno() {
        return bYno;
    }

    public void setbYno(Integer bYno) {
        this.bYno = bYno;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

/*    public String getsSno() {
        return sSno;
    }

    public void setsSno(String sSno) {
        this.sSno = sSno;
    }*/

    public String getbMname() {
        return bMname;
    }

    public void setbMname(String bMname) {
        this.bMname = bMname;
    }

    public String getbWname() {
        return bWname;
    }

    public void setbWname(String bWname) {
        this.bWname = bWname;
    }

    public Date getbDate() {
        return bDate;
    }

    public void setbDate(Date bDate) {
        this.bDate = bDate;
    }

    public String getbYduty() {
        return bYduty;
    }

    public void setbYduty(String bYduty) {
        this.bYduty = bYduty;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "bYno=" + bYno +
                ", uName='" + uName + '\'' +
                ", pId='" + pId + '\'' +
                ", bMname='" + bMname + '\'' +
                ", bWname='" + bWname + '\'' +
                ", bDate=" + bDate +
                ", bPhone='" + bPhone + '\'' +
                ", bYduty='" + bYduty + '\'' +
                ", eno='" + eno + '\'' +
                ", employee=" + employee +
                ", product=" + product +
                ", user=" + user +
                '}';
    }
}
