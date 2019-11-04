<%--
  Created by IntelliJ IDEA.
  User: 14375
  Date: 2019/8/10
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
    <title>修改个人信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- bootstrap-css -->
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet" type="text/css" media="all" />
    <!--// bootstrap-css -->
    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>" type="text/css" media="all" />
    <!--// css -->
    <!-- font-awesome icons -->
    <link href="<c:url value="/css/font-awesome.css"/>" rel="stylesheet">
    <!-- //font-awesome icons -->

    <link rel="stylesheet" type="text/css" href="<c:url value="/css/myself/reset.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/myself/common.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/myself/thems.css"/>">


    <script src="<c:url value="/js/jquery-1.11.1.min.js"/> "></script>
    <script src="<c:url value="/js/bootstrap.js"/> "></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <style type="text/css">
        .biankuang{
            border: 1px solid gainsboro;
        }
        .bianju{
            margin-top: 10px;
        }
    </style>
    <script type="text/javascript">
        $(function(){
            $('.sidenav li').click(function(){
                $(this).siblings('li').removeClass('now');
                $(this).addClass('now');
            });

            $('.erji li').click(function(){
                $(this).siblings('li').removeClass('now_li');
                $(this).addClass('now_li');
            });

            var main_h = $(window).height();
            $('.sidenav').css('height',main_h+'px');
        })
    </script>
</head>
<body>
<!-- banner -->
<jsp:include page="top.jsp"/>
<!--拍摄套餐-->
<div class="posts">
    <div class="container panel panel-danger">
            <div class="w3-agileits-heading " style="margin-top: 10px">
                <h3>个人信息</h3>
            </div>
            <div class="col-md-2"></div>
            <div class="col-md-8" style="margin-bottom: 10px">
                <div class="hy_list">
                    <div class="space_hx">&nbsp;</div>
                    <form:form action="/ling/ling/update" modelAttribute="user"  id="admin-form" name="updateform">

                        <div class="section row">
                                <div class="col-md-12 bianju" >
                                    <span class="title">用户：</span>
                                     <form:input path="uName" cssClass="gui-input"  readonly="true" />
                                </div>

                                <div class="col-md-12 bianju" >
                                    <span class="title">姓名：</span>
                                    <form:input path="uRelname" cssClass="gui-input"   />

<%--                                    <input type="text" id="uRelname" name="uRelname" class="gui-input"  value="${sessionScope.user.uRelname}" >--%>
                                </div>

                            <div class="col-md-12 bianju">
                                    <span class="title">电话：</span>
                                <form:input path="uPhone" cssClass="gui-input"   />

<%--                                <input type="text" id="uPhone" name="uPhone" class="gui-input"  value="${sessionScope.user.uPhone}" >--%>
                                </div>

<%--                            <div class="col-md-12 bianju">--%>
<%--                                    <span class="title">密码：</span>--%>
                                <form:hidden path="uPassword"  cssClass="gui-input"  readonly="true" />

<%--                                <input type="password" id="uPassword" name="uPassword" class="gui-input"  value="${sessionScope.user.uPassword}" readonly>--%>
<%--                                </div>--%>

                            <div class="col-md-12 bianju">
                                    <span class="title">性别：</span>
                                <form:input path="uSex" cssClass="gui-input"   />

<%--                                <input type="text" id="uSex" name="uSex" class="gui-input"  value="${sessionScope.user.uSex}" >--%>
                                </div>

                            <div class="col-md-12 bianju">
                                    <span class="title">地址：</span>
                                <form:input path="uAddress" cssClass="gui-input"  />

<%--                                <input type="text" id="uAddress" name="uAddress" class="gui-input"  value="${sessionScope.user.uAddress}" >--%>
                                </div>

                            <div class="col-md-12 bianju">
                            <span class="title">邮箱：</span>
                                <form:input path="uEmail" cssClass="gui-input"   />
<%--                                <input type="text" id="uEmail" name="uEmail" class="gui-input"  value=" ${sessionScope.user.uEmail}" >--%>
                            </div>

                            <div class="col-md-12 bianju">
                                <div class="panel-footer text-right">
                                    <button type="submit" class="button"> 编辑 </button>
                                    <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</div>


</body>
<!-- footer -->
<script src="<c:url value="/js/responsiveslides.min.js"/> "></script>
<script src="<c:url value="/js/jarallax.js"/> "></script>
<script src="<c:url value="/js/SmoothScroll.min.js"/> "></script>
<script type="text/javascript">
    /* init Jarallax */
    $('.jarallax').jarallax({
        speed: 0.5,
        imgWidth: 1366,
        imgHeight: 768
    })
</script>
<script type="text/javascript" src="<c:url value="/js/move-top.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/easing.js"/> "></script>
<!-- here stars scrolling icon -->
<script type="text/javascript">
    $(document).ready(function() {
        $().UItoTop({ easingType: 'easeOutQuart' });
    });
</script>
<!-- //here ends scrolling icon -->
<jsp:include page="footer.jsp"/>