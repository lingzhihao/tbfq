<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 编辑员工信息 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form:form action="/houtai/employee/update" modelAttribute="employee"  id="admin-form" name="addForm">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="eno" class="field prepend-icon">
                                    <form:input path="eno" cssClass="gui-input" placeholder="工号..."  />
                                    <label for="eno" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="eName" class="field prepend-icon">
                                    <form:input path="eName" class="gui-input" placeholder="姓名..."/>
                                    <label for="eName" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="eSex" class="field prepend-icon">
                                    <form:input path="eSex" cssClass="gui-input" placeholder="性别..." />
                                    <label for="eSex" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="eAge" class="field prepend-icon">
                                    <form:input path="eAge" class="gui-input" placeholder="年龄..."/>
                                    <label for="eAge" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <form:hidden path="ePassword"/>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="eAddress" class="field prepend-icon">
                                    <form:input path="eAddress" cssClass="gui-input" placeholder="家庭住址..."  />
                                    <label for="eAddress" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="ePhone" class="field prepend-icon">
                                    <form:input path="ePhone" class="gui-input" placeholder="联系电话..."/>
                                    <label for="ePhone" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
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