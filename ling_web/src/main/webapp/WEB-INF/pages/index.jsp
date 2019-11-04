<%--
  Created by IntelliJ IDEA.
  User: 14375
  Date: 2019/8/10
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <title>台北风情婚纱摄影</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- bootstrap-css -->
    <link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet" type="text/css" media="all" />
    <!-- css -->
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>" type="text/css" media="all" />
    <!-- font-awesome icons -->
    <link href="<c:url value="/css/font-awesome.css"/>" rel="stylesheet">
    <!-- 字体样式 -->
    <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="<c:url value="/js/jquery-3.4.1.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/bootstrap.js"/> "></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>

    <style type="text/css"  >
        /*轮播图*/
        .pc_imgBox{
            display: block;
            height: 400px;
            width: 100%;
            background-size: cover;
            background-position:  center;
            background-repeat: no-repeat;
        }
        .m_imgBox{
            display: block;
            width: 100%;
        }
        .kongbai{
            height: 15px;
            width: 0px;
        }
        .img{
            width: auto;
            height: auto;
            max-width: 100%;
            max-height: 100%;
        }
        .jiage{
             color: #f44336;
         }
    </style>
</head>
<body>
<!-- 顶部 -->
<jsp:include page="top.jsp"/>

<!-- 轮播图 -->
    <div class="container-fluid">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- 轮播图的中的小点 -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                <li data-target="#carousel-example-generic" data-slide-to="4"></li>
            </ol>
            <!-- 轮播图的轮播图片 -->
            <div class="carousel-inner" role="listbox">
                <c:forEach items="${product_lunbo}" begin="0" end="0" step="1" var="lunbo" >
                    <div class="item active" >
                        <img src="<c:url value="${lunbo.lImage1}"/>" class="pc_imgBox hidden-xs">
                        <img src="<c:url value="${lunbo.lImage1}"/>" class="m_imgBox hidden-lg hidden-md hidden-sm">
                    </div>
                    <div class="item ">
                        <img src="<c:url value="${lunbo.lImage2}"/>" class="pc_imgBox hidden-xs">
                        <img src="<c:url value="${lunbo.lImage2}"/>" class="m_imgBox hidden-lg hidden-md hidden-sm">

                    </div>
                    <div class="item">
                        <img src="<c:url value="${lunbo.lImage3}"/>" class="pc_imgBox hidden-xs">
                        <img src="<c:url value="${lunbo.lImage3}"/>" class="m_imgBox hidden-lg hidden-md hidden-sm">

                    </div>
                    <div class="item">
                        <img src="<c:url value="${lunbo.lImage4}"/>" class="pc_imgBox hidden-xs">
                        <img src="<c:url value="${lunbo.lImage4}"/>" class="m_imgBox hidden-lg hidden-md hidden-sm">

                    </div>
                    <div class="item">
                        <img src="<c:url value="${lunbo.lImage5}"/>" class="pc_imgBox hidden-xs">
                        <img src="<c:url value="${lunbo.lImage5}"/>" class="m_imgBox hidden-lg hidden-md hidden-sm">
                        <div class="carousel-caption">
                            <!-- 轮播图上的文字 -->
                        </div>
                    </div>
<%--                    <img src="<c:url value="/images/gundong3.jpg"/>" class="m_imgBox hidden-lg hidden-md hidden-sm">--%>

                </c:forEach>

            </div>

            <!-- 上一张 下一张按钮 -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
<%--                <span class="glyphicon glyphicon-chevron-left" aria-hidden="false"></span>--%>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
<%--                <span class="glyphicon glyphicon-chevron-right" aria-hidden="false"></span>--%>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

<!-- 客片连接 -->
<div class="posts">
    <div class="container ">
        <div class="w3-agileits-heading">
            <h3>特惠拍摄<span>套餐</span></h3>
            <p>&nbsp;</p>
        </div>
    </div>
    <div class="container ">
        <c:forEach items="${product}" var="product" step="1" begin="0" end="2">
        <div class="w3l-banner-bottom-grids">

            <div class="col-md-4 w3l-banner-bottom-grid">
                <a href="<c:url value="/ling/to_taocan?pId=${product.pId}"/> ">
                    <img class="img"    src="<c:url value="${product.pImg}"/> "/>
                </a>
                <div class="w3-agile-post-info">
                    <h4><a href="<c:url value="/ling/to_taocan?pId=${product.pId}"/> "> ${product.pName}</a></h4>
                </div>
                <h4 >惊喜价：<span class="jiage">${product.pPrice}</span>元</h4>
            </div>
        </div>
        </c:forEach>

    </div>
</div>

<!-- 欢迎 -->
<div class="welcome">
    <div class="container">
        <div class="welcome-grids">
            <div class="col-md-6 w3ls-welcome-left">
                <div class="w3ls-welcome-left-img">
                    <img class="img" src="<c:url value="/images/index_4.jpg"/> "/>
                </div>
            </div>
            <div class="col-md-6 w3ls-welcome-right">
                <div class="w3ls-welcome-right-info">
                    <h2>关于 我们 <span>的一些话</span></h2>
                    <p>创立之初，创始人团队就确立以技术为核心竞争力的发展战略，搜罗国内顶尖技术人才组件研发团队。</p>
                    <h4>“创作年轻人真正喜欢的婚纱照”</h4><p>这个理念已经深植每个台北风情创作人。</p>
                    <p><span>2018年台北风情推出“大旅行者”系列旅拍作品。区分于市面上鱼龙混杂的所谓旅拍产品，
                        我们希望以更纯粹的真旅拍体验，带着我们的新人“穿着婚纱环游世界”。</span></p>
                    保证每一张出自我们的照片都不遗余力。
                </div>
                <div class="agileits-border">
                    <div class="agileinfo-red"> </div>
                    <div class="agileinfo-red agileinfo-green"> </div>
                    <div class="agileinfo-red agileinfo-blue"> </div>
                    <div class="agileinfo-red agileinfo-yellow"> </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>

<!-- 客片展示 -->
<div class="posts">
    <div class="container">
        <div class="w3-agileits-heading">
            <h3>客片 <span>展示</span></h3>
            <p>&nbsp;</p>
        </div>

        <div class="container ">
            <div class="w3l-banner-bottom-grids">
                <c:forEach items="${product_img}" var="productImg" begin="0" end="2" step="1">
                    <div class="col-md-4 w3l-banner-bottom-grid ">
                        <a href="<c:url value="/ling/kepian?gGno=${productImg.gGno}"/>">
                            <img class="img" src="<c:url value="${productImg.gImage1}"/> "/>
                        </a>
                        <div class="kongbai"></div>
                        <div class="w3-agile-post-info">
                            <h4><a href="<c:url value="/ling/kepian?gGno=${productImg.gGno}"/>">${productImg.gName}</a></h4>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%-- <div class="posts-grids">
              <div class="col-md-4 w3-agile-post-grids">
              <div class="w3-agile-post-img" >
                  <
              </div>
              <div class="w3-agile-post-info">
                  <h4><a href="single.html"></a></h4>
              </div>
          </div>
          <div class="clearfix"> </div>
      </div>--%>
    </div>
</div>
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
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //services -->


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
<!-- 跳转到顶部 -->
<script type="text/javascript">
    $(document).ready(function() {
        $().UItoTop({ easingType: 'easeOutQuart' });
    });
</script>
<!-- //底部图标 -->

<!-- //posts -->
<jsp:include page="footer.jsp"/>