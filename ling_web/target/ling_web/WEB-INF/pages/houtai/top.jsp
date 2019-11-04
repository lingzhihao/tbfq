<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from admindesigns.com/demos/absolute/1.1/admin_forms-validation.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 06 Aug 2015 02:56:15 GMT -->
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">

    <title> 台北风情婚纱摄影后台管理系统 </title>

    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/skin/default_skin/css/theme.css"/>">

    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin-tools/admin-forms/css/admin-forms.css"/>">
    <link rel="shortcut icon" href="<c:url value="/assets/img/favicon.ico"/>">


    <script type="text/javascript" src="<c:url value="/js/jquery-3.4.1.min.js"/> "></script>
    <link href="<c:url value="/ceshi/bootstrapValidator.min.css"/>" rel="stylesheet">
    <script  src="<c:url value="/ceshi/bootstrapValidator.min.js"/>"></script>
    <script  src="<c:url value="/js/jquery.validate.min.js"/> "></script>
    <script  src="<c:url value="/js/messages_zh.min.js"/> "></script>

</head>

<body class="admin-validation-page" data-spy="scroll" data-target="#nav-spy" data-offset="200">
<div id="main">
    <header class="navbar navbar-fixed-top navbar-shadow">
        <div class="navbar-branding">
            <a class="navbar-brand" href="<c:url value="/ling/index"/> ">
                <b>台北风情婚纱摄影后台管理系统</b>
            </a>
            <span id="toggle_sidemenu_l" class="ad ad-lines"></span>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown menu-merge">
                <a href="#" class="dropdown-toggle fw600 p15" data-toggle="dropdown">
                    <img src="<c:url value="/assets/img/avatars/5.jpg"/>" alt="avatar" class="mw30 br64">
                    <span class="hidden-xs pl15">${sessionScope.employee.eName} </span>
                    <span class="caret caret-tp hidden-xs"></span>
                </a>
                <ul class="dropdown-menu list-group dropdown-persist w250" role="menu">
                    <li class="list-group-item">
                        <a href="<c:url value="/houtai/self"/>" class="animated animated-short fadeInUp">
                            <span class="fa fa-user"></span> 个人信息
                            <span class="label label-warning"></span>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="<c:url value="/houtai/to_change_password"/>" class="animated animated-short fadeInUp">
                            <span class="fa fa-gear"></span> 设置密码 </a>
                    </li>
                    <li class="dropdown-footer">
                        <a href="<c:url value="/houtai/quit"/>" class="">
                            <span class="fa fa-power-off pr5"></span> 退出 </a>
                    </li>
                </ul>
            </li>
        </ul>
    </header>
    <aside id="sidebar_left" class="nano nano-light affix">
        <div class="sidebar-left-content nano-content">
            <ul class="nav sidebar-menu">
                <li class="sidebar-label pt20">订单管理</li>
                <li>
                    <a href="<c:url value="/houtai/booking/list"/> ">
                        <span class="glyphicon glyphicon-book"></span>
                        <span class="sidebar-title">待处理预订单</span>
                        <span class="sidebar-title-tray">
                <span class="label label-xs bg-primary">New</span>
              </span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value="/houtai/booking/processed_list"/> ">
                        <span class="fa fa-calendar"></span>
                        <span class="sidebar-title">已处理预订单</span>
                    </a>
                </li>
                <li class="sidebar-label pt15">基础信息管理</li>
                <c:if test="${sessionScope.employee.eno == 'E001'}">
                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="glyphicon glyphicon-check"></span>
                        <span class="sidebar-title">员工管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li>
                            <a href="<c:url value="/houtai/employee/list"/>">
                                <span class="glyphicon glyphicon-calendar"></span> 所有员工 </a>
                        </li>
                        <li class="active">
                            <a href="<c:url value="/houtai/employee/to_add"/>">
                                <span class="glyphicon glyphicon-check"></span> 添加员工 </a>
                        </li>
                    </ul>
                </li>
                </c:if>
                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="fa fa-columns"></span>
                        <span class="sidebar-title">摄影师管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li>
                            <a href="<c:url value="/houtai/photographer/list"/>">
                                <span class="glyphicon glyphicon-calendar"></span> 摄影师列表 </a>
                        </li>
                        <li class="active">
                            <a href="<c:url value="/houtai/photographer/to_add"/>">
                                <span class="glyphicon glyphicon-check"></span> 添加摄影师 </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="fa fa-apple"></span>
                        <span class="sidebar-title">婚纱拍摄套餐管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li>
                            <a href="<c:url value="/houtai/product/list"/>">
                                <span class="glyphicon glyphicon-calendar"></span> 拍摄套餐列表 </a>
                        </li>
                        <li >
                            <a href="<c:url value="/houtai/product/to_add"/>">
                                <span class="glyphicon glyphicon-check"></span> 添加拍摄套餐 </a>
                        </li>
                        <li >
                            <a href="<c:url value="/houtai/productImg/list"/>">
                                <span class="glyphicon glyphicon-calendar"></span> 套餐图片列表 </a>
                        </li>
                        <li >
                            <a href="<c:url value="/houtai/productImg/to_add"/>">
                                <span class="glyphicon glyphicon-check"></span> 添加套餐图片 </a>
                        </li>
                        <li >
                            <a href="<c:url value="/houtai/productLunBo/list"/>">
                                <span class="glyphicon glyphicon-calendar"></span> 套餐轮播图片列表 </a>
                        </li>
                        <li >
                            <a href="<c:url value="/houtai/productLunBo/to_add"/>">
                                <span class="glyphicon glyphicon-check"></span> 添加套餐轮播图片 </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </aside>
    <section id="content_wrapper">