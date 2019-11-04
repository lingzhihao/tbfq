<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 套餐详细信息 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 套餐详细信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>套餐编号：</h4><span>${detailed.pId}</span></label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon"> <h4>套餐价格：</h4><span>${detailed.pPrice}</span> </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>套餐名：</h4><span>${detailed.pName}</span></label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>内景：</h4><span>${detailed.pNj}</span></label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>外景：</h4><span>${detailed.pWj}</span></label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>拍摄数量：</h4><span>${detailed.pPssl}</span> </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>底片：</h4><span>${detailed.pDp}</span> </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>服务人员：</h4><span>${detailed.pFwry}</span></label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>造型套数：</h4><span>${detailed.pZxts}</span></label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>化妆用品：</h4><span>${detailed.pHzyp}</span></label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>拍摄道具：</h4><span>${detailed.pPsdj}</span> </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>相册：</h4><span>${detailed.pXc}</span> </label>
                            </div>
                        </div>
                        <div class="section row">

                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>相框：</h4><span>${detailed.pXk}</span> </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>摆台：</h4><span>${detailed.pBt}</span></label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>展架：</h4><span>${detailed.pZj}</span></label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>赠送商品：</h4><span>${detailed.pZssp}</span></label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4> 封面图片：</h4><img src="${detailed.pImg}" width="70px" height="70px">
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>服务时间：</h4><span>${detailed.pFwsj}</span></label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>套餐图片：</h4>
                                    <img src="${detailed.productImg.gImage1}" width="70px" height="70px">
                                    <img src="${detailed.productImg.gImage2}" width="70px" height="70px">
                                    <img src="${detailed.productImg.gImage3}" width="70px" height="70px">
                                    <img src="${detailed.productImg.gImage4}" width="70px" height="70px">
                                    <img src="${detailed.productImg.gImage5}" width="70px" height="70px">
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>套餐轮播图片：</h4>
                                    <img src="${detailed.productLunBo.lImage1}" width="70px" height="70px">
                                    <img src="${detailed.productLunBo.lImage2}" width="70px" height="70px">
                                    <img src="${detailed.productLunBo.lImage3}" width="70px" height="70px">
                                    <img src="${detailed.productLunBo.lImage4}" width="70px" height="70px">
                                    <img src="${detailed.productLunBo.lImage5}" width="70px" height="70px">
                                </label>
                            </div>
                        </div>
                        <div class="panel-footer text-right">
                            <a href="<c:url value="/houtai/product/to_update?pId=${detailed.pId}"/>"><button class="button"> 修改 </button></a>
                            <a onclick="return confirm('将要删除套餐：${detailed.pName}，是否继续？')" href="<c:url value="/houtai/product/remove?pId=${detailed.pId}"/>"><button class="button"> 删除 </button></a>
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>