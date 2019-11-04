<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 编辑摄影师 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form:form action="/ling/houtai/photographer/update" modelAttribute="photographer"  id="admin-form" name="updateform">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 编辑摄影师 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="sSno" class="field prepend-icon">
                                    <form:input path="sSno" cssClass="gui-input" placeholder="摄影师编号..." readonly="true" />
                                    <label for="sSno" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="sName" class="field prepend-icon">
                                    <form:input path="sName" class="gui-input" placeholder="姓名..."/>
                                    <label for="sName" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="sSex" class="field prepend-icon">
                                    <form:input path="sSex" cssClass="gui-input" placeholder="性别..." />
                                    <label for="sSex" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="sAge" class="field prepend-icon">
                                    <form:input path="sAge" class="gui-input" placeholder="年龄..."/>
                                    <label for="sAge" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="sAge" class="field prepend-icon">
                                <form:input path="sPhone" items="${plist}" cssClass="gui-input" placeholder="电话..."/>
                                    <i class="arrow double"></i>
                                </label>
                            </div>
                        </div>
                        <div class="panel-footer text-right">
                            <button type="submit" class="button"> 保存 </button>
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>