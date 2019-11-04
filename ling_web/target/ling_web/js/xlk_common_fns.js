(function($) {
	
    $.fn.bigPicShow = function(opt) {
        opt = $.extend({
            'oBtnPrev': $(this).find('.mark_left, .prev'),
            'oBtnNext': $(this).find('.mark_right, .next'),
            'oUlSmall': $(this).find('.smallPic ul'),
            'oUlBig': $(this).find('.bigPic'),
            'type': 0,
            'lastNum':4
        }, opt);

        return this.each(function() {
            var _this = $(this);
            var aLiBtn = opt.oUlSmall.find('li');
            var aLiPic = opt.oUlBig.find('li');
            var iNow = 0, cnt = aLiBtn.length;
            var iw = aLiBtn.width(), pw = opt.oUlSmall.parent().width(), show_cnt = Math.ceil(pw/iw) - 1;

            opt.oUlSmall.width(aLiBtn.outerWidth() * aLiBtn.size());

            aLiPic.eq(0).fadeIn(400).siblings('li').fadeOut();
            aLiBtn.eq(0).addClass('active').siblings('li').removeClass('active');

            opt.oBtnPrev.click(function() {
                iNow--;
                if (iNow < 0) { iNow = cnt - 1; }
                tab();
            });

            opt.oBtnNext.click(function() {
                iNow++;
                if (iNow > aLiBtn.size() - 1) { iNow = 0; }
                tab();
            });

            aLiBtn.bind('mouseover', function() {
                if ($(this).index() !== iNow) {
                    iNow = $(this).index();
                    tab();
                }
            });

            function tab() {
                aLiPic.eq(iNow).fadeIn(400).siblings('li').fadeOut();
                aLiBtn.eq(iNow).addClass('active').siblings('li').removeClass('active');
                if(iNow > show_cnt) {
                    opt.oUlSmall.animate({'left': -(iNow-show_cnt)* iw}, 300);
                } else {
                    opt.oUlSmall.animate({'left': 0}, 300);
                }
            }
        });
    };

    var hunli = hunli || {};
    hunli.focusPic = {
        init: function() {
            this.focusScroll();
        },

        focusScroll: function() {
            $('.focus').bigPicShow({
                'oBtnPrev': $('.focus .prev'),
                'oBtnNext': $('.focus .next'),
                'oUlSmall': $('.focus .smallPic ul'),
                'oUlBig': $('.focus .bigPic ul'),
                'type': 0,
                'lastNum':3
            });
        }

    };

    $(document).ready(function() {
        hunli.focusPic.init();
    });

})(jQuery);

//-----分享
function share(num){
    $('.share,.shareLayer').hover(function(){
            $('.shareLayer').show();
        },function(){
            $('.shareLayer').hide();
        }
    );

    $('.xzsj a').hover(function(){
            $('.codeLayer').show();
        },function(){
            $('.codeLayer').hide();
        }
    );
};

//----标签切换
function tabNav(){
    $('.tabMenu a').click(function(){
        $(this).addClass('active').siblings().removeClass('active');
        $('.tabCont .cont').eq($(this).index()).show().siblings().hide();
    });

}

function payActive(){
    //发布商品
    $('.box .payment a').on('click',function(){
        $('.box .payment a').removeClass('active');
        $(this).addClass('active');
    });

    $('.box .paymentA a').on('click',function(){
        $('.box .paymentA a').removeClass('active');
        $(this).addClass('active');
    });
}

//------图片放大
function zoomImg (){

    //------超值套餐
    $('.adv .pic img').mouseenter(function(){
        var wValue=1.2 * $(this).width();
        var hValue=1.2 * $(this).height();
        $(this).animate({width: wValue,
            height: hValue,
            left:("-"+(0.2 * $(this).width())/2),
            top:("-"+(0.2 * $(this).height())/2)}, 1000);
    }).mouseleave(function(){
        $(this).animate({width: "175",
            height: "130",
            left:"0",
            top:"0"}, 1000 );
    });

}

function toggleMenu(className){
    $('.'+className).toggle();
    var targetLink = $('a',$('.'+className).parent().next());
    targetLink.attr('class') == 'down'?targetLink.attr('class','up')&&targetLink.html('收起'):
        targetLink.attr('class','down')&&targetLink.html('更多');
}

/*effect js 结束*/


if(!window['console']) {
    window['console'] = {
        log: function() {},
        error: function() {}
    }
}
if(!Object.keys) {
    Object.keys = (function() {
        var hasO = Object.prototype.hasOwnProperty,
            hasDontEnumBug = !({toString: null}).propertyIsEnumerable('toString'),
            dontEnums = [
                'toString',
                'toLocalString',
                'valueOf',
                'hasOwnProperty',
                'isPropertyOf',
                'propertyIsEnumerable',
                'constructor'
            ],
            dontEnumsLength = dontEnums.length;
        return function(obj) {
            if(typeof obj !== 'object' && typeof obj !== 'function' || obj === null) throw new TypeError('Object.keys called on non-object');
            var rs = [];
            for(var prop in obj) {
                if(hasO.call(obj, prop)) rs.push(prop);
            }
            if(hasDontEnumBug) {
                for(var i = 0; i < dontEnumsLength; i++) {
                    if(hasO.call(obj, dontEnums[i])) rs.push(dontEnums[i]);
                }
            }
            return rs;
        }
    })();
}
/*
 1.  xlk网站的公用变量为xlk, 不要冲突掉这个变量
 为了避免变量的冲突，建议扩展xlk的时候采用下面闭包方式进行
 (function(root) {
 var X = root.xlk  || {}; //当然此处的X可以为其他的字符，最后再附回去即可
 .......
 root.xlk = X;
 })(window);
 2.  jquery 对象的使用时候尽量使用$var_name的方式进行（非强制），只是这样用起来一看就知道是jquery变量，比较方便
 */
(function(root) {
    var default_user = {
        name: '',
        gender: '',
        id: '',
        mobile: '',
        email: '',
        icon: '',
        is_business: false
    };
    var APIS = {
        guanzhu: 'collection',
        like: 'like',
        login: 'login',
        send_code: 'sendCode',
        addReserve: 'addReserve',
        addXSYLog: 'addXSYLog',
        yykd_list : 'ext',
        yhj_login: 'promotion'
    };

    var x = root.xlk  || {};
    x.regs = {
        'mobile': /^1[0-9]\d{9}$/,
        'captcha': /^\d{4}$/,
        'mob_vrf': /^\d{6}$/
    };
    x.CITIES = {
        B: [ {'bj': '北京'}],
        C: [ {'cq': '重庆'}, {'cd': '成都'},{ 'cc': '长春'} ],
        D: [ {'dl': '大连'} ],
        F: [ {'fz': '福州'} ],
        G: [ {'gz': '广州'}, {'gy': '贵阳'} ],
        H: [ {'hz': '杭州'} ],
        J: [ {'jn': '济南'} ],
        N: [ {'nj': '南京'}, {'nb': '宁波'}, {'nc': '南昌'} ],
        Q: [ {'qd': '青岛'} ],
        S: [ {'sh': '上海'}, {'sy': '沈阳'}, {'sjz': '石家庄'}, {'sz': '苏州'}, {'szn': '深圳'}, {'sy': '三亚'} ],
        T: [ {'tj': '天津'}, {'ty': '太原'} ],
        W: [ {'wh': '武汉'}, {'wx': '无锡'} ],
        X: [ {'xa': '西安'} ],
        Y: [ {'yz': '扬州'} ],
        Z: [ {'zz': '郑州'} ]
    };

    x.VERSION = '0.0.1';
    x.user = default_user;
    x.APIS = APIS;
    x.BAIHE_DOMAIN = '.baihe.com';
    x.DEFAULT_DOMAIN = '.hunli.baihe.com';
    x.API_PRE = "/outer/setting/";
    x.API_PRE_INNER = "/outer/setting/";
    x.IMG_DEFAULT_SRC = "/static/imgs/default_07.jpg";
    x.IS_INDEX = window.location.pathname == '/' || window.location.pathname == '';

    /**以下是基础函数，脚手架 *方便各种基础功能 */

    var arrs = 'Arguments, Function, String, Number, Date, RegExp, Error'.split(', ');
    x.each = Array.prototype.forEach || function(callback, thisArg) {
            var T, k;
            if(this === null) {
                throw new TypeError('this is null or not defined');
            }
            var O = Object(this);
            var len = O.length >>> 0;
            if(typeof callback !== 'function') {
                throw new TypeError(callback + ' is not a function');
            }
            if(arguments.length > 1) {
                T = thisArg;
            }
            k = 0;
            while(k < len) {
                var kValue;
                if(k in O) {
                    kValue = O[k];
                    callback.call(T, kValue, k, O);
                }
                k++;
            }
        }
    x.each.call(arrs, function(v, k) {
        x['is' + v] = function(o) {
            return Object.prototype.toString.call(o) === '[object ' + v + ']';
        }
    });

    x.isElement = function(o){
        return !!(obj && obj.nodeType === 1);
    }
    x.isArray = Array.isArray || function(o) {
            return Object.prototype.toString.call(o) == '[object Array]';
        }
    x.isObject = function(o) {
        var type = typeof o;
        return type === 'function' || type === 'object' && !!o;
    }
    if(typeof /./ != 'function' && typeof Int8Array != 'object') {
        x.isFunction = function(o) {
            return typeof o == 'function' || false
        }
    }
    x.isNaN = function(o) {
        return x.isNum(o) && o !== +o;
    }
    x.isBoolean = function(o) {
        return o === true || o === false || Object.prototype.toString.call(o) == '[object Boolean]';
    }
    x.isNull = function(o) {
        return o === null;
    }
    x.isUndefined = function(o) {
        return o === void 0;
    }
	//数组去重；
	x.isUnique1 = function(o){
		var res = [this[0]];
		for(var i = 1; i < this.length; i++){
			var repeat = false;
			for(var j = 0; j < res.length; j++){
				if(this[i] == res[j]){
					repeat = true;
					break;
				}
			}
			if(!repeat){
				res.push(this[i]);
			}
		}
		return res;
	},
    // x.imgErr = function(img, src) {
    //     img.src = src || x.IMG_DEFAULT_SRC;
    // }
    x.cookie = {
        get: function(n) {
            var cn = encodeURIComponent(n) + '=',
                cs = document.cookie.indexOf(cn),
                cv = null;
            if(cs > -1) {
                var ce = document.cookie.indexOf(';', cs);
                if(ce === -1) {
                    ce = document.cookie.length;
                }
                cv = decodeURIComponent(document.cookie.substring(cs + cn.length, ce));
            }
            return cv;
        },
        set: function(n, v, e, p, d, s) {
            var ct = encodeURIComponent(n) + '=' + encodeURIComponent(v);
            if(e instanceof Date) {
                ct += '; expires=' + e.toGMTString();
            }
            if(p) {
                ct += '; path=' + p;
            }
            if(d) {
                ct += '; domain=' + d;
            }
            if(s) {
                ct += '; secure';
            }
            document.cookie = ct;
        },
        rm: function(n, p, d, s) {
            this.set(n, '', new Date(0), p, d, s);
        }
    };

    //以上内容和业务逻辑无关，只是一些基础共用函数

    var TPL_LOGIN = '<div class="modal" id="m_login">'
            + '<div class="modal_bg"></div>'
            + '<div class="modal_container">'
            + '<div class="modal_border"></div>'
            + '<div class="modal_inner">'
            + '<div class="modal_head t_y">快速登录</div>'
            + '<div class="modal_body">'
            + '<div class="clearfix">'
            + '<div class="lg_fig">'
            + '<img src="/static/imgs/login_fig.jpg" />'
            + '</div>'
            + '<div class="log_fm">'
            + '<div class="fm_group clearfix">'
            + '<label class="ctr_lable" for="lg_u_phone">手机号：</label>'
            + '<div class="ctr_input">'
            + '<input type="text" value="请输入手机号" data-default="请输入手机号" maxlength="11" class="in_txt j_indefault" id="lg_u_phone" />'
            + '<div class="ctr_err">手机号码无效</div>'
            + '</div>'
            + '</div>'
            + '<div class="fm_group clearfix">'
            + '<label class="ctr_lable" for="lg_u_radm">动态码：</label>'
            + '<div class="ctr_input">'
            + '<input type="text" value="请输入动态码" data-default="请输入动态码" maxlength="6" class="in_txt j_indefault" id="lg_u_radm" />'
            + '<a href="javascript:void(0);" class="btn_org3" id="lg_get_radm">获取动态码</a>'
            + '<div class="ctr_err">动态码不正确</div>'
            + '</div>'
            + '</div>'
            + '<div class="fm_group clearfix">'
            + '<div class="ctr_input auto_log_check">'
            + '<input type="checkbox" checked id="login_3d" />'
            + '<label for="login_3d" class="t_3">30天内自动登录</label>'
            + '</div>'
            + '</div>'
            + '<a href="javascript:void(0);" class="btn_org4" id="lg_sub">登录</a>'
            + '</div>'
            + '</div>'
            + '</div>'
            + '</div>'
            + '<a class="modal_close a_9" href="javascript:void(0);">&times;</a>'
            + '</div>'
            + '</div>',

        TPL_USR_AREA = '<a href="http://seller.hunli.baihe.com" target="_blank" onclick="baihe.bhtongji.tongji({event: 3, spm: '+"'21.168.758.2617.6731'"+'});" class="fr a_lk a_6">商家中心</a>'

            + '<div class="sep fr"></div>'
            + '<a href="_DOMAIN_/user/index/index" onclick="baihe.bhtongji.tongji({event: 3, spm: '+"'21.168.758.2616.6730'"+'});" class="fr a_lk a_6">个人中心</a>'
            + '<div class="sep fr"></div>'
            + '<a href="javascript:void(0);" class="fr a_lk a_6" id="u_top_logout">[退出]</a>'
            + '<span class="t_y a_lk">MOBILE　</span>',
        TPL_LOGOUT = '<div class="modal" id="m_logout">'
            + '<div class="modal_bg"></div>'
            + '<div class="modal_container">'
            + '<div class="modal_border"></div>'
            + '<div class="modal_inner">'
            + '<div class="modal_head t_y">快速登录</div>'
            + '<div class="modal_body">'
            + '<div class="clearfix">'
            + '<div class="lg_fig">'
            + '<img src="/static/imgs/login_fig.jpg" />'
            + '</div>'
            + '<div class="log_fm">'
            + '<div class="out">'
            + '<p>确定要退出登录账户吗？</p>'
            + '<div class="clearfix"><a href="javascript:void(0);" id="log_out_a1">确定</a><a href="javascript:void(0);" id="log_out_a2">取消</a></div>'
            + '</div>'
            + '</div>'
            + '</div>'
            + '</div>'
            + '</div>'
            + '<a class="modal_close a_9" href="javascript:void(0);">&times;</a>'
            + '</div>'
            + '</div>',
        TPL_PZONE = '<div class="pr_ct_zn" id="pr_ct_zn">'
            + '<div class="clearfix hd">'
            + '<div class="lb">选择地区</div>'
            + '<div class="pl_rs">'
            + '<span class="pi" data-code="31000">上海</span>'
            + '<span class="pl_arrow_r"></span>'
            + '<span class="pi">长宁区</span>'
            + '</div>'
            + '</div>'
            + '<div class="sub_zs clearfix">'
            + '<a href="javascript:void(0);" class="ps_i a_6 on" data-code="310101">黄埔区</a>'
            + '</div>'
            + '<a href="javascript:void(0);" id="plc_x">&times;</a>'
            + '</div>',
        TPL_RSV_ACTI_INDEX = '<div class="itm">'
            + '<div class="act_x"><span class="corner_bot"></span></div>'
            + '<div class="lk_x" title="%T%"><span class="t_9">%T%</span></div>'
            + '</div>',
        TPL_RSV_ACTI = '<div class="itm">'
            + '<div class="act_%I%">%N%<span class="corner_lft"></span></div>'
            + '<div class="lk" title="%T%"><span class="t_3">%T%</span></div>'
            + '</div>';

    var err_msgs = {
        'mobile': '手机号码无效',
        'mobile_plan': '请正确输入您的手机号码',
        'mob_vrf': '动态码不正确'
    }, DIS = 'disabled', $win = $(window);

    x.is_zxs = function(c) {
        return /^11|^12|^31|^50/.test(c);
    }


    x.add_gz = function($btn) {
        if($btn.is('.active')){
            //x.pop_msg('已关注');
            x.guanzhu_query($btn, false);
        } else {
            if(x.user.id) {
                x.guanzhu_query($btn, true);
            } else {
                x.m_login(function() {
                    x.guanzhu_query($btn, true);
                });
            }
        }
    }
    x.add_like = function($btn) {
        if($btn.is('.active')) {
            x.like_query($btn, false);
        } else {
            if(x.user.id) {
                x.like_query($btn, true);
            } else {
                x.m_login(function() {
                    x.like_query($btn, true);
                });
            }
        }
    }
    x.get_store_acts_a = function(attr) {
        var el = document.getElementById('tempSaleLabel'), rs = [], i, v;
        v = attr ? attr : (el ? el.value : null);
        if(v) {
            var a = v.split('|||');
            for(i = 0; i < a.length; i++) {
                rs.push(a[i].split('||'));
            }
        }
        return rs;
    }

    x.get_store_acts_s = function($btn) {
        var s = '', a, i;
        if($btn && $btn.attr('data-tempSaleLabel')) {
            a = x.get_store_acts_a($btn.attr('data-tempSaleLabel'));
        } else {
            a = x.get_store_acts_a();
        }
        if(a.length) {
            for(i = 0; i < a.length; i++) {
                if(a[i][0] == 'xxx') {
                    s += TPL_RSV_ACTI_INDEX.replace(/%T%/g, a[i][1] || '');
                } else {
                    s += TPL_RSV_ACTI.replace(/%I%/g, (i % 3 + 1)).replace(/%N%/g, a[i][0] || '').replace(/%T%/g, a[i][1] || '');
                }
            }
        }
        return s;
    }

    x.like_query = function($btn, is_add) {
        if($btn.is('.dis')) return;
        var data = {params: JSON.stringify({ userID: x.user.id, gID: $btn.attr('data-gid') || '101', type: $btn.attr('data-type'), mark: is_add ? 1 : -1 })};
        return $.ajax({
            url: x.API_PRE + APIS.like,
            type: 'get',
            data: data,
            dataType: 'json',
            beforeSend: function() {
                $btn.addClass('dis');
            },
            success: function(d) {
                if((typeof d !== 'undefined' && d !== null ? d.code : void 0) === 200) {
                    if(is_add) {
                        $btn.addClass('active');
                        $btn.html($btn.html().replace(/喜欢（\d+）/, '已喜欢（' + ++$btn.text().match(/\d+/)[0] + '）'));
                    } else {
                        $btn.removeClass('active');
                        $btn.html($btn.html().replace(/已喜欢（\d+）/, '喜欢（' + --$btn.text().match(/\d+/)[0] + '）'));
                    }
                } else {
                    x.pop_msg(d.msg, $btn);
                }
            },
            complete: function() {
                $btn.removeClass('dis');
            }
        });
    };
    x.guanzhu_query = function($btn, is_add) {
        if($btn.is('.dis')) return;
        var data = {params: JSON.stringify({ userID: x.user.id, sID: $btn.attr('data-sid') || '101', mark: is_add ? 1 : -1 })};
        return $.ajax({
            url: x.API_PRE + APIS.guanzhu,
            type: 'get',
            data: data,
            dataType: 'json',
            beforeSend: function() {
                $btn.addClass('dis');
            },
            success: function(d) {
                if((typeof d !== 'undefined' && d !== null ? d.code : void 0) === 200) {
                    if(is_add) {
                        $btn.addClass('active');
                        $btn.html($btn.html().replace('关注', '已关注'));
                    } else {
                        $btn.removeClass('active');
                        $btn.html($btn.html().replace('已关注', '关注'));

                    }
                } else {
                    x.pop_msg(d.msg, $btn);
                }
            },
            complete: function() {
                $btn.removeClass('dis');
            }
        });
    };
    x.pop_msg = function(t, $btn, is_fail, fn){
        var $m = $('<div class="m_all_msg"><div class="msg_cner"></div><div class="msg_txt t_y">' + t + '</div></div>');
        $m.appendTo('body');
        $m.addClass(is_fail ? 'm_err_a' : 'msg_suc_a');
        if($btn && $btn.length) {
            var t = $btn.offset().top, l = $btn.offset().left, w = $btn.width(), h = $btn.height(), mh = $m.height(),
                sc_t = document.body.scrollTop, cht = document.documentElement.clientHeight;
            if(sc_t + cht > t + h + mh + 10) {
                $m.css({ 'position' : 'absolute', 'left': (l + w / 2 - 5 ) + 'px', 'top': (t + h + 10) + 'px', 'marginLeft': -$m.width()/2 + 'px'});
            } else {
                $m.addClass('msg_top').css({ 'position' : 'absolute', 'left': (l + w / 2 - 5 ) + 'px', 'top': (t - mh - 10) + 'px', 'marginLeft': -$m.width()/2 + 'px'});
            }
            function bindScroll() { $m.hide(); }
            $win.on('scroll.rmmsg', bindScroll);
        } else {
            $m.find('.msg_cner').remove();
        }
        if(typeof fn != 'undefined') {
            fn.apply( $m, arguments );
        }
        $m.delay(3000).fadeOut(function() {
            $(this).remove();
        });
    };

    x.init_search_fm = function($el) {
        if($el.length == 0) return 0;
        var $holder = $el.find('.placeholder'), $input = $el.find('.sch_txt'), $label = $el.find('.key_wrd');
        if($input.val()) {
            $holder.css('display', 'none');
            $label.css('display', 'none');
        }
        $holder.on('click', function() {
            $holder.css('display', 'none');
            $input.focus();
        });
        $input.on('focus', function() {
            $holder.css('display', 'none');
            $label.css('display', 'none');
        }).on('keyup', function() {
            $holder.css('display', 'none');
            $label.css('display', 'none');
        }).on('blur', function() {
            if(this.value == '') {
                $holder.css('display', 'block');
                $label.css('display', 'block');
            }
        });
    }
    x.init_coupon_tab = function() {
        $('body').on('click', '.coupons .coupon_nav .itm', function() {
            var $t = $(this), on = 'on', i = 0;
            if(!$t.is('.' + on)) {
                $t.addClass('on').siblings().removeClass('on');
                i = Math.floor($t.index() / 2)
                $('.coupon_detail .coup_itm').addClass('none').eq(i).removeClass('none');
            }
        });
    }

    x.update_user_top = function() {
        if(x.user.id) {
            var dm = $('.main_logo').attr('href').replace(/\/$/,'') || '';
            var city = x.cookie.get('baihe_city_short');
            if (city == '') {
                city = 'bj';
            }
            $('#u_top_area').html(TPL_USR_AREA.replace('MOBILE', x.user.mobile_show).replace("_DOMAIN_", dm).replace('_CITY_', city));

        }
    }
    x.init_friends = function() {
        var $c = $('#frd_ctnt'), $n = $('#frd_nv');
        if($c.length && $n.length) {
            function make_links(d) {
                var s = '', i = 0;
                for(i; i < d.length; i++) {
                    if(d[i]) {
                        s += '<span><a class="a_6" href="//'+ d[i]['url'].replace('http://', '')+'" target="_blank" title="'+d[i]['name']+'">'+d[i]['name']+'</a></span>';
                    }
                }
                $c.html(s);
            }
            function bind_actions(d) {
                var　$as = $n.find('.itm a'), t = this;
                var CITY_CODE = {
                    '110000': 'bj',
                    '120000': 'tj',
                    '310000': 'sh',
                    '320100': 'nj',
                    '610100': 'xa',
                    '510100': 'cd',
                    '530100': 'km',
                    '440300': 'sz'
                };
                $as.on('mouseover', function() {
                    var $t = $(this);
                    if($t.parent().not('.on')) {
                        $t.parent().addClass('on').siblings().removeClass('on');
                        var d1 = t[$t.attr('data-lk')], isLinks = x.isArray(d1);
                        if(isLinks) {
                            make_links(d1);
                        } else {
                            make_links(d1[CITY_CODE[x.get_city_code()]] || []);
                        }
                    }
                });
            }
            x.get_friend_links(make_links, bind_actions);
        }
    }
    x.init_share_module = function() {
        var hf = encodeURIComponent(window.location.href), tt = encodeURIComponent(document.title);
        $('.bds_tsina').attr('href', 'http://service.weibo.com/share/share.php?url=' + hf + '&title=' + tt).attr('target', '_blank');
        $('.bds_tqq').attr('href', 'http://share.v.t.qq.com/index.php?c=share&a=index&url=' + hf + '&title=' + tt).attr('target', '_blank');
        $('.bds_tqzone').attr('href', 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=' + hf + '&desc=' + tt).attr('target', '_blank');
    }
    x.get_friend_links = function(make_links, bind_actions) {
        $.ajax({
            url: ($('#frd_nv').attr('data-ajax_domain')) + x.API_PRE + 'getFoot',
            dataType: 'jsonp',
            cache: true,
            success: function(d) {
                var a = $.map(d.hot_citys, function(k, v) {
                    return {'name': v, 'url': k};
                });
                function tidy_items(o) {
                    $.each(o, function(k, v) {
                        v = $.map(v, function(v1, k1) {
                            return {'name': Object.keys(v1)[0], 'url': v1[Object.keys(v1)[0]] };
                        })
                        o[k] = v;
                    });
                }
                d.hot_citys = a;
                tidy_items(d.hssy);
                tidy_items(d.hyjd);
                tidy_items(d.hqfw);
                make_links(d.friend);
                bind_actions.call(d);
            }
        });
    }
    x.yykd_list_query = function(obj) {
        var defaultObj = {
            url: x.API_PRE + x.APIS.yykd_list,
            dataType: 'json',
            fail: function() {
                x.pop_msg('请求API出错，请稍后再试');
            }
        };
        $.ajax( $.extend(true, defaultObj, obj) );
    };
    x.yhj_list_query = function(obj) {
        var defaultObj = {
            url: x.API_PRE + x.APIS.yykd_list,
            dataType: 'json',
            fail: function() {
                x.pop_msg('请求API出错，请稍后再试');
            }
        };
        $.ajax( $.extend(true, defaultObj, obj) );
    };
    x.yhj_login_query = function(obj) {
        var defaultObj = {
            url: x.API_PRE + x.APIS.yhj_login,
            dataType: 'json',
            fail: function() {
                x.pop_msg('请求API出错，请稍后再试');
            }
        };
        $.ajax( $.extend(true, defaultObj, obj) );
    };
    x.login_query = function(obj) {
        var defaultObj = {
            url: x.API_PRE + x.APIS.login,
            data: {
                traceID: 12,
                systemID: 2
            },
            dataType: 'json',
            fail: function() {
                x.pop_msg('请求API出错，请稍后再试');
            }
        };
        $.ajax( $.extend(true, defaultObj, obj) );
    };
    x.get_phone_show = function(mobile) {
        return mobile.substr(0, 3) + '*****' + mobile.substr(8);
    }
    x.query_rsv = function(data, callback, beforeSend) {
        $.ajax({
            url: x.API_PRE_INNER + x.APIS.addReserve,
            beforeSend: beforeSend,
            data: $.extend(true, {traceID: 12, systemID: 2}, data),
            dataType: 'json',
            success: callback,
            fail: function() {
                x.pop_msg('请求API出错，请稍后再试');
            }
        });
    };
    x.query_xsyLog = function(data, callback, beforeSend) {
        $.ajax({
            url: x.API_PRE_INNER + x.APIS.addXSYLog,
            beforeSend: beforeSend,
            data: $.extend(true, {traceID: 12, systemID: 2}, data),
            dataType: 'json',
            success: callback,
            fail: function() {
                console.log('请求api异常.');
            }
        });
    };
    x.msg_query = function(obj) {
        var defaultObj = {
            url: x.API_PRE + x.APIS.send_code,
            data: {
                traceID: 12,
                systemID: 2
            },
            dataType: 'json',
            fail: function() {
                x.pop_msg('请求API出错，请稍后再试');
            }
        };
        $.ajax( $.extend( defaultObj, obj ) );
    };
    x.check_input = function($t, reg, errmsg, forceInvalid) {
        var b = true;
        if($t && $t.length) {
            if($t.val() !== $t.attr('data-default') || $t.val() !== '') {
                if(forceInvalid) {
                    b = false;
                } else {
                    b = reg.test($t.val());
                }
                $t.parent()[b ? 'removeClass' : 'addClass']('invalid');
                if(!b) {
                    $t.parent().find('.ctr_err').text(errmsg);
                }
                return b;
            }
        } else {
            return true;
        }
    };

    x.m_login = function(fn) {
        $('body').append(TPL_LOGIN);
        var $m_login = $('#m_login')
            , $u_phone = $m_login.find('#lg_u_phone')
            , $u_radm = $m_login.find('#lg_u_radm')
            , $u_get_radm = $m_login.find('#lg_get_radm')
            , $u_sub = $m_login.find('#lg_sub')
            , sendCount
            , check_login_fm = function() {
            var b1 = x.check_input($u_phone, x.regs.mobile, err_msgs.mobile),
                b2 = x.check_input($u_radm, x.regs.mob_vrf, err_msgs.mob_vrf);
            return b1 && b2;
        };

        $m_login.on('click', '.modal_close', function() {
            $m_login.remove();
            clearInterval(sendCount);
        });
        $u_phone.on('blur', function() {
            x.check_input($(this), x.regs.mobile, err_msgs.mobile);
        });
        $u_radm.on('blur', function() {
            x.check_input($(this), x.regs.mob_vrf, err_msgs.mob_vrf);
        });
        $u_get_radm.on('click', function() {
            if($u_get_radm.is('.' + DIS)) return ;
            var bl = x.check_input($u_phone, x.regs.mobile, err_msgs.mobile);
            if(bl) {
                x.msg_query({
                    data: {
                        params: JSON.stringify({
                            mobile: $u_phone.val(),
                            appId: 7,
                            isCheck: ($('#login_3d').is(':checked') ? 1 : 0),
                            apver: '1.0.0'
                        })
                    },
                    beforeSend: function() {
                        $u_get_radm.addClass(DIS).html('发送中...');
                    },
                    success: function(data) {
                        if((typeof data !== 'undefined' && data !== null ? data.code : void 0) === 200) {
                            var t = 60;
                            sendCount = setInterval(function() {
                                t--;
                                if(t > 0) {
                                    $u_get_radm.addClass(DIS).html(t + '秒');
                                } else {
                                    clearInterval(sendCount);
                                    $u_get_radm.removeClass(DIS).html( '获取动态码' );
                                }
                            }, 1000);
                        } else {
                            $u_get_radm.removeClass(DIS).html( '获取动态码' );
                            x.pop_msg(data.msg, $u_get_radm);
                        }
                    }
                });
            } else {
                return;
            }
        });
        $u_sub.on('click', function() {
            if($u_sub.is('.' + DIS)) {
                return ;
            } else {
                if(check_login_fm()) {
                    $u_sub.addClass(DIS).html('登录中...');
                    x.login_query({
                        data: {
                            params: JSON.stringify({
                                mobile: $u_phone.val(),
                                appId: 7,
                                apver: '1.0.0',
                                verifyCode: $u_radm.val()
                            })
                        },
                        success: function(data) {
                            if((typeof data !== 'undefined' && data !== null ? data.code : void 0) === 200) {
                                data.data.result.mobile = $u_phone.val();
                                x.set_user(data.data.result, $('#login_3d').is(":checked"));
                                $m_login.addClass('none');
                                fn && fn.call();
                                setTimeout(function() {
                                    $m_login.remove();
                                },1000);

                                //登陆成功后，调用mall.hunli.baihe.com  进行自动登录
                                x.mallLogin(data.data.result.mobile);
                            } else {
                                x.pop_msg(data.msg, $u_sub);
                            }

                        },
                        complete: function() {
                            $u_sub.removeClass(DIS).html('登录');
                        }
                    });
                }
            }
        });
    }
    //调用mall 进行自动登录商城
    x.mallLogin=function(mobile){
        //设置支付弹窗的手机号码
        $('#pay_mobile').text('短信发送电话：' + mobile.substr(0,3) + '*****' + mobile.substr(-3));
        $.ajax({url:"/mall_hunli/index.php/simple/login_reg/mobile/"+mobile,async:true});
    }
    x.autoFillUPhone = function() {
        $('.j_uphone_autofill').val(x.user.mobile);
    }
    x.set_user = function(rs, save3d) {
        var d = new Date();
        d.setTime(d.getTime() + 1000 * rs.seconds);
        x.user.id = rs.userid;
        x.user.icon = rs.headPicUrl;
        x.user.mobile = rs.mobile;
        x.user.mobile_show = x.get_phone_show(rs.mobile);
        x.update_user_top();
        x.autoFillUPhone();
        x.cookie.set('baihe_uid', rs.userid, d, '/', x.DEFAULT_DOMAIN);
        x.cookie.set('baihe_mobile_true', rs.mobile, d, '/', x.DEFAULT_DOMAIN);
        x.cookie.set('baihe_mobile_number', x.user.mobile_show, d, '/', x.DEFAULT_DOMAIN);
        x.cookie.set('HLAuthCookie', rs.cookieVal, d, '/', x.DEFAULT_DOMAIN);
    }

    x.m_logout = function() {
        $('body').append(TPL_LOGOUT);
        var $out = $('#m_logout');
        $out.on('click', '.modal_close, #log_out_a2', function() {
            $out.remove();
        }).on('click', '#log_out_a1', function() {
            x.cookie.set('baihe_uid', '', new Date(0), '/', x.DEFAULT_DOMAIN);
            x.cookie.set('baihe_mobile_number', '', new Date(0), '/', x.DEFAULT_DOMAIN)
            x.cookie.set('HLAuthCookie', '', new Date(0), '/', x.DEFAULT_DOMAIN)
            x.cookie.set('HLAuthCookie', '', new Date(0), '/', x.BAIHE_DOMAIN)
            x.cookie.set('baihe_mobile_true', '', new Date(0), '/', x.BAIHE_DOMAIN)
            x.cookie.set('hlm_user_id','',new Date(0),'/',x.DEFAULT_DOMAIN);
            x.cookie.set('hlm_username','',new Date(0),'/',x.DEFAULT_DOMAIN);
            x.cookie.set('hlm_head_ico','',new Date(0),'/',x.DEFAULT_DOMAIN);
            x.cookie.set('hlm_last_login','',new Date(0),'/',x.DEFAULT_DOMAIN);
            x.cookie.set('hlm_user_pwd','',new Date(0),'/',x.DEFAULT_DOMAIN);
            x.cookie.set('hlm_loginName','',new Date(0),'/',x.DEFAULT_DOMAIN);
            root.location.reload();
        });
    }

    x.mimit_select = function($btn, $target) {
        if($btn.length === 0) return;
        var $v = $btn.find('.selector_rs'), $dn = $btn.find('.dn_mod'), key = $btn.attr('data-key');
        function set_on( $me ) {
            if ($me.html() == '不限桌数' || $me.html() == '不限价格') {
                $target && $target.length && $target.attr('data-' + key, $me.html()) && $target.attr('data-' + key +'-key', "");
            } else {
                $target && $target.length && $target.attr('data-' + key, $me.html()) && $target.attr('data-' + key +'-key', $me.attr("data-key"));
            }
            $v.html($me.html());
            $me.addClass('on').siblings().removeClass('on');
            $btn.removeClass('opened');
        }

        set_on($dn.find('.on'));

        $btn.on('click', '.hv_hold', function() {
            $btn.addClass('opened');
        }).hover(function(){
        }, function() {
            $btn.removeClass('opened');
        }).on('click', '.dn_mod a', function() {
            set_on($(this));
        });
    }
    x.init_lunar_day = function($el) {
        if($el.length) {
            $.ajax({
                url: '/static/js/lunar.js',
                dataType: 'script',
                cache: true
            });
        }
    }

    x.bind_hy_pop = function($pop) {
        $pop.data('is_binded', true);
        $pop.on('click', '.pop_x', function() {
            $pop.addClass('none');
            $('body').removeClass('no_scroll');
        }).on('click', '.a_lft', function() {
            var pi = $pop.data('data-groups').pi - 1;
            x.generate_hy_pop_info.call($pop, $pop.data('data-groups').gi, pi);
        }).on('click', '.a_rgt', function() {
            var pi = $pop.data('data-groups').pi + 1;
            x.generate_hy_pop_info.call($pop, $pop.data('data-groups').gi, pi);
        });
    }
    x.get_hy_pop_data = function($el) {
        var o = {group: [], infors: {it_2: [], it_3: []}, gi: 0, pi: 0};
        $el.find('.hall_i').each(function(k, v) {
            var $t = $(this);
            var obj = {name: $t.find('.hd').html(), it_1: [], it_2: '', it_3: '', price: $t.attr('data-price'), gid: $t.attr('data-gid')};
            $t.find('.itm').each(function() {
                obj.it_1.push(this.innerHTML);
            });
            obj.it_2 = $t.find('.it_2_l').html();
            obj.it_3 = $t.find('.it_3_l').html();
            obj.pics = $t.find('.pic img').attr('data-pics').split(';');
            o.group.push(obj);
        });
        return o;
    }
    x.generate_hy_pop_info = function(gi, pi) {
        var t = this, data = t.data('data-groups'), gcnt = data.group.length;

        function auto_set_gi_pi() {
            var pcnt = data.group[gi]['pics'].length;
            if(pi >= pcnt) {
                pi = 0;
                gi++;
                if(gi >= gcnt) {
                    gi = 0;
                }
            } else if(pi < 0) {
                gi--;
                if(gi < 0) {
                    gi = gcnt - 1;
                }
                pi = data.group[gi]['pics'].length - 1;
            }
            data.pi = pi; data.gi = gi;
        }
        auto_set_gi_pi();

        function make_actions() {
            var i, c = 0;
            for(i = 0; i < data.group.length; i++) {
                c += data.group[i].pics ? data.group[i].pics.length : 0;
            }
            if(c <= 1) {
                t.find('.a_lft, .a_rgt').remove();
            }
        }

        function make_infors() {
            $('#pop_it_2').html(data.group[gi].it_2);
            $('#pop_it_3').html(data.group[gi].it_3);
        }
        function make_t1() {
            var s = '', i, arr;
            arr = data.group[data.gi]['it_1'];
            for(i = 0; i < arr.length; i++) {
                arr[i] && (s += '<div class="it_1"><span class="t_3">' + arr[i].split("：")[0] + '：</span>' + arr[i].split('：')[1] + '</div>');
            }
            $('#pop_it_1').html(s);
        }
        function make_hd() {
            t.find('.hd span').html(data.group[data.gi]['name']).attr('title', data.group[data.gi]['name']);
            t.find('#hy_pic_pop_price').html(data.group[data.gi]['price'] || t.find('#hy_pic_pop_price').attr('data-prc_default'));
        }
        function make_pic() {
            t.find('#hy_pop_img').attr('src', data.group[data.gi]['pics'][data.pi]);
        }
        function make_hall_gid() {
            $('#pop_hall_rsv').attr('data-gid', data.group[data.gi]['gid']);
        }
        make_hd();
        make_t1();
        make_infors();
        make_pic();
        make_actions();
        make_hall_gid();
    }
    x.init_hy_pop = function($el) {
        if(!$el || $el.length == 0) return;
        var $pop = $('#hy_pic_pop');
        if(!$pop.data('is_binded')) {
            x.bind_hy_pop($pop.data('data-groups', x.get_hy_pop_data($el)));
        }
        $el.on('click', '.hall_i .pic img', function() {
            $pop.removeClass('none');
            $('body').addClass('no_scroll');
            x.generate_hy_pop_info.call($pop, $(this).closest('.hall_i').index(), 0);
        });
    }
    x.get_special_token_string = function($btn) {
        var attrs = ['zone', 'budget', 'tables'];
        var s = '', i, tmp;
        tmp = $btn.attr('data-' + attrs[0]) || false;
        if(tmp) {
            s += '<span class="t_y">' + tmp + '</span>';
        }
        tmp = $btn.attr('data-' + attrs[1]) || false;
        if(tmp) {
            s += '<span class="t_6">价格'+ (tmp == '不限' ? '' : '为') +'</span><span class="t_y">' + tmp + '</span>';
        }
        tmp = $btn.attr('data-' + attrs[2]) || false;
        if(tmp) {
            s += '<span class="t_6">，</span>' + (tmp == '不限' ? '<span class="t_y">不限桌数</span>' : '<span class="t_6">能容纳</span><span class="t_y">'+tmp+'</span>');
        }
        s += '<span class="t_6">的婚宴场地</span>';
        s += '<br/><span class="t_6">共有100家婚宴场地符合您的要求</span>';
        return s;
    }

    x.init_cookie_user = function() {
        x.user.id = x.cookie.get('baihe_uid');
        x.user.mobile = x.cookie.get('baihe_mobile_number');
        x.user.mobile1 = x.cookie.get('baihe_mobile_true');
		//console.log('得到cookie------'+x.user.mobile1);
        if(x.user.mobile) {
            x.user.mobile_show = x.get_phone_show(x.user.mobile);
        }
        x.update_user_top();
    }
    x.get_sub_tpl = function(tpl_name) {
        return $.get('/static/sub_tpl/' + tpl_name);
    };
    x.init_get_fangan = function($btn) {
        if($btn && $btn.length) {
            var getTPL = x.get_sub_tpl('fangan.html'), step = 0;
            getTPL.success(function(d) {
                $(d).appendTo('body').removeClass('none');
                bind_fangan($(d), $btn);
            });
            function bind_fangan($modal, $source) {
                step = 1;
                $modal.on('click', '.modal_close', function() {
                    $modal.remove();
                });
                x.get_province_city_zone( $('#fa_place_rs') );
            }
        }
    }
    x.get_cur_subsite = function() {
        return location.hostname.replace(x.DEFAULT_DOMAIN, '');
    }

    x.get_city_code = function() {
        return x.cookie.get('baihe_city') || '110000';
    }

    x.init_citie_switch = function($city_switcher) {
        $city_switcher = $city_switcher || $('#city_switcher');
        var t  = x.get_cur_subsite();
        function get_cur_sub_cn(t) {
            $.each(x.CITIES, function(k, v) {
                $.each(v, function(k1, v1) {
                    $.each(v1, function(k2, v2) {
                        if(k2 == t) {
                            $city_switcher.find('.cur_city').html($city_switcher.find('.cur_city').html() + v2);
                        }
                    });
                });
            });
        }
        get_cur_sub_cn(t);
    }

    x.init_search_collapse = function($s) {
        if($s.length == 0) { return ; }
        function close($t) {
            $t.find('.sch_tags').css('height', '30px');
            $t.find('.j_collapse').html('更多<span class="icon_a_down"></span>');
            $t.data('is_open', false);
        }
        function open($t) {
            $t.find('.sch_tags').css('height', 'auto');
            $t.find('.j_collapse').html('收起<span class="icon_a_up"></span>');
            $t.data('is_open', true);
        }
        setTimeout(function() {
            $s.find('> .item').each(function() {
                var $t = $(this);
                var b = $t.find('.sch_tags').height() < $t.find('.ruler').height();
                $t[b ? 'addClass' : 'removeClass']('multi_line');
                if(b) {
                    var $on = $t.find('.on');
                    if($on.length) {
                        if($on.position().top > 10) {
                            open($t);
                        }
                    }
                    $t.on('click', '.j_collapse', function() {
                        if($t.data('is_open')) {
                            close($t);
                        } else {
                            open($t);
                        }
                    });
                } else {
                    $t.find('.j_collapse').remove();
                }
            });
        }, 1000);
    }

    x.store_scroll = function($target, $placer) {
        if($placer.length == 0 || $target.length == 0) return;
        var w_top = $win.scrollTop(), b = $placer.offset().top < w_top;
        $target[b ? 'removeClass' : 'addClass']('none');
        $placer.find('.nv')[!b ? 'removeClass' : 'addClass']('fixed');
        var $as = $placer.find('.nv a'), i = 0, a_index = 0, $ach;
        for(i = 0; i < $as.length; i++) {
            $ach = $($as.eq(i).attr('data-anchor'));
            if($ach.length) {
                if(w_top >= $ach.offset().top) {
                    a_index++;
                } else {
                    break;
                }
            }
        }
        $as.removeClass('on').eq(a_index - 1 < 0 ? 0 : a_index -1).addClass('on');
    }

    x.case_scroll = function($el) {
        if($el.length == 0) return;
        var b = $el.offset().top < $win.scrollTop();
        $el.find('.case_store')[!b ? 'removeClass' : 'addClass']('fixed');
    }

    x.init_anchor_click_scroll = function($el, $placer) {
        if($el && $el.length) {
            $el.on('click', 'a', function() {
                var $t = $(this), t2 = $($t.attr('data-anchor')).offset().top;
                $win.scrollTop(t2);
                $t.siblings().removeClass('on').end().addClass('on');
            });
        }
    }

    x.init_ind_lp_tab = function($nv, $tc) {
        if($nv.length) {
            $nv.hover(function() {
                $nv.removeClass('on');
                $tc.addClass('none').eq($(this).addClass('on').index()).removeClass('none');
            }, function() {
            });
        }
    }

    x.init_acts_modal = function() {
        var $acts_modal = $('#acts_modal');
        if($acts_modal.length === 0) return;
        var $hv_msg = $('<div class="hv_msg none">点击查看优惠详情<span class="cn_tp"><span class="c_1"></span><span class="c_2"></span><span class="c_3"></span><span class="c_4"></span><span class="c_5"></span><span class="c_6"></span></span></div>');

        function show_modal() {
            $acts_modal.removeClass('none');
        }
        function hover_pop_show() {
            var $t = $(this);
            $hv_msg.css({left: ($t.offset().left + 86 + $t.find('.lk').width() / 2) + 'px', top: ($t.offset().top + $t.height() + 5) + 'px' }).removeClass('none');
        }
        function hover_pop_hide() {
            $hv_msg.addClass('none');
        }
        function hide_modal() {
            $acts_modal.addClass('none');
        }
        function set_nav_on(i) {
            $acts_modal.find('.tab_n_i').removeClass('on').eq(i).addClass('on');
            $acts_modal.find('.tab_c_i').addClass('none').eq(i).removeClass('none');
        }
        $acts_modal.on('click', '.modal_closer a', hide_modal);
        $acts_modal.on('click', '.tab_n_i', function() {
            if($(this).is('.on')) return;
            set_nav_on($(this).index());
        });
        $hv_msg.appendTo('body');
        $('body').on('click', '.j_acts', function() {
            show_modal();
            set_nav_on(+$(this).attr('data-i'));
        }).find('.j_acts').hover( hover_pop_show, hover_pop_hide);
    }
    x.init_hy_price = function() {
        var $hy = $('#hy_prc_sch');
        if($hy.length == 0) return;
        var $hy_e = $('#hy_prc_err'), $p1 = $hy.find('#hy_price1'), $p2 = $hy.find('#hy_price2'), rg = /^0{1,1}$|^[1-9]\d*$/;
        $hy.on('click', '#hy_prc_a', function() {
            var p1 = $p1.val(), p2 = $p2.val(), pn = $hy.siblings('a').eq(0).attr('href'), rprice = /p[0-9]+[_0-9]*/;
            if(p1 == '' || p2 == '') {
                $hy_e.html('* 请输入至少一个数字');
            } else if(rg.test(p1) && rg.test(p2)) {
                if(p1 * 1 >= p2 * 1) {
                    $hy_e.html('* 最大价格应大于最小价格');
                } else {
                    $hy_e.html('');
                    pn = pn.replace(rprice, 'p' + p1 + '_' + p2);
                    location.href = pn;
                }
            } else {
                $hy_e.html('* 请输入正确数字');
            }
        });
    }

    x.init_hy_list_map = function() {
        if(!document.getElementById('hy_bar_map')) return;
        var script = document.createElement('script');
        script.type = 'text/javascript';
        script.src = 'https://api.map.baidu.com/api?v=2.0&ak=6d416d98471c05464df00dda8f6524a5&callback=xlk.hy_list_map_callback';
        document.body.appendChild(script);
    }
    x.hy_list_map_callback = function() {
        if(typeof BMap == 'undefined') return;
        var mp = new BMap.Map("hy_bar_map");
        var pt = new BMap.Point(117.310301, 40.183797);
        var mp2;
        var pts = [], lbs = [], mks = [];
        var pts2 = [], lbs2 = [], mks2 = [];
        var $gL = $('#bar_map_holder'), $mp = $('#map-pan'), $gi = $('#jd_lst .jd_i'), $w = $(window),
            $a = $('#bar_map_full'), $dia = $('#mp_modal'), $bmp = $('#hy_bar_map'), $b = $('body'),
            mph = $bmp.height();
        function set_pts_lbs(pts, lbs, mks) {
            var gItms = $('.jd_i');
            var i = 0;
            for(i; i< gItms.length; i++) {
                var tmp, pt, lb, mkr;
                tmp = gItms[i].getAttribute('data-coordinates').split(',');
				//坐标值
                pt = new BMap.Point(+tmp[1], +tmp[0]);
				//创建label标签 设置偏移量
                lb = new BMap.Label(gItms.eq(i).find('.jd_pic').attr('data-title'),{offset:new BMap.Size(0,-20)});
				//设置经纬度
                mkr = new BMap.Marker(pt);
				//为标注添加一个标签
                mkr.setLabel(lb);
                pts.push(pt);
                lbs.push(lb);
                mks.push(mkr);
            }
        }

        function addMarker(map, mks) {
            var i;
            for(i = 0; i < mks.length; i++) {
                map.addOverlay(mks[i]);
            }
        }

        function map_pan() {
            var t = $gL.offset().top, t1 = $w.scrollTop(), b = t1 > t;
            $mp[b ? 'addClass' : 'removeClass']('fixed');
            if(b) {
                mp.panTo(pts[get_i()]);
            } else {
                mp.panTo(pts[0]);
            }
        }
        function get_i() {
            var t1 = $w.scrollTop(), i;
            for(i = 0; i < $gi.length; i++) {
                var ot = $gi.eq(i).offset().top, x1 = ot - t1, hi = $gi.eq(i).height();
                if(i == 0 && x1 >= mph) {
                    return i;
                }
                if( x1 < mph && x1 >= mph - hi - 20) {
                    return i;
                }
                if(i == $gi.length - 1) {
                    return i;
                }
            }
        }

        function init_mp2() {
            $dia.removeClass('none');
            if(!mp2) {
                mp2 = new BMap.Map("mp_big");
                mp2.enableScrollWheelZoom();
                mp2.centerAndZoom(pts[0], 14);
                var top_left_navigation = new BMap.NavigationControl();
                mp2.addControl(top_left_navigation);
                set_pts_lbs(pts2, lbs2, mks2);
                addMarker(mp2, mks2);
            }
            get_i();
            mp2.panTo(pts[get_i()]);
        }

        set_pts_lbs(pts, lbs, mks);
        mp.centerAndZoom(pts[0], 14);
        mp.enableScrollWheelZoom();
        addMarker(mp, mks);

        $gi.on('mouseover', function() {
            mp.panTo(pts[$(this).index()]);
        });

        $w.on('scroll', map_pan);
        $a.on('click', function() {
            init_mp2();
        });

        $dia.on('click', '.modal_closer', function() {
            $dia.addClass('none');
        });
        map_pan();
    }
    x.init_subscribe = function( $fms ) {
        $fms.each(function() {
            var $fm = $(this),
                $input = $fm.find('.add_phone_input'),
                $btn = $fm.find('.add_phone_send'),
                ING = false;
            $btn.on('click', function() {
                if(ING) return;
                var phone = $input.val();
                if(!x.regs.mobile.test(phone) ) {
                    x.pop_msg1();
                    return;
                }
                var param = {
                    "sid": $(this).attr('data-sid'),
                    "phone": phone
                };
                if(x.user.id) { param.uid = x.user.id; }
                var subs = x.ajax_subscribe(param, $btn, $input);
                ING = true;
                subs.complete(function() {
                    ING = false;
                });


            });
        });
    }
    x.ajax_subscribe = function(param, $btn, $input) {
        var api = '/outer/setting/addSubscribe?params=';
        return $.ajax({
            url: api + JSON.stringify(param),
            dataType: 'json',
            success: function(data) {
                if(data.code == 200) {
                    x.init_hy_pop_suc($btn);
                    $input.val('');
                }
            }
        });
    }
    x.pop_msg1 = function(msg, tmr, fn) {
        var $p = $('<div class="pop_msg1" style="position: fixed; z-index: 100; top: 50%; left: 0; right: 0; margin-top: -40px; font-size: 18px; color:#fff; text-align: center; "><div class="" style="display: inline-block; position: relative; z-index: 101; padding: 35px 40px; "><span class="bg" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background-color:#000; opacity: 0.7; filter:alpha(opacity=70)\\9; z-index: 101; border-radius: 10px;"></span><span style="position: relative; z-index: 102; white-space: nowrap;">' + ('请输入正确是手机号码' || msg) + '</span></div></div>');
        $p.appendTo('body');
        setTimeout(function() {
            $p.remove();
            fn && fn();
        }, 3000 || tmr)
    }

    root.xlk = x;

})(window);

(function(root) {
    'use strict';
    //定义xlk变量为全局变量，用来定义本站下的所有自定义功能
    var X = root.xlk || {};
    var SFull = function(conf) {
        if(!conf) return;
        this.$el = conf.$el; //传入slider元素的jquery对象
        if(this.$el.length == 0) return;
        //下边是可选参数
        this.ITM = '.s_itm' || conf.ITM; //item 选择器
        this.LIST = '.slider_lst' || conf.LIST; //list 选择器
        this.A_LEFT = '.lft' || conf.A_LEFT; //左移动按钮选择器
        this.A_RIGHT = '.rgt' || conf.A_RIGHT; //右移动按钮选择器
        this.TIMEOUTCNT = 5000 || conf.TIMEOUTCNT; //自动移动一个的间隔时间
        this.clone_callback = conf.clone_callback || null;//对clone元素进行其他的后续操作的回调函数

        this.is_hoving = false; //当前是否在hover中，用于停止自动滑动
        this.is_moving = false; //当前是否在移动中，用于取消掉连续的点击移动
        this.timeout = null;//自动的timeout变量
        this.ml = 0; //偏移量
        this.page_width = this.$el.width(); //计算页面的宽度，用于计算移动偏移量
        this.i_width = this.$el.find(this.ITM).width(); //获取单个元素的宽度，便于使用
        this.$l  = this.$el.find(this.LIST); //将list取来备用，以后方便引用
        this.cnt = this.$el.find(this.ITM).length; //cnt用于判断该clone的遍数

        this.init();
    };
    var SF_pro = SFull.prototype;
    SF_pro.init = function() {
        this.calcu_ml();
        this.make_pager();
        this.clone_itms();
        this.bind_events();
        this.auto_move();
    };
    SF_pro.make_pager = function() {
        if(this.cnt > 1) {
            var s = '<div class="s_nv">', i = 0;
            for(i; i < this.cnt; i++) {
                s += '<a href="javascript:void(0);" class="' + (i == 0 ? 'on': '') + '"></a>'
            }
            s += '</div>';
            var $s = $(s).insertAfter(this.$l);
            $s.css('marginLeft', -$s.width() / 2 + 'px');
        } else {
            this.$el.find('.act').remove();
        }
    }
    SF_pro.calcu_ml = function() {
        this.page_width = this.$el.width(); //计算页面的宽度，用于计算移动偏移量
        this.ml = this.page_width * 0.5 - 1.5 * this.i_width; //计算页面偏移量
        this.$l.css({"marginLeft" : this.ml});
    };
    SF_pro.clone_itms = function() {
        if(this.cnt == 1) {
            var $itm_clone = this.$l.find(this.ITM).clone();
            $itm_clone = $itm_clone.add(this.$l.find(this.ITM).clone());
        } else if(this.cnt == 2) {
            var $itm_clone = this.$l.find(this.ITM).clone().add(this.$l.find(this.ITM));
        } else {
            var $itm_clone = this.$l.find(this.ITM).clone();
        }
        this.$clones = $itm_clone;
        if(this.clone_callback) {
            this.clone_callback($itm_clone);
        }
        $itm_clone.appendTo(this.$l);
        $itm_clone.last().prependTo(this.$l);
    };
    SF_pro.bind_events = function() {
        var _t = this, $el = this.$el;
        $el.on('click', _t.A_LEFT, function() {
            _t.move(-1);
        }).on('click', _t.A_RIGHT, function() {
            _t.move(1);
        }).on('click', '.s_nv a', function() {
            var i = $(this).index(), ci = _t.get_cur_i();
            if(i !== ci) {
                _t.move( i - ci );
            }
        });
        $el.hover(function() {
            _t.is_hoving = true;
            clearTimeout(_t.timeout);
        }, function() {
            _t.is_hoving = false;
            _t.auto_move();
        });
        $(window).on('resize', function() {
            clearTimeout(_t.timeout);
            _t.calcu_ml();
            setTimeout(function() {
                _t.auto_move();
            }, 600);
        });
    };
    SF_pro.get_cur_i = function() {
        return this.$el.find('.s_nv a.on').index();
    }
    SF_pro.set_on = function(n) {
        if(n >= this.cnt) {
            n = 0;
        } else if( n < 0 ) {
            n = this.cnt - 1;
        }
        this.$el.find('.s_nv a').removeClass('on').eq(n).addClass('on');
    }
    SF_pro.move = function(n) {
        n = n || 1;
        if(this.is_moving) return;
        var _t = this, $l = _t.$l, i = Math.abs(n);
        _t.is_moving = true;
        if(n > 0) {
            $l.animate({"marginLeft" : (_t.ml - _t.i_width * n) + "px"}, 300, function(){
                $l.find(_t.ITM + ':lt(' + n + ')').appendTo($l);
                $l.css('marginLeft', _t.ml);
                _t.set_on(_t.get_cur_i() + n);
                _t.is_moving = false;
                (!_t.is_hovered) && _t.auto_move();
            });
        } else {
            for(i; i > 0; i--) {
                $l.find(_t.ITM).last().prependTo($l);
            }
            $l.css('marginLeft' ,_t.ml - _t.i_width * Math.abs(n) + 'px');
            $l.animate({"marginLeft" : _t.ml + "px"}, 300, function(){
                _t.set_on(_t.get_cur_i() + n);
                _t.is_moving = false;
                (!_t.is_hovered) && _t.auto_move();
            })
        }

    }
    SF_pro.auto_move = function() {
        var _t = this;
        if(_t.is_hoving || this.cnt < 2) return;
        clearTimeout(_t.timeout); //防止resize的时候重复多次调用
        _t.timeout = setTimeout(function() {
            _t.move(1);
        }, _t.TIMEOUTCNT);
    }

    var Slider1 = function(conf) {
        if(!conf) return;
        this.$el = conf.$el; //传入slider元素的jquery对象
        if(this.$el.length == 0) return;
        //下边是可选参数
        this.ITM = conf.ITM || '.s_itm'; //item 选择器
        this.ONCLASS = conf.ONCLASS || 'on'; //当前状态的class值
        this.A_LEFT = conf.A_LEFT || '.lft'; //左移动按钮选择器
        this.A_RIGHT = conf.A_RIGHT || '.rgt'; //右移动按钮选择器
        this.PAGER_ALIGN = conf.PAGER_ALIGN || 'center'; //
        this.TIMEOUTCNT = conf.TIMEOUTCNT || 3000 ; //自动移动一个的间隔时间
        this.$itm  = this.$el.find(this.ITM); //将list取来备用，以后方便引用
        this.CNT = this.$itm.length;
        this.timeout = null;
        this.i = 0;
        this.pager_el_inner = conf.pager_el_inner || '';
        this.init();
    };
    var S1_pro = Slider1.prototype;
    S1_pro.init = function() {
        if(this.CNT  <= 1) {
            this.remove_acts();
        } else {
            this.add_pager();
            this.bind();
            this.switchi();
        }
    };
    S1_pro.add_pager = function() {
        if(this.CNT > 1) {
            var s = '<div class="sld_pager"><div class="cv"></div>', i = 0;
            for(i; i< this.CNT; i++) {
                s += '<a href="javascript:void(0);" class="' + (i == 0 ? 'on' : '') + '">' + this.pager_el_inner + '</a>';
            }
            s += '</div>';
            var $s = $(s);
            this.$el.append($s);
            this.$ni = $s.find('a');
            if(this.PAGER_ALIGN == 'center') {
                $s.css('marginLeft', (-$s.width() / 2) + 'px');
            }
        }
    };
    S1_pro.remove_acts = function() {
        this.$el.find('.sld_pager, .act').remove();
    };
    S1_pro.bind = function() {
        var _t = this;
        _t.$el.on('click', '.rgt', function() {
            if(_t.is_moving) return;
            _t.is_moving = true;
            _t.i++;
            _t.switchi();
        }).on('click', '.lgt,.lft', function() {
            if(_t.is_moving) return;
            _t.is_moving = true;
            _t.i--;
            _t.switchi();
        }).on('click', '.sld_pager a', function() {
            if($(this).is('.on')) return ;
            _t.i = $(this).index() - 1;
            _t.switchi();

        }).hover(function() {
            _t.is_hoving = true;
            clearTimeout(_t.timeout);
        }, function() {
            _t.is_hoving = false;
            _t.auto_switch();
        });
    }
    S1_pro.auto_switch = function() {
        var _t = this;
        if(_t.is_hoving) return;
        _t.timeout = setTimeout(function() {
            _t.i++;
            _t.switchi();
        }, _t.TIMEOUTCNT);
    };
    S1_pro.switchi = function() {
        if(this.i < 0) {
            this.i = this.CNT - 1;
        } else if(this.i >= this.CNT) {
            this.i = 0;
        }
        this.$itm.removeClass(this.ONCLASS).eq(this.i).addClass(this.ONCLASS);
        this.$ni.removeClass(this.ONCLASS).eq(this.i).addClass(this.ONCLASS);
        var _t = this;
        setTimeout(function() {
            _t.is_moving = false;
            _t.auto_switch();
        }, 300);
    }

    X.slider_full_page = SFull;
    X.Slider1 = Slider1;
    root.xlk = X;
})(window);

//这里真正执行相关的业务相关功能
$(function() {

    //初始化cookieuser信息
    window.xlk.init_cookie_user();
    var $win = $(window);

    var slider_full = new window.xlk.slider_full_page({$el: $('#slider_full_page')});

    var sld = new window.xlk.Slider1({$el: $('#ban_wp')});
    var ban_cp = new window.xlk.Slider1({$el: $('#rec_ban'), PAGER_ALIGN: "left" });
    var ban_jd = new window.xlk.Slider1({$el: $('#ind_jd_ban'), PAGER_ALIGN: 'left'});
    var ban_hs = new window.xlk.Slider1({$el: $('#ind_hs_ban'), PAGER_ALIGN: 'left'});
    var ban_lp = new window.xlk.Slider1({$el: $('#ind_lp_ban'), PAGER_ALIGN: 'left'});
    var ban_coupon = new window.xlk.Slider1({$el: $('#ban_cp')});
	var ban_szt = new window.xlk.Slider1({$el: $('#ban_sy_zt')});
	var ban_sdt = new window.xlk.Slider1({$el: $('#ban_sy_dt')});
    var index_slider = new window.xlk.Slider1({$el: $('#m_slider_ind'), PAGER_ALIGN: "right", pager_el_inner: '<span></span>'});
    var ind_slider_hq_2 = new window.xlk.Slider1({$el: $('#m_slider_hq_2'), PAGER_ALIGN:"center"});
    var lst_ban = new window.xlk.Slider1({$el: $('#lst_ban'), TIMEOUTCNT: 5000});

    //store_list 页面去掉最后一个元素的底边
    $('#store_lst .store_i').last().addClass('last');

    //个人中心喜欢切换tab
    var my_fav_tab = function() {
        var $nv = $('#my_fav_nav'), ON = 'on';
        if($nv.length) {
            $nv.on('click', 'a', function() {
                var $i = $(this), isOn = $i.is('.' + ON), i = $i.index();
                if(isOn) return;
                $('#my_fav_l .u_tab_i').addClass('none').eq(i === 0 ? 0 : 1).removeClass('none');
                $nv.find('a').removeClass(ON);
                $i.addClass(ON);
            });
        }
    }


    $('body').on('focus', '.j_indefault', function() {
        if(this.value == this.getAttribute('data-default')) {
            this.value = '';
        }
    }).on('blur', '.j_indefault', function() {
        if(this.value === '') {
            this.value = this.getAttribute('data-default');
        }
    }).on('click', '#top_nv_lgn, #top_nv_reg', function() {
        xlk.m_login();
    }).on('click', '#u_top_logout', function() {
        xlk.m_logout();
    });


    if($('#store_scroll_bar').length) {
        xlk.store_scroll($('#store_scroll_bar'), $('#shp_nv_holder'));
        $win.scroll(function() {
            xlk.store_scroll($('#store_scroll_bar'), $('#shp_nv_holder'));
        });
    }
    if($('#case_store_holder').length) {
        xlk.case_scroll($('#case_store_holder'));
        $win.scroll(function() {
            xlk.case_scroll($('#case_store_holder'));
        });
    }


    if(jQuery.datetimepicker) {
        jQuery.datetimepicker.setLocale('zh');
    }


    //搜索的自动折叠隐藏行

    xlk.init_search_collapse($('#search_subs'));

    xlk.set_temp_user = function() {
        var d = new Date().getTime() + 30 * 60 * 60 * 24 * 1000;
        xlk.cookie.set('baihe_uid', '400000226', new Date(d), '/', xlk.DEFAULT_DOMAIN)
        xlk.cookie.set('baihe_mobile_number', '18622702328', new Date(d), '/', xlk.DEFAULT_DOMAIN)
    }


    $('body').on('click', '.j_gz', function() {
        xlk.add_gz($(this));
    }).on('click', '.j_like', function() {
        xlk.add_like($(this));
    }).on('click', '#bar_2top', function() {
        $win.scrollTop(0);
    });


    xlk.init_anchor_click_scroll($('#jd_scroll_anchors'), $('#store_placer'));

    xlk.set_div_style = function(div) {
        div.style.position = "absolute";
        div.style.backgroundColor = "#fff";
        div.style.borderRight = "1px solid #c4c7cd";
        div.style.borderBottom = "1px solid #c4c7cd";
        div.style.color = "#333";
        div.style.height = "18px";
        div.style.padding = "2px 8px";
        div.style.lineHeight = "18px";
        div.style.whiteSpace = "nowrap";
        div.style.MozUserSelect = "none";
        div.style.fontSize = "12px"
    }
    xlk.set_span_style = function(span) {
        span.style.maxWidth = '150px';
        span.style.whiteSpace = 'nowrap';
        span.style.overflow = 'hidden';
        span.style.textOverflow = 'ellipsis';
        span.style.display = 'block';
    }
    xlk.set_arrow_style = function(arrow) {
        arrow.style.background = "url(/static/imgs/mp_label_arrow.png) no-repeat";
        arrow.style.position = "absolute";
        arrow.style.width = "15px";
        arrow.style.height = "9px";
        arrow.style.bottom = "-9px";
        arrow.style.left = "50%";
        arrow.style.marginLeft = "-7px";
        arrow.style.overflow = "hidden";
    }
    xlk.addCustomerOverlay = function(map, pt, text) {
        var nIcon = new BMap.Icon('/static/imgs/mp_label.png', new BMap.Size(12,12));

        function ComplexCustomOverlay(point, text){
            this._point = point;
            this._text = text;
        }

        ComplexCustomOverlay.prototype = new BMap.Overlay();

        ComplexCustomOverlay.prototype.initialize = function(map){
            this._map = map;
            var div = this._div = document.createElement("div");
            div.style.zIndex = BMap.Overlay.getZIndex(this._point.lat);
            xlk.set_div_style(div);
            div.title = this._text;
            var span = this._span = document.createElement("span");
            xlk.set_span_style(span);
            div.appendChild(span);
            span.appendChild(document.createTextNode(this._text));
            var that = this;
            var arrow = this._arrow = document.createElement("div");
            xlk.set_arrow_style(arrow);
            div.appendChild(arrow);
            map.getPanes().labelPane.appendChild(div);
            return div;
        }

        ComplexCustomOverlay.prototype.draw = function(){
            var map = this._map;
            var pixel = map.pointToOverlayPixel(this._point);
            var w = $(this._div).width();
            this._div.style.left = pixel.x + "px";
            this._div.style.marginLeft = (-w/2 - 8) + 'px';
            this._div.style.top  = pixel.y - 37 + "px";
        }
        var myCompOverlay = new ComplexCustomOverlay(pt, text);
        var marker2 = new BMap.Marker(pt, {icon: nIcon});
        map.addOverlay(myCompOverlay);
        map.addOverlay(marker2);
    }


    function init_map() {
        var $mapid=$('#hy_mp'), $trig = $('#hy_dmap_trig'), $mp_d = $('#hyd_map');
        if($mapid.length && typeof BMap !== 'undefined') {
            var map = new BMap.Map("hy_mp");
            var pt = new BMap.Point($mapid.attr('data-longitude-val'),$mapid.attr('data-latitude-val'));
            var split_reg = /; |, |;|,/g;
            map.centerAndZoom(pt,15);
            map.enableScrollWheelZoom(true);
            xlk.addCustomerOverlay(map, pt, $mapid.attr('data-sname'));

            if(document.getElementById('dt_rs')) {
                function mk_lines(rs) {
                    try {
                        var is_gj = rs.keyword == '公交';
                        var str = '', rsa = [], find_arr;
                        find_arr = _.find(rs, function(v, k) {
                            return _.isArray(v) && v.length > 0;
                        });
                        if(is_gj) {
                            if(find_arr && find_arr.length) {
                                str += find_arr[0].title + '站有：' + find_arr[0].address.replace(split_reg, '、') + '。';
                            }
                        } else {
                            if(find_arr) {
                                for(var i = 0; i < find_arr.length; i++) {
                                    rsa = rsa.concat(find_arr[i].address.split(split_reg));
                                }
                            }
                            if(rsa.length) {
                                rsa = _.uniq(rsa);
                                str = '附近有：' + rsa.join('、') + '。';
                            }
                        }
                        return str;
                    } catch(e) {}
                }
                var loc = new BMap.LocalSearch(map, {
                    onSearchComplete: function(rs) {
                        if(rs) {
                            try {
                                var s = mk_lines(rs, loc);
                                if(rs.keyword == '公交' && s == '' && rs.radius == 1000) {
                                    loc.searchNearby('公交', pt, 2000);
                                }
                                document.getElementById((rs.keyword == '公交') ? 'gj_rs' : 'dt_rs').innerHTML = s ? s : ('无' + rs.keyword);
                            } catch(e) {}
                        }
                    }
                });
                loc.searchNearby('公交', pt, 1000);
                loc.searchNearby('地铁', pt);
            }
        }
        if($mp_d.length && typeof BMap !== 'undefined') {
            var mp_d_inited = false;
            function mp_d_init() {
                mp_d_inited = true;
                var mpd = new BMap.Map("hyd_mapb");
                var pt1 = new BMap.Point($mp_d.attr('data-lng'),$mp_d.attr('data-lat'));
                mpd.centerAndZoom(pt1,15);
                mpd.enableScrollWheelZoom(true);
                xlk.addCustomerOverlay(mpd, pt1, $mp_d.attr('data-t'));
            }
            $trig.on('click', function() {
                $mp_d.removeClass('none');
                if(!mp_d_inited) {
                    mp_d_init();
                }
            });
            $mp_d.on('click', '.modal_cover, .modal_close', function() {
                $mp_d.addClass('none');
            });
        }
    }

    init_map();

    xlk.init_friends();

    xlk.mimit_select($('#hy_selector_1'), $('#hy_lj'));
    xlk.mimit_select($('#hy_selector_2'), $('#hy_lj'));
    xlk.mimit_select($('#hy_selector_3'), $('#hy_lj'));
    xlk.init_lunar_day($('.index_jr'));

    xlk.init_hy_pop($('#hy_hall_list'));
    xlk.init_share_module();
    xlk.init_search_fm($('#tp_sch_fm'));
    xlk.init_coupon_tab();
    xlk.init_acts_modal();
    xlk.init_ind_lp_tab($('#ind_lp_tab_nav .nv_i'), $('#ind_lp_tab_c .lp_tab_ci'));

    xlk.init_hy_price();
    xlk.init_hy_list_map();

    if($('.j_scroll_loading').length>0){
        $('.j_scroll_loading').scrollLoading();

    }


});
(function() {

    function init_spr_fst() {

        var p = window.location.pathname.replace(/^\//,'').replace(/\/$/, '').toLowerCase(), ck = xlk.cookie.get('baihe_city'), tmout;

        if(ck != '110000' && ck != '310000' && ck != '440300' && ck != '530100') { return; }
        var gifts = {
            '110000' : {
                'uri' : '//hunli.baihe.com/bj/topic/bjdlb5.html',
                'pic' : '//images9.baihe.com/topic/p/hyhlbhq/pop_bg.png'
            },
            '310000' : {
                'uri' : '//hunli.baihe.com/sh/topic/shdlb4.html',
                'pic' : '//images9.baihe.com/topic/p/hyhlbhq/pop_bg.png'
            },
            '440300': {
                'uri' : '//hunli.baihe.com/sz/topic/szdlb.html',
                'pic' : '//images9.baihe.com/topic/p/hyhlbhq/pop_bg.png'
            },
            '530100': {
                'uri' : '//hunli.baihe.com/km/topic/kmdlb2.html',
                'pic' : '//images9.baihe.com/topic/p/hyhlbhq/pop_bg.png'
            }
        };
        var pic_url = gifts[ck]['pic'];
        function show_bar_gift( spm, utm ) {
            var s = '<a class="spr_gift" id="j_spr_gift" href="' + gifts[ck]['uri'] + '" target="_blank" onclick="baihe.bhtongji.tongji({\'event\': 3, spm: \'' + spm + '\'});"><img src="/static/imgs/gift1.gif" /></a>';
            $('body').append(s);
        }

        function show_pop_gift() {

            var s = '<div class="spr_pop" id="j_spr_fst"><div class="pop_bg"></div><a href="' + gifts[ck]['uri'] + '" target="_blank" onclick="baihe.bhtongji.tongji({\'event\': 3, spm: \'21.200.757.3243.8701\'});" ><img style="margin-right: -375px; margin-top: -363px;" src="' + pic_url + '" /></a><a href="javascript:void(0);" id="j_spr_x" style=" margin-left: 270px;"></a></div>';

            $('body').append(s);
        }
        function hide_pop_gift() {

            $('#j_spr_fst img').animate({width: 0, height: 0, marginRight: 0, right: '30px', marginTop: 0, top: '210px'}, 1000);

            $('#j_spr_fst').fadeOut(1000);

            show_bar_gift('21.200.757.3244.8702', 2);

        }
        if(p == 'bj' || p == 'sh' || p == 'sz' || p == 'km') {
            if(xlk.cookie.get('baihe_bj_spr_gift')) {
                show_bar_gift('21.200.757.3244.8702', 2);
            } else {
                show_bar_gift('21.200.757.3244.8702', 2);
                /*
                var i = new Image();
                i.onload = function() {
                    xlk.cookie.set('baihe_bj_spr_gift', '1', new Date(new Date().getTime() + 1000*60*60));
                    show_pop_gift(ck);
                    tmout = setTimeout(hide_pop_gift, 3000);
                    $('body').on('click', '#j_spr_x, #j_520_x', function() {
                        clearTimeout(tmout);
                        hide_pop_gift(ck);
                    });
                }
                i.src = pic_url;
                */
            }

        } else if(p.indexOf('hunyanchangdi/store') > 0 ) {
            show_bar_gift('21.172.767.3244.8703', 4);
        }
    }

    setTimeout(init_spr_fst, 500);

})();

setTimeout(function() {
    var page_spm = "21.202.918.3279.8769";
    baihe.bhtongji.tongji({"event": 3, "spm": page_spm});
    //开始添加新的pv的统计
    var p = window.location.pathname;
    var regs = [
        [/^\/hunyanchangdi\/store$|^\/hunyanchangdi\/store\//, '21.204.922.3283.8795'],
        [/^\/hunyanchangdi\/shop/, '21.204.923.3283.8796'],
        [/^\/hunshasheying\/store$|^\/hunshasheying\/store\//, '21.206.924.3283.8803'],
        [/^\/hunshasheying\/shop/, '21.206.925.3283.8804'],
        [/^\/hunshasheying\/goods$|^\/hunshasheying\/goods\//, '21.206.926.3283.8805'],
        [/^\/hunshasheying\/\d+/, '21.206.927.3283.8806'],
        [/^\/hunshasheying\/case/, '21.206.928.3283.8807'],
        [/^\/lv$/, '21.207.929.3283.8809'],
        [/^\/lvpai\/store$|^\/lvpai\/store\//, '21.207.924.3283.8810'],
        [/^\/lvpai\/shop/, '21.207.925.3283.8811'],
        [/^\/lvpai\/goods$|^\/lvpai\/goods\//, '21.207.926.3283.8812'],
        [/^\/lvpai\/\d+/, '21.207.927.3283.8813'],
        [/^\/lvpai\/case$|^\/lvpai\/case\//, '21.207.928.3283.8814'],
        [/^\/hunqingfuwu\/store$|^\/hunqingfuwu\/store\//, '21.205.924.3283.8797'],
        [/^\/hunqingfuwu\/shop/, '21.205.925.3283.8798'],
        [/^\/hunqingfuwu\/goods$|^\/hunqingfuwu\/goods\//, '21.205.926.3283.8799'],
        [/^\/hunqingfuwu\/\d+/, '21.205.927.3283.8800'],
        [/^\/hunqingfuwu\/case$|^\/hunqingfuwu\/case\//, '21.205.928.3283.8801'],
        [/^\/thread-pic-view$|^\/thread-pic-view/, '21.205.774.3283.8802']
    ], i = 0;

    for(i; i < regs.length; i++) {
        if(regs[i][0].test(p)) {
            baihe.bhtongji.tongji({"event": 3, "spm": regs[i][1]});
            break;
        }
    }

}, 500);

(function() {
    var $win = $(window);
    function hall_collapse() {
        var $l = $('#hy_hall_list'), $n = $l.find('.hall_i.none'), $a = $l.find('.hall_more a');
        $a.toggle(function() {
            $n.removeClass('none');
            more_a_alt($a);
        }, function(){
            $n.addClass('none');
            more_a_alt($a);
            $win.scrollTop($win.scrollTop() - $n.outerHeight() * $n.length);
        });
    }
    function menu_ban() {
        var $b = $('#ban_menu');
        if($b.length == 0) return;
        var $mc = $b.find('.menu_c'),
            $mi = $b.find('.menu_i'),
            c = $mi.length,
            iw = $mi.eq(0).width(),
            ml = +$mi.eq(0).css('margin-left').replace('px', ''),
            $ms = $b.find('.menus'),
            i = 0,
            $a = $b.find('.menu_more a'),
            $m_pop = $('#menu_pop');
        function move() {
            $ms.animate({left: i*(iw + ml) + 'px'}, 200);
        }
        $b.on('click', '.nav_l', function() {
            i++;
            if(i > 0) i = 0;
            move();
        });
        $b.on('click', '.nav_r', function() {
            i--;
            if(i < (4 - c)) i = 4 - c;
            move();
        });
        $a.toggle(function() {
            $b.removeClass('menu_closed');
            more_a_alt($a);
        }, function(){
            $b.addClass('menu_closed');
            more_a_alt($a);
            $win.scrollTop($win.scrollTop() - 490);
        });
        $b.on('click', '.m_tab_nv a', function() {
            var $t = $(this),
                ix = $t.index(),
                b = $t.is('.on'),
                $p = $t.parent(),
                $ti = $p.siblings('.m_tab_c').find('.m_tab_i');
            if(!b) {
                $t.addClass('on').siblings().removeClass('on');
                $ti.addClass('none').eq(ix).removeClass('none');
            }
        });
        $b.on('click', '.m_tab_m a', function() {
            var $tabi = $(this).parent().siblings('.m_tab_c').find('.m_tab_i').not('.none');
            var $mc = $m_pop.find('.modal_container');
            $m_pop.removeClass('none');
            $m_pop.find('#m_dishes').html($tabi.html());
            $mc.css('marginTop', -$mc.height()/2 + 'px');
        });
        $m_pop.on('click', '.modal_close, .modal_cover', function() {
            $m_pop.addClass('none');
        });
    }
    function txt_more() {
        var $w = $('.hy_hotel'),
            $t = $w.find('.txt'),
            $ti = $t.find('.txt_h'),
            $a = $w.find('.hy_tmore a'),
            h = $ti.height() - $t.height();
        if(h > 0) {
            $a.toggle(function(){
                $w.removeClass('closed');
                more_a_alt($a);
            }, function(){
                $win.scrollTop($win.scrollTop() - h);
                $w.addClass('closed');
                more_a_alt($a);
            });
        } else {
            $a.parent().remove();
        }
    }
    function more_a_alt($a) {
        $a.html($a.find('.icon_a_down').length ? '收起<span class="icon_a_up"></span>' : '查看更多<span class="icon_a_down"></span>');
    }
    function init_hy_d() {
        if($('#pg_id').val() != 'hy_d') return;
        hall_collapse();
        menu_ban();
        txt_more();
    }
    setTimeout(init_hy_d, 600);
})();

/*common_fns 1 start*/
(function(root) {
    'use strict';
    //定义xlk变量为全局变量，用来定义本站下的所有自定义功能
    var x = root.xlk || {};

    var TPL_PLNRSV = '<div class="modal" id="yykd_rsv">'
            + '<div class="modal_bg"></div>'
            + '<div class="layerHL query">'
            + '<h3><a href="javascript:;" class="modal_close a_9">×</a><span id="title_rsv">查询档期</span></h3>'
            + '<div class="cont" id="yykd_rsv_steps">'

            + '<div class="stepi step1">'
            + '<div class="tabNav" id="plan_date_type">'
            + '<a href="javascript:;" class="active">我要选择区间</a>'
            + '<a href="javascript:;">我要指定日期</a>'
            + '</div>'
            + '<div class="timeRange" id="plan_range">'
            + '<div class="picker">'
            + '<span class="txt">起</span><span class="icon"></span><input type="text" value="" id="plan_start">'
            + '</div>'

            + '<div class="arrow"><em></em></div>'
            + '<div class="picker">'
            + '<span class="txt">起</span><span class="icon"></span><input type="text" value="" id="plan_end">'
            + '</div>'
            + '</div>'
            + '<div class="timeRange none" id="plan_sig">'
            + '<div class="picker">'
            + '<span class="txt">起</span><span class="icon"></span><input type="text" value="" id="plan_single">'
            + '</div>'
            + '</div>'
            + '<div class="plan" id="plan_acts">'
            + '</div>'

            + '<div class="plan" style="display:none;">&nbsp;</div>'
            + '<a href="javascript:;" id="rsv_get_radm" class="mT20">立即免费预约</a>'
            + '</div>'


            + '<div class="verification stepi step2">'
            + '<p>验证码已发送至手机<span class="red" id="rsv_mobile_show">159****937</span> 的手机上</p>'
            + '<input type="text" placeholder="* 您的手机号" class="inp in_txt" id="rsv_u_radm" maxlength="6"/><a href="javascript:;" class="yellow" id="rsv_get_radm2">重新发送</a>'
            + '<div class="link">'
            + '<a href="javascript:;" id="rsv_sub">提交</a>'
            + '<div class="ctr_input auto_log_check"><input name="" type="checkbox" value="" checked class="inpB" id="rsv_agree"/><span onClick="window.open(\'//www.hunli.baihe.com/about/user\',\'name\')"  class="t_9">已阅读百合网婚礼用户服务协议</span></div>'
            + '</div>'
            + '</div>'
            + '<div class="ok stepi step3">'
            + '<strong>您的查询需求已经成功提交！</strong><br />我们将通知婚礼管家尽快与您联系'
            + '</div>'

            + '<div class="shut stepi step4">'
            + '<strong>只差最后一步了，确定要关闭吗？</strong>'
            + '<p>'
            + '关闭后：<br />'
            + '1、您将无法获得婚礼管家一对一服务<br />'
            + '2、您将无法获得商家最新的优惠信息<br />'
            + '</p>'
            + '<a href="javascript:;" id="rsv_a1">继续操作</a><a href="javascript:;" class="close" id="rsv_a2">关闭</a>'
            + '</div>'

            + '</div>'
            + '</div>'
            + '</div>',


        TPL_LJSTEP1 = '<div class="reserve">'
            + '<strong>您选择的是：</strong>'
            + '<dl id="area_hotel">__area_hotel__'
            + '<dd>'
            + '<p>*我们将严格保护您的个人信息安全</p>'
            + '<input name="" type="text" placeholder="请输入手机号" data-default="请输入手机号" maxlength="11" class="in_txt inp" id="lg_u_phone" class="inp" /><a href="javascript:;" id="rsv_get_radm">立即免费预约</a>'
            + '<p class="error">* 请正确输入您的手机号</p>'
            + '</dd>'
            + '</dl>'
            + '</div>',


        TPL_RSVSTEP1 = '<h4>__SNAME__</h4>'
            + '<div class="lab">'
            + '<em></em>'
            + '<ul id="list_yykd">'
            + '</ul>'
            + '</div>'
            + '<div class="plan" >'
            + '<div id="existence_rsv">'
            + '</div>'
            + '</div>'
            + '<a href="javascript:void(0);" id="rsv_get_radm">立即免费预约</a>',

        TPL_RSVSTEP1_HY = '<div class="reserve">'
            + '<strong>您预约的是：</strong>'
            + '<dl id="area_hotel">'
            + '<dt ><span class="t_y">__SNAME__</span><br/>请您留下联系方式，稍后会有客服联系您</dt>'
            + '<dd>'
            + '<p>*我们将严格保护您的个人信息安全</p>'
            + '<input name="" type="text" placeholder="请输入手机号" data-default="请输入手机号" maxlength="11" class="in_txt inp" id="lg_u_phone" class="inp" /><a href="javascript:;" id="rsv_get_radm">立即免费预约</a>'
            + '<p class="error">* 请正确输入您的手机号</p>'
            + '</dd>'
            + '</dl>'
            + '</div>',

        TPL_HYRSV = '<div class="modal" id="yykd_rsv">'
            + '<div class="modal_bg"></div>'
            + '<div class="layerHL store">'
            + '<h3><a href="javascript:;" class="modal_close a_9">×</a><span id="title_rsv">预约看店</span></h3>'
            + '<div class="cont" id="yykd_rsv_steps">'

            + '<div class="appointment stepi step1">'
            + '__STEP1__'
            + '</div>'

            + '<div class="verification stepi step2">'
            + '<p>验证码已发送至手机号 <span class="red"ow" id="rsv_mobile_show">159****937</span> 的手机上</p>'
            + '<input name="" type="text" paceholderl="请输入验证码" class="inp in_txt"  maxlength="6" id="rsv_u_radm"/><a href="javascript:void(0);" class="yellow disabled" id="rsv_get_radm2">重新发送</a>'
            + '<div class="link">'
            + '<a href="javascript:void(0);" id="rsv_sub">提交</a>'
            + '<div class="auto_log_check invalid" style="text-align:center">'
            + '<input type="checkbox" class="inpB" checked="checked" id="rsv_agree">'
            + '<span onClick="window.open(\'//www.hunli.baihe.com/about/user\',\'name\')"  class="t_9">已阅读百合网婚礼用户服务协议</span>'
            + '</div>'
            + '</div>'
            + '</div>'

            + '<div class="ok stepi step3">'
            + '<strong>您的预约需求已经成功提交！</strong><br />我们将通知婚礼管家尽快与您联系'
            + '</div>'

            + '<div class="shut stepi step4">'
            + '<strong>只差最后一步了，确定要关闭吗？</strong>'
            + '<p>关闭后：<br />'
            + '1、您将无法获得婚礼管家一对一服务<br />'
            + '2、您将无法获得商家最新的优惠信息<br />'
            + '</p>'
            + '<a href="javascript:void(0);" id="rsv_a1">继续操作</a><a href="javascript:void(0);" class="close" id="rsv_a2">关闭</a>'
            + '</div>'
            + '</div>'
            + '</div>'
            + '</div>';

    var err_msgs = {
        'mobile': '手机号码无效',
        'mobile_plan': '请正确输入您的手机号码',
        'mob_vrf': '动态码不正确'
    }, DIS = 'disabled', $win = $(window);

    x.init_hy_pop_suc = function( $btn, tmer, fn ) {
        var $hy_pop_suc = $('#hy_rsv_success'), thisTimer,
            pop_suc_hide = function() {
                $hy_pop_suc.addClass('none');
                clearTimeout(thisTimer);
                if(fn) {
                    fn($btn, $hy_pop_suc);
                }
            },
            pop_suc_show = function() {
                $hy_pop_suc.removeClass('none');
            },
            auto_hide_pop = function() {
                thisTimer = setTimeout(pop_suc_hide, tmer || 7000);
            }, IS_CX = $btn.attr('data-isCX');
        if(!$hy_pop_suc.data('BINDED')) {
            $hy_pop_suc.data('BINDED', 1)
            $hy_pop_suc.on('click', '.modal_close', pop_suc_hide);
        }
        $hy_pop_suc.find('#j_rsv_or_cx').html(IS_CX ? '查询' : '预约' );
        pop_suc_show();
        auto_hide_pop();
    }

    x.init_rsv = function($btn, ct, special_token) {
        if($btn.length == 0) return;
        if(x.is_reserving == true) return;
        x.is_reserving = true;
        var data_rsv = {
                sID: $btn.attr('data-sid') || '',
                type: $btn.attr('data-type') || '1',
                gID: $btn.attr('data-gid') || '',
                page_source: $btn.attr('data-page_source') || '',
                way_source: $btn.attr('data-way_source') || 4,
                appID: '7',
                data_zone : $btn.attr('data-zone') || '',
                data_budget : $btn.attr('data-budget') || '',
                data_tables : $btn.attr('data-tables') || '',
                data_tables_key : $btn.attr('data-tables-key') || '',
                data_zone_key : $btn.attr('data-zone-key') || '',
                data_budget_key : $btn.attr('data-budget-key') || '',

            }, $m_rsv, $stpi,
            _step = 1, _ostep = 1,
            isPlan = 0,
            spm_ext = $btn.attr('data-ext') || '',
            isHY = $btn.attr('data-rsv_type') == '1';

        function init_step1() {
            var val = "";
            var area_hotel = "";
            if(special_token) {
                if(data_rsv.data_zone == "不限区域" && data_rsv.data_budget == "不限价格" && data_rsv.data_tables == "不限桌数"){

                    area_hotel = '<dt>'
                        + '<span class="red">' + data_rsv.data_zone + '</span>'
                        + ' <span class="red">' + data_rsv.data_budget + '</span>'
                        + ' <span class="red"> ' + data_rsv.data_tables + ' </span>的婚宴场地<br />'
                        + '共有 <span class="red">100 家</span>婚宴场地符合您的要求'
                        + '</dt>'

                }
                else{//三个都不选走上方的，如果选择任意一个走下方
                    area_hotel = '<dt>'
                        + '<span class="red">' + data_rsv.data_zone + '</span>'
                        + (data_rsv.data_budget == "不限价格" ? ' <span class="red">' + data_rsv.data_budget + '</span><br />' : ' 价格为 <span class="red">' + data_rsv.data_budget + '</span><br />')
                        + (data_rsv.data_tables == "不限桌数" ? ' <span class="red"> ' + data_rsv.data_tables + ' </span>的婚宴场地<br />' : '能容纳 <span class="red"> ' + data_rsv.data_tables + ' </span>的婚宴场地<br />')
                        //+ '<br />能容纳 <span class="red"> ' + data_rsv.data_tables + ' </span>的婚宴场地<br />'
                        + '共有 <span class="red">' + Math.floor(Math.random()*20+70) + ' 家</span>婚宴场地符合您的要求'
                        + '</dt>'
                }
                val = TPL_HYRSV.replace('__STEP1__', TPL_LJSTEP1.replace('__area_hotel__', area_hotel || '' ));
            } else {
                val = TPL_HYRSV.replace('__STEP1__', (isHY ? TPL_RSVSTEP1_HY : TPL_RSVSTEP1).replace('__SNAME__', $btn.attr('data-sname') || '' ));
            }

            $('body').append(val);
            $m_rsv = $('#yykd_rsv');
            $stpi = $('#yykd_rsv_steps .stepi');

            var data = x.yykd_list_data;
            var html =  ''
            if(Array.isArray(data.result)){
                $.each( data.result, function(i, o){
                    switch(o.name){
                        case "arrive":
                            html += '<li>'
                            html += '<span class="ddl">到店礼</span>'
                            $.each( o.text, function(ii, oo){
                                html += '<p>' + oo + '</p>'
                            });
                            html += '</li>'
                            break;
                        case "order":
                            html += '<li>'
                            html += '<span class="qkl">订单礼</span>'
                            $.each( o.text, function(ii, oo){
                                html += '<p>' + oo + '</p>'
                            });
                            html +=  '</li>'
                            break;
                        default:
                            $.each( o.text, function(ii, oo){
                                html += '<li>'
                                html += '<span class="vip">vip服务</span>'
                                html += '<p>' + oo + '</p>'
                                html += '</li>'
                            });
                            break;
                    }
                })
            }


            $('#list_yykd').html(html);
            $m_rsv.find('.j_who').html(data_rsv.sID ? '商家' : '婚礼管家')

            var UPHONE = '<p>请留下您的联系方式，我们将通知专业人员尽快与您联系</p><input name="" type="text" placeholder="请输入手机号" data-default="请输入手机号" maxlength="11" class="in_txt inp" id="lg_u_phone"/><div class="error">* 请正确输入您的手机号</div>';
            $m_rsv.find('#existence_rsv').html(x.user.id ? '&nbsp;' : UPHONE);

        }
        function rsv_bind() {
            x.is_reserving = false;
            var $u_phone = $m_rsv.find('#lg_u_phone'),//手机文本框
                $u_radm = $m_rsv.find('#rsv_u_radm'),//手机文本框
                $u_get_radm = $m_rsv.find('#rsv_get_radm'),//立即免费预约
                $u_get_radm2 = $m_rsv.find('#rsv_get_radm2'),//60秒后重新获取
                $rsv_agree = $m_rsv.find('#rsv_agree'),//服务协议
                sendCount, is_user_login = x.user.id;
            function send_msg() {

                var b1 = x.check_input($u_phone, x.regs.mobile, err_msgs.mobile),
                    $this = $(this),
                    b2 = $this.not('.' + DIS);
                if(b1 && b2) {
                    x.msg_query({
                        data: {
                            params: JSON.stringify({
                                mobile: $u_phone.val(),
                                appId: 7,
                                apver: '1.0.0'
                            })
                        },
                        beforeSend: function() {
                            $this.addClass(DIS).html('发送中...');
                        },
                        success: function(data) {
                            //var data = {"code":200,"msg":"\u8bf7\u6c42\u592a\u8fc7\u9891\u7e41\u8bf7\u7a0d\u540e\u518d\u8bd5","data":{"result":"","other":"0","apver":"1.0.0"}};
                            if((typeof data !== 'undefined' && data !== null ? data.code : void 0) === 200) {
                                hy_step2($u_phone.val());
                                var t = 60;
                                sendCount = setInterval(function() {
                                    t--;
                                    if(t > 0) {
                                        $u_get_radm2.addClass(DIS).html(t + '秒后可重发');
                                    } else {
                                        clearInterval(sendCount);
                                        $u_get_radm2.removeClass(DIS).html( '重新发送' );
                                    }
                                }, 1000);
                            } else {
                                $u_get_radm.removeClass(DIS).html('立即免费预约');
                                $u_get_radm2.removeClass(DIS);
                                x.pop_msg(data.msg, $this);
                            }
                        },
                        complete: function() {
                            $u_get_radm.removeClass(DIS).html('立即免费预约');
                        }
                    });
                }

            }
            function rsv_agree_check() {
                var b = $rsv_agree.is(':checked');
                $rsv_agree.parent()[b ? 'removeClass' : 'addClass']('invalid');
                return b;
            }
            function rsv_login() {
                var b1 = x.check_input($u_radm, x.regs.mob_vrf, err_msgs.mob_vrf),
                    $this = $(this),
                    b2 = $this.not('.' + DIS),
                    b3 = rsv_agree_check();
                if(b1 && b2 && b3) {
                    x.login_query({
                        data: {
                            params: JSON.stringify({
                                mobile: $u_phone.val(),
                                appId: 7,
                                apver: '1.0.0',
                                isCheck: 1,
                                verifyCode: $u_radm.val()
                            })
                        },
                        beforeSend: function() {
                            $this.addClass(DIS).html('提交中...');
                        },
                        success: function(data) {
                            if((typeof data !== 'undefined' && data !== null ? data.code : void 0) === 200) {
                                data.data.result.mobile = $u_phone.val();
                                x.set_user(data.data.result, true);
                                data_rsv.userID = x.user.id;

                                x.query_rsv({params:JSON.stringify(data_rsv)}, function(data2) {
                                    if((typeof data2 !== 'undefined' && data2 !== null ? data2.code : void 0) === 200) {
                                        if(+data2['data']['result']['result'] === 1) {
                                            hy_step3();
                                        } else if(+data2['data']['result']['result'] == 2){
                                            $('#yykd_rsv').remove();
                                            x.pop_msg('已预约，7天内无须重复预约哦', $btn);
                                        } else {
                                            x.pop_msg('预约失败', $this);
                                        }
                                    } else {
                                        x.pop_msg(data2.msg, $this);
                                    }
                                });
                            } else {
                                $this.removeClass(DIS).html('提交');
                                x.pop_msg(data.msg);
                            }
                        },
                        fail: function() {
                            x.pop_msg('API错误，请稍后重试');
                            $this.removeClass(DIS).html('提交');
                        }
                    });
                }
            }
            $m_rsv.on('click', '.modal_close', function() {
                if(typeof baihe !== 'undefined') {
                    if(_step == 1) {
                        baihe.bhtongji.tongji({event: 3, spm: '21.167.778.2781.6997', extend: spm_ext });
                    } else if(_step == 2) {
                        baihe.bhtongji.tongji({event: 3, spm: '21.167.778.2783.6999', extend: spm_ext });
                    } else if(_step == 3) {
                        baihe.bhtongji.tongji({event: 3, spm: (is_user_login ? '21.167.778.2785.7006' : '21.167.778.2785.7001'), extend: spm_ext });
                    }
                }

                if(_step == 1 || _step == 2) {
                    hy_step4();
                } else {
                    $m_rsv.remove();
                }
            }).on('click', '#rsv_a2', function() {
                baihe.bhtongji.tongji({event: 3, spm: '21.167.778.2787.7003', extend: spm_ext });
                $m_rsv.remove();
            }).on('click', '#rsv_a1', function() {
                baihe.bhtongji.tongji({event: 3, spm: '21.167.778.2786.7002', extend: spm_ext });
                if(_ostep == 1) {
                    hy_step1();
                } else {
                    hy_step2();
                }
            }).on('blur', '#lg_u_phone', function() {
                x.check_input($u_phone, x.regs.mobile, err_msgs.mobile);
            }).on('blur', '#rsv_u_radm', function() {
                x.check_input($u_radm, x.regs.mob_vrf, err_msgs.mob_vrf);
            }).on('click', '#rsv_get_radm, #rsv_get_radm2', function() { //免费预约和60称到计时
                var $t = $(this);
                if($t.is('#rsv_get_radm')) {
                    baihe.bhtongji.tongji({event: 3, spm: '21.167.778.2780.6996', extend: spm_ext});
                }
                if($t.is('.' + DIS)) {
                    return;
                } else {
                    send_msg.call(this);
                }
            })
                .on('click', '#rsv_sub', rsv_login)
                .on('click', '#rsv_sub', function() {
                    baihe.bhtongji.tongji({event: 3, spm: '21.167.778.2782.6998', extend: spm_ext });
                }).on('change', '#rsv_agree', function() {
                rsv_agree_check();
            });
        }
        function hy_step1() {
            _step = 1;
            _ostep = 1;
            $('#yykd_rsv #title_rsv').html("预约看店");
            $stpi.addClass('none').eq(0).removeClass('none');
        };
        function hy_step2(mobile) {
            _step = 2;
            _ostep = 2;
            $('#yykd_rsv #title_rsv').html("填写验证码");
            var $stp2 = $stpi.addClass('none').eq(1).removeClass('none');
            mobile && $stp2.find('#rsv_mobile_show').html(x.get_phone_show(mobile));
        };
        function hy_step3() {
            _ostep = 3;
            _step = 3;
            if(isHY) {
                $('#yykd_rsv').remove();
                x.init_hy_pop_suc( $btn );
            } else {
                $('#yykd_rsv #title_rsv').html("提交成功");
                $stpi.addClass('none').eq(2).removeClass('none');
                setTimeout(function() {
                    $('#yykd_rsv').remove();
                }, 7000);
            }
        };
        function hy_step4() {
            _ostep = _step;
            _step = 4;
            $('#yykd_rsv #title_rsv').html("");
            $stpi.addClass('none').eq(3).removeClass('none');
        };

        function hy_step5() {
            _ostep = 5;
            _step = 5;
            $('#yykd_rsv #title_rsv').html("预约看店");
            $stpi.addClass('none').eq(4).removeClass('none');
        };

        if(x.user.id) {
            data_rsv.userID = x.user.id;
            x.query_rsv({params:JSON.stringify(data_rsv)}, function(data2) {
                if((typeof data2 !== 'undefined' && data2 !== null ? data2.code : void 0) === 200) {
                    if(+data2['data']['result']['result'] === 1) {
                        if(isHY) {
                            $('#yykd_rsv').remove();
                            x.init_hy_pop_suc( $btn );
                        } else {
                            init_step1();
                            hy_step3();
                            rsv_bind();
                        }
                    } else if(+data2['data']['result']['result'] == 2){
                        x.pop_msg('已预约，7天内无须重复预约哦', $btn);
                    } else {
                        x.pop_msg('预约失败', $btn);
                    }
                } else {
                    x.pop_msg(data2.msg, $btn);
                }
                x.is_reserving = false;
            });
        } else {
            init_step1();
            hy_step1();
            rsv_bind();
        }

    };


    x.init_pln_rsv = function($btn) {
        if($btn.length == 0) return;
        var data_rsv = {
                sID: $btn.attr('data-sid') || '',
                type: $btn.attr('data-type') || '1',
                gID: $btn.attr('data-gid') || '',
                page_source: $btn.attr('data-page_source') || '',
                way_source: $btn.attr('data-way_source') || 4,
                appID: '7'
            }, $m_rsv, $stpi,
            $date = $btn.find('.j_canlender_holder'),
            _step = 1, _ostep = 1,
            spm_ext = $btn.attr('data-ext') || '',
            time_type = 0;
        function getNextNMonth(n) {
            var d = new Date();
            var Y = d.getFullYear(), m = d.getMonth() + 1;
            var str = '';
            Y = m + n > 12 ? Y + 1 : Y;
            m = m + n > 12 ? m + n - 12 : m + n;
            m = m > 9 ? m : '0' + m;
            return Y + '/' + m + '/01';
        }
        function init_step1() {
            var html = TPL_PLNRSV.replace('__SNAME__', $btn.attr('data-sname') || '' );
            $('body').append(html);
            $m_rsv = $('#yykd_rsv');
            $stpi = $('#yykd_rsv_steps .stepi');
            var acts = $.trim(x.get_store_acts_s($btn));

            $m_rsv.find('.j_who').html(data_rsv.sID ? '商家' : '婚礼管家');

            var UPHONE = '<p>请留下您的联系方式，我们将通知专业人员尽快与您联系</p> <input type="text" placeholder="* 您的手机号" class="inp in_txt" id="lg_u_phone" maxlength="11"/><div class="error">请正确输入您的手机号</div>';
            $m_rsv.find('#plan_acts').html(x.user.id ? '&nbsp;' : UPHONE);
            var $t1 = $m_rsv.find('#plan_start'),
                $t2 = $m_rsv.find('#plan_end'),
                $t3 = $m_rsv.find('#plan_single');

            $t1.val(getNextNMonth(6));
            $t2.val(getNextNMonth(7));
            $t3.val(getNextNMonth(6));

            $t1.datetimepicker({
                timepicker: false,
                minDate: new Date(),
                maxDate: new Date($t2.val()),
                format: 'Y/m/d',
                onShow: function(cdt) {
                    this.setOptions({'maxDate': $t2.val()})
                }
            });
            $t2.datetimepicker({
                timepicker: false,
                minDate: new Date($t1.val()),
                format: 'Y/m/d',
                onShow: function(cdt) {
                    this.setOptions({'minDate': $t1.val()})
                }
            });
            $t3.datetimepicker({
                timepicker: false,
                minDate: new Date(),
                format: 'Y/m/d'
            });
        }
        function rsv_bind() {
            var $u_phone = $m_rsv.find('#lg_u_phone'),
                $u_radm = $m_rsv.find('#rsv_u_radm'),
                $u_get_radm = $m_rsv.find('#rsv_get_radm'),
                $u_get_radm2 = $m_rsv.find('#rsv_get_radm2'),
                $rsv_agree = $m_rsv.find('#rsv_agree'),
                $p_start = $m_rsv.find('#plan_start'),
                $p_end = $m_rsv.find('#plan_end'),
                $p_single = $m_rsv.find('#plan_single'),
                sendCount, is_user_login = x.user.id;
            function send_msg() {
                var b1 = x.check_input($u_phone, x.regs.mobile, err_msgs.plan_mobile),
                    $this = $(this),
                    b2 = $this.not('.' + DIS);
                if(b1 && b2) {
                    x.msg_query({
                        data: {
                            params: JSON.stringify({
                                mobile: $u_phone.val(),
                                appId: 7,
                                apver: '1.0.0'
                            })
                        },
                        beforeSend: function() {
                            $this.addClass(DIS).html('发送中...');
                        },
                        success: function(data) {
                            if((typeof data !== 'undefined' && data !== null ? data.code : void 0) === 200) {
                                hy_step2($u_phone.val());
                                var t = 60;
                                sendCount = setInterval(function() {
                                    t--;
                                    if(t > 0) {
                                        $u_get_radm2.addClass(DIS).html(t + '秒后可重发');
                                    } else {
                                        clearInterval(sendCount);
                                        $u_get_radm2.removeClass(DIS).html( '重新获取验证码' );
                                    }
                                }, 1000);
                            } else {
                                $u_get_radm.removeClass(DIS).html('立即免费预约');
                                x.pop_msg(data.msg, $this);
                            }
                        },
                        complete: function() {
                            $u_get_radm.removeClass(DIS).html('立即免费预约');
                        }
                    });
                }
            }
            function rsv_agree_check() { //同意协议
                var b = $rsv_agree.is(':checked');
                $rsv_agree.parent()[b ? 'removeClass' : 'addClass']('invalid');
                return b;
            }
            function rsv_login() {
                var b1 = x.check_input($u_radm, x.regs.mob_vrf, err_msgs.mob_vrf),  //检查验证码
                    $this = $(this),
                    b2 = $this.not('.' + DIS),
                    b3 = rsv_agree_check();
                if(b1 && b2 && b3) {
                    x.login_query({
                        data: {
                            params: JSON.stringify({
                                mobile: $u_phone.val(),
                                appId: 7,
                                apver: '1.0.0',
                                isCheck: 1,
                                verifyCode: $u_radm.val()
                            })
                        },
                        beforeSend: function() {
                            $this.addClass(DIS).html('提交中...');
                        },
                        success: function(data) {
                            if((typeof data !== 'undefined' && data !== null ? data.code : void 0) === 200) {
                                data.data.result.mobile = $u_phone.val();
                                x.set_user(data.data.result, true);
                                data_rsv.userID = x.user.id;

                                x.query_rsv({params:JSON.stringify(data_rsv)}, function(data2) {
                                    if((typeof data2 !== 'undefined' && data2 !== null ? data2.code : void 0) === 200) {
                                        if(+data2['data']['result']['result'] === 1) {
                                            hy_step3();
                                        } else if(+data2['data']['result']['result'] == 2){
                                            $('#yykd_rsv').remove();
                                            x.pop_msg('已预约，7天内无须重复预约哦', $btn);

                                        } else {
                                            $('#yykd_rsv').remove();
                                            x.pop_msg('预约失败', $btn);
                                        }
                                    } else {
                                        x.pop_msg(data2.msg, $this);
                                    }
                                });
                            } else {
                                $this.removeClass(DIS).html('提交');
                                x.pop_msg(data.msg);
                            }
                        },
                        fail: function() {
                            x.pop_msg('API错误，请稍后重试');
                            $this.removeClass(DIS).html('提交');
                        }
                    });
                }
            }
            $m_rsv.on('click', '.modal_close', function() { //关闭按钮

                if(typeof baihe !== 'undefined') {
                    if(_step == 1) {
                        baihe.bhtongji.tongji({event: 3, spm: '21.167.778.2781.6997', extend: spm_ext });
                    } else if(_step == 2) {
                        baihe.bhtongji.tongji({event: 3, spm: '21.167.778.2783.6999', extend: spm_ext });
                    } else if(_step == 3) {
                        baihe.bhtongji.tongji({event: 3, spm: (is_user_login ? '21.167.778.2785.7006' : '21.167.778.2785.7001'), extend: spm_ext });
                    }
                }
                if(_step == 1 || _step == 2) {
                    hy_step4();
                } else {
                    $m_rsv.remove();
                }
            }).on('click', '#plan_date_type a', function() { //日期切换按钮
                if($(this).is('.active')) return;
                time_type = +!time_type;
                $(this).addClass('active').siblings().removeClass('active');
                $m_rsv.find('.timeRange').addClass('none').eq($(this).index()).removeClass('none');
            }).on('click', '#rsv_a2', function() {  //关闭按钮
                baihe.bhtongji.tongji({event: 3, spm: '21.167.778.2787.7003', extend: spm_ext });
                $m_rsv.remove();
            }).on('click', '#rsv_a1', function() {//继续操作按钮
                baihe.bhtongji.tongji({event: 3, spm: '21.167.778.2786.7002', extend: spm_ext });
                if(_ostep == 1) {
                    hy_step1();
                } else {
                    hy_step2();
                }
            }).on('blur', '#lg_u_phone', function() {//验证手机号
                x.check_input($u_phone, x.regs.mobile, err_msgs.plan_mobile);
            }).on('blur', '#rsv_u_radm', function() {//验证验证码
                x.check_input($u_radm, x.regs.mob_vrf, err_msgs.mob_vrf);
            }).on('click', '#rsv_get_radm, #rsv_get_radm2', function() { //提交按钮和60秒后获取
                var $t = $(this);
                if($t.is('#rsv_get_radm')) {
                    baihe.bhtongji.tongji({event: 3, spm: '21.167.778.2780.6996', extend: spm_ext});
                }
                if($t.is('.' + DIS)) {
                    return;
                } else {
                    if(x.user.id) {
                        x.query_rsv({params:JSON.stringify(data_rsv)}, function(data2) {
                            if((typeof data2 !== 'undefined' && data2 !== null ? data2.code : void 0) === 200) {
                                if(+data2['data']['result']['result'] === 1) {
                                    hy_step3();
                                } else if(+data2['data']['result']['result'] == 2){
                                    $('#yykd_rsv').remove();
                                    x.pop_msg('已预约，7天内无须重复预约哦', $btn);
                                } else {
                                    $('#yykd_rsv').remove();
                                    x.pop_msg('预约失败', $btn);
                                }
                            } else {
                                x.pop_msg(data2.msg, $btn);
                            }
                        });
                    } else {
                        send_msg.call(this);
                    }
                }
            })
                .on('click', '#rsv_sub', rsv_login)
                .on('click', '#rsv_sub', function() {
                    baihe.bhtongji.tongji({event: 3, spm: '21.167.778.2782.6998', extend: spm_ext });
                }).on('change', '#rsv_agree', function() { //同意协议
                rsv_agree_check();
            });
        }
        function hy_step1() {//显示内容信息及手机登录框
            _step = 1;
            _ostep = 1;
            $('#yykd_rsv #title_rsv').html("查询档期");
            $stpi.addClass('none').eq(0).removeClass('none');
        };
        function hy_step2(mobile) {//显示验证码框
            _step = 2;
            _ostep = 2;
            $('#yykd_rsv #title_rsv').html("填写验证码");
            var $stp2 = $stpi.addClass('none').eq(1).removeClass('none');
            mobile && $stp2.find('#rsv_mobile_show').html(x.get_phone_show(mobile));
        };

        function hy_step3() {
            _ostep = 3;
            _step = 3;
            $('#yykd_rsv #title_rsv').html("提交成功");
            $stpi.addClass('none').eq(2).removeClass('none');
            setTimeout(function() {
                $('#yykd_rsv').remove();
            }, 7000);
        };
        function hy_step4() {
            _ostep = _step;
            _step = 4;
            $('#yykd_rsv #title_rsv').html("");
            $stpi.addClass('none').eq(3).removeClass('none');
        };


        init_step1();
        hy_step1();
        rsv_bind();


        if(x.user.id) {
            data_rsv.userID = x.user.id;
        }
    };


    x.init_index_liji = function($el) {
        if(!$el || $el.length == 0) return;
        $('#hy_lj').on('click', function() {
            x.init_rsv($(this), null, 'lj');
        });
    };


    x.yykd_list_data = "";
    x.init_list_yykd = function(sid){
        x.yykd_list_query({data: {
                params: JSON.stringify({
                    id: sid,    //企业ID
                    type: 1
                })
            },
                beforeSend: function() {
                    //$this.addClass(DIS).html('提交中...');
                },
                success: function(data) {
                    if(data.status === 200) {
                        x.yykd_list_data = data;
                    }
                },
                fail: function() {
                    // x.pop_msg('API错误，请稍后重试');
                }}
        );
    }


    x.init_list_yhj = function(sid){
        x.yhj_list_query({data: {
                params: JSON.stringify({
                    id: sid,    //企业ID
                    type: 3
                })
            },
            beforeSend: function() {

            },
            success: function(data) {

                if(data.status === 200) {
                    var i = 0;

                    if(data.result.manjian.msg.length > 0){
                        $("#sj_manjian_title").html(data.result.manjian.msg);
                        $("#sj_manjian_text").html("<pre>" + data.result.manjian.desc + "</pre>");
                        $("#pt_manjian_label").show();
                        if(i < 1){
                            $("#sj_manjian_title").parent().show();
                            $("#pt_manjian_label a").addClass("active");
                            i++;
                        }
                    }

                    if(data.result.xianjinzhijiang.msg.length > 0){
                        $("#sj_xianjinzhijiang_title").html(data.result.xianjinzhijiang.msg);
                        $("#sj_xianjinzhijiang_text").html("<pre>" + data.result.xianjinzhijiang.desc + "</pre>");
                        $("#pt_xianjinzhijiang_label").show();
                        if(i < 1){
                            $("#sj_xianjinzhijiang_title").parent().show();
                            $("#pt_xianjinzhijiang_label a").addClass("active");
                            i++;
                        }
                    }

                    if(data.result.mianfeisongquan.msg.length > 0){
                        $("#sj_mianfeisongquan_title").html(data.result.mianfeisongquan.msg);
                        $("#sj_mianfeisongquan_text").html("<pre>" + data.result.mianfeisongquan.desc + "</pre>");
                        $("#pt_mianfeisongquan_label").show();
                        if(i < 1){
                            $("#sj_mianfeisongquan_title").parent().show();
                            $("#pt_mianfeisongquan_label a").addClass("active");
                            i++;
                        }
                    }

                    if(data.result.miaoshaqiangquan.msg.length > 0){
                        $("#sj_miaoshaqiangquan_title").html(data.result.miaoshaqiangquan.msg);
                        $("#sj_miaoshaqiangquan_text").html("<pre>" + data.result.miaoshaqiangquan.desc + "</pre>");
                        $("#pt_miaoshaqiangquan_label").show();
                        if(i < 1){
                            $("#sj_miaoshaqiangquan_title").parent().show();
                            $("#pt_miaoshaqiangquan_label a").addClass("active");
                            i++;
                        }
                    }

                    if(data.result.xianshicuxiao.msg.length > 0){
                        $("#sj_xianshicuxiao_title").html(data.result.xianshicuxiao.msg);
                        $("#sj_xianshicuxiao_text").html("<pre>" + data.result.xianshicuxiao.desc + "</pre>");
                        $("#pt_xianshicuxiao_label").show();
                        if(i < 1){
                            $("#sj_xianshicuxiao_title").parent().show();
                            $("#pt_xianshicuxiao_label a").addClass("active");
                            i++;
                        }
                    }

                    if(data.result.xianshilizeng.msg.length > 0){
                        $("#sj_xianshilizeng_title").html(data.result.xianshilizeng.msg);
                        $("#sj_xianshilizeng_text").html("<pre>" + data.result.xianshilizeng.desc + "</pre>");
                        $("#pt_xianshilizeng_label").show();
                        if(i < 1){
                            $("#sj_xianshilizeng_title").parent().show();
                            $("#pt_xianshilizeng_label a").addClass("active");
                            i++;
                        }
                    }

                    if(data.result.xianshimiaosha.msg.length > 0){
                        $("#sj_xianshimiaosha_title").html(data.result.xianshimiaosha.msg);
                        $("#sj_xianshimiaosha_text").html("<pre>" + data.result.xianshimiaosha.desc + "</pre>");
                        $("#pt_xianshimiaosha_label").show();
                        if(i < 1){
                            $("#sj_xianshimiaosha_title").parent().show();
                            $("#pt_xianshimiaosha_label a").addClass("active");
                            i++;
                        }
                    }

                    if(data.result.pintuanyouhui.msg.length > 0){
                        $("#sj_pintuanyouhui_title").html(data.result.pintuanyouhui.msg);
                        $("#sj_pintuanyouhui_text").html("<pre>" + data.result.pintuanyouhui.desc + "</pre>");
                        $("#pt_pintuanyouhui_label").show();
                        if(i < 1){
                            $("#sj_pintuanyouhui_title").parent().show();
                            $("#pt_pintuanyouhui_label a").addClass("active");
                            i++;
                        }
                    }

                    if(data.result.mianchangdifei.msg.length > 0){
                        $("#sj_mianchangdifei_title").html(data.result.mianchangdifei.msg);
                        $("#sj_mianchangdifei_text").html("<pre>" + data.result.mianchangdifei.desc + "</pre>");
                        $("#pt_mianchangdifei_label").show();
                        if(i < 1){
                            $("#sj_mianchangdifei_title").parent().show();
                            $("#pt_mianchangdifei_label a").addClass("active");
                            i++;
                        }
                    }

                    if(data.result.songhunfang.msg.length > 0){
                        $("#sj_songhunfang_title").html(data.result.songhunfang.msg);
                        $("#sj_songhunfang_text").html("<pre>" + data.result.songhunfang.desc + "</pre>");
                        $("#pt_songhunfang_label").show();
                        if(i < 1){
                            $("#sj_songhunfang_title").parent().show();
                            $("#pt_songhunfang_label a").addClass("active");
                            i++;
                        }
                    }

                    if(data.result.store_arrive.msg.length > 0){
                        $("#sj_daodianli_title").html(data.result.store_arrive.msg);
                        $("#sj_daodianli_text").html("<pre>" + data.result.store_arrive.desc + "</pre>");
                        $("#sj_daodianli_label").show();
                        if(i < 1){
                            $("#sj_daodianli_title").parent().show();
                            $("#sj_daodianli_label a").addClass("active");
                            i++;
                        }
                    }

                    if(data.result.platform_arrive.msg.length > 0){
                        $("#pt_daodianli_title").html(data.result.platform_arrive.msg);
                        $("#pt_daodianli_text").html("<pre>" + data.result.platform_arrive.desc + "</pre>");
                        $("#pt_daodianli_label").show();
                        if(i < 1){
                            $("#pt_daodianli_title").parent().show();
                            $("#pt_daodianli_label a").addClass("active");
                            i++;
                        }
                    }

                    if(data.result.store_order.msg.length > 0){
                        $("#sj_dingdanli_title").html(data.result.store_order.msg);
                        $("#sj_dingdanli_text").html("<pre>" + data.result.store_order.desc + "</pre>");
                        $("#sj_dingdanli_label").show();
                        if(i < 1){
                            $("#sj_dingdanli_title").parent().show();
                            $("#sj_dingdanli_label a").addClass("active");
                            i++;
                        }
                    }

                    if(data.result.platform_order.msg.length > 0){
                        $("#pt_dingdanli_title").html(data.result.platform_order.msg);
                        $("#pt_dingdanli_text").html("<pre>" + data.result.platform_order.desc + "</pre>");
                        $("#pt_dingdanli_label").show();
                        if(i < 1){
                            $("#pt_dingdanli_title").parent().show();
                            $("#pt_dingdanli_label a").addClass("active");
                            i++;
                        }
                    }
                }
            },
            fail: function() {
                // x.pop_msg('API错误，请稍后重试');
            }}
        );

    }



    x.init_yhj_window = function(_this) {


        var sid = $(_this).data("sid");
        var spm = $(_this).data("spm");
        var source = $(_this).data("source");
        baihe.bhtongji.tongji({event: 3, spm: spm, extend: "" });


        var yhj_window = $('#yhj_window');
        function yhj_bind() {//

            var $u_phone = $('#yhj_u_phone');        //手机文本框
			// console.log('1---'+$u_phone);
            function yhj_login() {
                var b1 = x.check_input($u_phone, x.regs.mobile, err_msgs.mobile),
                    $this = $(this),
                    b2 = $this.not('.' + DIS)
                if(b1 && b2) {
                    x.yhj_login_query({
                        data: {
                            params: JSON.stringify({
                                mobile: $u_phone.val(),
                                sid: sid,
                                page_source: source
                            })
                        },
                        beforeSend: function() {
                            $this.addClass(DIS).html('领取优惠...');
                        },
                        success: function(data) {
                            if(data.status > 0) {
                                hy_step2();
                            }
                        },
                        complete: function() {
                            $this.removeClass(DIS).html('领取优惠');
                        },
                        fail: function() {
                            x.pop_msg('API错误，请稍后重试');
                            $this.removeClass(DIS).html('领取优惠');
                        }
                    });
                }
            }




            yhj_window.on('click', '.modal_close', function() { //关闭按钮
                yhj_window.hide();

            }).on('click', '.leftNav li a', function() { //切换按钮
                if($(this).is('.active')) return;
                $(this).parent().siblings().find("a").removeClass('active');
                $(this).addClass('active');

                var index = $(this).parent().index();
                $(".rightTxt span").eq(index).show().siblings().hide();
            }).on('click', '.yhj_sub', yhj_login).on('click', '.yhj_sub', function() {
                baihe.bhtongji.tongji({event: 3, spm: '21.167.778.2787.7003', extend: "" });

            })

        };

        function hy_step1() {

            $('#title_lqyh').html("领取优惠");
            $('#yhj_window #yhj_body .tool').show();    //列表窗口显示
            $('#yhj_window #yhj_body .ok').hide();      //恭喜您，领取成功！隐藏
            if(x.user.id) {         //如果已经登录了不显示提交窗口
				// console.log('id----'+x.user.id);
                $('#yhj_phone_sub').hide();
                x.user.mobile1 = (x.user.mobile1 == null || x.user.mobile1 == "") ? x.cookie.get('baihe_mobile_true') : x.user.mobile1;
                $('#yhj_u_phone').val(x.user.mobile1);
				// console.log('赋值------'+x.user.mobile1);
                // console.log(x.cookie.get('baihe_mobile_true'));
                $('.yhj_only_button').show();
            }
            else{                   //如果没有登录显示提交窗口
                $('#yhj_u_phone').val("");  //反复显示需要将手机框清空
                $('#yhj_phone_sub').show();
                $('.yhj_only_button').hide();
            }
        };
        function hy_step2() {
            $('#yhj_window #yhj_body .tool').hide();    //列表窗口隐藏
            $('#yhj_window #yhj_body .ok').show();      //恭喜您，领取成功！显示
        };

        hy_step1();
        yhj_bind();
        yhj_window.show();
    },

	//点击对比 层出现消失
	x.init_compareBox_appear=function($el,$obj,obj){
		if(!$el || $el.length == 0) return;
		//判断对比层的位置
		var $box=$('.compare_add_box');  //弹出层
		var $ul=$obj.find('ul');
		var comepare_Box_arr=[];
		var jsonClick = {hotel:'', banquet:''};
		var date = new Date();
		date.setTime(date.getTime() + 3600 * 12 * 1000);
		var storeArr={};
		var hallArr={};
		//console.log(x.cookie.get('accessID'));
		var $accessID=x.cookie.get('accessID');
		//console.log(x.cookie.get('hotelCompare-'+$accessID));
		//console.log(x.cookie.get('hallCompare-'+$accessID));

		if($('.detailCompare').length>1 || $('.compare_add_action').length>1){
		}else{
			$('.compare_add_box').hide();
		}

		//婚宴酒店
		var cookieHotel=x.cookie.get('hotelCompare-'+$accessID);
		if(cookieHotel != null){
			//判断哪个层显示
			//fnAdd(0);
			storeArr = JSON.parse(cookieHotel);
			var hotelLen = Object.keys(storeArr).length;
			for(var json in storeArr){
				//增加active
				$('.compare_add_action[data-sid="'+storeArr[json].sid+'"]').find('.compare_btn_attention').addClass('active');
				$('.detailCompare[data-sid="'+storeArr[json].sid+'"]').addClass('active');
				//console.log('sid------'+storeArr[json].sid);
				if(jsonClick.hotel.indexOf(storeArr[json].sid)>-1){
				
				}else{
					jsonClick.hotel+=storeArr[json].sid+',';
					create_comepare_Arr($('.compareGoods').find('ul'),storeArr,jsonClick.hotel);
					strNoEmpty(hotelLen+1,$('.compareGoods').find('ul'),'append','您还可以继续添加酒店');
				}
			}
			//console.log('jsonHotel----------'+jsonClick.hotel);
		}else{
			storeArr = {};
			strNoEmpty(1,$('.compareGoods').find('ul'),'append','还可以继续添加酒店');
			jsonClick.hotel='';
		}
		//------ end ------>

		//宴会厅
		var cookieHall=x.cookie.get('hallCompare-'+$accessID);
		if(cookieHall != null){
			//判断哪个层显示
			//fnAdd(1);

			hallArr = JSON.parse(cookieHall);
			var hallLen = Object.keys(hallArr).length;
			
			for(var json in hallArr){
				//增加active
				$('.hall_i[data-gid="'+hallArr[json].sid+'"]').find('.banquetHall').addClass('active');
				if(jsonClick.banquet.indexOf(hallArr[json].sid)>-1){
				
				}else{
					jsonClick.banquet+=hallArr[json].sid+',';
					create_comepare_Arr($('.compareHalls').find('ul'),hallArr,jsonClick.banquet);
					strNoEmpty(hallLen+1,$('.compareHalls').find('ul'),'append','还可以继续添加宴会厅');
				}
			}
		}else{
			hallArr = {};
			strNoEmpty(1,$('.compareHalls').find('ul'),'append','还可以继续添加宴会厅');
			jsonClick.banquet='';
		}
		

		
		$el.click(function(){
			
			if($(this).attr('class').indexOf('compare_btn_attention')>-1 || $(this).attr('class').indexOf('compareIcon')>-1){ 
				//cookie值里是否有hotel值
				var hotelLen = Object.keys(storeArr).length;
				//获取婚宴酒店的sid值
				var $parent=$(this).parent().parent();
				if($(this).attr('class').indexOf('compareIcon')>-1){  //详情页
					var $index=$(this).attr('data-sid');
					var $pic=$parent.prev().find('img').eq(0).attr('src');
					var $title=$parent.attr('data-title');
					var $price=$parent.attr('data-price');
					var $href=window.location.href;
				}else{
					//列表页
					var $index=$(this).parent().attr('data-sid');
					var $pic=$parent.find('.jd_pic img').attr('src');
					var $title=$parent.find('.jd_pic').attr('data-title');
					var $price=$parent.find('.jd_pic').attr('data-price');
					var $href=$(this).parent().prev().attr('href');
				}
				$('.compare_add_box').show();
				$('.compareTab .hide').text('隐藏');
				$('.compareTab .hide').removeClass('appearBox');
				$('.compareLines').hide();
				$('.compareGoods').show();
				$('.compare_add_box .icon').find('a').removeClass('active');
				$('.compareTab .icon').find('a').eq(0).addClass('active');
				$box.animate({'bottom':0},200);

				if($(this).hasClass('active')){
					delete storeArr[''+$index];
					jsonClick.hotel=jsonClick.hotel.replace($index+',','');
					$(this).removeClass('active');
					$obj.find('li[aIndex="'+$index+'"]').remove();
					//将点击后的酒店值存入cookie
					x.cookie.set('hotelCompare-'+$accessID, JSON.stringify(storeArr), 0, '/', x.DEFAULT_DOMAIN);
					//console.log("点击删除后存入的值 = " + JSON.stringify(storeArr));
					//console.log("点击删除后 得到的cookie = " + x.cookie.get('hotelCompare-'+$accessID));
					strNoEmpty(Object.keys(storeArr).length+1,$('.compareGoods').find('ul'),'append','您还可以继续添加酒店');

					if($('.compareGoods').find('.goodsItem').length<2){
						$('.compareGoods').find('.iconA').addClass('iconGray');	
					}
					
				}else{
					if(hotelLen>=4){
						if($box.css('display')=='none'){
							$box.show();
							$('.compareLines').hide();
							$obj.show();
							$box.css('bottom','0px');
						}
						$box.find('.erroy').show().text('对比栏已满，请删除不需要的栏目再继续添加～');
						setTimeout(function(){ $box.find('.erroy').hide(); },5000);
						return
					}
					$(this).addClass('active');
					storeArr[''+$index]= {
						'sid':$index,
						'title':$title,
						'img':$pic,
						'price':$price,
						'href':$href,
					};
					
					//将点击后的酒店值存入cookie
					x.cookie.set('hotelCompare-'+$accessID, JSON.stringify(storeArr), 0, '/', x.DEFAULT_DOMAIN);
					//console.log("存入hotel cookie值 = " + JSON.stringify(storeArr));
					//console.log("得到hotel cookie值 = " + x.cookie.get('hotelCompare-'+$accessID));
					if(Object.keys(storeArr).length>0){
						for(var json in storeArr){
							console.log('sid------'+storeArr[json].sid);
							if(jsonClick.hotel.indexOf(storeArr[json].sid)>-1){
							
							}else{
								jsonClick.hotel+=storeArr[json].sid+',';
								create_comepare_Arr($('.compareGoods').find('ul'),storeArr,jsonClick.hotel);
								strNoEmpty(Object.keys(storeArr).length+1,$('.compareGoods').find('ul'),'append','您还可以继续添加酒店');
							}
						}
						//console.log('jsonHotel----------'+jsonClick.hotel);
						$('.compareTab .icon a').removeClass('active');
						$('.compareTab .icon a').eq(0).addClass('active');
					}
				}
			}else{
				$('.compareTab .icon a').removeClass('active');
				$('.compareTab .icon a').eq(1).addClass('active');
				//cookie值里是否有hotel值
				var hallLen = Object.keys(hallArr).length;
				var $parent=$(this).parent().parent();
				var $pic=$parent.find('.pic img').attr('src');
				var $title=$parent.attr('data-title');
				var $price=$parent.attr('data-price');
				var $href=window.location.href;
				//获取婚宴酒店的sid值
				var $index=$parent.attr('data-gid');
				$('.compare_add_box').show();
				$('.compareLines').hide();
				$('.compareHalls').show();
				$('.compare_add_box .icon').find('a').removeClass('active');
				$('.compareTab .icon').find('a').eq(1).addClass('active');
				$box.animate({'bottom':0},200);

				if($(this).hasClass('active')){
					delete hallArr[''+$index];
					jsonClick.banquet=jsonClick.banquet.replace($index+',','');
					$(this).removeClass('active');
					$obj.find('li[aIndex="'+$index+'"]').remove();
					//将点击后的酒店值存入cookie
					x.cookie.set('hallCompare-'+$accessID, JSON.stringify(hallArr), 0, '/', x.DEFAULT_DOMAIN);
					strNoEmpty(Object.keys(hallArr).length+1,$('.compareHalls').find('ul'),'append','还可以继续添加宴会厅');

					if($('.compareHalls').find('.goodsItem').length<2){
						$('.compareHalls').find('.iconA').addClass('iconGray');	
					}
				}else{
					if(Object.keys(hallArr).length>=4){
						if($box.css('display')=='none'){
							$box.show();
							$('.compareLines').hide();
							$obj.show();
							$box.css('bottom','0px');
						}
						$box.find('.erroy').show().text('对比栏已满，请删除不需要的栏目再继续添加～');
						setTimeout(function(){ $box.find('.erroy').hide(); },5000);
						return
					}

					$(this).addClass('active');
					hallArr[''+$index]= {
						'sid':$index,
						'title':$title,
						'img':$pic,
						'price':$price,
						'href':$href,
					};
					//将点击后的酒店值存入cookie
					x.cookie.set('hallCompare-'+$accessID, JSON.stringify(hallArr), 0, '/', x.DEFAULT_DOMAIN);
					//console.log("存入banquet cookie值 = " + JSON.stringify(hallArr));
					//console.log("得到banquet cookie值 = " + x.cookie.get('hallCompare-'+$accessID));
					if(Object.keys(hallArr).length>0){
						for(var json in hallArr){
							console.log('sid------'+hallArr[json].sid);
							if(jsonClick.banquet.indexOf(hallArr[json].sid)>-1){
							
							}else{
								jsonClick.banquet+=hallArr[json].sid+',';
								create_comepare_Arr($('.compareHalls').find('ul'),hallArr,jsonClick.banquet);
								strNoEmpty(Object.keys(hallArr).length+1,$('.compareHalls').find('ul'),'append','还可以继续添加宴会厅');
							}
						}
						//console.log('jsonBanquet----------'+jsonClick.banquet);
						$('.compareTab .icon a').removeClass('active');
						$('.compareTab .icon a').eq(1).addClass('active');
					}
				}
			}
		});
		$('body').on('click','.compareGoods .iconGray',function(){
			$box.find('.erroy').show().text('至少有两家酒店才可以对比哦～');
			setTimeout(function(){ $box.find('.erroy').hide(); },5000);
		});
		$('body').on('click','.compareHalls .iconGray',function(){
			$box.find('.erroy').show().text('至少有两个宴会厅才可以对比哦～');
			setTimeout(function(){ $box.find('.erroy').hide(); },5000);
		});

		//删除
		$('body').on('mouseover','.compareGoods ul li,.compareHalls ul li',function(){
			$(this).find('.del').show();
		}).on('mouseout','.compareGoods ul li,.compareHalls ul li',function(){
			$(this).find('.del').hide();
		});
		$('body').on('click','.compareGoods li .del',function(){
			$(this).parent().remove();
			//删除的产品 sid值
			var $index=$(this).parent().attr('aIndex');
			$('.compare_add_action[data-sid="'+$index+'"]').find('div').removeClass('active');
			$('.detailCompare[data-sid="'+$index+'"]').removeClass('active');
			//婚宴酒店
			delFun($('.compareGoods'),$index,'.compareGoods');
		});
		$('body').on('click','.compareHalls li .del',function(){
			$(this).parent().remove();
			var $index=$(this).parent().attr('aIndex');
			$('.hall_i[data-gid="'+$index+'"]').find('.banquetHall').removeClass('active');
			delFun($('.compareHalls'),$index,'.compareHalls');
		});

		//清空
		$('body').on('click','.compareGoods .iconB',function(){
			$('.compareGoods ul').html('');
			storeArr = {};
			jsonClick.hotel='';
			//将点击后的酒店值存入cookie
			x.cookie.set('hotelCompare-'+$accessID, JSON.stringify(storeArr), 0, '/', x.DEFAULT_DOMAIN);

			$('.compare_add_action[data-sid]').find('.compare_btn_attention').removeClass('active');
			$('.detailCompare[data-sid]').removeClass('active');
			var $index=$(this).parent().parent().find('.goodsItem').attr('aIndex');
			//没有商品时
			strNoEmpty(1,$('.compareGoods').find('ul'),'append','您还可以继续添加酒店');
			$('.compareGoods .iconA').addClass('iconGray');
		});
		$('body').on('click','.compareHalls .iconB',function(){
			$('.compareHalls ul').html('');
			hallArr = {};
			jsonClick.banquet='';
			//将点击后的酒店值存入cookie
			x.cookie.set('hallCompare-'+$accessID, JSON.stringify(hallArr), 0, '/', x.DEFAULT_DOMAIN);
			//console.log("清空时banquet cookie值 = " + JSON.stringify(hallArr));
			//console.log("清空时hotel cookie值 = " + x.cookie.get('hallCompare-'+$accessID));
			$('.banquetHall').removeClass('active');
			//没有商品时
			strNoEmpty(1,$('.compareHalls').find('ul'),'append','还可以继续添加宴会厅');
			$('.compareHalls .iconA').addClass('iconGray');
		});

		function delFun(obj,$index,$class){
			obj.find('ul').find('.goodsEmpty').remove();
			if($class=='.compareGoods'){
				//console.log('点击删除的index-----'+storeArr[''+$index]);
				delete storeArr[''+$index];
				jsonClick.hotel=jsonClick.hotel.replace($index+',','');
				//将点击后的酒店值存入cookie
				x.cookie.set('hotelCompare-'+$accessID, JSON.stringify(storeArr), 0, '/', x.DEFAULT_DOMAIN);
				//console.log("点击删除后存入的值 = " + JSON.stringify(storeArr));
				//console.log("点击删除后 得到的cookie = " + x.cookie.get('hotelCompare-'+$accessID));
				strNoEmpty(obj.find('ul').children().length+1,obj.find('ul'),'append','您还可以继续添加酒店');
				//没有商品时
				if(obj.find('ul').find('.goodsItem').length<2){
					obj.find('.iconA').addClass('iconGray');	
				}
			}else{
				delete hallArr[''+$index];
				jsonClick.banquet=jsonClick.banquet.replace($index+',','');
				xlk.cookie.set('hallCompare-'+$accessID,JSON.stringify(hallArr), 0, '/', x.DEFAULT_DOMAIN);
				//console.log("点击删除后存入的值 = " + JSON.stringify(storeArr));
				//console.log("点击删除后 得到的cookie = " + x.cookie.get('hotelCompare-'+$accessID));
				strNoEmpty(obj.find('ul').children().length+1,obj.find('ul'),'append','还可以继续添加宴会厅');
				//没有商品时
				if(obj.find('ul').find('.goodsItem').length<2){
					obj.find('.iconA').addClass('iconGray');	
				}
			}
			
			
			//return json;
		}

		function create_comepare_Arr($ul,storeArr,json){	
			$ul.empty();
			var $json=json.substring(0,json.length-1).split(',');
			$($json).each(function(i,elem){
				var strCompare='';
				strCompare+='<li class="goodsItem" aIndex="'+storeArr[$json[i]].sid+'">';
				strCompare+='	<a href="'+storeArr[$json[i]].href+'" target="_blank" onclick="$(this).parent().parent().parent().attr(\'class\').indexOf(\'compareGoods\')>-1?baihe.bhtongji.tongji({\'event\': \'3\', spm: \'39.144.1571.4797.13880\'}):baihe.bhtongji.tongji({\'event\': \'3\', spm: \'39.144.1570.4796.13876\'})">';
				strCompare+='		<img src="'+storeArr[$json[i]].img+'">';
				strCompare+='		<p>'+storeArr[$json[i]].title+'</p>';
				strCompare+='	</a>';
				strCompare+='	<strong>￥'+parseInt(storeArr[$json[i]].price)+'/桌起</strong>';
				strCompare+='	<a href="javascript:;" class="del">删除</a>';
				strCompare+='</li>';
				//没有添加过 或者 全部清空的时候
				$ul.append(strCompare);
			});
			if(Object.keys(storeArr).length>=2){
				$ul.next().find('.iconA').removeClass('iconGray');
				$ul.next().find('.iconB').show();
			}
		}
		function strNoEmpty($index,$ul,evt,$txt){
			$ul.find('.goodsEmpty').remove();	
			for(var i=$index;i<=4;i++){
				var strEmpty='';
				
				strEmpty+='<li class="goodsEmpty"><a href="javascript:;" class="empty">';
				strEmpty+='  <p><span>'+i+'</span></p>';
				strEmpty+= $txt;
				strEmpty+='  </a>';
				strEmpty+='</li>';
				if($ul.children().length>=4){
					return;
				}else{
					if($ul.find('.goodsItem').length<4){
						$ul[evt](strEmpty);
					}else{
						$ul.find('.goodsItem')[evt](strEmpty);
						console.log('2');
					}
				}
				
			}
		}
	},

    root.xlk = x;

})(window);


$(function() {

    if($('.j_rsv').length > 0){ //如果有预约看店的时候
        var sid = $('.j_rsv:eq(0)').attr("data-sid");
        xlk.init_list_yykd(sid);//获取预约看店列表数据
    }

    if($('.yxgj_window').length > 0){
        //var sid = $(this).attr("data-sid");
        var sid = $('.yxgj_window:eq(0)').attr("data-sid");
        xlk.init_list_yhj(sid); //获取优惠卷列表数据
        $('.yxgj_window').click(function(){
            xlk.init_yhj_window(this);//领取优惠卷提交的时候
        });
    }


    xlk.init_index_liji($('#hy_lj'));

    xlk.init_subscribe( $('.j_addr_send_msg') );

    $('body').on('click', '.j_rsv, .j_rsv_hv_btn', function() {
        xlk.init_rsv($(this)); //所有预约入口走这里
    }).on('click', '.j_rsv_pln', function(){
        xlk.init_pln_rsv($(this));  //档期位置入口
    }).on('click', '.j_no_pop_a', function(e) {
        e.preventDefault();
    })

	//前端测试用 对应index值
	$('#jd_lst').find('.jd_i').children('a').click(function(i,elem){
		//$(this).attr('href',$('#jd_lst').find('.jd_i').children('a').attr('href')+'#'+$(this).parents('.jd_i').index());
	});
	
	//tab 切换
	$('body').on('click', '.compareTab .icon a', function() {
		$(this).addClass('active').siblings().removeClass('active');
		if($(this).index()==0){
			$('.compareGoods').show();
			$('.compareHalls').hide();
			baihe.bhtongji.tongji({'event': 3, spm: '39.144.1571.4802.13881'});
			$('.compare_add_box').animate({'bottom':'0'},300);
			$('.compareTab .hide').text('隐藏');
			$('.compareTab .hide').removeClass('appearBox');
		}else{
			$('.compareHalls').show();
			$('.compareGoods').hide();
			baihe.bhtongji.tongji({'event': 3, spm: '39.144.1570.4800.13877'});
			$('.compare_add_box').animate({'bottom':'0'},300);
			$('.compareTab .hide').text('隐藏');
			$('.compareTab .hide').removeClass('appearBox');
		}
	});

	//
    var compareAccessID=xlk.cookie.get('accessID');
    var shortCity = xlk.cookie.get('baihe_city_short') ? xlk.cookie.get('baihe_city_short') : 'bj';

	$('.compareGoods .iconA').click(function(){
		if(!$(this).hasClass('iconGray')){
            var compareSid1 = $(".compareGoods ul li").eq(0).attr('aindex') != undefined ? $(".compareGoods ul li").eq(0).attr('aindex') : 0;
            var compareSid2 = $(".compareGoods ul li").eq(1).attr('aindex') != undefined ? $(".compareGoods ul li").eq(1).attr('aindex') : 0;
            var compareSid3 = $(".compareGoods ul li").eq(2).attr('aindex') != undefined ? $(".compareGoods ul li").eq(2).attr('aindex') : 0;
            var compareSid4 = $(".compareGoods ul li").eq(3).attr('aindex') != undefined ? $(".compareGoods ul li").eq(3).attr('aindex') : 0;
            var shortCity = xlk.cookie.get('baihe_city_short') ? xlk.cookie.get('baihe_city_short') : 'bj';
            var compareStoreUrl = "/" + shortCity + "/hunyanchangdi/comparestore-"+ compareSid1 + "-" + compareSid2 + "-" + compareSid3 + "-" + compareSid4 + ".html";
            baihe.bhtongji.tongji({'event': '3', spm: '39.144.1571.4799.13879'});
			window.open(compareStoreUrl);
		}
	});

	$('.compareHalls ').on('click','.iconA',function(){
		if(!$(this).hasClass('iconGray')){
            /*var compareGid1 = 0;
            var compareGid2 = 0;
            var compareGid3 = 0;
            var compareGid4 = 0;
            goodsInfo=xlk.cookie.get('hallCompare-' + compareAccessID);
            if(goodsInfo != null){
                var gindex = 1;
                $.each(JSON.parse(goodsInfo), function(kg, vg){
                    switch(gindex){
                        case 1:
                            compareGid1 = kg;
                            break;
                        case 2:
                            compareGid2 = kg;
                            break;
                        case 3:
                            compareGid3 = kg;
                            break;
                        case 4:
                            compareGid4 = kg;
                            break;
                    }
                    gindex++;
                })
            }*/

            var compareGid1 = $(".compareHalls ul li").eq(0).attr("aindex") != undefined ? $(".compareHalls ul li").eq(0).attr('aindex') : 0 ;
            var compareGid2 = $(".compareHalls ul li").eq(1).attr("aindex") != undefined ? $(".compareHalls ul li").eq(1).attr('aindex') : 0;
            var compareGid3 = $(".compareHalls ul li").eq(2).attr("aindex") != undefined ? $(".compareHalls ul li").eq(2).attr('aindex') : 0;
            var compareGid4 = $(".compareHalls ul li").eq(3).attr("aindex") != undefined ? $(".compareHalls ul li").eq(3).attr('aindex') : 0;
            var compareGoodsUrl = "/" + shortCity + "/hunyanchangdi/comparegoods-"+ compareGid1 + "-" + compareGid2 + "-" + compareGid3 + "-" + compareGid4 + ".html";
            baihe.bhtongji.tongji({'event': '3', spm: '39.144.1570.4799.13875'});
			window.open(compareGoodsUrl);
		}
	});

	//隐藏
	$('.compare_add_box').on('click','.compareTab .hide',function(){
		var $box=$('.compare_add_box');
		if($('.compareGoods').find('.goodsItem').length>0 || $('.compareHalls').find('.goodsItem').length>0){
			$box.animate({'bottom':'-182px'},200);
			$('.compareTab .hide').text('显示');
			$(this).addClass('appearBox');
		}else{
			$box.animate({'bottom':-$box.height()},200);
			setTimeout(function(){$box.hide()},200);
			$(this).removeClass('appearBox');
		}
	});
	$('.compare_add_box').on('click','.appearBox',function(){
		var $box=$('.compare_add_box');
		$box.animate({'bottom':0},200);
		$('.compareTab .hide').text('隐藏');
		$(this).removeClass('appearBox');
	});

	//存酒店
	var clickArr=[];
	//存宴会厅
	var clickArr2=[];
	
	//点击出现对比层 婚宴酒店
	xlk.init_compareBox_appear($('.compare_btn_attention'),$('.compareGoods'),'.compareGoods');
	//xlk.init_compareBox_appear($('.hall_compare_attention'),$('.compareHalls'),'.compareHalls');
	//宴会厅
	xlk.init_compareBox_appear($('.banquetHall'),$('.compareHalls'),'.compareHalls');
	//详情页对比
	xlk.init_compareBox_appear($('.detailCompare'),$('.compareGoods'),'.compareGoods');

});
/*common_fns 1 end*/

/*---- 到店礼 ----*/
function showGift() {
  var i,p,v,obj,args=showGift.arguments;
  for (i=0; i<(args.length-2); i+=3) 
  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
};

/*---- 支付订金 ----*/
function depositEffect(){
    var cUrl = window.location.href;
	var items = cUrl.split('#');
	//判断是否回跳
    var userID = xlk.cookie.get('baihe_uid');
	if (items[1] == 'callback') {
        if ((userID == undefined || userID == '') && (xlk.user.id == '' || xlk.user.id == null)) {
            xlk.m_login();
        } else {
            $('#depositLayer').css('display','block');
            $('.depositState').css('display','block');
        }
    }

    $('.zfdj_btn').click(function(){
        if ((userID == undefined || userID == '') && (xlk.user.id == '' || xlk.user.id == null)) {
            xlk.m_login();
        } else {
            $('#depositLayer').css('display','block');
            $('.depositLayer').css('display','block');
            $('.depositState').css('display','none');
        }
    })

    $('.oneStop_zfdj_btn').click(function(){
        var userID = xlk.cookie.get('baihe_uid');
        if ((userID == undefined || userID == '') && (xlk.user.id == '' || xlk.user.id == null)) {
            xlk.m_login();
        } else {
            $('#depositLayer').css('display','block');
            $('.depositLayer').css('display','block');
            $('.depositState').css('display','none');
            //更改page_source值
            $("#aliPay").attr('data-page_source','pc_yzs_d_tk_zfdj');
        }
    })


    $('.depositLayer .modal_close,.depositState .modal_close').click(function(){
        $('#depositLayer').css('display','none');
        $('#payment').css('display','block');
        $('.qrCode').css('display','none');
        $('.depositLayer .icon a').removeClass('active');
    })

    $('#qrCode_wx').click(function(){
        $('#payment').css('display','none');
        $('.qrCode').css('display','block');
    })

    $('#aliPay').click(function(){
        var depositV = $("#payment .active").attr('data-value');
        var depositN = $("#payment .active").attr('data-name');
        var sid = $('#aliPay').attr('data-sid');
        var payUrl = 'http://mall.hunli.baihe.com/simple/carthl/payment/10/hl_gear/'+depositV+'/hl_storeid/'+sid;
        window.open(payUrl);
        $('.depositLayer').css('display','none');
        $('.depositState').css('display','block');



        //添加销售易记录
        var data_rsv = {
            sID: $('#aliPay').attr('data-sid') || '',
            type: $('#aliPay').attr('data-type') || '1',
            gID: $('#aliPay').attr('data-gid') || '',
            page_source: $('#aliPay').attr('data-page_source') || '',
            way_source: $('#aliPay').attr('data-way_source') || 133,
            userID: xlk.user.id,
            comment: depositN + ', 金额:'+ depositV +'元, 未付订金',
            appID: '7'
        }

        xlk.query_xsyLog({params:JSON.stringify(data_rsv)}, function(data2) {
            if((typeof data2 !== 'undefined' && data2 !== null ? data2.code : void 0) === 200) {
                if(+data2['data'] > 0) {
                    console.log('预约成功.');
                } else {
                    console.log('预约失败.');
                }
            } else {
                console.log('预约异常.');
            }   
        });
    })


    $('.depositLayer .num a,.depositLayer .icon a').click(function(){
        $(this).addClass('active').siblings('a').removeClass('active');
    })
}
