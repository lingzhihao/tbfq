<%--
  Created by IntelliJ IDEA.
  User: 14375
  Date: 2019/8/10
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <title><c:url value="${sessionScope.user.uName}"/>信息</title>
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
            <div class="col-md-1"></div>
            <div class="col-md-10" style="margin-bottom: 10px">
                <div class="hy_list">
                    <div class="space_hx">&nbsp;</div>
                    <div class="xjhy">
                        <!--高级配置-->
                        <ul class="hypz gjpz clearfix">
                            <li class="clearfix">
                                <span class="title">用户名：</span>
                                <div class="li_r">${sessionScope.user.uName}</div>
                            </li>
                            <li class="clearfix">
                                <span class="title">姓名：</span>
                                <div class="li_r">${sessionScope.user.uRelname}</div>
                            </li>
                            <li class="clearfix">
                                <span class="title">联系电话：</span>
                                <div class="li_r">${sessionScope.user.uPhone}</div>
                            </li>
                            <li class="clearfix">
                                <span class="title">密码：</span>
                                <div class="li_r">*******</div>
                            </li>
                            <li class="clearfix">
                                <span class="title">性别：</span>
                                <div class="li_r">${sessionScope.user.uSex}</div>
                            </li>
                            <li class="clearfix">
                                <span class="title">地址：</span>
                                <div class="li_r">${sessionScope.user.uAddress}</div>
                            </li>
                            <li class="clearfix">
                                <span class="title">邮箱：</span>
                                <div class="li_r">
                                    ${sessionScope.user.uEmail}
                                </div>
                            </li>
<%--                            <li class="clearfix">--%>
<%--                                <span class="title">入职时间：</span>--%>
<%--                                <div class="li_r">--%>
<%--                                    <fmt:formatDate value="${OBJ.workTime}" pattern="yyyy-MM-dd hh:mm"/>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="clearfix">--%>
<%--                                <span class="title">离职时间：</span>--%>
<%--                                <div class="li_r">--%>
<%--                                    <fmt:formatDate value="${OBJ.leaveTime}" pattern="yyyy-MM-dd hh:mm"/>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                            <li class="clearfix">--%>
<%--                                <span class="title">备注：</span>--%>
<%--                                <div class="li_r">${OBJ.info}</div>--%>
<%--                            </li>--%>
                            <li class="tj_btn">
                                <div class="panel-footer text-right">
                                    <button  onclick="javascript:window.location.href='/ling/user/to_update?uName=${sessionScope.user.uName}';" type="submit" class="button"> 编辑 </button>
                                    <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
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