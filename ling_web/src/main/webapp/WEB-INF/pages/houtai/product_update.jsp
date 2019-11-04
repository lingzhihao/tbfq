<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</script>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 编辑套餐信息 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form action="<c:url value="/houtai/product/update"/>"   method="post" enctype="multipart/form-data">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 编辑套餐信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>套餐编号：</h4><input type="text" name="pId" class="gui-input" readonly value="${product.pId}" maxlength="10" required>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>套餐价格：</h4><input type="text" name="pPrice" class="gui-input" value="${product.pPrice}"maxlength="10" required>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>套餐名：</h4><input type="text" name="pName" class="gui-input" value="${product.pName}" maxlength="30"required>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>内景：</h4><input type="text" name="pNj" class="gui-input" value="${product.pNj}" maxlength="50" required>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>外景：</h4><input type="text" name="pWj" class="gui-input" value="${product.pWj}" maxlength="50" required>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>拍摄数量：</h4><input type="text" name="pPssl" class="gui-input" value="${product.pPssl}" maxlength="50" required>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>底片：</h4><input type="text" name="pDp" class="gui-input" value="${product.pDp}" maxlength="50" required>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>服务人员：</h4><input type="text" name="pFwry" class="gui-input" value="${product.pFwry}" maxlength="70" required>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>服务时间：</h4><input type="text" name="pFwsj" class="gui-input" value="${product.pFwsj}" maxlength="50" required>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>造型套数：</h4><input type="text" name="pZxts" class="gui-input" value="${product.pZxts}" maxlength="50"  required>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>化妆用品：</h4><input type="text" name="pHzyp" class="gui-input" value="${product.pHzyp}" maxlength="50"  required>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>拍摄道具：</h4><input type="text" name="pPsdj" class="gui-input" value="${product.pPsdj}" maxlength="50"  required>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>相册：</h4><input type="text" name="pXc" class="gui-input" value="${product.pXc}" maxlength="70"  required>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>相框：</h4><input type="text"  name="pXk"class="gui-input" value="${product.pXk}" maxlength="50"  required>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>摆台：</h4><input type="text" name="pBt" class="gui-input" value="${product.pBt}" maxlength="50"  required>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>展架：</h4><input type="text" name="pZj" class="gui-input" value="${product.pZj}" maxlength="50"  required>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>赠送商品：</h4><input type="text"name="pZssp" class="gui-input" value="${product.pZssp}" maxlength="50" required>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4> 封面图片：</h4>
                                    <img src="<c:url value="${product.pImg}"/>" width="70px" height="70px" id="image">
                                    <label class="button">
                                        <input type="file" name="header" id="pImg" path="multipartFile" style="display: none" >选择图片</input>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="section row">


                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>套餐图片：</h4>
                                   <select class="gui-input"  name="productImgGno">
                                       <option value="${product.productImg.gGno}" selected>${product.productImg.gName}</option>
                                       <c:forEach items="${product_img}" var="productImg">
                                           <option value="${productImg.gGno}">${productImg.gName}</option>
                                       </c:forEach>
                                   </select>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label  class="field prepend-icon">
                                    <h4>套餐轮播图片：</h4>
                                   <select class="gui-input"  name="productLunBoLno">
                                       <option value="${product.productLunBoLno}" selected>${product.productLunBo.lName}</option>
                                       <c:forEach items="${product_lunbo}" begin="1" step="1" var="productLunBo">
                                           <option value="${productLunBo.lLno}">${productLunBo.lName}</option>
                                       </c:forEach>
                                   </select>
                                </label>
                            </div>
                        </div>

                        <div class="panel-footer text-right">
                            <a href="<c:url value="/houtai/product/to_update?pId=${product.pId}"/>"><button class="button"> 修改 </button></a>
                            <button type="button" class="button" onclick="javascript:window.history.go(-2);"> 返回 </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>