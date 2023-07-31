<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>income</title>
    <link rel="stylesheet" href="./css/host/host.css">
</head>


<body style="">

<!-- 헤더 -->
<%@ include file="../../common/header.jsp" %><noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-M24ZFBJ" height="0" width="0"
            title="googletagmanager-iframe" style="display:none;visibility:hidden"></iframe></noscript>
    <div id="fb-root" class=" fb_reset">
       
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
                        <div class="tit">HOST ${sessionScope.memberId}</div>
                        <div class="my-count" role="link" tabindex="0">IMPORTS</div>
                    </div>
                    <div class="newmypage_menu pc_only">
                        <ul>
                            <li class=""><a href="./stayhost">숙소 관리</a></li>
                            <li class=""><a href="./reservation">예약 관리 </a></li>
                            <li class="active"><a href="./income">수입 현황</a></li>
                            <li class=""><a href="./guide">호스트가이드</a></li>
                        </ul>
                    </div>
                    <div class="mypage_content">
                        <div class="reserv_wrap mypage-reservation-info">
                            <div class="reserv_box accepted">
                                <div class="reserv_name">
                                    <!-- =============================== 수입 현황  ============================================-->
                                    <p class="name"><span class="ellipsis" style="font-size:30px">수입 현황</span></p>
                                </div>
                                <!-- chart.js -->
                                
                                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                                
                                <canvas id="myChart" width='350px' height='200px'></canvas>
                            
                                                  
                                <script>
                                   
                                        // 차트 생성
                                      
                                </script>
                               

                                </a>
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