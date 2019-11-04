<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"/>



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
<section id="content" class="table-layout animated fadeIn">


    <div class="tray tray-center">
        <div class="content-header">
            <h2> 修改密码 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form method="post" action="<c:url value="/houtai/change_password"/> " id="admin-form">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
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
                                <button type="submit" class="button"> 修改 </button>
                                <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>
