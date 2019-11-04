<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"/>

<script>
    function ajaxValidate() {
        var eEno=$("#eno").val();
        var map = '{"account":"' + eEno + '"}';
        $.ajax({
            type:"POST",
            url:"<c:url value='/houtai/employee/findEno'/>",//提交地址
            data:map,//提交数据
            dataType:"json",//返回json格式
            contentType:"application/json;charset=utf-8",
            success:function(data){
                if (data == 0) {//后端传来的msg的值是no,不能注册。反之。
                    $("#remind").html("<font color='red'>**此工号已存在，请重新输入**</font>");
                }if(data == 1){
                    $("#remind").html("")//如果没有被注册，将提示语清空。
                }
            }
        });
    }
</script>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 添加员工 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form:form action="/ling/houtai/employee/add" modelAttribute="employee"  id="admin-form" name="addForm">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="eno" class="field prepend-icon">
                                    <form:input path="eno" cssClass="gui-input" placeholder="工号..." onblur="ajaxValidate()"/>
                                    <span id="remind" color="red"></span>
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
                                    <form:input path="eAddress" cssClass="gui-input" placeholder="家庭住址..." />
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