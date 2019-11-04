<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>测试表单验证</title>

        <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet" type="text/css" media="all" />
        <!-- css -->
        <link rel="stylesheet" href="<c:url value="/css/style.css"/>" type="text/css" media="all" />
        <!-- font-awesome icons -->
        <link href="<c:url value="/css/font-awesome.css"/>" rel="stylesheet">
        <!-- 字体样式 -->
        <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="<c:url value="/js/jquery-3.4.1.min.js"/> "></script>
        <script src="<c:url value="/js/bootstrap.js"/> "></script>


        <link href="<c:url value="/ceshi/bootstrapValidator.min.css"/>" rel="stylesheet">
        <script src="<c:url value="/ceshi/bootstrap.min.js"/> "></script>
        <script src="<c:url value="/ceshi/bootstrapValidator.min.js"/> "></script>
    </head>
   <%-- <script>
        $(function(){
            $('form').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid:'glyphicon glyphicon-ok',
                    invalid:'glyphicon glyphicon-remove',
                    validating:'glyphicon glyphicon-refresh'
                },
                fields: {
                    username: {
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
                            remote: {
                                url: '<c:url value="/ling/back_user"/>',
                                message: '该用户已存在，请重新输入',
                                delay: 500,
                                type: 'POST'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9_]+$/,
                                message: '用户名只能包含字母数字下划线'
                            }
                        }
                    },
                    password: {
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
                    emailTest: {
                        message:'请输入正确的邮箱号',
                        validators: {
                            regexp: {
                                regexp: /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/,
                                message: '邮箱格式不正确'
                            }
                        }
                    },
                    rpassword: {
                        message:'确认密码验证失败',
                        validators: {
                            notEmpty: {
                                message: '确认密码不能为空'
                            },
                            identical: {
                                field: 'password',
                                message: '两次输入密码不一致'
                            }
                        }
                    },
                }
            });

        });
    </script>--%>
    <script type="text/javascript">
        function ajaxValidate() {
            var username=$("#username").val();
            var map = '{"account":"' + username + '"}';
            $.ajax({
                type:"POST",
                url:"<c:url value='/ling/findUser'/>",//提交地址
                data:map,//提交数据
                dataType:"json",//返回json格式
                contentType:"application/json;charset=utf-8",
                success:function(data){
                    if (data == 0) {//后端传来的msg的值是no,不能注册。反之。
                        $("#remind").html("<font color='red'>抱歉，该用户已被注册，请更换！</font>");
                    }if(data == 1){
                        $("#remind").html("")//如果没有被注册，将提示语清空。
                    }
                }
            });
        }
    </script>

<body>
<h2>Hello World!</h2>
<form action="#"
      method="post" onsubmit="return validate();">
    <div class="login_1">
        <div class="span1">
            <label class="tn-form-lable">用户名：</label>
            <input class="tn-textbox" type="text" name="userName" id="username" onblur="ajaxValidate()"   >
            <span id="remind" color="red"></span>
        </div>
        <div class="span1">
            <label class="tn-form-lable">密码：</label>
            <input class="tn-textbox" type="text" name="password" id="password">
        </div>
    </div>

</form>
<%--
<form action="/ling/login" method="post" class="form-horizontal col-sm-offset-3" enctype="multipart/form-data">
    <br/>
    <h3>测试表单校验</h3>
    <div class="col-sm-9 col-md-9">
        <div class="form-group">
            <label>用户名</label>
            <input type="text" class="form-control required"  name="username" autofocus="autofocus"/>
        </div>
        <div class="form-group">
            <label>密码</label>
            <input type="password" class="form-control required"  name="password" />
        </div>
        <div class="form-group">
            <label>确认密码</label>
            <input type="password" class="form-control required"  name="rpassword" />
        </div>
        <div class="form-group">
            <label>邮箱</label>
            <input type="email" class="form-control required"  name="emailTest" />
        </div>
        <div class="form-group">
            <input type="submit" class="form-control required"  value="立即登陆" />
        </div>
    </div>
</form>--%>


</body>
</html>
