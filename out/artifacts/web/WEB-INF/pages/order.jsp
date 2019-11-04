<%--
  Created by IntelliJ IDEA.
  User: 14375
  Date: 2019/8/30
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<c:url value="/css/login/bootstrap.min.css"/>" type="text/css" rel="stylesheet">
    <link href="<c:url value="/css/login/font-awesome.min.css"/>" type="text/javascript" rel="stylesheet">

    <link href="<c:url value="/css/login/bootsnav.css"/>" type="text/css" rel="stylesheet">
    <link href="<c:url value="/css/login/normalize.css"/>"type="text/css" rel="stylesheet">
    <link href="<c:url value="/css/login/css.css"/>" rel="stylesheet" type="text/css">
    <script src="<c:url value="/js/jquery-1.11.1.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/bootsnav.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.js"/>" type="text/javascript"></script>
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
    <script src="<c:url value="/js/WdatePicker.js"/>" type="text/javascript"></script>

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
    <title>预约订单</title>
    <style>
        body {
            margin-top: 20px;
            margin: 0 auto;
        }

        .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }

        font {
            color: #3164af;
            font-size: 18px;
            font-weight: normal;
            padding: 0 10px;
        }
    </style>

    <link href="<c:url value="/ceshi/bootstrapValidator.min.css"/>" rel="stylesheet">
    <script type="text/javascript" src="<c:url value="/ceshi/bootstrapValidator.min.js"/> "></script>
<script>
    $(function(){
        $('form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid:'glyphicon glyphicon-ok',
                invalid:'glyphicon glyphicon-remove',
                validating:'glyphicon glyphicon-refresh'
            },
            fields: {
                bMname: {
                    message:'新郎姓名验证失败',
                    validators: {
                        notEmpty: {
                            message: '新郎姓名不能为空'
                        },
                    }
                },
                bWname: {
                    message:'新娘姓名验证失败',
                    validators: {
                        notEmpty: {
                            message: '新娘姓名不能为空'
                        },
                    }
                },
                bPhone: {
                    message:'联系电话验证失败',
                    validators: {
                        notEmpty: {
                            message: '联系电话不能为空'
                        },
                        stringLength: {
                            min: 11,
                            max: 11,
                            message: '联系电话为11位'
                        },
                        regexp: {
                            regexp: /^[0-9_]+$/,
                            message: '联系电话只能数字'
                        }
                    }
                },
            }
        });

    });
</script>
</head>
<body>

<!-- 引入header.jsp -->
<jsp:include page="top.jsp"></jsp:include>

<div class="container"
     style="width: 100%; background: url('/images/regist_bg.jpg');">
    <div style="height: 30px;">&nbsp;</div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8"
             style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
            <font>优惠订购</font>
            <form action="<c:url value="/ling/add_order"/>" method="post" class="form-horizontal" style="margin-top: 5px;">
                <!-- //预约编号隐藏-->
                <div class="form-group" style="display: none">
                    <label for="yuyuebianhao" class="col-sm-2 control-label">预约编号</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="yuyuebianhao" name="bYno">
                    </div>
                </div>
                <!-- 用户名-->
                <div class="form-group" style="display: none">
                    <label for="username" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="username" name="uName" value="${sessionScope.user.uName}">
                    </div>
                </div>
                <!-- 套餐ID-->
                <div class="form-group" style="display: none">
                    <label for="taocan" class="col-sm-2 control-label">套餐ID</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control"  name="pId" value="<c:url value="${product.pId}"/>" readonly>
                    </div>
                </div>
                <!-- 套餐名-->
                <div class="form-group" >
                    <label for="taocan" class="col-sm-2 control-label">套餐名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="taocan"  value="<c:url value="${product.pName}"/>" readonly>
                    </div>
                </div>
                <!-- 新郎姓名-->
                <div class="form-group">
                    <label for="man" class="col-sm-2 control-label">新郎</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="man" name="bMname"
                               placeholder="请输入新郎姓名">
                    </div>
                </div>
                <!-- 新郎姓名-->
                <div class="form-group">
                    <label for="woman" class="col-sm-2 control-label">新娘</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="woman" name="bWname"
                               placeholder="请输入新娘姓名">
                    </div>
                </div>
                <!--到店日期-->
                <div class="form-group">
                    <label class="col-sm-2 control-label">到店日期</label>
                    <div class="col-sm-6">
                        <input  class="form-control" name="bDate" id="putawayDate"
                                 type="date" class="Wdate"
                              >
                    </div>
                </div>
                <!-- 联系电话-->
                <div class="form-group">
                    <label for="man" class="col-sm-2 control-label">联系电话</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="bPhone" name="bPhone"
                               placeholder="请输入你的联系电话">
                    </div>
                </div>
                <!--价格-->
                <div class="form-group">
                    <label  class="col-sm-2 control-label">价格</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control"  value="<c:url value="${product.pPrice}"/> " readonly>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" width="100" value="提交"
                               style="background: url('/images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-2"></div>

    </div>
    <div style="height: 30px;">&nbsp;</div>
</div>

<jsp:include page="footer.jsp"/>
</script><script src="<c:url value="/js/responsiveslides.min.js"/> "></script>
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
