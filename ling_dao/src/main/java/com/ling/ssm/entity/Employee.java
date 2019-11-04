package com.ling.ssm.entity;

public class Employee {

    private String eno;//管理员编号
    private String eName;//姓名
    private String eSex;//性别
    private String eAge;//年龄
    private String ePassword;//密码
    private String eAddress;//地址
    private String ePhone;//联系方式

    public String getEno() {
        return eno;
    }

    public void setEno(String eno) {
        this.eno = eno;
    }

    public String geteName() {
        return eName;
    }

    public void seteName(String eName) {
        this.eName = eName;
    }

    public String geteSex() {
        return eSex;
    }

    public void seteSex(String eSex) {
        this.eSex = eSex;
    }

    public String geteAge() {
        return eAge;
    }

    public void seteAge(String eAge) {
        this.eAge = eAge;
    }

    public String getePassword() {
        return ePassword;
    }

    public void setePassword(String ePassword) {
        this.ePassword = ePassword;
    }

    public String geteAddress() {
        return eAddress;
    }

    public void seteAddress(String eAddess) {
        this.eAddress = eAddess;
    }

    public String getePhone() {
        return ePhone;
    }

    public void setePhone(String ePhone) {
        this.ePhone = ePhone;
    }
}
