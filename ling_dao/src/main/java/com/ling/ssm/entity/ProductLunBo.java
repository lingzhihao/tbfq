package com.ling.ssm.entity;

//客片表
public class ProductLunBo {
    private Integer lLno;//客片编号
    private String lName;//图片套餐名
    private String lImage1;//图片
    private String lImage2;//图片
    private String lImage3;//图片
    private String lImage4;//图片
    private String lImage5;//图片

    @Override
    public String toString() {
        return "ProductLunBo{" +
                "lLno=" + lLno +
                ", lName='" + lName + '\'' +
                ", lImage1='" + lImage1 + '\'' +
                ", lImage2='" + lImage2 + '\'' +
                ", lImage3='" + lImage3 + '\'' +
                ", lImage4='" + lImage4 + '\'' +
                ", lImage5='" + lImage5 + '\'' +
                '}';
    }

    public Integer getlLno() {
        return lLno;
    }

    public void setlLno(Integer lLno) {
        this.lLno = lLno;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getlImage1() {
        return lImage1;
    }

    public void setlImage1(String lImage1) {
        this.lImage1 = lImage1;
    }

    public String getlImage2() {
        return lImage2;
    }

    public void setlImage2(String lImage2) {
        this.lImage2 = lImage2;
    }

    public String getlImage3() {
        return lImage3;
    }

    public void setlImage3(String lImage3) {
        this.lImage3 = lImage3;
    }

    public String getlImage4() {
        return lImage4;
    }

    public void setlImage4(String lImage4) {
        this.lImage4 = lImage4;
    }

    public String getlImage5() {
        return lImage5;
    }

    public void setlImage5(String lImage5) {
        this.lImage5 = lImage5;
    }
}
