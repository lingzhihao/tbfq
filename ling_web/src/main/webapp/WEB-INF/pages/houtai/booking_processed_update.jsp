<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 修改已处理订单 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form action="<c:url value="/houtai/booking/update?bYno=${booking.bYno}"/>"   method="post" >
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 修改订单 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <label  class="field prepend-icon"><h4>预约订单号：</h4><span class="badge badge-warning mr10 fs11">&nbsp;&nbsp;${booking.bYno}&nbsp;&nbsp;</span></label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <label  class="field prepend-icon"> <h4>预约用户：</h4><span>${booking.uName}</span> </label>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>新郎名字：</h4><input type="text" name="bMname" class="gui-input" value="${booking.bMname}" maxlength="5">
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>新娘名字：</h4><input type="text" name="bWname" class="gui-input" value="${booking.bWname}" maxlength="5">
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>到店日期：</h4><input type="date" name="bDate" class="gui-input" value="<fmt:formatDate value="${booking.bDate}" pattern="yyyy-MM-dd" />" >
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>套餐编号：</h4>
                                    <select class="gui-input"  name="pId">
                                        <option value="${booking.product.pId}" selected>${booking.product.pName}</option>
                                        <c:forEach items="${product}" var="pro">
                                        <option value="${pro.pId}">${pro.pName}</option>
                                    </c:forEach>
                                    </select>
                                </label>
                            </div>
                        </div>
                        <div class="panel-footer text-right">
                            <input type="submit" class="button" value="提交">
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>