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
    <title><c:url value="${taocan.pName}"/></title>
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
        <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
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
        img{
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
<div class="konghang"></div>
<div id="setContNav" class="fixfloat bianju">
    <!--小轮播图-->
    <div class="weddingDress clearfix" style="margin-bottom:10px;">
        <div class="focus">
            <div class="bigPic">
                <ul>
                    <li>
                        <a href="javascript:;">
                            <img src="<c:url value="${taocan.productLunBo.lImage1}"/>" class="pic_loading" />
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <img src="<c:url value="${taocan.productLunBo.lImage2}"/>"  class="pic_loading" />
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <img src="<c:url value="${taocan.productLunBo.lImage3}"/>"  class="pic_loading" />
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <img src="<c:url value="${taocan.productLunBo.lImage4}"/>"  class="pic_loading" />
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <img src="<c:url value="${taocan.productLunBo.lImage5}"/>"  class="pic_loading" />
                        </a>
                    </li>
                </ul>
            </div>
            <div class="smallPic">
                <div class="prev"><a class="icon" href="javascript:;">上</a></div>
                <div class="next"><a class="icon" href="javascript:;">下</a></div>
                <div class="cont">
                    <ul>
                        <li class="active">
                            <a href="javascript:;"><img src="<c:url value="${taocan.productLunBo.lImage1}"/>" /></a>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="<c:url value="${taocan.productLunBo.lImage2}"/>"/></a>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="<c:url value="${taocan.productLunBo.lImage3}"/>"/> </a>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="<c:url value="${taocan.productLunBo.lImage4}"/>"/> </a>
                        </li>
                        <li>
                            <a href="javascript:;"><img src="<c:url value="${taocan.productLunBo.lImage5}"/>"/></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>


        <div class="contTxt">
            <h3>
                <div class="clearfix">
                    <div class="lp_name" title="金夫人超值团购套餐">
                        <h2>${taocan.pName}</h2>
                    </div>
                </div>
                <div class="lp_sub_t clearfix t_9" title="超值团购，超级优惠">超值团购，超级优惠</div>
            </h3>
            <div class="prc t_y"
                 style="height: 60px; line-height: 60px; padding-left: 15px; background-color:#ffede7; font-size: 12px;">
                <div class="fl" style="display: inline-block; line-height: 60px; margin-right: 15px;">
                    ￥<strong style="font-size: 28px; font-weight: bold;">${taocan.pPrice}</strong>
                </div>
                <%--<div class="t_9 fl" style="display: inline-block; line-height: 60px;">市场价<del>￥5998</del></div>--%>
            </div>

            <!---- 模似到店礼 ---->
            <div class="s_acts" style="display:block;padding: 5px 15px; background-color:#fff8f6;">
                <div class="clearfix">
                    <div class="sale_half j_sale">
                        <div class="sale_lb sale_orange">到店礼</div>
                        <div class="sale_dt t_3">
                            <p class="yxgj_window" data-sid="5" data-source="pc_hssy_d_p_lbt"
                               data-spm="21.238.1203.4070.11397">预定到店既有礼品赠送</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tag_l clearfix" style="margin:5px 40px 10px 0">
                <a href="#" class="tag_i">复古</a>
                <a href="#"class="tag_i">时尚</a>
                <a href="#" class="tag_i">个性</a>
                <a href="#" class="tag_i">简约</a>
                <a href="#" class="tag_i">欧式</a>
                <a href="#" class="tag_i">小清新</a>
                <a href="#" class="tag_i">故事</a>
                <a href="#" class="tag_i">韩式</a>
                <a href="#" class="tag_i">宫廷</a>
                <a href="#" class="tag_i">自然</a>
            </div>

            <div class="tel"></div>
            <!--点击预定判断是否已经登录-->
            <div class="icon fixfloat">
                    <a href="<c:url value="/ling/order?pId=${taocan.pId}"></c:url>"
                            <c:if test="${sessionScope.user.uName == null}" >
                                onclick="return confirm('你还没有登录，请先登录？') ;"
                            </c:if>
                       class="j_rsv active" data-sid="5" data-type="2" data-sname="台北风情婚纱摄影" data-gid="65" data-ext="fcs_1h"
                       data-page_source="pc_hs_g_rsv">立即订购</a>
            </div>

        </div>
        <div class="adv">
            <h3></h3>
            <h3>—— 品质服务 ——</h3>
            <h3></h3>
            <h3>—— 口碑营销 ——</h3>
            <h3></h3>
            <h3>—— 拍摄保证 ——</h3>
            <h3></h3>
            <h3>—— 风险保障 ——</h3>
            <h3></h3>
            <h3>—— 专业团队 ——</h3>
            <h3></h3>
            <h3>—— 品牌的力量 ——</h3>
            <h3></h3>
        </div>
    </div>
</div>
<div id="content" style="font:12px/20px 'Microsoft Yahei';" >
    <div class="contLeft">
        <div class="bor shop">
            <a href="/ling/contact" title="台北风情婚纱摄影">
                <h4>台北风情婚纱摄影</h4>
            </a>
            <strong><span>￥</span>2999-7999</strong><br />
            <div class="clearfix add_phone"><span class="t_6">地址：</span>四川省成都市双流区公兴街道湾河东街63号 </div>
            <div class="clearfix add_phone"><span class="t_6">商家客服：</span><span class="t_y">028-8568 0470</span></div>
        </div>
        <div class="bor code">
            <dl>
                <dt><img src="<c:url value="/picture/erweima.png"/>" alt="二维码" /></dt>
                <dd>
                    <strong>台北风情婚纱摄影</strong><br />
                    关注微信号<span>留言</span><br />
                    制作属于我的请柬
                </dd>
            </dl>
        </div>
    </div>
    <div class="contRight">
        <div class="shp_show">
            <div class="shp_nv_holder" id="shp_nv_holder">
                <div class="nv" id="jd_scroll_anchors">
                    <a href="javascript:void(0);" data-anchor="#tw_xq" class="on">图文详情</a>
                    <a href="javascript:void(0);" data-anchor="#tx_cs">套系参数</a>
                </div>
            </div>
            <div class="tabCont">
                <div class="cont clearfix">
                    <div class="anchor" id="tw_xq"></div>
                    <h3><span>图文详情</span></h3>
                    <div class="details">
                        <img src="<c:url value="${taocan.productImg.gImage1}"/>"/>
                        <img src="<c:url value="${taocan.productImg.gImage2}"/>" />
                        <img src="<c:url value="${taocan.productImg.gImage3}"/>" />
                        <img src="<c:url value="${taocan.productImg.gImage4}"/>" />
                        <img src="<c:url value="${taocan.productImg.gImage5}"/>" />
                    </div>
                    <div class="anchor" id="tx_cs"></div>
                    <h3 style="margin-bottom: 10px"><span>套系参数</span></h3>
                    <p></p>
                    <!-- 婚纱摄影 -->
                    <!-- 旅拍 -->
                    <div class="parameter" style="font:12px/20px 'Microsoft Yahei';">
                        <div class="name">摄影服务</div>
                        <dl>
                            <dt>外景</dt>
                            <dd>${taocan.pWj}<br /></dd>
                        </dl>
                        <dl>
                            <dt>内景</dt>
                            <dd> ${taocan.pNj}<br /> </dd>
                        </dl>

                        <dl>
                            <dt>拍摄(张)</dt>
                            <dd>${taocan.pPssl}<br /></dd>
                        </dl>

                        <dl>
                            <dt>底片</dt>
                            <dd>${taocan.pDp}<br /> </dd>
                        </dl>
                        <dl>
                            <dt>服务人员</dt>
                            <dd>${taocan.pFwry}<br /></dd>
                        </dl>

                        <dl>
                            <dt>服务时间</dt>
                            <dd>${taocan.pFwsj}<br /> </dd>
                        </dl>
                    </div>
                    <div class="parameter">
                        <div class="name">服装造型</div>
                        <dl>
                            <dt>造型套数</dt>
                            <dd>${taocan.pZxts}<br /></dd>
                        </dl>
                        <dl>
                            <dt>化妆用品</dt>
                            <dd>${taocan.pHzyp}<br /> </dd>
                        </dl>
                        <dl>
                            <dt>拍摄道具</dt>
                            <dd>${taocan.pPsdj}<br /></dd>
                        </dl>
                    </div>
                    <div class="fixfloat">
                        <div class="parameter">
                            <div class="name">拍摄成品</div>
                            <dl>
                                <dt>相册</dt>
                                <dd>${taocan.pXc}<br /></dd>
                            </dl>
                            <dl>
                                <dt>相框</dt>
                                <dd>${taocan.pXk}<br /></dd>
                            </dl>
                            <dl>
                                <dt>摆台</dt>
                                <dd>${taocan.pBt}<br /></dd>
                            </dl>
                            <dl>
                                <dt>展架</dt>
                                <dd>${taocan.pZj}<br /> </dd>
                            </dl>
                        </div>
                    </div>
                    <div class="fixfloat">
                        <div class="parameter">
                            <div class="name">赠品</div>
                            <dl>
                                <dt>赠品内容</dt>
                                <dd>${taocan.pZssp} </dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

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