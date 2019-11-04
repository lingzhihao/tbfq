<%--
  Created by IntelliJ IDEA.
  User: 14375
  Date: 2019/8/10
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
<head>
    <title>订单详情</title>
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

    <%--<link rel="stylesheet" type="text/css" href="<c:url value="/assets/skin/default_skin/css/theme.css"/>">--%>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin-tools/admin-forms/css/admin-forms.css"/>">
    <link rel="shortcut icon" href="<c:url value="/assets/img/favicon.ico"/>">

    <script src="<c:url value="/assets/admin-tools/admin-forms/js/jquery.validate.min.js"/>"></script>
    <script src="<c:url value="/assets/admin-tools/admin-forms/js/additional-methods.min.js"/>"></script>
    <script src="<c:url value="/assets/admin-tools/admin-forms/js/jquery-ui-datepicker.min.js"/>"></script>

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
                <h3>我的订单</h3>
            </div>
            <div class="col-md-1"></div>

            <div class="col-md-10" style="margin-bottom: 10px">
                <div class="panel-body pn">
                    <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
                        <thead>
                        <tr class="">
                            <th class="hidden-xs">预约编号</th>
                            <th class="hidden-xs">套餐名</th>
                            <th class="hidden-xs">套餐价格</th>
                            <th class="hidden-xs">新郎姓名</th>
                            <th class="hidden-xs">新娘姓名</th>
                            <th class="hidden-xs">到店日期</th>
                            <th class="hidden-xs">预约状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <tr class="message-unread">
                            <td>${detailed.bYno}</td>
                            <td>${detailed.product.pName}</td>
                            <td>${detailed.product.pPrice}</td>
                            <td>${detailed.bMname}</td>
                            <td>${detailed.bWname}</td>
                            <td><span class="badge badge-warning mr10 fs11"><fmt:formatDate value="${detailed.bDate}" pattern="yyyy-MM-dd"/></span></td>
                            <c:if test="${detailed.bYduty == '未联系'}">
                                <td class="hidden-xs"><span class="badge badge-danger mr10 fs11">${detailed.bYduty}</span></td>
                            </c:if>
                            <c:if test="${detailed.bYduty == '已联系'}">
                                <td class="hidden-xs"><span class="badge badge-success mr10 fs11">${detailed.bYduty}</span></td>
                            </c:if>
                            <td>
                                <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-1"></div>
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

<style>
    .ui-datepicker select.ui-datepicker-month,
    .ui-datepicker select.ui-datepicker-year {
        width: 48%;
        margin-top: 0;
        margin-bottom: 0;

        line-height: 25px;
        text-indent: 3px;

        color: #888;
        border-color: #DDD;
        background-color: #FDFDFD;

        -webkit-appearance: none; /*Optionally disable dropdown arrow*/
    }
</style>


<!-- //here ends scrolling icon -->
<jsp:include page="footer.jsp"/>