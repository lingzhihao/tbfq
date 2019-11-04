<%--
  Created by IntelliJ IDEA.
  User: 14375
  Date: 2019/9/10
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>

        window.onload = function (ev) {
            //选择图片 并显示
            var thumbnail = document.getElementById("thumbnail");//file
            var selectImg = document.getElementById("thumbnail-img");//img
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
</head>
<body>
<img src="">
</form>
</body>
</html>
