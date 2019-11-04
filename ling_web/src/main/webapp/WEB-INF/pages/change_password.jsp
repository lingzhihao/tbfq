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
    <title>修改密码</title>
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
                old: {
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
                new1: {
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
                new2: {
                    message:'确认密码验证失败',
                    validators: {
                        notEmpty: {
                            message: '确认密码不能为空'
                        },
                        identical: {
                            field: 'new1',
                            message: '两次输入密码不一致'
                        }
                    }
                },
            }
        });
    });
</script>


</head>
<body>
<!-- banner -->
<jsp:include page="top.jsp"/>
<!--拍摄套餐-->
<div class="posts">
    <div class="container panel panel-danger" >
        <div class="w3-agileits-heading " >
            <h3>修改密码</h3>
        </div>
        <div class="col-md-2"></div>
        <div class="col-md-8" style="margin-top: 20px">
            <div class="panel heading-border" >
                <form action="<c:url value="/ling/change_password"/>" method="post" class="form-horizontal col-sm-offset-3" enctype="multipart/form-data">
                    <div class="col-sm-9 col-md-9">
                        <div class="form-group">
                            <label>原始密码</label>
                            <input type="password" class="form-control required"  name="old" autofocus="autofocus"/>
                        </div>
                        <div class="form-group">
                            <label>新密码</label>
                            <input type="password" class="form-control required"  name="new1" />
                        </div>
                        <div class="form-group">
                            <label>确认密码</label>
                            <input type="password" class="form-control required"  name="new2" />
                        </div>
                        <div class="form-group">
                            <input type="submit" class="form-control required"  value="修改" />
                        </div>
                    </div>
                </form>
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