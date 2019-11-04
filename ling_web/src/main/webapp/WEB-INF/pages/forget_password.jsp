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
    <title>忘记密码</title>
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
</head>
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
                uName: {
                    message:'用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 15,
                            message: '用户名长度在6~15位之间'
                        },
                        threshold:6,
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '用户名只能包含字母数字下划线'
                        }
                    }
                },
                uPassword: {
                    message:'密码验证失败',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 15,
                            message: '密码长度在6~12位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '密码只能包含字母数字下划线'
                        }
                    }
                },
                uPhone: {
                    message:'电话验证失败',
                    validators: {
                        notEmpty: {
                            message: '电话不能为空'
                        },
                        stringLength: {
                            min: 11,
                            max: 11,
                            message: '电话长度为11位'
                        },
                        regexp: {
                            regexp: /^[0-9_]+$/,
                            message: '电话只能是数字'
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
    <div class="row" style="height: 585px;">
        <div class="col-md-2"></div>
        <div class="col-md-8"
             style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
            <font>找回密码</font>USER REGISTER
            <form action="<c:url value="/ling/forget_password"/>" method="post" class="form-horizontal" style="margin-top: 5px;">
                <div class="form-group">
                    <label style="color:red;text-align: left;" class="col-sm-6 control-label">&nbsp;&nbsp;${sessionScope.forget}</label>
                </div>
                <div class="form-group">
                    <label for="uName" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-6">

                        <input type="text" class="form-control" id="uName" name="uName"
                               placeholder="请输入用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="uPhone" class="col-sm-2 control-label">电话</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="uPhone" name="uPhone"
                               placeholder="请输入电话号码" maxlength="11">
                    </div>
                </div>
                <div class="form-group">
                    <label for="uPassword" class="col-sm-2 control-label">新密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="uPassword" name="uPassword"
                               placeholder="请输入新的密码">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" width="100"
                               style="background: url('<c:url value="/images/register.gif"/>') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">确定</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-2"></div>

    </div>
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
