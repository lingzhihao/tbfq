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
    <title>套餐首页</title>
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
        <c:if test="${sessionScope.ok != null}">
        alert("预定成功");
        </c:if>
    </script>
    <style type="text/css">
        .biankuang{
            border: 1px solid gainsboro;
        }
        .jiage{
            color: #f44336;
        }
        img{
            width: auto;
            height: auto;
            max-width: 100%;
            max-height: 100%;
        }
    </style>
</head>
<body>
<!-- banner -->
<jsp:include page="top.jsp"/>
<!--拍摄套餐-->
    <div class="banner-bottom">
        <div class="container ">
            <div class="w3-agileits-heading">
                <h3>台北风情 <span>婚纱套餐</span></h3><p></p>
            </div>
        </div>
        <div class="container ">
            <c:forEach items="${product}" var="product">
            <div class="w3l-banner-bottom-grids">
                <div class="col-md-6 w3l-banner-bottom-grid ">
                    <a href="<c:url value="/ling/to_taocan?pId=${product.pId}"/>">
                        <img src="<c:url value="${product.pImg}"/> "/>
                    </a>
                    <div class="kongbai"></div>
                    <div class="w3-agile-post-info">
                        <h4><a href="<c:url value="/ling/to_taocan?pId=${product.pId}"/> "> ${product.pName}</a></h4>
                    </div>
                    <h4 >惊喜价：<span class="jiage">${product.pPrice}</span>元</h4>
                    <div class="clearfix"> </div>
                </div>
            </div>
            </c:forEach>
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