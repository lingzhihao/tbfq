package com.ling.ssm.entity;

public class ProductClass {

    private String pcId;//类别编号
    private String pcName;//类别名称
    private String pcQdate;//取片天数

    public String getPcId() {
        return pcId;
    }

    public void setPcId(String pcId) {
        this.pcId = pcId;
    }

    public String getPcName() {
        return pcName;
    }

    public void setPcName(String pcName) {
        this.pcName = pcName;
    }

    public String getPcQdate() {
        return pcQdate;
    }

    public void setPcQdate(String pcQdate) {
        this.pcQdate = pcQdate;
    }
}
