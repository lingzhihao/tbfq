package com.ling.ssm.entity;

//客片表
public class ProductImg {
    private Integer gGno;//客片编号
    private String gImage1;//图片
    private String gImage2;//图片
    private String gImage3;//图片
    private String gImage4;//图片
    private String gImage5;//图片
    private String gName;//图片套餐名

    @Override
    public String toString() {
        return "ProductImg{" +
                "gGno=" + gGno +
                ", gImage1='" + gImage1 + '\'' +
                ", gImage2='" + gImage2 + '\'' +
                ", gImage3='" + gImage3 + '\'' +
                ", gImage4='" + gImage4 + '\'' +
                ", gImage5='" + gImage5 + '\'' +
                ", gName='" + gName + '\'' +
                '}';
    }

    public String getgName() {
        return gName;
    }

    public void setgName(String gName) {
        this.gName = gName;
    }


    public Integer getgGno() {
        return gGno;
    }

    public void setgGno(Integer gGno) {
        this.gGno = gGno;
    }

    public String getgImage1() {
        return gImage1;
    }

    public void setgImage1(String gImage1) {
        this.gImage1 = gImage1;
    }

    public String getgImage2() {
        return gImage2;
    }

    public void setgImage2(String gImage2) {
        this.gImage2 = gImage2;
    }

    public String getgImage3() {
        return gImage3;
    }

    public void setgImage3(String gImage3) {
        this.gImage3 = gImage3;
    }

    public String getgImage4() {
        return gImage4;
    }

    public void setgImage4(String gImage4) {
        this.gImage4 = gImage4;
    }

    public String getgImage5() {
        return gImage5;
    }

    public void setgImage5(String gImage5) {
        this.gImage5 = gImage5;
    }
}
