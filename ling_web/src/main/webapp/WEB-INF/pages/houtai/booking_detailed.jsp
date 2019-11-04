<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 未处理预订单详情 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 未处理预订单详情 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>预约订单号：</h4><span class="badge badge-warning mr10 fs11">&nbsp;&nbsp;${detailed.bYno}&nbsp;&nbsp;</span></label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon"> <h4>预约用户：</h4><span>${detailed.uName}</span> </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>新郎姓名：</h4><span>${detailed.bMname}</span></label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>新娘姓名：</h4><span>${detailed.bWname}</span></label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>到店日期：</h4><span class="badge badge-alert mr10 fs11"><fmt:formatDate value="${detailed.bDate}" pattern="yyyy-MM-dd"/></span></label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>套餐编号：</h4><span>${detailed.product.pId}</span> </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>套餐名：</h4><span class="badge badge-alert mr10 fs11">${detailed.product.pName}</span> </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>套餐价格：</h4><span>${detailed.product.pPrice}</span></label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>内景：</h4><span>${detailed.product.pNj}</span></label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>外景：</h4><span>${detailed.product.pWj}</span></label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>联系电话：</h4><span>${detailed.bPhone}</span></label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>联系地址：</h4><span>${detailed.user.uAddress}</span></label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon"><h4>受理状态：</h4><span class="badge badge-danger mr10 fs11">${detailed.bYduty}</span></label>
                            </div>
                            <div class="col-md-6">
                            </div>
                        </div>
                        <div class="panel-footer text-right">
                            <a href="<c:url value="/houtai/booking/acceptance?bYno=${detailed.bYno}"/>"><button class="button"> 联系成功 </button></a>
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>