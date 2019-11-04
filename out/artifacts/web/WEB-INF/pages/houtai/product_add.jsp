<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"/>


<script>
    window.onload = function (ev) {
            //选择图片 并显示
            var thumbnail = document.getElementById("pImg");//file
            var selectImg = document.getElementById("image");//img
            thumbnail.addEventListener("change", function () {
                // if ($('#thumbnail')[0].files[0].size > imgSize) {
                //     // toastr.warning("图片最大为4M");
                //     return;
                // }
                var reader = new FileReader();
                reader.readAsDataURL(thumbnail.files[0]);//发起异步请求
                reader.onload = function () {
                    //读取完成后，将结果赋值给img的src
                    selectImg.src = this.result;
                    //console.log(this.result)
                }
            });

        }

    function ajaxValidate() {
        var pid=$("#pId").val();
        var map = '{"account":"' + pid + '"}';
        $.ajax({
            type:"POST",
            url:"<c:url value='/houtai/product/findPid'/>",//提交地址
            data:map,//提交数据
            dataType:"json",//返回json格式
            contentType:"application/json;charset=utf-8",
            success:function(data){
                if (data == 0) {//后端传来的msg的值是no,不能注册。反之。
                    $("#remind").html("<font color='red'>**此套餐ID已存在存在，请重新输入**</font>");
                }if(data == 1){
                    $("#remind").html("")//如果没有被注册，将提示语清空。
                }
            }
        });

    }
   /* $("#adForm").validate({
        rules:{
            pId:"required",
            pPrice:"required",
            pName:"required",
            pNj:"maxlength(49)"
        },
        messages:{
            pId:"请输入套餐编号",
            pPrice:"请输入套餐价格",
            pName:"请输入套餐名",
            pNj:"最大值为49",
        }
    });*/
</script>

<%--<script>
    $(function(){
        $('form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid:'glyphicon glyphicon-ok',
                invalid:'glyphicon glyphicon-remove',
                validating:'glyphicon glyphicon-refresh'
            },
            fields: {
                pId: {
                    message:'套餐编号验证失败',
                    validators: {
                        notEmpty: {
                            message: '套餐编号不能为空'
                        },
                        stringLength: {
                            min: 4,
                            max: 6,
                            message: '套餐编号长度在4~6位之间'
                        },
                        threshold:4,
                        regexp: {
                            regexp: /^[a-zA-Z0-9]+$/,
                            message: '套餐编号只能包含字母数字'
                        }
                    }
                },
                pPrice: {
                    message:'套餐价格验证失败',
                    validators: {
                        notEmpty: {
                            message: '套餐价格不能为空'
                        }
                    }
                },
                pName: {
                    message:'套餐名验证失败',
                    validators: {
                        notEmpty: {
                            message: '套餐名不能为空'
                        }
                    }
                },
            }
        });

    });
</script>--%>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 添加拍摄套餐 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form action="<c:url value="/houtai/product/add"/>"   id="adForm" method="post" enctype="multipart/form-data">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 套餐详细信息 </span>
                        </div>
                        <div class="section row">
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>套餐编号：</h4><input type="text" name="pId" id="pId" class="form-control gui-input" maxlength="10" onblur="ajaxValidate()" required >
                                </label>
                                <span id="remind" color="red"></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>套餐价格：</h4><input type="text" name="pPrice" class="form-control gui-input" maxlength="10" required>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>套餐名：</h4><input type="text" name="pName" class="form-control gui-input" maxlength="30" required>
                                </label>
                            </div>
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>内景：</h4><input type="text" name="pNj" class="form-control gui-input"  maxlength="50" >
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>外景：</h4><input type="text" name="pWj" class="form-control gui-input" maxlength="50" >
                                </label>
                            </div>
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>拍摄数量：</h4><input type="text" name="pPssl" class="form-control gui-input" maxlength="50" >
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>底片：</h4><input type="text" name="pDp" class="form-control gui-input" maxlength="50">
                                </label>
                            </div>
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>服务人员：</h4><input type="text" name="pFwry" class="form-control gui-input" maxlength="70" >
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>服务时间：</h4><input type="text" name="pFwsj" class="form-control gui-input" maxlength="50" >
                                </label>
                            </div>
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>造型套数：</h4><input type="text" name="pZxts" class="form-control gui-input" maxlength="50" >
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>化妆用品：</h4><input type="text" name="pHzyp" class="form-control gui-input"  maxlength="50">
                                </label>
                            </div>
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>拍摄道具：</h4><input type="text" name="pPsdj" class="form-control gui-input"  maxlength="50">
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>相册：</h4><input type="text" name="pXc" class="form-control gui-input"  maxlength="70">
                                </label>
                            </div>
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>相框：</h4><input type="text"  name="pXk"class="form-control gui-input" maxlength="50" >
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>摆台：</h4><input type="text" name="pBt" class="form-control gui-input" maxlength="50" >
                                </label>
                            </div>
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>展架：</h4><input type="text" name="pZj" class="form-control gui-input" maxlength="505" >
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>赠送商品：</h4><input type="text"name="pZssp" class="form-control gui-input" maxlength="50" >
                                </label>
                            </div>
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4> 封面图片：</h4>
                                    <img src="<c:url value="/images/addImage.png"/>" width="70px" height="70px" id="image" style="margin-bottom: 3px;"></label>
                                    <label class="button">
                                    <input type="file" name="header" id="pImg" class="form-control" style="display: none"  path="multipartFile" >选择图片</input>
                                    </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>套餐图片：</h4>
                                    <select class="form-control gui-input"  name="productImgGno">
                                        <c:forEach items="${product_img_add}" var="product_img">
                                            <option value="${product_img.gGno}">${product_img.gName}</option>
                                        </c:forEach>
                                    </select>
                                </label>
                            </div>
                            <div class="form-group col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>套餐图片：</h4>
                                    <select class="form-control gui-input"  name="productLunBoLno">
                                        <c:forEach items="${product_lunbo}" var="productLunBo">
                                            <option value="${productLunBo.lLno}">${productLunBo.lName}</option>
                                        </c:forEach>
                                    </select>
                                </label>
                            </div>
                        </div>

                        <div class="form-group panel-footer text-right">
                           <button type="submit" class="button"> 添加 </button></a>
                           <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>