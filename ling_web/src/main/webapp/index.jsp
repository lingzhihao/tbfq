<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>测试表单验证</title>
        <link href="<c:url value="/ceshi/bootstrap.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/ceshi/bootstrapValidator.min.css"/>" rel="stylesheet">
        <script type="text/javascript" src="<c:url value="/ceshi/jquery-1.11.1.min.js"/> "></script>
        <script type="text/javascript" src="<c:url value="/ceshi/bootstrap.min.js"/> "></script>
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
                                url: '/OnlineMusic/user/checkUserExist.do',
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
    </script>
<body>
<h2>Hello World!</h2>

<form action="#" method="post" class="form-horizontal col-sm-offset-3" enctype="multipart/form-data">
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
            <input type="submit" class="form-control required"  value="立即登陆" />
        </div>
    </div>
</form>
</body>
</html>
