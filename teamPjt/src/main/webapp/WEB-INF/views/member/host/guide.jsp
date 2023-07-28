<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>guide</title>
    <link rel="stylesheet" href="./css/host/host.css">
</head>



 <body style="">
 <!-- 헤더 -->
<%@ include file="../../common/header.jsp" %>
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-M24ZFBJ" height="0" width="0"
               title="googletagmanager-iframe" style="display:none;visibility:hidden"></iframe></noscript>
     <div id="fb-root" class=" fb_reset">
         <script async="" src="https://connect.facebook.net/en_US/all.js"></script>
         <div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
             <div></div>
         </div>
     </div>
    
     <script src="/static/js/common.js"></script>
     <div id="__next" data-reactroot="">
         <div>
             <div class=""></div>
             <div id="gnbBgColor">
             </div>
             <div id="contents">
                 <div class="container sub_title">
                     <div class="tit">HOST PAGE</div>
                 </div>
                 <div class="container mypage_wrap">
                     <div class="mypage_myinfo">
                         <!-- =================================== host 이름 !!!! =================================== -->
                         <div class="tit">HOST 000</div>
                         <div class="my-count" role="link" tabindex="0">HOST GUIDE</div>
                     </div>
                     <div class="newmypage_menu pc_only">
                         <ul>
                             <li class=""><a href="./stayhost">숙소 관리</a></li>
                             <li class="active"><a href="./reservation">예약 관리 </a></li>
                             <li class=""><a href="./income">수입 현황</a></li>
                             <li class=""><a href="/host/guide">호스트가이드</a></li>
                         </ul>
                     </div>
                     <div class="mypage_content">
                         <div class="tab_mypage">
                             <ul>
                                 <!-- ================================ restcontroller -> 숙소 업로드 ==============================================-->
                                 <li class="active"><a id="info" href="/" style="padding-bottom: 0px;">입점 신청</a>
                                 </li>
                                 <!-- ================================ 질문 ==============================================-->
                                 <li class=""><a id="info" href="/" style="padding-bottom: 0px;">문의 요청</a>
                                 </li>
                             </ul>
                         </div>
                         <div class="reserv_wrap mypage-reservation-info">
                             <div class="reserv_box accepted">
                                 
                                 
                                 <div class="store_apply">
                                     <div class="store_sec">
                                         <div class="tit">스테이 큐레이션</div>
                                         <div class="desc"><span>
						                                             코지스테이는 ‘머무름만으로도 여행이 되는 공간’을 큐레이션 하는 파인 스테이 플랫폼으로, 가격 중심의 경쟁 논리에서 벗어나 디자인, 운영 철학, 지역성 등 ‘브랜드 가치’를 기반으로
						                                             독특한 개성을 가진 숙소를 선별하고 있습니다. 하나의 책을 추천하듯 세계 곳곳에 숨어 있는 파인 스테이를 소개, 연결, 제작하며 그 속에 담긴 이야기를 여행자에게 전달합니다.
                                         </span></div>
                                            
                                             <div class="store_sec">
                                                 <div class="tit">네 가지 관점</div><div class="desc">스테이 큐레이션은 아래 네 가지 관점에 기반합니다.</div><ul class="point_list"><li>
                                                 <span class="dt">독창성 (ORIGINALITY)</span><span class="dd">자신만의 컨셉과 이야기, 가치를 지닌 스테이</span></li>
                                                 <li><span class="dt">디자인 (DESIGN)</span><span class="dd"><span>
                                 					  단순한 심미성만이 아니라 건축, 디자인, 경험, 지역성 등이 조화를 이룬 스테이</span></span></li><li><span class="dt">환대 (HOSPITALITY)</span>
                                                         <span class="dd">고객에게 만족스러운 숙박 경험과 섬세한 서비스를 제공하는 스테이</span></li>
                                                         <li><span class="dt">가격 (PRICE)</span><span class="dd">공간, 환경, 경험 등을 고려하여 합리적인 가격이 책정된 스테이</span></li></ul>
                                                         </div>
                                                             <button type="button" class="btn_bk btn_sm findstay_btn" style="margin-top: 20px; margin-bottom: 20px;">
                                                             	<a href="/addstay" style='color: white;'>신청하기</a></button>

                                                         </div>

                             </div>
                         </div>
                         <!-- =============================== 페이징 ============================================-->
                     </div>
                 </div>
             </div>

 <!-- 푸터 -->
<%@ include file="../../common/footer.jsp" %>
</body>

</html>