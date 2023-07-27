<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 css link -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/main/main.css">
<link href="/resources/css/main/main2.css">
<style type="text/css">
.form-control-dark {
  border-color: var(--bs-gray);
}
.form-control-dark:focus {
  border-color: #fff;
  box-shadow: 0 0 0 .25rem rgba(255, 255, 255, .25);
}

.text-small {
  font-size: 85%;
}

.dropdown-toggle {
  outline: 0;
}

</style>
<style type="text/css" data-styled-jsx="">a.jsx-a44b61ff91ee7fc6{padding-bottom:30px;border-bottom:1px solid#e6e6e6;margin-bottom:10px}p.jsx-a44b61ff91ee7fc6{font-size:12px;color:#999}.login.jsx-a44b61ff91ee7fc6{font-size:16px;color:#333;margin-bottom:10px}</style>
</head>
<body>
    <div id="gnbBgColor">
        <header id="header" class="container_wide">
            <div class="header_wrap gnb-responsive-css only-pc">
                <div class='logo'>
                    <a href="/main">STAY FOLIO</a>
                </div>
                <div class="whe gnb-responsive-margin" style=""><button type="button"><span class="gnb-mo-small">어디로
                            떠날까요?</span></button><button type="button" class="gnb-when-mo-small"><span
                            class="gnb-mo-small">언제 떠날까요?</span></button></div>
                <div class="toggle-ko-mo"></div>
                <div class="nav">
                    <ul class="menu">
                        <li class=""><a href="/stay/list">FIND STAY</a></li>
                        <li class=""><a href="#none">메뉴</a></li>
                    </ul>
                    <ul class="etc">
                        <div class="nav_etc">
                        	<!-- 추후 login 여부 판단하여 mypage와 login 둘 중 하나 노출 -->
                        	<div class="box">
                            	<a href="/login"><div class="nav_tit login">LOGIN</div></a>
                           	</div>
                            <div class="box">
                                <div class="nav_tit mypage">MY PAGE</div>
                                <ul class="open_list" style="width: 125px;">
                                    <li><a href="/member/mypage/reservation">예약 정보</a></li>
                                    <li><a href="/mypage/reservation/cancel">취소 내역</a></li>
                                    <li><a href="/mypage/likestay">관심 스테이</a></li>
                                    <li><a href="/mypage/account/edit">회원 정보 수정</a></li>
                                    <li><a href="/chat">메시지</a></li>
                                    <li class="login"><a href="">로그아웃</a></li>
                                </ul>
                            </div>
                        </div>
                    </ul>
                </div>
            </div>
            <div class="header_wrap gnb-responsive-css only-mobile">
                <div class="logo"><a href="/">STAY FOLIO</a></div>
                <div class="side-menu"></div>
            </div>
            <div class="header_wrap gnb-responsive-css new-header">
                <div class="logo" style="margin-left: 16px;"><a href="/">STAY FOLIO</a></div>
                <div class="right-menu">
                    <div class="side-menu"></div>
                </div>
            </div>
        </header>
    </div>

<!--   <div class="b-example-divider"></div>

  
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="#" class="nav-link px-2 link-dark">어디로 갈까요</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">언제 떠날까요</a></li>

      </ul>

	   <ul class="nav col-12 col-md-auto mb-2 justify-content-end mb-md-0" style="padding-right:30px">
        <li><a href="/login" class="nav-link px-2 link-dark">로그인</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">로그아웃</a></li>
        <li><a href="/member/mypage" class="nav-link px-2 link-dark"><img src="/resources/images/마이페이지.png" style="height:20px;">myPage</a></li>
       </ul>
    </header>
    
   Navigation
   <nav class="navbar navbar-light bg-light static-top" style='width: 100%;'>
       <div class="container" style='margin: 10px 40px; width: 30%;'>
           <a class="navbar-brand" href="#!" style='font-size: 32px;'>COZY <br> STAY</a>
       </div>
       <div>
           <a class="btn btn-bg" href="#where" style='font-size: 20px; color: rgb(49, 49, 49); margin-right: 50px;'><i class="bi bi-geo-alt">어디로 떠날까요?</i></a>
           <i class="bi bi-dot"></i>
           <a class="btn btn-bg" href="#where" style='font-size: 20px; color: rgb(49, 49, 49);'><i class="bi bi-calendar-event">언제 떠날까요?</i></a>
       </div>
       
       <div style='margin-left: 10%;'>
           <a class="btn btn-bg" href="/login" style='font-size: 20px; color: rgb(49, 49, 49);'>LOGIN</a>
           <a class="btn btn-bg" href="/member/mypage/reservation" style='font-size: 20px; color: rgb(49, 49, 49);'>MY PAGE</a>
       </divstyle=>
   </nav> -->
