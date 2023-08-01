<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>reservation</title>
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
                           <div class="tit">HOST ${sessionScope.memberId}</div>
                           <div class="my-count" role="link" tabindex="0">MY RESERVATION</div>
                       </div>
                       <div class="newmypage_menu pc_only">
                           <ul>
                               <li class=""><a href="./stayhost">숙소 관리</a></li>
                               <li class="active"><a href="./reservation">예약 관리 </a></li>
                               <li class=""><a href="./income">수입 현황</a></li>
                               <li class=""><a href="./guide">호스트가이드</a></li>
                           </ul>
                       </div>
                       <div class="mypage_content">
                           <div class="reserv_wrap mypage-reservation-info">
								<div class="container">
								<div class="stay_view">
										<!-- ▶▶▶ forEach ▶▶▶ -->
								    
                                 </div>
                                 
                                       <p class="name"><span class="ellipsis"></span></p>
								
                                <table class="table">
								    <thead>
								        <tr>
								            <th>객실 번호</th>
								            <th>회원 아이디</th>
								            <th>예약일</th>
								            <th>체크인</th>
								            <th>체크아웃</th>
								            <th>예약 인원</th>
								        </tr>
								    </thead>
								    <tbody>
								        <c:set var="prevRoomNo" value="" />
								        <c:set var="firstRow" value="true" />
								
								        <!-- ▶▶▶ forEach ▶▶▶ -->
								        <c:forEach items="${list}" var="reserve" step="1">
				                        <c:if test="${sessionScope.memberId == reserve.STAYMEMBERID}">
				                        
								            <c:set var="currentRoomNo" value="${reserve.ROOMNO}" />
											
											<!-- 전객실번호 존재 x or 현객실번호=전객실번호 -> 출력x -->
								            <c:if test="${not empty prevRoomNo and !currentRoomNo.equals(prevRoomNo)}">
								                </tbody>
								            </c:if>
											
											<!-- 현객실번호 != 전객실번호 <hr> 태그로 구분 -->
								            <c:if test="${firstRow or not currentRoomNo.equals(prevRoomNo)}">
								                <tbody>
								                    <tr>
								                        <td colspan="6"><hr></td>
								                    </tr>
								                </tbody>
								            </c:if>
								
								            <tbody>
								                <tr>
								                    <td>${reserve.ROOMNO}</td>
								                    <td>${reserve.RESERVATIONMEMBERID}</td>
								                    <td>${reserve.REGDATE}</td>
								                    <td>${reserve.CHECKIN}</td>
								                    <td>${reserve.CHECKOUT}</td>
								                    <td>${reserve.MEMBERCOUNT}</td>
								                </tr>
								            </tbody>
								
								            <!-- 변수 업데이트 -->
								            <c:set var="prevRoomNo" value="${currentRoomNo}" />
								            <c:set var="firstRow" value="false" />
			                           
			                            </c:if>
								        </c:forEach>
								
								        <!-- 마지막 그룹 닫기 -->
								        <c:if test="${not firstRow}">
								            </tbody>
								        </c:if>
								    </tbody>
								</table>
								
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

</body>

</html>
</html>