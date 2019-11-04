<%--
  Created by IntelliJ IDEA.
  User: 14375
  Date: 2019/8/10
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <title>关于我们</title>
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
    </script>
</head>
<body>
<!-- banner -->
<jsp:include page="top.jsp"/>
<!-- //banner -->

<!-- contact -->
<div class="contact">
    <div class="container">
        <div class="w3-agileits-heading">
            <h3><span>关 于 我 们</span></h3>
        </div>
        <div class="agile-contact-form">
            <div class="col-md-12 contact-form-left">
                <div class="w3layouts-contact-form-top">
                    <div class="w3-agileits-heading">
                        <h3><span>台北风情</span>  二十多年来的风雨历程</h3>

                    </div>
                    <p>台北风情婚纱摄影（成都店）是全国知名的连锁摄影机构，立足成都市场已经有20余年的历史。 公司主营婚纱照、全家福、写真、商业摄影、婚礼跟妆、跟拍，旅拍等，为顾客提供高品质的拍摄，产品品质和可信赖的服务。</p>
                </div>
            </div>
            <div class="col-md-12 contact-form-left">
                <div class="w3layouts-contact-form-top">
                    <div class="w3-agileits-heading">
                        <h3><span>台北风情</span>  专业的技术团队</h3>

                    </div>
                    <p>台北风情专业技术团队，拥有二十年以上经验，以突出的作品荣获无数国内外婚纱摄影大奖，专业的表现能够精准的抓住新人心中理想风格，不论是时尚华丽、典雅复古还是韩系浪漫，通通能够百分百实现。</p>
                </div>
            </div>
                <div class="agileits-contact-address">

                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //contact -->

<!-- services -->
<div class="services">
    <div class="container">
        <div class="w3-agileits-heading">
            <h3>服务保障 <span>品牌的力量</span></h3>
        </div>
        <div class="wthree-services-grids">
            <div class="col-md-4 w3-agileits-services-grid">
                <i class="fa fa-cogs" aria-hidden="true"></i>
                <h4>坚持口碑营销 </h4>
                <p>高品质打造强劲品牌口碑</p>
                <p>成就魅力营销</p>
            </div>
            <div class="col-md-4 w3-agileits-services-grid agile-services1">
                <i class="fa fa-comments" aria-hidden="true"></i>
                <h4>用客片说话</h4>
                <p>用媲美样片的原创客片力量</p>
                <p>打败浮夸宣传</p>
            </div>
            <div class="col-md-4 w3-agileits-services-grid">
                <i class="fa fa-heart" aria-hidden="true"></i>
                <h4>消费主张</h4>
                <p>绝无任何隐形消费</p>
                <p>绝不收取任何额外费用</p>
            </div>
            <div class="col-md-4 w3-agileits-services-grid">
                <i class="fa fa-plane" aria-hidden="true"></i>
                <h4>风险保障</h4>
                <p>以公平消费为基本底线</p>
                <p>到店不满意直接退款</p>
            </div>
            <div class="col-md-4 w3-agileits-services-grid agile-services2">
                <i class="fa fa-paper-plane" aria-hidden="true"></i>
                <h4>拍摄保障</h4>
                <p>拍摄不满意无条件重拍</p>
                <p>重拍不满意退款</p>
            </div>
            <div class="col-md-4 w3-agileits-services-grid">
                <i class="fa fa-road" aria-hidden="true"></i>
                <h4>服务理念</h4>
                <p>“创作年轻人真正喜欢的婚纱照”</p>
                <p>穿着婚纱去旅行</p>
            </div>
        </div>
    </div>
</div>
<!-- //services -->
<!-- //here ends scrolling icon -->
<jsp:include page="footer.jsp"/>


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

