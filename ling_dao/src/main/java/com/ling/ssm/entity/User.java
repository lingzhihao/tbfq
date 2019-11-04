package com.ling.ssm.entity;

public class User {

    private String uName;//用户名
    private String uRelname;//用户姓名
    private String uPhone;//电话
    private String uPassword;//密码
    private String uSex;//性别
    private String uAddress;//地址
    private String uEmail;//邮箱

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuRelname() {
        return uRelname;
    }

    public void setuRelname(String uRelname) {
        this.uRelname = uRelname;
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public String getuSex() {
        return uSex;
    }

    public void setuSex(String uSex) {
        this.uSex = uSex;
    }

    public String getuAddress() {
        return uAddress;
    }

    public void setuAddress(String uAddress) {
        this.uAddress = uAddress;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail;
    }
}
