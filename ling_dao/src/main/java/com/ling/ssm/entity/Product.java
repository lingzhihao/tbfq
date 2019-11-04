package com.ling.ssm.entity;

public class Product {
    private String pId;//套餐编号
    private String pPrice;//价格
    private String pName;//介绍
    private String pImg;//图片
    private String pNj;//内景
    private String pWj;//外景
    private String pPssl;//拍摄数量
    private String pDp;//底片
    private String pFwry;//服务人员
    private String pFwsj;//服务时间
    private String pZxts;//造型套数
    private String pHzyp;//化妆用品
    private String pPsdj;//拍摄道具
    private String pXc;//相册
    private String pXk;//相框
    private String pBt;//摆台
    private String pZj;//展架
    private String pZssp;//赠送商品
    private int productImgGno;//照片编号
    private int productLunBoLno;//轮播图编号
    private ProductImg productImg;
    private ProductLunBo productLunBo;

    public int getProductLunBoLno() {
        return productLunBoLno;
    }

    public void setProductLunBoLno(int productLunBoLno) {
        this.productLunBoLno = productLunBoLno;
    }

    public ProductLunBo getProductLunBo() {
        return productLunBo;
    }

    public void setProductLunBo(ProductLunBo productLunBo) {
        this.productLunBo = productLunBo;
    }

    public ProductImg getProductImg() {
        return productImg;
    }

    public void setProductImg(ProductImg productImg) {
        this.productImg = productImg;
    }

    public int getProductImgGno() {
        return productImgGno;
    }

    public void setProductImgGno(int productImgGno) {
        this.productImgGno = productImgGno;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getpPrice() {
        return pPrice;
    }

    public void setpPrice(String pPrice) {
        this.pPrice = pPrice;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpImg() {
        return pImg;
    }

    public void setpImg(String pImg) {
        this.pImg = pImg;
    }

    public String getpNj() {
        return pNj;
    }

    public void setpNj(String pNj) {
        this.pNj = pNj;
    }

    public String getpWj() {
        return pWj;
    }

    public void setpWj(String pWj) {
        this.pWj = pWj;
    }

    public String getpPssl() {
        return pPssl;
    }

    public void setpPssl(String pPssl) {
        this.pPssl = pPssl;
    }

    public String getpDp() {
        return pDp;
    }

    public void setpDp(String pDp) {
        this.pDp = pDp;
    }

    public String getpFwry() {
        return pFwry;
    }

    public void setpFwry(String pFwry) {
        this.pFwry = pFwry;
    }

    public String getpFwsj() {
        return pFwsj;
    }

    public void setpFwsj(String pFwsj) {
        this.pFwsj = pFwsj;
    }

    public String getpZxts() {
        return pZxts;
    }

    public void setpZxts(String pZxts) {
        this.pZxts = pZxts;
    }

    public String getpHzyp() {
        return pHzyp;
    }

    public void setpHzyp(String pHzyp) {
        this.pHzyp = pHzyp;
    }

    public String getpPsdj() {
        return pPsdj;
    }

    public void setpPsdj(String pPsdj) {
        this.pPsdj = pPsdj;
    }

    public String getpXc() {
        return pXc;
    }

    public void setpXc(String pXc) {
        this.pXc = pXc;
    }

    public String getpXk() {
        return pXk;
    }

    public void setpXk(String pXk) {
        this.pXk = pXk;
    }

    public String getpBt() {
        return pBt;
    }

    public void setpBt(String pBt) {
        this.pBt = pBt;
    }

    public String getpZj() {
        return pZj;
    }

    public void setpZj(String pZj) {
        this.pZj = pZj;
    }

    public String getpZssp() {
        return pZssp;
    }

    public void setpZssp(String pZssp) {
        this.pZssp = pZssp;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pId='" + pId + '\'' +
                ", pPrice='" + pPrice + '\'' +
                ", pName='" + pName + '\'' +
                ", pImg='" + pImg + '\'' +
                ", pNj='" + pNj + '\'' +
                ", pWj='" + pWj + '\'' +
                ", pPssl='" + pPssl + '\'' +
                ", pDp='" + pDp + '\'' +
                ", pFwry='" + pFwry + '\'' +
                ", pFwsj='" + pFwsj + '\'' +
                ", pZxts='" + pZxts + '\'' +
                ", pHzyp='" + pHzyp + '\'' +
                ", pPsdj='" + pPsdj + '\'' +
                ", pXc='" + pXc + '\'' +
                ", pXk='" + pXk + '\'' +
                ", pBt='" + pBt + '\'' +
                ", pZj='" + pZj + '\'' +
                ", pZssp='" + pZssp + '\'' +
                ", productImgGno=" + productImgGno +
                ", productLunBoLno=" + productLunBoLno +
                ", productImg=" + productImg +
                ", productLunBo=" + productLunBo +
                '}';
    }
}
