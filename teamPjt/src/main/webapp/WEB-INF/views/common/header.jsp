<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
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
</head>
<body>
  <div class="b-example-divider"></div>

  
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
    
    
   <!-- Navigation-->
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
   </nav>
