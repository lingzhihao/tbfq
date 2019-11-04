<%--
  Created by IntelliJ IDEA.
  User: 14375
  Date: 2019/8/10
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div >
    <!-- banner  顶部背景图片  class="banner"  -->
    <div class="header">
        <div class="container">
            <div class="header-left">
                <div class="w3layouts-logo">
                    <h1>
                        <a href="/ling/index">台北风情 <span>婚纱摄影</span></a>
                    </h1>
                </div>
            </div>
            <div class="top-nav">
                <nav class="navbar navbar-default">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="<c:url value="/ling/index"/>">主页</a></li>
                            <li><a href="<c:url value="/ling/taocan_index"/>">拍摄套餐</a></li>
                            <li><a href="<c:url value="/ling/kepian_index"/>">客户样片</a></li>
                            <li><a href="<c:url value="/ling/team"/>">团队</a></li>
                            <li><a href="<c:url value="/ling/about"/>">关于我们</a></li>
                            <c:if test="${sessionScope.user.uName == null}">
                            <li><a href="<c:url value="/ling/to_login"/>">登录</a></li>
                            </c:if>
                            <c:if test="${sessionScope.user.uName != null }">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人中心 <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="<c:url value="/ling/myself"/>">个人信息</a></li>
                                    <li><a href="<c:url value="/ling/myorder?uName=${sessionScope.user.uName}"/>">我的订单</a></li>
                                    <li><a href="<c:url value="/ling/to_change_password"/>">修改密码</a></li>
                                    <li><a href="<c:url value="/ling/quit"/>">退出登录</a></li>
                                </ul>
                            </li>
                            </c:if>
                        </ul>
                        <div class="clearfix"> </div>
                    </div>
                </nav>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
