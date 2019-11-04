<%--
  Created by IntelliJ IDEA.
  User: 14375
  Date: 2019/8/27
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <title>客片详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- bootstrap-css -->
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet" type="text/css" media="all" />
    <!--// bootstrap-css -->
    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>" type="text/css" media="all" />
    <link rel="stylesheet" href="<c:url value="/css/taocan/a.css"/>" type="text/css" media="all" />
    <link rel="stylesheet" href="<c:url value="/css/taocan/swiper.min.css"/>" type="text/css" media="all" />
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
    </script>

    <script type='text/javascript'>
        ! function (e, t, n, g, i) {
            e[i] = e[i] || function () {
                (e[i].q = e[i].q || []).push(arguments)
            }, n = t.createElement("script"), tag = t.getElementsByTagName("script")[0], n.async = 1, n.src = (
                'https:' == document.location.protocol ? 'https://' : 'http://') + g, tag.parentNode.insertBefore(n,
                tag)
        }(window, document, "script", "assets.growingio.com/2.1/gio.js", "gio");
        gio('init', '8e90fa4679ba8289', {});
        gio('send');
    </script>
    <style type="text/css">
        .none {
            display: none !important;
        }

        #m_hy_rsv .stepi {
            padding-top: 0px !important;
        }

        a
        a:hover {
            background-color: #c1bdca !important;
            border-color: #c1bdca !important;
        }

        .auto_log_check input {
            float: initial;
        }
        .bianju{
            margin-top: 10px;
        }
        .konghang{
            height: 20px;

        }
        .img{
            width: auto;
            height: auto;
            max-width: 100%;
            max-height: 100%;
        }
    </style>
    <script type="text/javascript" src="<c:url value="/js/tool_libs.js" />" charset="utf-8"></script>
    <script type="text/javascript" src="<c:url value="/js/json2.js"/>" charset="utf-8"></script>
    <script type="text/javascript" src="<c:url value="/js/xlk_common_fns.js" />"charset="utf-8"></script>


</head>
<body>
<!-- banner -->
<jsp:include page="top.jsp"/>
<!--拍摄套餐-->
<div class="banner-bottom">
    <div class="container ">
        <div class="w3-agileits-heading">
            <h3>台北风情 <span>${kepian.gName}</span></h3>
            <p>   &nbsp;</p>
        </div>
    </div>
    <div class="container ">
        <div class="contRightSingle col-md-12">
            <div class="w3l-banner-bottom-grids">
                <div class="col-md-12 w3l-banner-bottom-grid ">
                    <img class="img" src="<c:url value="${kepian.gImage1}"/> "/>
                    <div class="kongbai"></div>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-12 w3l-banner-bottom-grid ">
                    <img class="img" src="<c:url value="${kepian.gImage2}"/> "/>
                    <div class="kongbai"></div>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-12 w3l-banner-bottom-grid ">
                    <img class="img" src="<c:url value="${kepian.gImage3}"/> "/>
                    <div class="kongbai"></div>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-12 w3l-banner-bottom-grid ">
                    <img class="img" src="<c:url value="${kepian.gImage4}"/> "/>
                    <div class="kongbai"></div>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-12 w3l-banner-bottom-grid ">
                    <img class="img" src="<c:url value="${kepian.gImage5}"/> "/>
                    <div class="kongbai"></div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--
<div class="konghang"></div>
<div id="content" style="font:12px/20px 'Microsoft Yahei';" >
    <div class="contRightSingle col-md-12">
        <div class="shp_show">
            <div class="shp_nv_holder" id="shp_nv_holder">
                <div class="nv" id="jd_scroll_anchors">
                    <a href="javascript:void(0);" data-anchor="#tw_xq" class="on">客片展示</a>
                </div>
            </div>
            <div class="tabCont">
                <div class="cont clearfix">
                    <div class="details">
                        <img src="<c:url value="${kepian.gImage1}"/>"/>
                        <img src="<c:url value="${kepian.gImage2}"/>" />
                        <img src="<c:url value="${kepian.gImage3}"/>" />
                        <img src="<c:url value="${kepian.gImage4}"/>" />
                        <img src="<c:url value="${kepian.gImage5}"/>" />
                    </div>
                </div>
            </div>
            <div class="panel-footer text-right">
            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
            </div>
        </div>
    </div>
</div>--%>
</body>
<!-- footer -->
<div class="konghang"></div>
<script src="<c:url value="/js/SmoothScroll.min.js"/> "></script>

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