<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- css -->
<link rel="stylesheet" href="/resources/css/mypage/reservation.css">

<script type="text/javascript">
window.addEventListener('load', function(){
	
	listOne.style.display=''; 
	comList.style.display='none';
	ReservationButton.style.fontWeight = 'bold';
	CompleteButton.style.fontWeight = '';
	
	
	ReservationButton.addEventListener('click', function(){ 
		listOne.style.display=''; 
		comList.style.display='none';
		ReservationButton.style.fontWeight = 'bold';
		CompleteButton.style.fontWeight = '';
	  });
	
	  
	CompleteButton.addEventListener('click', function(){ 
		listOne.style.display='none';  
		comList.style.display='';
		CompleteButton.style.fontWeight = 'bold';
		ReservationButton.style.fontWeight = '';
	  });
	
	
});

</script>
</head>


<body>
<!-- 헤더 -->
<%@ include file="../../common/header.jsp" %>

	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-M24ZFBJ"
			height="0" width="0" title="googletagmanager-iframe"
			style="display: none; visibility: hidden"></iframe>
	</noscript>
	<div id="fb-root" class=" fb_reset">
		<script async="" src="https://connect.facebook.net/en_US/all.js"></script>
		<div
			style="position: absolute; top: -10000px; width: 0px; height: 0px;">
			<div></div>
		</div>
	</div>

	<script src="/static/js/common.js"></script>
	<div id="__next" data-reactroot="">
		<div>
			<div class=""></div>
			<div id="gnbBgColor"></div>
			<div id="contents">
				<div class="container sub_title">
					<div class="tit">MY PAGE</div>
				</div>
				<div class="container mypage_wrap">
					<div class="mypage_myinfo">
						<!-- =================================== user 이름 !!!! =================================== -->
						<div class="tit">${sessionScope.memberId}님 반가워요!</div>
						<div class="my-count" role="link" tabindex="0">함께 ${travelCnt }번의 여행을 했어요.</div>
					</div>
					<div class="newmypage_menu pc_only">
						<ul>
							<li class="active"><a href="./reservation">예약 정보</a></li>
							<li class=""><a href="./cancel">취소 내역</a></li>
							<li class=""><a href="./likestay">관심 스테이</a></li>
							<li class=""><a href="./info">회원 정보 수정</a></li>
							<li><a href="/chat/chat">메시지</a></li>
							<li><a style="cursor:pointer;" onclick="goChatRoom()">메시지 방 입장</a>
								<input style="border: 1px solid #f2f2f2; width:175px; height:30px;" type="text" id="rid" placeholder="방 번호를 입력해 주세요" value=""/></li>
						</ul>
					</div>
					<div class="mypage_content">
						<div class="tab_mypage">
							<ul>
								<li class="active"><button id="ReservationButton" style="padding-bottom: 0px;">다가올 예약</button></li>
								<li class=""><button id="CompleteButton" style="padding-bottom: 0px;">이용 완료</button></li>
							</ul>
						</div>
						
						<!-- 다가올 예약 -->
						<div id="listOne">
							<c:if test="${empty list}">
								<div style="text-align: center;">
									<img src="/resources/images/no.png" class="img-booking-waiting" alt="img-booking-wating">
									<br>
									<p style="line-height: 1.5;">아직 예약 정보가 없습니다.<br class="mo_only"> 새로운 스테이를 찾아 떠나보세요.</p>
								</div>
							</c:if>
							
							<!-- ▶▶▶  forEach ▶▶▶  -->
	                        <c:forEach items="${list}" var="list" step="1" varStatus="status">
	                        <c:if test="${sessionScope.memberId == list.MEMBERID}">
							
							<div class="reserv_wrap mypage-reservation-info">
								<div class="reserv_box accepted">
									<div class="reserv_name">
										<!-- ================================ 예약 확정 시 ==============================================-->
										<p class="label">예약 확정</p>
										<!-- =============================== 숙소이름  ============================================-->
										<p class="name">
											<span class="ellipsis">${list.STAYNAME }</span>
										</p>
									</div>
									<div class="stay_view">
										<div class="photo"
											style="background-image: url('/resources/images/${list.MAINPIC1.replace('\\','/')}'); background-repeat: no-repeat; background-position: center center; background-size: cover;">
											<!-- =============================== 스테이 자세히보기 연결 ============================================-->
											<span class="view">스테이 보기</span>
										</div>
									</div>
										<div class="reserv_info">
											<!-- =============================== 숙소 체크인 / 체크아웃 ============================================-->
											<div class="day">${list.CHECKIN} ~ ${list.CHECKOUT}</div>
											<!-- =============================== 예약 인원 ============================================-->
											<div class="option">
												성인 ${list.MEMBERCOUNT }명<br>
											</div>
										</div>
										<!-- =============================== 가격 & view ============================================-->
										<div class="price">₩ ${list.PRICE }</div> <br>
										<!-- =============================== 예약 상세 연결 ============================================-->
										<button type="button" class="btn_reserv_detail"
												onclick="location.href='/member/mypage/reserved_detail'
													+'?stayName=${list.STAYNAME}&mainImg=${list.MAINPIC1}&'
													+'checkIn=${list.CHECKIN}&checkOut=${list.CHECKOUT}&'
													+'memberCount=${list.MEMBERCOUNT}&price=${list.PRICE}&stayNo=${list.STAYNO}&reservationNo=${list.RESERVATIONNO}';">예약 상세 확인</button>
								</div>
							</div>							
							</c:if>
	                        </c:forEach>
                        </div>
                        
                        <!-- 이용 완료 -->
                        <div id="comList">
	                        <c:if test="${empty complete}">
								<div style="text-align: center;">
									<img src="/resources/images/no.png" class="img-booking-waiting" alt="img-booking-wating">
									<br>
									<p style="line-height: 1.5;">아직 예약 정보가 없습니다.<br class="mo_only"> 새로운 스테이를 찾아 떠나보세요.</p>
								</div>
							</c:if>
							
	                        <!-- ▶▶▶  forEach ▶▶▶  -->
	                        <c:forEach items="${complete}" var="list" step="1" varStatus="status">
	                        <c:if test="${sessionScope.memberId == list.MEMBERID}">
							
							<div class="reserv_wrap mypage-reservation-info">
								<div class="reserv_box accepted">
									<div class="reserv_name">
										<p class="name">
											<span class="ellipsis">${list.STAYNAME }</span>
										</p>
									</div>
									<div class="stay_view">
										<div class="photo"
											style="background-image: url('/resources/images/${list.MAINPIC1.replace('\\','/')}'); background-repeat: no-repeat; background-position: center center; background-size: cover;">
											<span class="view">스테이 보기</span>
										</div>
									</div>
										<div class="reserv_info">
											<div class="day">${list.CHECKIN} ~ ${list.CHECKOUT}</div>
											<div class="option">
												성인 ${list.MEMBERCOUNT }명<br>
											</div>
										</div>
										<div class="price">₩ ${list.PRICE }</div> <br>
										<button type="button" class="btn_reserv_detail"
												onclick="location.href='/member/mypage/reserved_detail'
													+'?stayName=${list.STAYNAME}&mainImg=${list.MAINPIC1}&'
													+'checkIn=${list.CHECKIN}&checkOut=${list.CHECKOUT}&'
													+'memberCount=${list.MEMBERCOUNT}&price=${list.PRICE}&stayNo=${list.STAYNO}&reservationNo=${list.RESERVATIONNO}';">예약 상세 확인</button>
								</div>
							</div>							
							</c:if>
	                        </c:forEach>
                        </div>
						
						
						<!-- =============================== 페이징 ============================================-->
						<div class="paging">
							<a href="/" class="prev" title="이전 페이지">이전 페이지</a><a href="/"
								class="on">1</a><a href="/" class="next" title="다음 페이지">다음
								페이지</a>
						</div>
						<a href="/stay/list"><button type="button" class="btn_bk btn_sm findstay_btn" style="margin-top: 20px; margin-bottom: 20px;">FIND STAY</button></a>
					</div>
				</div>
			</div>

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
		<button class="custom-button-1"></button>
	</div>
</body>

<!-- 푸터 -->
<%@ include file="../../common/footer.jsp" %>

<script>
	var rid = '';
	
	$(function(){
		
		$('#rid').change(function(){

			rid = $('#rid').val();
			
		});
	});
	
	function goChatRoom(){
		
		
		
		if(rid == null || rid== ''){
			rid = '1';
		}
		
		location.href='/chat/chat?roomId='+rid;
	}

</script>

</html>