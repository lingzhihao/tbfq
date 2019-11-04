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
    <script src="<c:url value="/js/jquery-1.11.3.min.js"/>" type="text/javascript"></script>



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
    <!-- font -->
    <%--    <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>--%>
    <%--    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>--%>
    <!-- //font -->
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

    <!--表单验证-->
    <link href="<c:url value="/ceshi/bootstrapValidator.min.css"/>" rel="stylesheet">
<%--    <script type="text/javascript" src="<c:url value="/ceshi/bootstrap.min.js"/> "></script>--%>
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
                    u_name: {
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
                    u_password: {
                        message:'密码验证失败',
                        validators: {
                            notEmpty: {
                                message: '密码不能为空'
                            },
                            stringLength: {
                                min: 6,
                                max: 15,
                                message: '密码长度在6~15位之间'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9_]+$/,
                                message: '密码只能包含字母数字下划线'
                            }
                        }
                    }
                }
            });
        });
    </script>



<%--    <!--[if IE]><script src="/static/js/html5.js"></script><![endif]-->--%>
    <title>登录</title>
</head>

<body class="logobg_style">

<jsp:include page="top.jsp"/>

<div id="large-header" class="large-header login-page">
    <canvas id="demo-canvas" width="1590" height="600"></canvas>
    <div class="login-form">
        <div class="login-content">
            <h1 class="title_name">账户登录</h1>
            <form method="post" action="<c:url value="/ling/login"/>" role="form" id="registForm" class="login_padding">
                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="icon_user"></i>
                        </div>
                        <input type="text" class="form-control" name="u_name" id="u_name" placeholder="用户名" >
                    </div>
                </div>
                <div class="form-group clearfix">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="icon_password"></i>
                        </div>
                        <input type="password" class="form-control" name="u_password" id="u_password" placeholder="密码" >
                    </div>
                </div>
                <c:if test="${sessionScope.userLogin != null}">
                <div class="tishi"><label style="color: red"><c:url value="${sessionScope.userLogin}"/></label> </div>
                </c:if>
                <div class="form-group">
                    <button  type="submit" class="btn btn-danger btn-block btn-login" >
                        <i class="fa fa-sign-in"></i>
                        登录
                    </button>
                </div>
                <div class=" textleft">
                    <a href="<c:url value="/ling/to_forget"/> " class="forget">忘记密码？</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="<c:url value="/ling/to_register"/>" class="forget">立即注册</a></div>
                <div class=" textright"></div>
            </div>
            </form>
        </div>

    </div>
</div>

<jsp:include page="footer.jsp"/>
<script src="<c:url value="/js/tweenlite.min.js"/>"></script>
<script src="<c:url value="/js/easepack.min.js"/>"></script>
<script src="<c:url value="/js/raf.js"/>"></script>
<script src="<c:url value="/js/demo-1.js"/>">


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
