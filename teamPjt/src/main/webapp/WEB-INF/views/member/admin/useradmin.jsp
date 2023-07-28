<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>useradmin</title>
    <link rel="stylesheet" href="./css/admin.css">

    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <title>부트스트랩 테이블</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>


<body>

<!-- 헤더-->
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
                        <div class="my-count" role="link" tabindex="0">USER MANAGEMENT</div>
                    </div>
                    <div class="newmypage_menu pc_only">
                        <ul >
                            <li class=""><a href="./stayadmin">숙소 관리</a></li>
                            <li class="active"><a href="/admin/useradmin">사용자 관리 </a></li>
                            <li class=""><a href="./hosthelp">호스트 지원</a></li>
                            <li class=""><a href="./statistics">통계 및 분석</a></li>
                        </ul>
                    </div>
                    <div class="mypage_content">
                        <div class="reserv_wrap mypage-reservation-info">
                            <div class="reserv_box accepted">
                                
                            <!-- ========================= 회원 목록 조회 =================== -->
                            
                            
                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                            crossorigin="anonymous"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                            crossorigin="anonymous"></script>
                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                            crossorigin="anonymous"></script>
                            <div class="container">
                                <h6>회원목록</h6>      
                                <table class="table">
                            <!--<table class="table table-striped table-hover">-->
                                  <thead>
                                    <tr>
                                      <th>회원 번호</th>
                                      <th>회원 아이디</th>
                                      <th>이메일</th>
                                      <th>회원가입일</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                        <td>98</td>
                                        <td>누가 부트스트랩 공부한다면서요?</td>
                                        <td>존 김</td>
                                        <td>2019.07.05</td>
                                      </tr>
                                      <tr>
                                    </tbody>
                                  </table>
                                </div>
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