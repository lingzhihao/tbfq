package com.ling.ssm.entity;

public class Photographer {

    private String sSno;//摄影师编号
    private String sName;//摄影师姓名
    private String sSex;//性别
    private String sAge;//年龄
    private String sPhone;//联系方式
//    private String eno;//管理员编号

    public String getsSno() {
        return sSno;
    }

    public void setsSno(String sSno) {
        this.sSno = sSno;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public String getsSex() {
        return sSex;
    }

    public void setsSex(String sSex) {
        this.sSex = sSex;
    }

    public String getsAge() {
        return sAge;
    }

    public void setsAge(String sAge) {
        this.sAge = sAge;
    }

    public String getsPhone() {
        return sPhone;
    }

    public void setsPhone(String sPhone) {
        this.sPhone = sPhone;
    }
}
