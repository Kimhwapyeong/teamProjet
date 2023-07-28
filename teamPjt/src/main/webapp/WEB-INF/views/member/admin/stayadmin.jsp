<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>stayadmin</title>
    <link rel="stylesheet" href="./css/admin/admin.css">
</head>



   
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
                       <div class="tit">ADMIN</div>
                   </div>
                   <div class="container mypage_wrap">
                       <div class="mypage_myinfo">
                           <!-- =================================== admin  =================================== -->
                           <div class="tit"> 관리자</div>
                           <div class="my-count" role="link" tabindex="0">ACCOMODATIONS</div>
                       </div>
                       <div class="newmypage_menu pc_only">
                           <ul>
                               <li class="active"><a href="/admin/stayadmin">숙소 관리</a></li>
                               <li class=""><a href="./useradmin">사용자 관리 </a></li>
                               <li class=""><a href="./hosthelp">호스트 지원</a></li>
                               <li class=""><a href="./statistics">통계 및 분석</a></li>
                           </ul>
                       </div>
                       <div class="mypage_content">
                           <div class="reserv_wrap mypage-reservation-info">
                               <div class="reserv_box accepted">
                               <!-- ▶▶▶  forEach ▶▶▶  -->
                               <c:forEach items="${list}" var="vo" step="1">
                                   <div class="reserv_name">
                                        <!-- =============================== 숙소 seq  ============================================-->
                                       <div class="option" style='line-height: 50px;'>${vo.stayNo}</div>
                                       
                                       <!-- =============================== 숙소이름  ============================================-->
                                       <p class="name"><span class="ellipsis" style='line-height: 50px; font-size: smaller;'>${vo.stayName }</span></p>
                                   </div>
                                   <div class="stay_view">
                                       <div class="photo"
                                           style="background-image: url(&quot;//images.stayfolio.com/system/pictures/images/000/020/355/display/0259568486bda951e20241b741f6a7a30adc061f.jpg?1504161610&quot;); background-repeat: no-repeat; background-position: center center; background-size: cover;">
                                           <!-- =============================== 수정 ============================================-->
                                           <span class="view">스테이 수정</span></div>
                                   </div>
                                       <div class="reserv_info">
                                           <!-- =============================== 숙소 - 회원 아이디 ============================================-->
                                           <div class="stay" style='line-height: 70px;'>${vo.memberId }</div>
                                           <p></p>
                                               <!-- =============================== 숙소 설명 ============================================-->
                                           <div class="option">${vo.stayInfo }<br></div>
                                       </div>
                            
                                   </a>
                                </c:forEach>   
                               </div>
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

