<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 个人信息 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <div class="panel-body bg-light">
                    <div class="section-divider mt20 mb40">
                        <span> 基本信息 </span>
                    </div>
                    <div class="section row">
                        <div class="col-md-2">工号</div>
                        <div class="col-md-4">${sessionScope.employee.eno}</div>
                        <div class="col-md-2">姓名</div>
                        <div class="col-md-4">${sessionScope.employee.eName}</div>
                    </div>
                    <div class="section row">
                        <div class="col-md-2">性别</div>
                        <div class="col-md-4">${sessionScope.employee.eSex}</div>
                        <div class="col-md-2">年龄</div>
                        <div class="col-md-4">${sessionScope.employee.eAge}</div>
                    </div>
                    <div class="section row">
                        <div class="col-md-2">家庭住址</div>
                        <div class="col-md-4">${sessionScope.employee.eAddress}</div>
                        <div class="col-md-2">联系电话</div>
                        <div class="col-md-4">${sessionScope.employee.ePhone}</div>
                    </div>
<%--                    <div class="panel-footer text-right">--%>
<%--                        <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>