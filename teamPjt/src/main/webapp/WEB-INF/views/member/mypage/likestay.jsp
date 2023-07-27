<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>likestay</title>
    <link rel="stylesheet" href="/resources/css/mypage/likestay.css">
</head>
<body>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/likestay.css">
</head>

    <body style="overflow: visible;"><noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-M24ZFBJ"
                height="0" width="0" title="googletagmanager-iframe"
                style="display:none;visibility:hidden"></iframe></noscript>
    <!-- 헤더 -->
	<%@ include file="../../common/header.jsp" %>

        <div id="fb-root" class=" fb_reset">
            <script async="" src="https://connect.facebook.net/en_US/all.js"></script>
            <div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
                <div></div>
            </div>
        </div>
            <!-- =============================== 헤더 ============================================-->
                </div>
                <div id="contents">
                    <div class="container sub_title">
                        <div class="tit">MY PAGE</div>
                    </div>
                    <div class="container mypage_wrap">
                        <div class="mypage_myinfo">
                            <!-- =============================== 이름 ============================================-->
                            <div class="tit">000님 반가워요!</div>
                            <div class="my-count" role="link" tabindex="0">함께 0번의 여행을 했어요.</div>
                        </div>
                        <div class="newmypage_menu pc_only">
                            <ul>
                                <li class=""><a href="./reservation">예약 정보</a></li>
								<li class=""><a href="./cancel">취소 내역</a></li>
								<li class="active"><a href="./likestay">관심 스테이</a></li>
								<li class=""><a href="member/mypage/info">회원 정보 수정</a></li>
								<li><a href="/chat">메시지</a></li>
                            </ul>
                        </div>
                        <div class="mypage_content">
                            <div class="likestay_wrap">
                                <div class="likestay_box" role="presentation">
                                    <div class="info_container">
                                        <!-- =============================== 숙소정보 ============================================-->
                                        <div class="name"><span class="ellipsis"
                                                style="padding-bottom: 0px;">스테이무카</span><small>staymuka</small></div>
                                        <div class="stay">
                                            <p class="txt mo_only"><span class="ellipsis">staymuka</span></p>
                                            <p class="option">전라/장성군<br>최소 4명 / 최대 6명<br>₩400,000 ~ ₩480,000</p>
                                        </div>
                                        <!-- =============================== 예약 링크 ============================================-->
                                        <div class="btns"><button type="button" class="btn_bk"><a
                                                    href="/findstay/staymuka">예약하기</a></button></div><a
                                            href="/findstay/staymuka">
                                            <div class="likestay_img" role="presentation" style="padding-top: 0px;">
                                                <ul
                                                    class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events slider1 flist_slider">
                                                    <div class="swiper-wrapper">
                                                        <li class="swiper-slide swiper-slide-active img"
                                                            style="background: url(&quot;https://images.stayfolio.com/system/pictures/images/000/144/994/display/da4b0a181e677eb34638abe5b91695985b43613d.jpg?1664264819&quot;) center center / cover no-repeat; width: 372px;">
                                                        </li>
                                                        
                                                    </div><span>
                                                        <div class="_badge_badge_wrapper__h9IsV">
                                                        </div>
                                                    </span>
                                                </ul>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="paging"><a href="/" class="prev" title="이전 페이지">이전 페이지</a><a href="/"
                                    class="on">1</a><a href="/" class="next" title="다음 페이지">다음 페이지</a></div>
                        </div>
                    </div>
                </div>
                <!-- =============================== 푸터 ============================================-->
                <nav id="moMenu" class="mo-samll-only">
                    <ul>
                        <li><a class="" href="/findstay"><span>FIND STAY</span></a></li>
                        <li><a class="" href="/promotions"><span>PROMOTION</span></a></li>
                        <li><a class="" href="/journal"><span>JOURNAL</span></a></li>
                        <li><a class="" href="/preorder"><span>PRE-ORDER</span></a></li>
                        <li><a class=" false" href="/chat"><span>MESSAGE</span></a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <script src="/static/js/channelService.js"></script>
        <script id="__NEXT_DATA__"
            type="application/json">{"props":{"pageProps":{},"__N_SSP":true},"page":"/mypage/likestay","query":{},"buildId":"AkcWTw6G0_1t0OXgJhXZm","runtimeConfig":{"env":"production","config":{"baseDomain":"www.stayfolio.com","japanDomain":"www.stayfolio.jp","baseUrl":"https://www.stayfolio.com","bookingBaseUrl":"https://booking.stayfolio.com","globalBaseUrl":"https://global.stayfolio.com","naverMapApi":"i59qdpx9jz","googleMapApi":"AIzaSyCo0zg_f-jXKYyNh0m8dNwnnJYKnV3cMxo","googleOptimizeId":"OPT-P42MRXV","facebookAppId":"655307821227409","naverClientId":"HCZeJg5T3oPtnRap37Ya","kakaoClientId":"2b729d2a0ab2e8369f7fecb0cc9119a8","kakaoJavaScriptId":"ed6ca5f5662314a6c3a9246a5b21a165","gmoCreditCardApiKey":"9200005833356","gmoCreditCardUrl":"https://static.mul-pay.jp/ext/js/token.js","codeNButterId":"ijqjntuwow","shopLiveUrl":"https://static.shoplive.cloud/shoplive-shortform.js","shopLiveKoId":"ZPqRY5SbZtFtqkf1Ny71","shopLiveEnId":"caToTAlk2pX7TOjruXby","shopLiveJaId":"PsQM3fcBKIuMOn3PQWu6","nextDataPath":"_next/data","i18nDebug":false}},"isFallback":false,"gssp":true,"customServer":true,"locale":"ko","locales":["ko","en","ja"],"defaultLocale":"ko","domainLocales":[{"domain":"www.stayfolio.jp","defaultLocale":"ja"}],"scriptLoader":[]}</script>
        <script src="/static/js/ie-popup.js"></script><next-route-announcer>
            <p aria-live="assertive" id="__next-route-announcer__" role="alert"
                style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; white-space: nowrap; overflow-wrap: normal;">
            </p>
        </next-route-announcer>
        <script type="text/javascript"
            id="">!function (b, e, f, g, a, c, d) { b.fbq || (a = b.fbq = function () { a.callMethod ? a.callMethod.apply(a, arguments) : a.queue.push(arguments) }, b._fbq || (b._fbq = a), a.push = a, a.loaded = !0, a.version = "2.0", a.queue = [], c = e.createElement(f), c.async = !0, c.src = g, d = e.getElementsByTagName(f)[0], d.parentNode.insertBefore(c, d)) }(window, document, "script", "https://connect.facebook.net/en_US/fbevents.js"); fbq("init", "1800125330267035"); fbq("track", "PageView");</script>
        <noscript><img height="1" width="1" style="display:none"
                src="https://www.facebook.com/tr?id=1800125330267035&amp;ev=PageView&amp;noscript=1"></noscript>
        <script type="text/javascript" id="" charset="UTF-8" src="//t1.daumcdn.net/kas/static/kp.js"></script>
        <script type="text/javascript"
            id="gtm-scroll-tracking-for-spa">(function (b) {
                    function d() { if (!(this instanceof d)) return new d; this._config = {}; this._tracked = []; this._eventName = ""; this._tracking = this._tracking.bind(this); this._listenerAdded = !1 } d.prototype._tracking = function () {
                        var a = this._config, c = this._getTotalHeight(), f = this._getScrollPosition(); c = this._getPercentScroll(c, f); f = this._tracked; for (var g = 0; g < a.scroll_depth.length; g++) {
                            var e = a.scroll_depth[g]; c >= e && -1 === f.indexOf(e) && (console.log("customScrollTracker tracked : ", e + "%"), f.push(e), b.dataLayer.push({
                                event: this._eventName,
                                scroll_depth: e
                            }))
                        }
                    }; d.prototype.on = function (a, c) { this._config = a; this._eventName = c; this._listenerAdded || (b.addEventListener("scroll", this._tracking, { passive: !0 }), this._listenerAdded = !0) }; d.prototype.remove = function () { this._listenerAdded && (b.removeEventListener("scroll", this._tracking, { passive: !0 }), this._listenerAdded = !1) }; d.prototype._getTotalHeight = function () {
                        var a = document.body, c = document.documentElement; a = Math.max(a.scrollHeight, a.offsetHeight, c.clientHeight, c.scrollHeight, c.offsetHeight); return a -
                            b.innerHeight
                    }; d.prototype._getScrollPosition = function () { return void 0 !== b.scrollY ? b.scrollY : b.pageYOffset }; d.prototype._getPercentScroll = function (a, c) { a = Math.round(c / a * 100); 0 > a ? a = 0 : 100 < a && (a = 100); return a }; b.ScrollTracker = d
                })(this);
                (function (b) { var d = b.customScrollTracker, a = [25, 50, 75, 90], c = "custom_scroll_tracking"; a = { scroll_depth: a }; d ? (b.customScrollTracker.remove(), b.customScrollTracker = null, console.log("customScrollTracker deleted..."), b.customScrollTracker = new ScrollTracker, console.log("customScrollTracker regenerated...")) : (b.customScrollTracker = new ScrollTracker, console.log("customScrollTracker initiated...")); b.customScrollTracker.on(a, c) })(window);</script>
        <script type="text/javascript" id="" src="//wcs.naver.net/wcslog.js"></script>
        <div id="ch-plugin" class="notranslate" style="z-index: 10000000 !important;">
            <div id="ch-plugin-entry">
                <div style="display: block !important;"></div>
            </div>
            <div id="ch-plugin-script" style="display:none;" class="ch-messenger-hidden"> <iframe
                    id="ch-plugin-script-iframe" title="Channel chat"
                    style="position:relative!important;height:100%!important;width:100%!important;border:none!important;"></iframe>
            </div>
            <style data-styled="active" data-styled-version="5.3.9"></style>
        </div>
        <script type="text/javascript" id="">kakaoPixel("5345791374121416595").pageView();</script>
        <script type="text/javascript"
            id="">if (!wcs_add) var wcs_add = {}; wcs_add.wa = "s_4371e2020dab"; if (!_nasa) var _nasa = {}; window.wcs && (wcs.inflow(), wcs_do(_nasa));</script>
        <script src="/_next/static/chunks/9152-34f2910855f97eb3.js"></script>
        <script src="/_next/static/chunks/pages/promotions-f9675c9006ddc614.js"></script>
        <script src="/_next/static/chunks/9322-5ec188649d4ce518.js"></script>
        <script src="/_next/static/chunks/pages/findstay-a0f7aabc0274a1e3.js"></script>
        <script src="/_next/static/chunks/pages/preorder-b9ee57648264009c.js"></script>
        <script src="/_next/static/chunks/pages/mypage/offlinepass-5b8f54ac0f9ae125.js"></script>
        <script src="/_next/static/chunks/fec483df-7c0692bd397c929f.js"></script>
        <script src="/_next/static/chunks/6817-8a306c5ba44deb83.js"></script>
        <script src="/_next/static/chunks/pages/login-9beaf97cea69447e.js"></script>
        <script src="/_next/static/chunks/5675-55cd506a1f871987.js"></script>
        <script src="/_next/static/chunks/pages/index-94dafbca6d11d4f0.js"></script>
        <script src="/_next/static/chunks/pages/chat-054d05498060d544.js"></script>
        <script src="/_next/static/chunks/6725-01e98973bcaf003b.js"></script>
        <script src="/_next/static/chunks/5925-e9d279b579b447b4.js"></script>
        <script src="/_next/static/chunks/pages/journal/picks/%5Bidentifier%5D-4da3eacb7772e1da.js"></script>
        <script src="/_next/static/chunks/7084-aa45ddbc35e9ca04.js"></script>
        <script src="/_next/static/chunks/1639-18ed63b40105c938.js"></script>
        <script src="/_next/static/chunks/pages/findstay/%5Bidentifier%5D-88b0f50c00a4bb4e.js"></script>
        <script src="/_next/static/chunks/4824-06b75777f13ab866.js"></script>
        <script src="/_next/static/chunks/pages/mypage/reservation-a01571262cb0ce25.js"></script>
        <script src="/_next/static/chunks/pages/mypage/reservation/cancel-5c7691f3b5a91f8a.js"></script>
        <script src="/_next/static/chunks/4853-27357c75ce9c716a.js"></script>
        <script src="/_next/static/chunks/3298-e7baf27e3a520be1.js"></script>
        <script src="/_next/static/chunks/pages/mypage/account/edit-86e3367dc08cadf9.js"></script>
        <script src="/_next/static/chunks/pages/about-1c4122ab68a76fc6.js"></script>
        <script src="/_next/static/chunks/pages/4-point-approach-abf9f68f467ae115.js"></script>
        
        <!-- 푸터 -->
		<%@ include file="../../common/footer.jsp" %>

</body>

</html>
</body>
</html>