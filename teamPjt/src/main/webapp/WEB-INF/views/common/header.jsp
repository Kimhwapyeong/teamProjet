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
<link rel="stylesheet" href="/resources/css/main/main2.css">
<link rel="stylesheet" href="/resources/css/main/main3.css">
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
<script>
    window.addEventListener('load', function(){
    	// btnWhere 클릭되면 모달창 보이기
    	btnWhere.addEventListener('click', function(){
            document.querySelector("div[class=modalOverlay]").style.display='';
        })

        // closeBtn 클릭되면 모달창 가리기
        closeBtn.addEventListener('click', function(){
            document.querySelector("div[class=modalOverlay]").style.display='none';
        })
		
        // a 요소 (button 의 자식 a)
        let buttons = document.querySelectorAll("button>a");
        
        buttons.forEach(button => {
        	// 버튼이 클릭되면
            button.addEventListener('click', () => {
            	// 클릭된 버튼만 active 클래스 추가, 나머지는 active 클래스 삭제
                buttons.forEach(otherButton => {
                    if (otherButton === button) {
                        otherButton.classList.add('active');
                    } else {
                        otherButton.classList.remove('active');
                    }
                });
            })
        })
    })
    
    function searchWhere(){
    	let where;
    	document.querySelectorAll('button>a').forEach(button =>{
    		console.log(button.classList.contains('active'));
            if(button.classList.contains('active')){
    		 	where = button.innerHTML;
    		 	location.href='/stay/list?='+where;
    		}
        })
    }

</script>
<body>
	<!-- 헤더 메뉴 -->
    <div id="gnbBgColor">
        <header id="header" class="container_wide">
            <div class="header_wrap gnb-responsive-css only-pc">
                <div class='logo'>
                    <a href="/main">STAY FOLIO</a>
                </div>
                <div class="whe gnb-responsive-margin" style=""><button type="button" id="btnWhere"><span class="gnb-mo-small">어디로
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
                                    <li><a href="/member/mypage/cancel">취소 내역</a></li>
                                    <li><a href="/member/mypage/likestay">관심 스테이</a></li>
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

	<!-- where modal -->
	<div class="modalOverlay" style="display: none;">
		<div class="modalWrapper">
			<div class="modalInner">
				<div class="layer layer_whe where open"
					style="position: relative; display: block; height: auto;">
					<div class="container">
						<button type="button" class="btn_close" id="closeBtn">닫기</button>
						<div class="whe_tit" style="text-align: left;">어디로 떠날까요?</div>
						<div class="whe_wrap">
							<div class="where_search">
								<input type="text" placeholder="원하는 스테이 혹은 지역을 검색해 보세요.">
							</div>
							<div class="whe_cont">
								<div class="box">
									<div class="tit" style="text-align: left;">국내</div>
									<ul class="clearfix">
										<li><button type="button">
												<a class="">국내 전체</a>
											</button></li>
										<li><button type="button">
												<a class="">제주</a>
											</button></li>
										<li><button type="button">
												<a class="">서울</a>
											</button></li>
										<li><button type="button">
												<a class="">강원</a>
											</button></li>
										<li><button type="button">
												<a class="">부산</a>
											</button></li>
										<li><button type="button">
												<a class="">경기</a>
											</button></li>
										<li><button type="button">
												<a class="">충청</a>
											</button></li>
										<li><button type="button">
												<a class="">경상</a>
											</button></li>
										<li><button type="button">
												<a class="">전라</a>
											</button></li>
										<li><button type="button">
												<a class="">인천</a>
											</button></li>
										<li><button type="button">
												<a class="">광주</a>
											</button></li>
										<li><button type="button">
												<a class="">대전</a>
											</button></li>
										<li><button type="button">
												<a class="">대구</a>
											</button></li>
										<li><button type="button">
												<a class="">울산</a>
											</button></li>
									</ul>
								</div>
								<div class="box">
									<div class="tit" style="text-align: left;">스테이유형</div>
									<ul class="clearfix">
										<li><button type="button">
												<a class="">게스트하우스</a>
											</button></li>
										<li><button type="button">
												<a class="">렌탈하우스</a>
											</button></li>
										<li><button type="button">
												<a class="">펜션</a>
											</button></li>
										<li><button type="button">
												<a class="">한옥</a>
											</button></li>
										<li><button type="button">
												<a class="">캠핑&아웃도어</a>
											</button></li>
										<li><button type="button">
												<a class="">호스텔</a>
											</button></li>
										<li><button type="button">
												<a class="">리조트</a>
											</button></li>
										<li><button type="button">
												<a class="">민박</a>
											</button></li>
										<li><button type="button">
												<a class="">호텔</a>
											</button></li>
									</ul>

								</div>
							</div>
							<a href="#none" onclick="searchWhere()" style="display: flex; justify-content: center;"><button
									type="button" class="btn-searchstay" id="gigi"
									style="order: 0; margin-bottom: 30px;">SEARCH</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>