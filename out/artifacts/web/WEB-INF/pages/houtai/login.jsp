<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>欢迎使用爱慕课OA</title>
    <meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme" />
    <meta name="description" content="AbsoluteAdmin - A Responsive HTML5 Admin UI Framework">
    <meta name="author" content="AbsoluteAdmin">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/skin/default_skin/css/theme.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin-tools/admin-forms/css/admin-forms.css"/>">
    <link rel="shortcut icon" href="<c:url value="/assets/img/favicon.ico"/>">


    <link href="<c:url value="/ceshi/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/ceshi/bootstrapValidator.min.css"/>" rel="stylesheet">
    <script type="text/javascript" src="<c:url value="/ceshi/jquery-1.11.1.min.js"/> "></script>
    <script type="text/javascript" src="<c:url value="/ceshi/bootstrap.min.js"/> "></script>
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
                    eno: {
                        message:'工号验证失败',
                        validators: {
                            notEmpty: {
                                message: '工号不能为空'
                            },
                            stringLength: {
                                min: 4,
                                max: 6,
                                message: '工号长度在4~6位之间'
                            },
                            threshold:4,
                            regexp: {
                                regexp: /^[a-zA-Z0-9_]+$/,
                                message: '工号只能包含字母数字下划线'
                            }
                        }
                    },
                    ePassword: {
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
                    }
                }
            });
        });
    </script>
</head>
<body class="external-page external-alt sb-l-c sb-r-c">
<div id="main" class="animated fadeIn">
    <section id="content_wrapper">
        <section id="content">
            <div class="admin-form theme-info mw500" id="login">
                <div class="content-header">
                    <h1>台北风情</h1>
                    <p class="lead">婚纱摄影管理系统</p>
                </div>
                <div class="panel mt30 mb25">
                    <form method="post" action="<c:url value="/houtai/login"/>" id="contact" >
                        <div class="panel-body bg-light p25 pb15">
                            <div class="form-group section">
                                    <label for="eno" class="field-label text-muted fs18 mb10">工号</label>
                                    <label for="eno" class="field prepend-icon">
                                        <input type="text" name="eno" id="eno" class="form-control gui-input" placeholder="请输入工号...">
                                        <label for="eno" class="field-icon">
                                            <i class="fa fa-user"></i>
                                        </label>
                                    </label>
                            </div>
                            <div class="form-group section">
                                    <label for="ePassword" class="field-label text-muted fs18 mb10">密码</label>
                                    <label for="ePassword" class="field prepend-icon">
                                        <input type="password" name="ePassword" id="ePassword" class="form-control gui-input" placeholder="请输入密码...">
                                        <label for="ePassword" class="field-icon">
                                            <i class="fa fa-lock"></i>
                                        </label>
                                    </label>
                            </div>
                        </div>
                        <c:if test="${sessionScope.employeeLogin != null}">
                        <div class="form-group section">
                            <label for="ePassword" class="field-label text-muted fs18 mb10" style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:url value="${sessionScope.employeeLogin}"/></label>
                        </div>
                        </c:if>
                        <div class="form-group panel-footer clearfix" style="margin-bottom: 0px;">
                            <button type="submit" class="button btn-primary mr10 pull-right">登陆</button>
                            <label class="switch ib switch-primary mt10">
                                <input type="checkbox" name="remember" id="remember" checked="true">
                                <label for="remember" data-on="是" data-off="否"></label>
                                <span>记住我</span>
                            </label>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </section>
</div>
<%--<script src="<c:url value="/vendor/jquery/jquery-1.11.1.min.js"/>"></script>
<script src="<c:url value="/vendor/jquery/jquery_ui/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/assets/js/utility/utility.js"/>"></script>
<script src="<c:url value="/assets/js/demo/demo.js"/>"></script>
<script src="<c:url value="/assets/js/main.js"/>"></script>--%>
</body>
</html>
