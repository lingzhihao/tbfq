<%--
  Created by IntelliJ IDEA.
  User: 14375
  Date: 2019/8/10
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <title>团队</title>
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

    <style type="text/css">
        .konghang{
            height: 20px;
        }
    </style>

</head>
<body>
<!-- banner -->
<jsp:include page="top.jsp"/>
<!-- //banner -->
<!-- about -->
<div class="main-textgrids">
    <div class="container">
        <div class="w3-agileits-heading ">
            <h3>This is my <span>Team</span></h3>
        </div>
        <div class="statements">
            <div class="col-md-7 mission">
                <h4>摄影团队</h4>
                <p>我们是专业的摄影采风服务团队。 一直为实现图片与设计的个性化和人文化而努力。全外景、一对一贴心式的拍摄方式让摄影的过程变的更加放松和自由，留给客人更多的空间表现也让他们更加体验到参与的乐趣。每一个客人在我们面前都是明星。关键词：个性、原创、轻松、自然。 我们 是一群用镜头光圈记录幸福和唯美视觉风景的摄影人。 我们 是用我们的专业摄影态度和摄影视角去完成我们的每一次摄影作品。我们不同于通常意义上摄影组织团体的统和一贯。</p>
                <p></p>
                <ul class="ab">
                    <li><a href="single.html">成立之初，创始人团队就确立以技术为核心竞争力的发展战略，</a></li>
                    <li><a href="single.html">搜罗国内顶尖技术人才组建研发的摄影团队，因为我们深知，</a></li>
                    <li><a href="single.html">最好的营销不是铺天盖地的“广告宣传”，而是</a></li>
                    <li><a href="single.html">我们的产品，我们的照片，一切都来至于我们的团队。</a></li>
                </ul>
            </div>
            <div class="col-md-5 facts">
                <div class="konghang"></div>
                <img src="<c:url value="/images/team_2.jpg"/>" alt=" " />
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="statements">
            <div class="col-md-7 mission">
                <h4>化妆造型团队</h4>
                <p>我们是专业的摄影采风服务团队。 一直为实现图片与设计的个性化和人文化而努力。全外景、一对一贴心式的拍摄方式让摄影的过程变的更加放松和自由，留给客人更多的空间表现也让他们更加体验到参与的乐趣。每一个客人在我们面前都是明星。关键词：个性、原创、轻松、自然。 我们 是一群用镜头光圈记录幸福和唯美视觉风景的摄影人。 我们 是用我们的专业摄影态度和摄影视角去完成我们的每一次摄影作品。我们不同于通常意义上摄影组织团体的统和一贯。</p>
                <ul class="ab">
                    <li><a href="single.html">Lorem ipsum dolor sit amet,consectetur adipiscing elit</a></li>
                    <li><a href="single.html">Pellentesque eu erat lacus,consectetur adipiscing elit</a></li>
                    <li><a href="single.html">Lorem ipsum dolor sit amet,consectetur adipiscing elit</a></li>
                    <li><a href="single.html">Lorem ipsum dolor sit amet,consectetur adipiscing elit</a></li>
                    <li><a href="single.html">Pellentesque eu erat lacus,consectetur adipiscing elit</a></li>
                </ul>
            </div>
            <div class="col-md-5 facts">
                <div class="konghang"></div>
                <img src="<c:url value="/images/team_1.jpg"/>" alt=" " />
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
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