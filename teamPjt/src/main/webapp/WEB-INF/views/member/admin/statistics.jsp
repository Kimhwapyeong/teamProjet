<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>statistics</title>
    <link rel="stylesheet" href="./css/admin.css">
    
    <!-- 차트 링크 -->
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
  
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
                        <div class="tit">ADMIN</div>
                    </div>
                    <div class="container mypage_wrap">
                        <div class="mypage_myinfo">
                            <!-- =================================== admin  =================================== -->
                            <div class="tit"> 관리자</div>
                            <div class="my-count" role="link" tabindex="0">USER MANAGEMENT</div>
                        </div>
                        <div class="newmypage_menu pc_only">
                            <ul>
                                <li class=""><a href="./stayadmin">숙소 관리</a></li>
                                <li class=""><a href="./useradmin">사용자 관리 </a></li>
                                <li class=""><a href="./hosthelp">호스트 지원</a></li>
                                <li class="active"><a href="/admin/statistics">통계 및 분석</a></li>
                            </ul>
                        </div>
                        <div class="mypage_content">
                            <div class="reserv_wrap mypage-reservation-info">
                                <div class="reserv_box accepted">
                                    
                                    
                                    
                             			
                             			
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                
            </div><button class="custom-button-1"></button>
        </div>
        
        <!-- 푸터 -->
		<%@ include file="../../common/footer.jsp" %>
		
    </body>
</html>