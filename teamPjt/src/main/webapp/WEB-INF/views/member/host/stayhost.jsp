<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>stayhost</title>
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
                           <!-- =================================== user 이름 !!!! =================================== -->
                           <div class="tit">HOST 000</div>
                           <div class="my-count" role="link" tabindex="0">MY ACCOMMODATION</div>
                       </div>
                       <div class="newmypage_menu pc_only">
                           <ul>
                               <li class="active"><a href="./stayhost">숙소 관리</a></li>
                               <li class=""><a href="./reservation">예약 관리 </a></li>
                               <li class=""><a href="./income">수입 현황</a></li>
                               <li class=""><a href="./guide">호스트가이드</a></li>
                           </ul>
                       </div>
                       <div class="mypage_content">
                           <div class="reserv_wrap mypage-reservation-info">
                           	   <!-- ▶▶▶  forEach ▶▶▶  -->
                               <c:forEach items="${list}" var="vo" step="1">
                               <div class="reserv_box accepted">
                                   <div class="reserv_name">
                                       <!-- =============================== 숙소이름  ============================================-->
                                       <p class="name"><span class="ellipsis">${vo.stayName }</span></p>
                                   </div>
                                   <div class="stay_view">
                                       <div class="photo"
                                           style="background-image: url(${vo.mainPic1}); background-repeat: no-repeat; background-position: center center; background-size: cover;">
                                           <!-- =============================== 수정 ============================================-->
                                           <span class="view">스테이 수정</span></div>
                                   </div>
                                       <div class="reserv_info">
                                           <!-- =============================== 숙소 분류 ============================================-->
                                           <div class="stay">${vo.stayType } / ${vo.stayLoc }</div>
                                           <p></p>
                                               <!-- =============================== 숙소 설명 ============================================-->
                                           <div class="option">${vo.stayAdress }<br></div>
                                       </div>
                               </div>
                               </c:forEach>
                           </div>


                           <!-- =============================== 페이징 ============================================-->
                           <div class="paging"><a href="/" class="prev" title="이전 페이지">이전 페이지</a><a href="/"
                                   class="on">1</a><a href="/" class="next" title="다음 페이지">다음 페이지</a></div>
                       </div>
                   </div>
               </div>
               
           </div><button class="custom-button-1"></button>
       </div>
   
    <!-- 푸터 -->
	<%@ include file="../../common/footer.jsp" %>
   
   </body>
</html>
</html>
</html>