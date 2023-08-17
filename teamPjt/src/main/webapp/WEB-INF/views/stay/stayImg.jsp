<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/common/48ab7619b7161b1c.css" rel="stylesheet">
<link href="../resources/css/common/5f0d2e1da89b35fb.css" rel="stylesheet">
<link href="../resources/css/list/list.css" rel="stylesheet">
<style>
	@font-face {
            font-family: SpoqaHanSans;
            font-weight: 100;
            src: url(/_next/static/media/SpoqaHanSansRegular.50d57b70.ttf) format("truetype"), url(/_next/static/media/SpoqaHanSansRegular.328aee46.woff) format("woff"), url(/_next/static/media/SpoqaHanSansRegular.ccdc4420.woff2) format("woff2")
        }

        @font-face {
            font-family: SpoqaHanSans;
            font-weight: 300;
            src: url(/_next/static/media/SpoqaHanSansRegular.50d57b70.ttf) format("truetype"), url(/_next/static/media/SpoqaHanSansRegular.328aee46.woff) format("woff"), url(/_next/static/media/SpoqaHanSansRegular.ccdc4420.woff2) format("woff2")
        }

        @font-face {
            font-family: SpoqaHanSans;
            font-weight: 400;
            src: url(/_next/static/media/SpoqaHanSansRegular.50d57b70.ttf) format("truetype"), url(/_next/static/media/SpoqaHanSansRegular.328aee46.woff) format("woff"), url(/_next/static/media/SpoqaHanSansRegular.ccdc4420.woff2) format("woff2")
        }

        @font-face {
            font-family: SpoqaHanSans;
            font-weight: 500;
            src: url(/_next/static/media/SpoqaHanSansRegular.50d57b70.ttf) format("truetype"), url(/_next/static/media/SpoqaHanSansRegular.328aee46.woff) format("woff"), url(/_next/static/media/SpoqaHanSansRegular.ccdc4420.woff2) format("woff2")
        }

        @font-face {
            font-family: SpoqaHanSans;
            font-weight: 700;
            src: url(/_next/static/media/SpoqaHanSansBold.0fd60c37.ttf) format("truetype"), url(/_next/static/media/SpoqaHanSansBold.f9065bbd.woff) format("woff"), url(/_next/static/media/SpoqaHanSansBold.0c12aa88.woff2) format("woff2")
        }

        @font-face {
            font-family: SpoqaHanSans;
            font-weight: 800;
            src: url(/_next/static/media/SpoqaHanSansBold.0fd60c37.ttf) format("truetype"), url(/_next/static/media/SpoqaHanSansBold.f9065bbd.woff) format("woff"), url(/_next/static/media/SpoqaHanSansBold.0c12aa88.woff2) format("woff2")
        }

        @font-face {
            font-family: NanumSquare;
            font-weight: 100;
            src: url(/_next/static/media/NanumSquareL.89916685.eot);
            src: url(/_next/static/media/NanumSquareL.89916685.eot?#iefix) format("embedded-opentype"), url(/_next/static/media/NanumSquareL.20f00212.woff) format("woff"), url(/_next/static/media/NanumSquareL.c5f442a7.ttf) format("truetype")
        }

        @font-face {
            font-family: NanumSquare;
            font-weight: 300;
            src: url(/_next/static/media/NanumSquareR.7bd3e46d.eot);
            src: url(/_next/static/media/NanumSquareR.7bd3e46d.eot?#iefix) format("embedded-opentype"), url(/_next/static/media/NanumSquareR.c0c44f2a.woff) format("woff"), url(/_next/static/media/NanumSquareR.e314b586.ttf) format("truetype")
        }

        @font-face {
            font-family: NanumSquare;
            font-weight: 500;
            src: url(/_next/static/media/NanumSquareB.0a85fe47.eot);
            src: url(/_next/static/media/NanumSquareB.0a85fe47.eot?#iefix) format("embedded-opentype"), url(/_next/static/media/NanumSquareB.1ef493de.woff) format("woff"), url(/_next/static/media/NanumSquareB.ccf112ee.ttf) format("truetype")
        }

        @font-face {
            font-family: NanumSquare;
            font-weight: 700;
            src: url(/_next/static/media/NanumSquareEB.3c60c42a.eot);
            src: url(/_next/static/media/NanumSquareEB.3c60c42a.eot?#iefix) format("embedded-opentype"), url(/_next/static/media/NanumSquareEB.abcc264b.woff) format("woff"), url(/_next/static/media/NanumSquareEB.d6c2427e.ttf) format("truetype")
        }

        @font-face {
            font-family: Abel;
            font-style: normal;
            font-weight: 300;
            src: local("Abel"), url(/_next/static/media/Abel-Regular.7b8ef719.woff) format("woff")
        }

        @font-face {
            font-family: Lato-Light;
            font-style: normal;
            font-weight: 400;
            src: local("Lato Light"), url(/_next/static/media/Lato-Light.1d96d260.woff) format("woff")
        }

        @font-face {
            font-family: Lato-Regular;
            font-style: normal;
            font-weight: 400;
            src: local("Lato Regular"), url(/_next/static/media/Lato-Regular.2584c58a.woff) format("woff")
        }

        @font-face {
            font-family: Lato-Bold;
            font-style: normal;
            font-weight: 400;
            src: local("Lato Bold"), url(/_next/static/media/Lato-Bold.1d7ec642.woff) format("woff")
        }

        @font-face {
            font-family: Lato-Black;
            font-style: normal;
            font-weight: 400;
            src: local("Lato Black"), url(/_next/static/media/Lato-Black.4842dab1.woff) format("woff")
        }

        @font-face {
            font-family: "DroidSerif-Regular";
            font-style: normal;
            font-weight: 400;
            src: local("DroidSerif-Regular"), url(/_next/static/media/DroidSerif-Regular.63a2abb8.woff) format("woff")
        }

        @font-face {
            font-family: "DroidSerif-Italic";
            font-style: normal;
            font-weight: 400;
            src: local("DroidSerif-Italic"), url(/_next/static/media/DroidSerif-Italic.48c82928.woff) format("woff")
        }

        @font-face {
            font-family: "DroidSerif-Bold";
            font-style: normal;
            font-weight: 400;
            src: local("DroidSerif-Bold"), url(/_next/static/media/DroidSerif-Bold.196018b5.woff) format("woff")
        }

        @font-face {
            font-family: "DroidSerif-BoldItalic";
            font-style: normal;
            font-weight: 400;
            src: local("DroidSerif-BoldItalic"), url(/_next/static/media/DroidSerif-BoldItalic.5ba8b50a.woff) format("woff")
        }

        @font-face {
            font-family: SUIT;
            font-weight: 100;
            src: url(/_next/static/media/SUIT-Thin.fb0604ad.woff2) format("woff2")
        }

        @font-face {
            font-family: SUIT;
            font-weight: 200;
            src: url(/_next/static/media/SUIT-ExtraLight.0a94b30c.woff2) format("woff2")
        }

        @font-face {
            font-family: SUIT;
            font-weight: 300;
            src: url(/_next/static/media/SUIT-Light.c7c7e9d9.woff2) format("woff2")
        }

        @font-face {
            font-family: SUIT;
            font-weight: 400;
            src: url(/_next/static/media/SUIT-Regular.090f7270.woff2) format("woff2")
        }

        @font-face {
            font-family: SUIT;
            font-weight: 500;
            src: url(/_next/static/media/SUIT-Medium.63be5f82.woff2) format("woff2")
        }

        @font-face {
            font-family: SUIT;
            font-weight: 600;
            src: url(/_next/static/media/SUIT-SemiBold.6b582e19.woff2) format("woff2")
        }

        @font-face {
            font-family: SUIT;
            font-weight: 700;
            src: url(/_next/static/media/SUIT-Bold.24a0b501.woff2) format("woff2")
        }

        @font-face {
            font-family: SUIT;
            font-weight: 800;
            src: url(/_next/static/media/SUIT-ExtraBold.027e87c9.woff2) format("woff2")
        }

        @font-face {
            font-family: SUIT;
            font-weight: 900;
            src: url(/_next/static/media/SUIT-Heavy.5ae5d0f6.woff2) format("woff2")
        }

        ._gallery_sec_photo__CITKA {
            margin-top: 60px;
            display: flex;
            justify-content: space-between;
            min-width: 1100px
        }

        ._gallery_cont_area__OLib1 {
            width: 320px
        }

        ._gallery_cont_tit__nqN0s {
            position: relative
        }

        ._gallery_cont_tit__nqN0s:before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 54px;
            height: 4px;
            background: #333
        }

        ._gallery_name__FFIx8 {
            font-size: 40px;
            line-height: 1.1;
            padding-top: 35px
        }

        ._gallery_desc__2gd8E {
            font-size: 22px;
            line-height: 1.2;
            padding-top: 25px;
            color: #666
        }

        ._gallery_location__KCmB2 {
            font-size: 18px;
            line-height: 1.2;
            padding-top: 25px;
            color: #a5a5a5
        }

        ._gallery_cont_subtit__e5Fgl {
            border-top: 2px solid #333;
            padding-top: 17px;
            font-size: 26px;
            color: #333
        }

        ._gallery_photo_box__Wg_4Z {
            position: relative;
            background: #f4f4f4;
            width: 848px;
            font-size: 0;
            text-align: center
        }

        ._gallery_btn_photo_view__w6h_2 {
            position: absolute;
            bottom: 0;
            right: 0;
            width: 36px;
            height: 36px;
            background: url(/web/images/ico-photo-view.svg) no-repeat 50%;
            background-size: 20px 20px;
            text-indent: -99999px
        }

        ._gallery_pointer__c0HmY {
            cursor: pointer
        }

        ._gallery_photo__q4TEN {
            max-width: 848px;
            max-height: 565px;
            display: inline-block
        }

        ._gallery_photo-pop__1fXFz {
            max-width: 100vw;
            max-height: 100vh;
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background-color: #1a1a1a;
            z-index: 9101;
            color: #f0f0f0;
            --swiper-navigation-color: #ccc
        }

        ._gallery_photo_box_zoom__XKyYh {
            position: relative;
            text-align: center;
            height: 100vh
        }

        ._gallery_photo_box_zoom__XKyYh,
        ._gallery_photo_zoom__iZQqc {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%
        }

        ._gallery_photo_zoom__iZQqc {
            max-width: 1280px;
            height: calc(100vh - 220px);
            background-color: #1a1a1a
        }

        ._gallery_photo_zoom__iZQqc img {
            max-width: 100%;
            max-height: 100%;
            display: inline-block
        }

        ._gallery_desc_zoom__mZx9R {
            background-color: #1a1a1a;
            position: absolute;
            bottom: 35px;
            left: 0;
            width: 100%;
            text-align: center;
            color: #f0f0f0;
            font-size: 22px
        }

        ._gallery_name_zoom___1ZE5 {
            font-size: 16px;
            color: #ccc;
            display: inline-block;
            margin-top: 15px
        }

        ._gallery_btn_close__kYJkd {
            position: fixed;
            top: 50px;
            right: 50px;
            color: #fff;
            font-size: 18px;
            padding-right: 35px;
            background: url(/web/images/ico-slide-close-btn.svg) no-repeat 100% 50%;
            background-size: 22px 22px;
            z-index: 95
        }

        @media (max-width:768px) {
            ._gallery_wrapper__cyjyQ {
                padding-top: 35px
            }

            ._gallery_sec_photo__CITKA {
                margin-top: 30px;
                display: block;
                min-width: auto
            }

            ._gallery_cont_area__OLib1 {
                width: 100%
            }

            ._gallery_cont_tit__nqN0s:before {
                display: none
            }

            ._gallery_name__FFIx8 {
                font-size: 24px;
                padding-top: 10px
            }

            ._gallery_desc__2gd8E {
                font-size: 16px;
                padding-top: 15px
            }

            ._gallery_location__KCmB2 {
                font-size: 14px;
                padding: 10px 0 25px
            }

            ._gallery_cont_subtit__e5Fgl {
                border-top: none;
                padding: 17px 0 15px;
                font-size: 18px
            }

            ._gallery_photo_box__Wg_4Z {
                width: 100%
            }

            ._gallery_photo__q4TEN {
                max-width: 100%;
                max-height: 300px
            }

            ._gallery_photo-pop__1fXFz {
                z-index: 9000
            }

            ._gallery_photo_zoom__iZQqc {
                height: calc(100svh - 230px);
                transform: translateY(-10px)
            }

            ._gallery_desc_zoom__mZx9R {
                bottom: 115px;
                font-size: 16px;
                padding-top: 10px
            }

            ._gallery_name_zoom___1ZE5 {
                font-size: 12px;
                margin-top: 10px
            }

            ._gallery_btn_close__kYJkd {
                top: 65px;
                right: 20px;
                background-size: 16px 16px;
                text-indent: -99999px
            }
        }

        @media (min-width:769px) and (max-width:1280px) {
            ._gallery_cont_area__OLib1 {
                width: 25%;
                max-width: 200px
            }
        }
</style>
<title>Insert title here</title>
</head>
<body>
	<%@include file="../common/header.jsp" %>
	<div class="_gallery_wrapper__cyjyQ">
                <div class="container">
                
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1">
                            <div class="_gallery_cont_tit__nqN0s">
                                <p class="_gallery_name__FFIx8">서와정(stayName)</p>
                                <p class="_gallery_desc__2gd8E">평온한 쉼이 있는 곳(stayInfo)</p>
                                <p class="_gallery_location__KCmB2">강원 / 강릉시(stayLoc)</p>
                            </div>
                        </div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="0" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/188/808/original/1a0fd2fe1f34c1bb6b32bc2201b227d4cc28b31a.jpeg?1689916761"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy">(stayMainPic1)</div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1">
                            <div class="_gallery_cont_subtit__e5Fgl">스테이(roomName)</div>
                        </div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="1" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/188/826/original/36da18b19c0e30f52325e45078392ddf18d969b1.jpeg?1689920960"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="2" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/188/825/original/b57396e544535ded8b28b41d0e1056033773cc1c.jpeg?1689920910"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="3" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/188/827/original/b17f0a8e5b42d9ebf659130fcd2c5dcb442f00ea.jpeg?1689920977"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="4" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/188/829/original/2186b02fb99574b7a994f8de64168ea8d76ec66d.jpeg?1689921075"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="5" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/188/828/original/d323ec02dc8a9a048e4713936b21e1f9abc1d9e2.jpeg?1689920988"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1">
                            <div class="_gallery_cont_subtit__e5Fgl">서와정</div>
                        </div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="6" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/274/original/dbe8f056fad21c9fa23a092a70dfb5976f9ae7fe.jpeg?1690259978"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="7" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/275/original/26ee14b8707bfeec6fa9d6b124eeb5789c94f91e.jpeg?1690259981"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="8" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/276/original/26ee17075ae0e521f4f33e13673782eea1949175.jpeg?1690259983"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="9" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/277/original/c8568f552e1b3dbb97ec7ada5e762092bfb4aa25.jpeg?1690259986"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="10" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/278/original/07833452f23c28f0bf632d9df3784b67dd7a3929.jpeg?1690259988"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="11" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/279/original/fb18ea3d26df7cd9daa66f51f97c4e7d0c8bdc02.jpeg?1690259991"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="12" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/280/original/f88d708c67f5245d0ee1933ce63d6edd35d6b6d6.jpeg?1690259993"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="13" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/281/original/16349289d7b12e4c55d9434ecf0f3a5e88055593.jpeg?1690259996"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="14" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/282/original/36653d1ee2139fc23953b7a99eace799017ab464.jpeg?1690259998"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="15" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/283/original/7f4d2d30c134b603d8a369ea4deb69f7fad97a72.jpeg?1690260000"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="16" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/284/original/361aa9c958dd7a07db020a034536aa17879b8dbc.jpeg?1690260003"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="17" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/285/original/bc617cb6d7c1584a894bc2fdbb7d3892db354e9e.jpeg?1690260007"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="18" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/286/original/4242b4a2275f34cf37ac1fa323afc6a13fe726a2.jpeg?1690260009"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="19" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/287/original/b078c9488c237d8922db3ceeb9af65b934172283.jpeg?1690260014"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="20" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/288/original/0d11983c304783c67d525af70e28a776a3fef23d.jpeg?1690260016"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="21" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/289/original/71c875412a3037032ca6629569d49316800dafc7.jpeg?1690260019"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="22" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/290/original/00e8d5714ac625eb67b8c79a1ae6716641a47836.jpeg?1690260022"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="23" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/291/original/6d1989e636ac5db67f481c7d5639360b803b56b1.jpeg?1690260025"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="24" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/292/original/6ab0d3be88a03e2943bcf6f9e94a61e58f7b166a.jpeg?1690260028"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="25" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/293/original/c3758b118ba62cbf913be35bc998d435d50ed032.jpeg?1690260030"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="26" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/295/original/536ab7cdfa2105f27ee7780963fa4ae41ec87af5.jpeg?1690260036"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="27" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/294/original/e224e1e2c6bbc84c51435610641c2e5dc8708ad9.jpeg?1690260033"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="28" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/296/original/0cc4be541a2bae5d59c553d49dbf5ed907043b10.jpeg?1690260038"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                    <div class="_gallery_sec_photo__CITKA">
                        <div class="_gallery_cont_area__OLib1"></div>
                        <div>
                            <div class="_gallery_photo_box__Wg_4Z">
                                <div data-index="29" role="presentation" class="_gallery_pointer__c0HmY"><img
                                        src="//images.stayfolio.com/system/pictures/images/000/189/297/original/0710200bb1d741f776bc79caeef85f3448852f9a.jpeg?1690260041"
                                        alt="Detail Stay" class="_gallery_photo__q4TEN" loading="lazy"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	<%@include file="../common/footer.jsp"%>
</body>
</html>