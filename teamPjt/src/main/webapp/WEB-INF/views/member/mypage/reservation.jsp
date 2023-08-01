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
						<div class="my-count" role="link" tabindex="0">함께 0번의 여행을
							했어요.</div>
					</div>
					<div class="newmypage_menu pc_only">
						<ul>
							<li class="active"><a href="./reservation">예약 정보</a></li>
							<li class=""><a href="./cancel">취소 내역</a></li>
							<li class=""><a href="./likestay">관심 스테이</a></li>
							<li class=""><a href="./info">회원 정보 수정</a></li>
							<li><a href="./message">메시지</a></li>
						</ul>
					</div>
					<div class="mypage_content">
						<div class="tab_mypage">
							<ul>
								<li class="active"><a id="info" href="/"
									style="padding-bottom: 0px;">다가올 예약</a></li>
							</ul>
						</div>
						
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
										style="background-image: url(${list.MAINPIC1 }); background-repeat: no-repeat; background-position: center center; background-size: cover;">
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
									<div class="price">₩ ${list.amount }</div> <br>
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



</html>