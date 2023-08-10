<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${list.STAYNAME }</title>
<link rel="shortcut icon" type="image⁄x-icon" href="https://www.stayfolio.com/web/images/logo.png">

<!-- <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="../resources/css/common/48ab7619b7161b1c.css" rel="stylesheet">
<link href="../resources/css//common/5f0d2e1da89b35fb.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="/resources/js/list/list.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09bf24dddad83867e65996ffe53d6185"></script>

<style>
	.reveal {
    visibility: visible;
    opacity: 1;
    transition: .3s;
}
</style>

<script charset="utf-8">
        window.addEventListener('load', function () {
            let guideBtn = document.querySelectorAll('.faq_cont .left li');
            let guideInfo = document.querySelectorAll('.tab_view');
            guideBtn.forEach((button, index) => {
                button.addEventListener('click', () => {
                    guideBtn.forEach((otherButton, otherIndex) => {
                        console.log('클릭된 버튼의 인덱스:', index);
                        if(otherButton == button){
                            otherButton.classList.add('active');
                            guideInfo[index].classList.add('active');
                            guideInfo[index].classList.remove('hide');
                        }else{
                            otherButton.classList.remove('active');
                            guideInfo[otherIndex].classList.remove('active');
                            guideInfo[otherIndex].classList.add('hide');
                        }
                    });
                })
            });
            
            let likeBtn = document.querySelector('.btn_like2');
            likeBtn.addEventListener('click', () => {
                if (likeBtn.classList.contains('on')) {
                    likeBtn.classList.remove('on');
                } else {
                    likeBtn.classList.add('on');
                }
            })
            
            
            // 날짜 선택 버튼
            let dateBtn = document.querySelector('.booking_summary .dayday');
            dateBtn.addEventListener('click', () => {
            	console.log('aa');
            	document.querySelector('.booking_summary .modalOverlay').style.display='';
            })
            
            let btn_close = document.querySelector('.container .container .btn_close');
            btn_close.addEventListener('click', () => {
            	console.log('a');
            	document.querySelector('.booking_summary .modalOverlay').style.display='none';
            }) 
            
            
            // 카카오 지도 
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(${list.LATITUDE}, ${list.LONGITUDE}), // 지도의 중심좌표
		        level: 4 // 지도의 확대 레벨
		    };
		
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(${list.LATITUDE}, ${list.LONGITUDE}); 
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
            
			
			
			 let nextBtn = document.querySelector('.swiper-button-next-room');
			 var roomList = document.querySelectorAll('.room_slider ul li');
			 var roomListt = document.querySelectorAll('.room_slider ul li');
			 var roomListtt = document.querySelectorAll('.room_slider ul li');
			 let room = document.querySelectorAll('.room_slider ul');
			
			 let startIdx = 0;
			 let maxIdx = roomList.length;
			 
/* 			 nextBtn.addEventListener('click', ()=>{
				console.log('a');
				// 버튼을 누르면  0 1 2
				// 버튼을 누르면  1 2 0
				// 버튼을 누르면  2 0 1
				// 버튼을 누르면  0 1 2
				
				
			}) */	
			
			// 객실 갯수에 따른 인덱스 번호
			let indices = Array.from({ length: roomList.length }, (_, i) => i);

			function rotateIndices() {
			  let firstIndex = indices[0];

			  indices.shift();

			  indices.push(firstIndex);

			  return indices;
			}

			let rotateBtn = document.querySelector('.swiper-button-next-room');

			rotateBtn.addEventListener('click', () => {
			  let updatedIndices = rotateIndices();
				
			  console.log(updatedIndices);
			  console.log(updatedIndices[0]);
			  console.log(updatedIndices[1]);
			  console.log(updatedIndices[2]);
			  
			  
/* 			  roomList[0].innerHTML = roomListt[updatedIndices[0]].outerHTML;
			  console.log(roomListt[updatedIndices[0]]);
			  roomList[1].innerHTML = roomListt[updatedIndices[1]].outerHTML;
			  console.log(roomListt[updatedIndices[1]]);
			  roomList[2].innerHTML = roomListt[updatedIndices[2]].outerHTML; 
			  console.log(roomListt[updatedIndices[2]]); */

			  
			  let tmp = roomList[0].innerHTML;
			  roomList[0].innerHTML = roomList[1].innerHTML;
			  roomList[1].innerHTML = roomList[2].innerHTML;
			  roomList[2].innerHTML = tmp;
			});

			let prevtBtn = document.querySelector('.swiper-button-prev-room');
			prevtBtn.addEventListener('click', ()=>{
				  let tmp = roomList[0].innerHTML;
				  roomList[0].innerHTML = roomList[2].innerHTML;
				  roomList[1].innerHTML = roomList[1].innerHTML;
				  roomList[2].innerHTML = tmp;
			})
			
			
			
			
			// 공유하기
			let shareClose = document.querySelector('.share_layer .btn_close');
			shareClose.addEventListener('click', ()=>{
				document.querySelector('.share_layer').style.display= 'none';
			})
			
			let shareBtn = document.querySelector('.links_area .btn_share');
			shareBtn.addEventListener('click', ()=>{
				document.querySelector('.share_layer').style.display= '';
			})
			
			var link =  document.location.href;
			console.log(link);
			
			
			
	 		/* var pic = "${list.MAINPIC1}";
			console.log(pic);
			var pp = pic.replace('\\', '/');
			var savePath= encodeURIComponent(pp);
			console.log(savePath);
			console.log('/display?fileName='+savePath);
			var p = '/display?fileName='+savePath; */
			
			
			// 카카오 링크 공유 api
			 Kakao.Share.createDefaultButton({
			      container: '#kakaotalk-sharing-btn',
			      objectType: 'feed',
			      content: {
			        title: '${list.STAYNAME }',
			        description: '${list.STAYINFO }',
			        imageUrl: "https://images.prismic.io/stayfolio-production/abc8ac48-3810-47d2-9727-5e6d7553a2cf_20230726_%E1%84%87%E1%85%B3%E1%84%85%E1%85%A2%E1%86%AB%E1%84%83%E1%85%B3%E1%84%89%E1%85%B3%E1%84%90%E1%85%A9%E1%84%85%E1%85%B5.jpg?auto=compress,format&rect=0,0,2880,525&w=2880&h=525",
			        link: {
			          // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함 // 들어갈 링크
			          mobileWebUrl: link,
			          webUrl: link,
			        },
			      },
			      buttons: [
			        {
			          title: '자세히 보기',
			          link: {
			            mobileWebUrl: link,
			            webUrl: link,
			          },
			        },
			      ],
			      // 카카오톡 미설치 시 카카오톡 설치 경로이동
			      installTalk: true,
			    });
			
			let likeCopy = document.querySelector('.share_list img');
			let copySuccess = document.getElementById('toast');
			likeCopy.addEventListener('click', () => {
				console.log('a');
				
				// 링크 복사
				navigator.clipboard.writeText(link).then(() => {
					// 링크 복사 알림창
					copySuccess.classList.add('reveal');
					
					// 3초후에 사라짐
					setTimeout(() => {
						copySuccess.classList.remove('reveal');
					}, 3000);
				}).catch((err) => {
				    console.error('Failed to copy link:', err);
				});
			});
			
        });
        
    </script>
    
    
    <!-- 카카오 공유하기 api스크립트 -->
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js" integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh" crossorigin="anonymous"></script>
  	<script>
  		Kakao.init('124076e69929aa6f11bd182ef5993338'); // 사용하려는 앱의 JavaScript 키 입력
  	</script>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<div id="contents" class="findstay-detail-container">
		<div class="container_wide fdetail_top">
			<div class="top_title">
				<div class="name" style='font-size: 40px; font-weight: bold;'>${list.STAYNAME }</div>
				<ul class="links_area">
					<li><button type="button" class="btn_like2">
							<span>관심스테이</span>
						</button>
						<small class="small">${list.LIKECOUNT }</small></li>
					<li><button type="button" class="btn_share">공유하기</button>
						<div class="share_layer" style="display: none;">
							<button type="button" class="btn_close">
								<span>닫기</span>
							</button>
							<div class="share_tit">공유하기</div>
							<ul class="share_list">
								<li><a href="#"><img
										src="https://www.stayfolio.com/web/images/ico-share-link.svg" alt="링크복사">링크 복사</a></li>
								<li><a id="kakaotalk-sharing-btn" href="javascript:;">
								<img src="https://www.stayfolio.com/web/images/ico-share-kakao.svg" alt="올래갈래" />카카오톡</a></li>
							</ul>
							<div class="link-copy-topbanner" id="toast">클립보드에 링크가 복사되었습니다.</div>
						</div> 
						<small class="small">공유하기</small></li>
						
						
				</ul>
			</div>
			<div class="top_img">
				<a href="/findstay/dansim-stay/gallery">
					<div class="stay-main-img">
						<span id="show-pictures-button">사진 모아보기</span> <span
							style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;">
							<img alt="Stay Main Image" sizes="100vw" src="/resources/images/${list.MAINPIC1 }"
							decoding="async" data-nimg="fill"
							style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover;">
						</span>
					</div>
				</a>
				<div class="info">
					<p class="txt">${list.STAYINFO }</p>
					<p class="link">
						<!-- <a href="/" class="not_link">MAGAZINE</a> -->
						<a href="/journal/picks/dansim-stay" class="">${list.BADGE }</a>
					</p>
					<p class="eng_name">${list.STAYNAME }<small>${list.STAYLOC }</small></p>
				</div>
			</div>
		</div>
		<div class="container fdetail_calendar">
			<div class="booking_summary">
				<div class="name">${list.STAYNAME }</div>
				<div class="dayday" role="presentation">
					<div class="btn_select ">날짜를 선택해주세요.</div>
				</div>
				
				
				 <div class="modalOverlay" style="display: none">
                        <div class="modalWrapper" >
                            <div class="modalInner" >
                                <div class="container" >
                                     <div class="shared-calendar" >
                                        <div class="DatePicker_calendar_wrap" >
                                            <div class="DateRangePicker DateRangePicker_1">
                                                <div class="" style="width: 1080px; height: 450px; border: 1px solid #e4e4e4; background: #fff; border-radius: 5px;">
                                                        <div class="calendar-wrap" style="padding-top: 0px ">
                                                            <div class="calendar-middle-wrap" style="height: 400px;">
                                                              <div class="cal_nav">
                                                                <a href="javascript:;" class="nav-btn go-prev"></a>
                                                                <span class="year-month start-year-month">2023.08</span>
                                                                <a href="javascript:;" class="nav-btn go-next"></a>
                                                              </div>
                                                              <div class="cal_wrap" style="background: none;">
                                                                <div class="days">
                                                                  <div class="day">일</div>
                                                                  <div class="day">월</div>
                                                                  <div class="day">화</div>
                                                                  <div class="day">수</div>
                                                                  <div class="day">목</div>
                                                                  <div class="day">금</div>
                                                                  <div class="day">토</div>
                                                                </div>
                                                                <div class="dates start-calendar"><div class="day prev disable">30</div><div class="day prev disable">31</div><div class="day prev disable">1</div><div class="day current" data-day="20230802" onclick="selectDay(this)"><span>2</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230803" onclick="selectDay(this)"><span>3</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230804" onclick="selectDay(this)"><span>4</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230805" onclick="selectDay(this)"><span>5</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230806" onclick="selectDay(this)"><span>6</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230807" onclick="selectDay(this)"><span>7</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230808" onclick="selectDay(this)"><span>8</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230809" onclick="selectDay(this)"><span>9</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230810" onclick="selectDay(this)"><span>10</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230811" onclick="selectDay(this)"><span>11</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230812" onclick="selectDay(this)"><span>12</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230813" onclick="selectDay(this)"><span>13</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230814" onclick="selectDay(this)"><span>14</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230815" onclick="selectDay(this)"><span>15</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230816" onclick="selectDay(this)"><span>16</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230817" onclick="selectDay(this)"><span>17</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230818" onclick="selectDay(this)"><span>18</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230819" onclick="selectDay(this)"><span>19</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230820" onclick="selectDay(this)"><span>20</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230821" onclick="selectDay(this)"><span>21</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230822" onclick="selectDay(this)"><span>22</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230823" onclick="selectDay(this)"><span>23</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230824" onclick="selectDay(this)"><span>24</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230825" onclick="selectDay(this)"><span>25</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230826" onclick="selectDay(this)"><span>26</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230827" onclick="selectDay(this)"><span>27</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230828" onclick="selectDay(this)"><span>28</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230829" onclick="selectDay(this)"><span>29</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230830" onclick="selectDay(this)"><span>30</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230831" onclick="selectDay(this)"><span>31</span><p class="check_in_out_p"></p><p></p></div><div class="day next disable">1</div><div class="day next disable">2</div></div>
                                                              </div>
                                                            </div>
                                                      
                                                            <div class="calendar-middle-wrap" style="height: 400px;">
                                                              <div class="cal_nav">
                                                                <a href="javascript:;" class="nav-btn go-prev"></a>
                                                                <span class="year-month last-year-month">2023.09</span>
                                                                <a href="javascript:;" class="nav-btn go-next"></a>
                                                              </div>
                                                              <div class="cal_wrap">
                                                                <div class="days">
                                                                  <div class="day">일</div>
                                                                  <div class="day">월</div>
                                                                  <div class="day">화</div>
                                                                  <div class="day">수</div>
                                                                  <div class="day">목</div>
                                                                  <div class="day">금</div>
                                                                  <div class="day">토</div>
                                                                </div>
                                                                <div class="dates last-calendar"><div class="day prev disable">27</div><div class="day prev disable">28</div><div class="day prev disable">29</div><div class="day prev disable">30</div><div class="day prev disable">31</div><div class="day current" data-day="20230901" onclick="selectDay(this)"><span>1</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230902" onclick="selectDay(this)"><span>2</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230903" onclick="selectDay(this)"><span>3</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230904" onclick="selectDay(this)"><span>4</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230905" onclick="selectDay(this)"><span>5</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230906" onclick="selectDay(this)"><span>6</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230907" onclick="selectDay(this)"><span>7</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230908" onclick="selectDay(this)"><span>8</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230909" onclick="selectDay(this)"><span>9</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230910" onclick="selectDay(this)"><span>10</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230911" onclick="selectDay(this)"><span>11</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230912" onclick="selectDay(this)"><span>12</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230913" onclick="selectDay(this)"><span>13</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230914" onclick="selectDay(this)"><span>14</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230915" onclick="selectDay(this)"><span>15</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230916" onclick="selectDay(this)"><span>16</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230917" onclick="selectDay(this)"><span>17</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230918" onclick="selectDay(this)"><span>18</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230919" onclick="selectDay(this)"><span>19</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230920" onclick="selectDay(this)"><span>20</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230921" onclick="selectDay(this)"><span>21</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230922" onclick="selectDay(this)"><span>22</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230923" onclick="selectDay(this)"><span>23</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230924" onclick="selectDay(this)"><span>24</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230925" onclick="selectDay(this)"><span>25</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230926" onclick="selectDay(this)"><span>26</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230927" onclick="selectDay(this)"><span>27</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230928" onclick="selectDay(this)"><span>28</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230929" onclick="selectDay(this)"><span>29</span><p class="check_in_out_p"></p><p></p></div><div class="day current" data-day="20230930" onclick="selectDay(this)"><span>30</span><p class="check_in_out_p"></p><p></p></div></div>
                                                              </div>
                                                            </div>
                                                      
                                                            <div class="checkInOutInfo" style="height:400px;">
                                                              <div>
                                                                <p>
                                                                  <span style="padding-bottom:15px">체크인</span>
                                                                  <label id="check_in_day_list" style="font-size: 20px;"></label>
                                                                </p>
                                                                <p class="space" style="color: #212529;font-size:2em;"></p>
                                                                <p>
                                                                  <span>체크아웃</span>
                                                                  <label id="check_out_day_list" style="font-size: 20px;"></label>
                                                                </p>
                                                                <br><br>
                                                                <p>
                                                                  <span>총 예약일</span>
                                                                </p>
                                                                <p>
                                                                  <label id="check_out_day" class="check_day_count" style="font-size: 20px;"></label>
                                                                </p>
                                                      
                                                              </div>
                                                            </div>
                                                            <div id="buttonBtn">
                                                                
                                                                  <input type="hidden" id="reserved_day" name="reserved_day" value="">
                                                                  <input type="hidden" id="reserved_checkIn" name="reserved_checkIn" value="">
                                                                  <input type="hidden" id="reserved_checkOut" name="reserved_checkOut" value="">
                                                        
                                                                  <div class="btn-wrapper" style="position:absolute; bottom:5%; left:35%;">
                                                                    <button style=" border:0px; cursor: pointer;" type="submit" onclick="" class="btn-number-search">예약하기</button>
                                                                  </div>
                                                                  <!-- <button style="padding-bottom:10px; background-color:white; border:0px; cursor: pointer; position:absolute; top:3%; right:2%;" type="button" id="closeBtn2">
                                                                    <img src="https://www.stayfolio.com/web/images/btn_layer_close.png">
                                                                  </button> -->
                                                                
                                                              </div>
                                                            <script>
                                                      
                                                              window.addEventListener('load', function () {
                                                      
                                                                /*
                                                                // 예약 페이지에선 닫기 버튼 안보여주기
                                                                if($('.modalOverlay2').attr('style') == null){
                                                                    
                                                                  $('#closeBtn2').attr('style', 'display:none;');
                                                                    
                                                                }
                                                                */
                                                      
                                                                if (checkInDate == '' || checkOutDate == '') {
                                                      
                                                                  $('.space').html('');
                                                      
                                                                }
                                                      
                                                      
                                                      
                                                      			// 초기화 버튼
                                                                /* reload.addEventListener('click', function (e) {
                                                      
                                                                  e.preventDefault();            <button style="padding-bottom:10px; background-color:white; border:0px; cursor: pointer;"
                                                                      id="reload">초기화</button><br><br>
                                                      
                                                                  //window.location.reload();
                                                      
                                                                  // 달력 체크 인/아웃 값 초기화
                                                                  $('.checkIn').find('.check_in_out_p').html('');
                                                                  $('.checkOut').find('.check_in_out_p').html('');
                                                      
                                                                  $('.day').removeClass('checkIn');
                                                                  $('.day').removeClass('checkOut');
                                                                  $('.day').removeClass('selectDay');
                                                      
                                                      
                                                                  $('.checkInOutInfo label').html('')
                                                      
                                                      
                                                      
                                                                  checkInDate = '';
                                                                  checkOutDate = '';
                                                      
                                                                  // ~ 표시
                                                                  $('.space').html('');
                                                                }); */
                                                      
                                                                // 뒤로가기 버튼
                                                                /* back.addEventListener('click', function (e) {
                                                      
                                                                  e.preventDefault();
                                                      
                                                                  location.href = '/main';
                                                      
                                                                }); */
                                                      
                                                              });
                                                      
                                                              // 날짜 유효성 검사
                                                              function check(form) {
                                                      
                                                                if (checkInDate == "") {
                                                      
                                                      
                                                                  alert('체크인 날짜를 선택해 주세요');
                                                      
                                                                  return false;
                                                                }
                                                      
                                                                if (checkOutDate == "") {
                                                      
                                                      
                                                                  alert('체크아웃 날짜를 선택해 주세요');
                                                      
                                                                  return false;
                                                                }
                                                      
                                                                form.submit();
                                                      
                                                      
                                                      
                                                              }
                                                      
                                                            </script>
                                                      
                                                          </div>


                                                    </div>
                                                
                                                
                                            </div>
                                        </div>
                                        <!-- <button type="button" class="day_del">선택 날짜 지우기</button> -->
                                    </div>
                                    <div class="btn_close" role="presentation"></div>
                                </div>
                            </div>
                        </div>
                    </div>
				
				
				
				
				<div></div>
			</div>
		</div>
		<div class="container_full fdetail_room">
			<div class="container room_cont">
				<div class="tit">
					ROOM<br class="pc_only">
				</div>
				<div class="txt"></div>
				<div class="swiper-buttons">
					<div class="swiper-button-prev-room swiper-button-disabled">Prev</div>
					<div class="swiper-button-next-room swiper-button-disabled">Next</div>
				</div>
			</div>
			<div class="room_slider">
				<div
					class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events">
					<ul class="swiper-wrapper">
						<!-- 반복 -->
						<c:forEach items="${stayRoomInfo}" var="roomList" step="1">
						<li class="swiper-slide slider_box single-room swiper-slide-active">
							<a href="/stay/roomInfo?stayName=${list.STAYNAME }&roomName=${roomList.ROOMNAME}">
								<div role="presentation" class="img"
									style="background-image: url(&quot;${roomList.FIELD}&quot;); background-repeat: no-repeat; background-position: center center; background-size: cover;">
								</div>
								<div class="room-info">
									<p class="name" style="width: 100%;">
										<small>특실</small>${roomList.ROOMNAME}
									</p>
									<p class="etc" style="width: 100%;">
										<span>기준 ${roomList.STDPERSON}명&nbsp;(최대 ${roomList.OVERPERSON}명)</span><span>침구 ${roomList.BED}개</span>
									</p>
									<p class="price">₩${roomList.PRICE} ~</p>
									<p class="book mo-book-btn" role="presentation">예약하기</p>
								</div>
							</a>
						</li>
						</c:forEach>
						<!-- 여기까지 -->
					</ul>
				</div>
			</div>
		</div>
		<div class="fdetail_info_wrapper">
			<div class="container fdetail_intro">
				<div class="fdetail_title">
					${list.INFO }<small>${list.STAYNAME }</small>
				</div>
				<div class="fdetail_text">
					<div class="txt1">저희 특별한 공간과 시간만을 제공하는 스테이폴리오에서 가장 인기있는 숙소 '${list.STAYNAME }' 입니다.</div>
					<div class="txt2">‘ㄱ’자 구조의 단심 스테이는 전면에 배치된 4개의 통창이 단연 돋보입니다.
						특히, 다이닝 공간의 폴딩형 창은 완전히 오픈하면 주변과 경계 없이 호흡이 가능합니다. 실내에 따로 마련된 욕조 공간
						또한, 창을 통해 햇볕을 받으며 탁 트인 주변 경치를 감상할 수 있도록 했습니다. 노출 콘크리트와 월넛 우드 소재로
						구성된 내부는 공간에 채워진 오브제나 액자, 가구와 어우러져 사뭇 미술관 같은 분위기마저 듭니다. 단심 스테이는
						호스트가 직접 공간에 어울리는 플레이리스트를 선별하여 제공하고 있습니다. 호스트가 제안하는 음악과 함께 공간에서의
						경험을 완성해 보세요.</div>
				</div>
			</div>

			<!-- 옵션 추출 -->
			<div class="container_full fdetail_special"
				<%-- style="background-image: url(/resources/images/${list.MAINPIC1.replace('\\','/')}); background-repeat: no-repeat; background-position: center center; background-size: cover;"> --%>
				style="background-image: url(/resources/images/jyp.jpg); background-repeat: no-repeat; background-position: center center; background-size: cover;">
				<div class="container special_wrap">
					<div class="special_tit">
						<small>SPECIAL</small>
					</div>
					<div class="special_list">
						<c:if test="${list.POOL eq 'Y'}">
						<li><i><img
								src="https://images.stayfolio.com/system/pictures/images/000/161/857/original/41df569c4c5367b783f4793f058957ab0d7a771d.png?1673938881"
								alt="special_img_1"></i>
							<div class="tit">실내 스파</div>
							<div class="desc">6인까지도 충분히 들어갈 수 있는 실내 스파가 있습니다. 가족과 함께
								즐겨보세요.</div>
						</li>
						</c:if>
						<c:if test="${list.BABIQU eq 'Y'}">
						<li>
						<i><img
								src="https://images.stayfolio.com/system/pictures/images/000/022/852/original/da72017d52231aece7591975b33191a88d831d33.png?1509347637"
								alt="special_img_1"></i>
							<div class="tit">TOWN HOTEL</div>
							<div class="desc">서촌의 작은 골목들을 배경삼아, 동네가 품은 이야기와 정취를 느끼며 편안히 머물 수 있는 공간이 되고자 합니다. 커피 맛이 좋은 스펙터, 가정식이 훌륭한 공기식당, 통인시장과 수성동 계곡 등 서촌의 매력적인 곳들을 산책하며 호흡하는 여행을 추천합니다.</div>
						</li>
						</c:if>
						<c:if test="${list.POOL eq 'Y'}">
						<li>
						<i><img
								src="https://images.stayfolio.com/system/pictures/images/000/018/215/original/b8c313646dafe7674539a93e7e1effd20f670cd9.png?1500455204"
								alt="special_img_1"></i>
							<div class="tit">MEALS</div>
							<div class="desc">쌀과 제철 채소, 해산물, 그리고 멧돼지와 오소리고기 등 산을 온전히 느낄 수 있는 가이세키 요리(일본식 코스 요리)를 제공합니다.</div>
						</li>
						</c:if>
					</div>
				</div>
			</div>



			<div class="container_full fdetail_map">
				<div class="container map_txt">
					<div class="txt1">'${list.STAYNAME }'의 위치는 [${list.STAYADRESS }]
						입니다.</div>
					<div class="txt2">주차가 가능한 숙소입니다.</div>
				</div>
				<div class="map_container">
					<div id="naver-map-detail" tabindex="0"
						style="height: inherit; position: relative; overflow: hidden; background: rgb(248, 249, 250);">
						<div id="map" style="width: 100%; height: 550px;"></div>
					</div>
					<div class="map_tit" style='margin-top: 40px'>
						<div class="title">
							HELLO.<br>${list.STAYNAME }
						</div>
						<div class="desc">
							${list.STAYADRESS }<br> <a class="phone"
								href="tel:0504-0904-2702">0504-0904-2702</a> <a class="email"
								href="mailto:dansim.stay@gmail.com" target="_blank"
								rel="noreferrer">dansim.stay@gmail.com</a>
						</div>
						<div class="links">
							<a href="http://instagram.com/dansim.stay" target="_blank"
								rel="noopener noreferrer" class="insta">
								<div class="icon-insta"></div>
							</a>
						</div>
					</div>
				</div>
			</div>




			<div class="container_full booking_faq" id="faq">
				<div class="container">
					<div class="faq_tit">
						<div class="left">안내사항</div>
						<div class="right">
							<div>숙소 이용에 대한 상세한 안내를 확인해 보세요.</div>
						</div>
					</div>
					<div class="faq_cont">
						<ul class="left tab_btn">
							<li class="active" role="presentation">예약 안내</li>
							<li class="" role="presentation">이용 안내</li>
							<li class="" role="presentation">환불 규정</li>
						</ul>
						<div class="right tab_cont">
							<div class="tab_view active">
								<div class="tit">예약 안내</div>
								<div class="cont">
									<dl>
										<dt>
											요금 기준
											<div class="line-break"></div>
										</dt>
										<dd>
											<p>
												<mark style="background-color: black;">
													<b style="color: #888; font-weight: bolder;"> &nbsp;
														정확한 객실 요금은 일정 선택 후 확인할 수 있습니다. &nbsp; </b>
												</mark>
												<br>&nbsp;
											</p>
											<table>
												<thead>
													<tr>
														<th
															style="color: #888; font-size: 12px; font-weight: bold;">숙소
														</th>
														<th
															style="color: #888; font-size: 12px; font-weight: bold;">
															인원(기준/최대)</th>
														<th
															style="color: #888; font-size: 12px; font-weight: bold;">요금
														</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td style="color: #888; font-size: 12px;">${list.STAYNAME }</td>
														<td style="color: #888; font-size: 12px;">
															 최소 ${list.STDPERSON}인 / 최대 ${list.OVERPERSON}인</td>
														<td style="color: #888; font-size: 12px;">${list.MINPRICE} ~ </td>
													</tr>
												</tbody>
											</table>
											<ul>
												<li>기준인원 ${list.STDPERSON}인이며, 최대 인원 ${list.OVERPERSON}인(영유아포함)까지 이용 가능한 숙소입니다.</li>
												<li>기준인원 초과 시 1인 1박당 2만원의 추가 요금이 발생합니다.</li>
											</ul>
										</dd>
									</dl>
								</div>
								<div class="cont">
									<dl>
										<dt>
											할인 혜택
											<div class="line-break"></div>
										</dt>
										<dd>
											<ul>
												<li>한달 이상 사용자만 할인 혜택이 제공됩니다.</li>
											</ul>
										</dd>
									</dl>
								</div>
								<div class="cont">
									<dl>
										<dt>
											문의하기
											<div class="line-break"></div>
										</dt>
										<dd>
											<ul>
												<li>예약과 이용 문의 060-700-5454</li>
											</ul>
										</dd>
									</dl>
								</div>
							</div>
							<div class="tab_view hide">
								<div class="tit">이용 안내</div>
								<div class="cont">
									<dl>
										<dt>
											이용 규칙
											<div class="line-break"></div>
										</dt>
										<dd>
											<ul>
												<li>체크인은 오후 3시, 체크아웃은 오후 12시입니다.</li>
												<li>최대인원을 초과하는 인원은 입실이 불가합니다.</li>
												<li>예약인원 외 방문객의 출입을 엄격히 제한합니다.</li>
												<li>모든 공간에서 절대 금연입니다. 위반 시 특수청소비가 청구됩니다.</li>
												<li>화재의 위험으로 모든 공간에서 화기 사용을 엄격히 금지합니다.</li>
												<li>취사 가능한 숙소이나, 연기와 냄새가 나는 음식(고기, 해산물 등)의 조리를 금지합니다.</li>
												<li>침구나 비품, 시설 등에 심각한 오염, 파손 및 분실이 발생한 경우 변상비가 청구됩니다.</li>
												<li>협의되지 않은 상업 사진 및 영상 촬영(광고용, 제품사진, 쇼핑몰, SNS마켓 포함), 드론
													촬영은 불가합니다.</li>
											</ul>
										</dd>
									</dl>
								</div>
								<div class="cont">
									<dl>
										<dt>
											실내 욕조
											<div class="line-break"></div>
										</dt>
										<dd>
											<ul>
												<li>영유아와 어린이는 반드시 보호자의 동반 하에 안전하게 이용해 주시기 바랍니다.</li>
											</ul>
										</dd>
									</dl>
								</div>
								<div class="cont">
									<dl>
										<dt>
											주차
											<div class="line-break"></div>
										</dt>
										<dd>
											<ul>
												<li>주차가 가능한 숙소입니다.</li>
											</ul>
										</dd>
									</dl>
								</div>
							</div>
							<div class="tab_view hide">
								<div class="tit">환불 규정</div>
								<div class="cont">
									<dl>
										<dt>환불 규정</dt>
										<dd>
											<table>
												<thead>
													<tr>
														<th>기준일</th>
														<th>환불 금액</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>체크인 15일전까지</td>
														<td>총 결제금액의 100% 환불</td>
													</tr>
													<tr>
														<td>체크인 10일전까지</td>
														<td>총 결제금액의 70% 환불</td>
													</tr>
													<tr>
														<td>체크인 7일전까지</td>
														<td>총 결제금액의 50% 환불</td>
													</tr>
													<tr>
														<td>체크인 3일전까지</td>
														<td>총 결제금액의 20% 환불</td>
													</tr>
													<tr>
														<td>체크인 2일전부터</td>
														<td>변경 / 환불 불가</td>
													</tr>
												</tbody>
											</table>
										</dd>
										<dt>
											숙박권 양도
											<div class="line-break"></div>
										</dt>
										<dd>
											<ul>
												<li>앙대요~</li>
											</ul>
										</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="../common/footer.jsp"%>
</html>
