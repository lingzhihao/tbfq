<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"/>
<script>
    window.onload = function (ev) {
        //选择图片 并显示
        var thumbnail = document.getElementById("gImage1");//file
        var selectImg = document.getElementById("img1");//img
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

        //选择图片 并显示
        var thumbnail_2 = document.getElementById("gImage2");//file
        var selectImg_2 = document.getElementById("img2");//img
        thumbnail_2.addEventListener("change", function () {
            // if ($('#thumbnail')[0].files[0].size > imgSize) {
            //     // toastr.warning("图片最大为4M");
            //     return;
            // }
            var reader = new FileReader();
            reader.readAsDataURL(thumbnail_2.files[0]);//发起异步请求
            reader.onload = function () {
                //读取完成后，将结果赋值给img的src
                selectImg_2.src = this.result;
                //console.log(this.result)
            }
        });
        //选择图片 并显示
        var thumbnail_3 = document.getElementById("gImage3");//file
        var selectImg_3 = document.getElementById("img3");//img
        thumbnail_3.addEventListener("change", function () {
            // if ($('#thumbnail')[0].files[0].size > imgSize) {
            //     // toastr.warning("图片最大为4M");
            //     return;
            // }
            var reader = new FileReader();
            reader.readAsDataURL(thumbnail_3.files[0]);//发起异步请求
            reader.onload = function () {
                //读取完成后，将结果赋值给img的src
                selectImg_3.src = this.result;
                //console.log(this.result)
            }
        });
        //选择图片 并显示
        var thumbnail_4 = document.getElementById("gImage4");//file
        var selectImg_4 = document.getElementById("img4");//img
        thumbnail_4.addEventListener("change", function () {
            // if ($('#thumbnail')[0].files[0].size > imgSize) {
            //     // toastr.warning("图片最大为4M");
            //     return;
            // }
            var reader = new FileReader();
            reader.readAsDataURL(thumbnail_4.files[0]);//发起异步请求
            reader.onload = function () {
                //读取完成后，将结果赋值给img的src
                selectImg_4.src = this.result;
                //console.log(this.result)
            }
        });
        //选择图片 并显示
        var thumbnail_5 = document.getElementById("gImage5");//file
        var selectImg_5 = document.getElementById("img5");//img
        thumbnail_5.addEventListener("change", function () {
            // if ($('#thumbnail')[0].files[0].size > imgSize) {
            //     // toastr.warning("图片最大为4M");
            //     return;
            // }
            var reader = new FileReader();
            reader.readAsDataURL(thumbnail_5.files[0]);//发起异步请求
            reader.onload = function () {
                //读取完成后，将结果赋值给img的src
                selectImg_5.src = this.result;
                //console.log(this.result)
            }
        });
    }
</script>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 修改套餐图片 </h2>
            <p class="lead"></p>
        </div>
    <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
        <div class="panel heading-border">
            <div class="panel-body bg-light">
                <div class="section-divider mt20 mb40">
                    <span> 修改套餐图片 </span>
                </div>
                <div class="panel-body pn">
                    <form action="<c:url value="/houtai/productImg/update"/>" method="post" enctype="multipart/form-data">
                        <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
                            <thead>
                            <tr class="">
                                <th class="hidden-xs">套餐名</th>
                                <th class="hidden-xs">第一张</th>
                                <th class="hidden-xs">第二张</th>
                                <th class="hidden-xs">第三张</th>
                                <th class="hidden-xs">第四张</th>
                                <th class="hidden-xs">第五张</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="message-unread">
                                <input type="text" value="<c:url value="${productImg.gGno}"/>" name="gGno" hidden>

                                <td><input type="text" value="<c:url value="${productImg.gName}"/>" name="gName" id="gName" class="gui-input" maxlength="20"></td>
                                <td><img src="<c:url value="${productImg.gImage1}"/>" width="93px" height="80px" id="img1"style="margin-bottom: 3px;"/><br/>
                                    <label class="button">
                                        <input type="file" name="header" id="gImage1" path="multipartFile" style="display: none">选择图片</input>
                                    </label>
                                </td>
                                <td><img src="<c:url value="${productImg.gImage2}"/>" width="93px" height="80px" id="img2"style="margin-bottom: 3px;"/><br/>
                                    <label class="button">
                                        <input type="file" name="header" id="gImage2" path="multipartFile" style="display: none">选择图片</input>
                                    </label>
                                </td>
                                <td>
                                    <img src="<c:url value="${productImg.gImage3}"/>" width="93px" height="80px" id="img3"style="margin-bottom: 3px;"/><br/>
                                    <label class="button">
                                        <input type="file" name="header" id="gImage3" path="multipartFile" style="display: none">选择图片</input>
                                    </label>
                                </td>
                                <td><img src="<c:url value="${productImg.gImage4}"/>" width="93px" height="80px" id="img4"style="margin-bottom: 3px;"/><br/>
                                    <label class="button">
                                        <input type="file" name="header" id="gImage4" path="multipartFile" style="display: none">选择图片</input>
                                    </label>
                                </td>
                                <td><img src="<c:url value="${productImg.gImage5}"/>" width="93px" height="80px" id="img5"style="margin-bottom: 3px;"/><br/>
                                    <label class="button">
                                        <input type="file" name="header" id="gImage5" path="multipartFile" style="display: none">选择图片</input>
                                    </label>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <div class="panel-footer text-right">
                            <button type="submit" class="button"> 修改 </button>
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>