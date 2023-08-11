<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>stayhost</title>
    <link rel="stylesheet" href="./css/host/host.css">
    
<script type="text/javascript">

window.addEventListener('load', function(){
    var roomView = document.getElementById('roomView');
    var roomViewBtn = document.getElementById('roomViewBtn');
    // 기본값 보여주지 않기
    var isRoomViewVisible = false;

    roomView.style.display = 'none';

    roomViewBtn.addEventListener('click', function(){ 
        if (isRoomViewVisible) {
            roomView.style.display = 'none';
        } else {
            roomView.style.display = '';
        }
        
        // 버튼 누를 때 마다 true / false 변경
        isRoomViewVisible = !isRoomViewVisible;
    });
});


</script>

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
                           <!-- =================================== user 이름 !!!! =================================== -->
                           <div class="tit">HOST ${sessionScope.memberId}</div>
                           <div class="my-count" role="link" tabindex="0">MY ACCOMMODATION</div>
                       </div>
                       <div class="newmypage_menu pc_only">
                           <ul>
                               <li class="active"><a href="./stayhost">숙소 관리</a></li>
                               <li class=""><a href="./reservation">예약 관리 </a></li>
                               <li class=""><a href="./income">수입 현황</a></li>
                               <li class=""><a href="./guide">호스트가이드</a></li>
                               <li class=""><a href="./message">메세지</a></li>                               
                           </ul>
                       </div>
                       <div class="mypage_content">
                           <div class="reserv_wrap mypage-reservation-info">
                           	   <!-- ▶▶▶  forEach ▶▶▶  -->
                               <c:forEach items="${list}" var="vo" step="1">
                               <!-- <img alt="" src="/resources/images/${vo.mainPic1 }"> -->
                               <c:if test="${sessionScope.memberId == vo.memberId}">

                               <div class="reserv_box accepted">
                                   <div class="reserv_name">
                                   	   <label>
	                                       <!-- =============================== 숙소이름  ============================================-->
	                                       <p class="name"><span class="ellipsis">${vo.stayName }</span></p>
                                       </label>
                                   </div>
                                   <div class="stay_view">
                                       <div class="photo" 
                                           style="background-image: url('/resources/images/${vo.mainPic1.replace('\\','/')}'); background-repeat: no-repeat; background-position: center center; background-size: cover;">
                                            <a href="../../editstay?stayNo=${vo.stayNo}">
                                            <span class="view">스테이 수정</span></a></div>
                                   </div>
                                       <div class="reserv_info">
                                           <!-- =============================== 숙소 분류 ============================================-->
                                           <div class="stay">${vo.stayType } / ${vo.stayLoc }</div>
                                           <p></p>
                                               <!-- =============================== 숙소 설명 ============================================-->
                                           <div class="option" style="line-height: 1.5;">${vo.stayInfo}<br></div>
                                           <div style="display: flex; gap: 10px;">
	                                           <button type="button" class="btn_bk btn_sm findstay_btn" style=" width:130px; margin-left:0px; margin-top:30px; background-color:white">
	                                           <a href="/addroom?stayNo=${vo.stayNo}" style='color: black;'>객실 추가 등록</a></button>
                                           </div>
                                           <button id="roomViewBtn" style="margin-top:20px; text-decoration: underline;">객실 보기</button>
                                       </div>
                               </div>
                                
                                
                                
                                <!-- 객실 정보 -->
                                <!-- ▶▶▶  forEach ▶▶▶  -->
                                <div class="stay_view" id="roomView" style="display:flex; justify-content: center; width:100%;">
                               		<c:forEach items="${room}" var="room" step="1">
	                                	<div id="divRoom" style="width:100%">
	                                	<a href="../../../stay/roomInfo?stayName=${vo.stayName }&roomName=${room.roomName}" style="display:flex; justify-content: center;">
	                                       <div class="photo" style="border:1px solid black;background-image: url('/resources/images/${room.roomPhoto.replace('\\','/')}'); background-repeat: no-repeat;
	                                        background-position: center center; background-size: cover; width: 330px; height: 200px; margin-top:50px;">
	                                        </div>
	                                    </a>  
	                                    <div class="reserv_info" style="margin-top:10px;">
	                                           <div class="stay" style= "font-size:15px;font-weight:bold; justify-content: center; display:flex; ">${room.roomName }</div>
	                                           <p></p>
	                                           <div class="option" style="line-height: 2.5; justify-content: center; display:flex;">${room.roomInfo }<br></div>
	                                       </div>
	                                    </div>
                                	</c:forEach>
                                 </div>
                                 
                               </c:if>
                               </c:forEach>
                           </div>


                           <!-- =============================== 페이징 ============================================-->
                           <!-- <div class="paging"><a href="/" class="prev" title="이전 페이지">이전 페이지</a><a href="/"
                                   class="on">1</a><a href="/" class="next" title="다음 페이지">다음 페이지</a></div>  -->
                                  
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
</html>