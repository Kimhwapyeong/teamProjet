<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단심스테이</title>
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/css/list/room.css" rel="stylesheet">
<link href="../resources/css/list/room2.css" rel="stylesheet">
<link href="../resources/css/list/room3.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="/resources/js/list/list.js"></script>
<script>
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
            let dateBtn = document.querySelector('.booking_summary .day');
            dateBtn.addEventListener('click', () => {
            	console.log('aa');
            	document.querySelector('.booking_summary .modalOverlay').style.display='';
            })
            
            let btn_close = document.querySelector('.container .container .btn_close');
            btn_close.addEventListener('click', () => {
            	console.log('a');
            	document.querySelector('.booking_summary .modalOverlay').style.display='none';
            }) 
            
            
        });
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
						<small class="small">공유하기</small></li>
				</ul>
			</div>
			<div class="top_img">
				<a href="/findstay/dansim-stay/gallery">
					<div class="stay-main-img">
						<span id="show-pictures-button">사진 모아보기</span> <span
							style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;">
							<img alt="Stay Main Image" sizes="100vw" src="${list.MAINPIC1 }"
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
				<div class="day" role="presentation">
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
                                        </div><button type="button" class="day_del">선택 날짜 지우기</button>
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
						<li
							class="swiper-slide slider_box single-room swiper-slide-active">
							<a
							href="/findstay/dansim-stay/room?room_id=2155&amp;identifier=dansim-stay&amp;check_in=&amp;check_out=">
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
				style="background-image: url(&quot;${list.MAINPIC2}&quot;); background-repeat: no-repeat; background-position: center center; background-size: cover;">
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
					<div class="txt1">'${list.STAYNAME }'의 위치는 [${list.STAYADRESS }] 입니다.</div>
					<div class="txt2">주차가 가능한 숙소입니다.</div>
				</div>
				<div class="map_container">
					<div class="map_tit">
						<div class="title">
							HELLO.<br>${list.STAYNAME }
						</div>
						<div class="desc">
							${list.STAYADRESS }<br>
							<a class="phone" href="tel:0504-0904-2702">0504-0904-2702</a><a
								class="email" href="mailto:dansim.stay@gmail.com"
								target="_blank" rel="noreferrer">dansim.stay@gmail.com</a>
						</div>
						<div class="links">
							<a href="http://instagram.com/dansim.stay" target="_blank"
								rel="noopener noreferrer" class="insta">
								<div class="icon-insta"></div>
							</a>
						</div>
					</div>
					<div id="naver-map-detail" tabindex="0"
						style="height: inherit; position: relative; overflow: hidden; background: rgb(248, 249, 250);">
						<div
							style="position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; overflow: visible; width: 100%; height: 100%; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); z-index: 0; cursor: url(&quot;https://ssl.pstatic.net/static/maps/mantle/1x/openhand.cur&quot;), default;">
							<div
								style="position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; overflow: visible; width: 100%; height: 100%; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); z-index: 0;">
								<div
									style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 1; zoom: 1;">
									<div
										style="overflow: visible; width: 100%; height: 0px; position: absolute; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 1; user-select: none; zoom: 1;">
										<div
											style="position: absolute; top: 0px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 0px; height: 0px; overflow: visible; box-sizing: content-box !important;">
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 289px; left: 521px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-364">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223368/105304.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 33px; left: 521px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-348">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223368/105303.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 545px; left: 521px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-332">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223368/105305.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -223px; left: 521px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-346">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223368/105302.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -223px; left: 777px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-360">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223369/105302.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 545px; left: 265px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-352">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223367/105305.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 33px; left: 777px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-362">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223369/105303.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 289px; left: 265px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-349">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223367/105304.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 289px; left: 777px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-342">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223369/105304.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 33px; left: 265px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-358">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223367/105303.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 545px; left: 777px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-357">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223369/105305.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -223px; left: 265px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-335">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223367/105302.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -223px; left: 1033px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-356">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223370/105302.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 545px; left: 9px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-361">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223366/105305.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 33px; left: 1033px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-347">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223370/105303.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 289px; left: 9px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-353">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223366/105304.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 289px; left: 1033px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-341">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223370/105304.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 33px; left: 9px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-363">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223366/105303.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 545px; left: 1033px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-355">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223370/105305.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -223px; left: 9px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-345">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223366/105302.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -223px; left: 1289px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-330">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223371/105302.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 545px; left: -247px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-334">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223365/105305.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 33px; left: 1289px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-343">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223371/105303.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 289px; left: -247px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-350">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223365/105304.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 289px; left: 1289px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-333">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223371/105304.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 33px; left: -247px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-354">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223365/105303.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 545px; left: 1289px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-336">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223371/105305.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -223px; left: -247px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-338">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/18/223365/105302.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
										</div>
									</div>
									<div
										style="overflow: visible; width: 100%; height: 0px; position: absolute; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 0; user-select: none; zoom: 1; display: none;">
										<div
											style="position: absolute; top: 0px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 0px; height: 0px; overflow: visible; box-sizing: content-box !important;">
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 282px; left: 898px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-302">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111684/52652.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 26px; left: 898px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-303">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111684/52651.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 538px; left: 898px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-304">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111684/52653.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -230px; left: 898px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-305">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111684/52650.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -230px; left: 1154px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-306">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111685/52650.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 538px; left: 642px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-307">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111683/52653.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 26px; left: 1154px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-308">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111685/52651.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 282px; left: 642px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-309">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111683/52652.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 282px; left: 1154px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-310">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111685/52652.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 26px; left: 642px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-311">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111683/52651.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 538px; left: 1154px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-312">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111685/52653.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -230px; left: 642px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-313">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111683/52650.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -230px; left: 1410px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-314">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111686/52650.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 538px; left: 386px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-315">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111682/52653.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 26px; left: 1410px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-316">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111686/52651.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 282px; left: 386px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-317">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111682/52652.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 282px; left: 1410px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-318">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111686/52652.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 26px; left: 386px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-319">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111682/52651.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 538px; left: 1410px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-320">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111686/52653.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -230px; left: 386px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-321">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111682/52650.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -230px; left: 1666px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-322">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111687/52650.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 538px; left: 130px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-323">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111681/52653.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 26px; left: 1666px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-324">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111687/52651.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 282px; left: 130px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-325">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111681/52652.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 282px; left: 1666px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-326">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111687/52652.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 26px; left: 130px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-327">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111681/52651.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 538px; left: 1666px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-328">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111687/52653.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -230px; left: 130px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-329">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111681/52650.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -230px; left: -382px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-290">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111679/52650.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 26px; left: -382px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-291">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111679/52651.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 282px; left: -382px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-292">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111679/52652.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 538px; left: -382px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-293">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111679/52653.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -230px; left: -126px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-294">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111680/52650.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 26px; left: -126px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-295">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111680/52651.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 282px; left: -126px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-296">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111680/52652.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 538px; left: -126px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-297">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111680/52653.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: -230px; left: 1922px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-298">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111688/52650.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 26px; left: 1922px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-299">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111688/52651.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 282px; left: 1922px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-300">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111688/52652.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
											<div draggable="false" unselectable="on"
												style="position: absolute; top: 538px; left: 1922px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"
												data-ntranid="NTran-301">
												<img draggable="false" unselectable="on" alt=""
													crossorigin="anonymous" width="256" height="256"
													src="https://nrbe.pstatic.net/styles/basic/1689914544/17/111688/52653.png?mt=bg.ol.sw.ar.lko"
													style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;">
											</div>
										</div>
									</div>
									<div
										style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 100;">
										<div
											style="overflow: visible; width: 100%; height: 0px; position: absolute; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 101;">
										</div>
										<div
											style="overflow: visible; width: 100%; height: 0px; position: absolute; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 103;">
											<div title=""
												style="position: absolute; overflow: visible; box-sizing: content-box !important; cursor: inherit; left: -378px; top: 3173px;">
												<div class="map_marker" style="cursor: pointer;">1</div>
											</div>
											<div title=""
												style="position: absolute; overflow: visible; box-sizing: content-box !important; cursor: inherit; left: 4626px; top: -4785px;">
												<div class="map_marker" style="cursor: pointer;">2</div>
											</div>
											<div title=""
												style="position: absolute; overflow: visible; box-sizing: content-box !important; cursor: inherit; left: 4762px; top: -4791px;">
												<div class="map_marker" style="cursor: pointer;">3</div>
											</div>
											<div title=""
												style="position: absolute; overflow: visible; box-sizing: content-box !important; cursor: inherit; left: 4766px; top: -4850px;">
												<div class="map_marker" style="cursor: pointer;">4</div>
											</div>
											<div title=""
												style="position: absolute; overflow: visible; box-sizing: content-box !important; cursor: inherit; left: 6073px; top: 5163px;">
												<div class="map_marker" style="cursor: pointer;">5</div>
											</div>
											<div title=""
												style="position: absolute; overflow: visible; box-sizing: content-box !important; cursor: inherit; left: 4875px; top: -5977px;">
												<div class="map_marker" style="cursor: pointer;">6</div>
											</div>
											<div title=""
												style="position: absolute; overflow: visible; box-sizing: content-box !important; cursor: inherit; left: 613px; top: 231px;">
												<div class="map_stay" style="cursor: pointer;"></div>
											</div>
										</div>
										<div
											style="overflow: visible; width: 100%; height: 0px; position: absolute; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 106;">
										</div>
									</div>
								</div>
								<div
									style="position: absolute; display: none; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; overflow: visible; width: 100%; height: 100%; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); background-color: rgb(255, 255, 255); z-index: 10000; opacity: 0.5;">
								</div>
							</div>
						</div>
						<div
							style="position: absolute; z-index: 100; margin: 0px; padding: 0px; pointer-events: none; bottom: 0px; right: 0px;">
							<div
								style="border: 0px none; margin: -4px 0px 0px; padding: 0px; pointer-events: none; float: right; height: 21px;">
								<div
									style="position: relative; width: 60px; height: 14px; margin: 0px 12px 7px 2px; overflow: hidden; pointer-events: auto;">
									<span
										style="display: block; margin: 0; padding: 0 4px; text-align: center; font-size: 10px; line-height: 11px; font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic,&amp; quot; 나눔고딕 &amp;quot; , Dotum ,&amp;quot; 돋움 &amp;quot; , sans-serif; font-weight: bold; color: #000; text-shadow: -1px 0 rgba(255, 255, 255, 0.3), 0 1px rgba(255, 255, 255, 0.3), 1px 0 rgba(255, 255, 255, 0.3), 0 -1px rgba(255, 255, 255, 0.3);">30m</span><img
										src="https://ssl.pstatic.net/static/maps/mantle/1x/scale-normal-b.png"
										width="52" height="4" alt=""
										style="position: absolute; left: 4px; bottom: 0px; z-index: 2; display: block; width: 52px; height: 4px; overflow: hidden; margin: 0px; padding: 0px; border: 0px none; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important;"><img
										src="https://ssl.pstatic.net/static/maps/mantle/1x/scale-normal-l.png"
										width="4" height="10" alt=""
										style="position: absolute; left: 0; bottom: 0; z-index: 2; display: block; width: 4px; height: 10px; overflow: hidden; margin: 0; padding: 0; border: 0 none; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important;"><img
										src="https://ssl.pstatic.net/static/maps/mantle/1x/scale-normal-r.png"
										width="4" height="10" alt=""
										style="position: absolute; right: 0; bottom: 0; z-index: 2; display: block; width: 4px; height: 10px; overflow: hidden; margin: 0; padding: 0; border: 0 none; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important;">
								</div>
							</div>
							<div
								style="border: 0px none; margin: 0px; padding: 0px; pointer-events: none; float: right;">
								<a
									href="https://ssl.pstatic.net/static/maps/mantle/notice/legal.html"
									target="_blank"
									style="display: block; width: 45px; height: 10px; overflow: hidden; margin: 0px 5px 7px 12px; pointer-events: auto;"><img
									src="https://ssl.pstatic.net/static/maps/mantle/1x/naver-logo-normal-new.png"
									width="45" height="10" alt="NAVER"
									style="display: block; width: 45px; height: 10px; overflow: hidden; border: 0 none; margin: 0; padding: 0; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important;"></a>
							</div>
						</div>
						<div
							style="position: absolute; z-index: 100; margin: 0px; padding: 0px; pointer-events: none; bottom: 0px; left: 0px;">
							<div
								style="border: 0px none; margin: 0px; padding: 0px; pointer-events: none; float: left; height: 19px;">
								<div class="map_copyright"
									style="margin: 0px; padding: 0px 0px 2px 10px; height: 19px; line-height: 19px; color: rgb(68, 68, 68); font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic, 나눔고딕, Dotum, 돋움, sans-serif; font-size: 11px; clear: both; white-space: nowrap; pointer-events: none;">
									<div style="float: left;">
										<span style="white-space: pre; color: rgb(68, 68, 68);">©
											NAVER Corp.</span>
									</div>
									<a href="#"
										style="font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic, 나눔고딕, Dotum, 돋움, sans-serif; font-size: 11px; line-height: 19px; margin: 0px 0px 0px 5px; padding: 0px; color: rgb(68, 68, 68); float: left; pointer-events: auto; text-decoration: underline; display: none;">더보기</a>
									<div style="float: left;">
										<a target="_blank"
											href="http://www.openstreetmap.org/copyright"
											style="pointer-events: auto; white-space: pre; display: none; color: rgb(68, 68, 68);">
											/OpenStreetMap</a>
									</div>
								</div>
							</div>
						</div>
						<div
							style="border: 1px solid rgb(41, 41, 48); background: rgb(255, 255, 255); padding: 15px; color: rgb(51, 51, 51); position: absolute; font-size: 11px; line-height: 1.5; clear: both; display: none; max-width: 350px !important; max-height: 300px !important;">
							<h5
								style="font-size: 12px; margin-top: 0px; margin-bottom: 10px;">지도
								데이터</h5>
							<a href="#"
								style="position: absolute; top: 8px; right: 8px; width: 14px; height: 14px; font-size: 14px; line-height: 14px; display: block; overflow: hidden; color: rgb(68, 68, 68); text-decoration: none; font-weight: bold; text-align: center;">x</a>
							<div>
								<span
									style="white-space: pre; color: rgb(68, 68, 68); float: left;">©
									NAVER Corp.</span><a target="_blank"
									href="http://www.openstreetmap.org/copyright"
									style="pointer-events: auto; white-space: pre; color: rgb(68, 68, 68); float: left; display: none;">
									/OpenStreetMap</a>
							</div>
						</div>
						<div
							style="position: absolute; z-index: 100; margin: 0px; padding: 0px; pointer-events: none; top: 0px; left: 0px;">
							<div
								style="border: 0px none; margin: 0px; padding: 0px; pointer-events: none; float: left;">
								<div
									style="position: relative; z-index: 52; pointer-events: auto;">
									<div
										style="position: relative; z-index: 0; width: 28px; margin: 10px; border: 1px solid rgb(68, 68, 68); box-sizing: content-box !important; user-select: none;">
										<a href="#"
											style="position: relative; z-index: 2; width: 28px; height: 22px; cursor: pointer; display: block; overflow: hidden; border-bottom: 1px solid rgb(202, 205, 209); box-sizing: content-box !important;"><img
											src="https://ssl.pstatic.net/static/maps/mantle/1x/zoom-in-large-normal.png"
											width="28" height="22" alt="지도 확대"
											style="margin: 0; padding: 0; border: solid 0 transparent; display: block; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important; width: 28px; height: 22px;"></a>
										<div
											style="position: relative; width: 28px; height: 156px; overflow: hidden; margin: 0px; padding: 7px 0px; background-color: rgb(255, 255, 255); cursor: pointer; box-sizing: content-box !important; display: block;">
											<div
												style="position: absolute; top: 7px; bottom: 7px; left: 12px; width: 4px; height: 156px; display: block; background-color: rgb(47, 135, 236);">
											</div>
											<div
												style="position: absolute; top: 7px; bottom: 7px; left: 12px; width: 4px; height: 34px; display: block; background-color: rgb(202, 205, 209);">
											</div>
											<a href="#"
												style="position: absolute; left: 4px; width: 18px; height: 10px; top: 34px; border: 1px solid rgb(68, 68, 68); cursor: move; display: block; overflow: hidden; box-sizing: content-box !important;"><img
												src="https://ssl.pstatic.net/static/maps/mantle/1x/zoom-handle.png"
												width="18" height="10" alt="지도 확대/축소 슬라이더"
												style="margin: 0; padding: 0; border: solid 0 transparent; display: block; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important; width: 18px; height: 10px;"></a>
										</div>
										<a href="#"
											style="position: relative; z-index: 2; width: 28px; height: 22px; cursor: pointer; display: block; overflow: hidden; border-top: 1px solid rgb(202, 205, 209); box-sizing: content-box !important;"><img
											src="https://ssl.pstatic.net/static/maps/mantle/1x/zoom-out-large-normal.png"
											width="28" height="22" alt="지도 축소"
											style="margin: 0; padding: 0; border: solid 0 transparent; display: block; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0 !important; min-height: 0 !important; width: 28px; height: 22px;"></a>
										<div
											style="position: absolute; top: 22px; width: 44px; height: 0px; overflow: visible; left: 36px; display: none;">
											<div style="display: block; margin: 0px; padding: 0px;">
												<h4
													style="visibility: hidden; width: 0; height: 0; overflow: hidden; margin: 0; padding: 0;">
													지도 컨트롤러 범례</h4>
												<div
													style="position: absolute; top: 43px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 44px; height: 17px; overflow: hidden; box-sizing: content-box !important; visibility: visible;">
													<img
														src="https://ssl.pstatic.net/static/maps/mantle/1x/zoom-legend-right-on.png"
														alt=""
														style="position: absolute; top: 0px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 44px; height: 17px; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important;"><span
														style="margin: 0px; border: 0px solid transparent; display: block; font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic, 나눔고딕, Dotum, 돋움, sans-serif; position: relative; z-index: 2; line-height: 17px; color: rgb(255, 255, 255); font-size: 11px; padding: 0px 0px 0px 4px; text-align: center; letter-spacing: -1px; box-sizing: content-box !important;">부동산</span>
												</div>
												<div
													style="position: absolute; top: 63px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 44px; height: 17px; overflow: hidden; box-sizing: content-box !important; visibility: visible;">
													<img
														src="https://ssl.pstatic.net/static/maps/mantle/1x/zoom-legend-right-normal.png"
														alt=""
														style="position: absolute; top: 0px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 44px; height: 17px; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important;"><span
														style="margin: 0px; border: 0px solid transparent; display: block; font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic, 나눔고딕, Dotum, 돋움, sans-serif; position: relative; z-index: 2; line-height: 17px; color: rgb(255, 255, 255); font-size: 11px; padding: 0px 0px 0px 4px; text-align: center; letter-spacing: -1px; box-sizing: content-box !important;">거리</span>
												</div>
												<div
													style="position: absolute; top: 83px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 44px; height: 17px; overflow: hidden; box-sizing: content-box !important; visibility: visible;">
													<img
														src="https://ssl.pstatic.net/static/maps/mantle/1x/zoom-legend-right-normal.png"
														alt=""
														style="position: absolute; top: 0px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 44px; height: 17px; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important;"><span
														style="margin: 0px; border: 0px solid transparent; display: block; font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic, 나눔고딕, Dotum, 돋움, sans-serif; position: relative; z-index: 2; line-height: 17px; color: rgb(255, 255, 255); font-size: 11px; padding: 0px 0px 0px 4px; text-align: center; letter-spacing: -1px; box-sizing: content-box !important;">읍,면,동</span>
												</div>
												<div
													style="position: absolute; top: 113px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 44px; height: 17px; overflow: hidden; box-sizing: content-box !important; visibility: visible;">
													<img
														src="https://ssl.pstatic.net/static/maps/mantle/1x/zoom-legend-right-normal.png"
														alt=""
														style="position: absolute; top: 0px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 44px; height: 17px; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important;"><span
														style="margin: 0px; border: 0px solid transparent; display: block; font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic, 나눔고딕, Dotum, 돋움, sans-serif; position: relative; z-index: 2; line-height: 17px; color: rgb(255, 255, 255); font-size: 11px; padding: 0px 0px 0px 4px; text-align: center; letter-spacing: -1px; box-sizing: content-box !important;">시,군,구</span>
												</div>
												<div
													style="position: absolute; top: 143px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 44px; height: 17px; overflow: hidden; box-sizing: content-box !important; visibility: visible;">
													<img
														src="https://ssl.pstatic.net/static/maps/mantle/1x/zoom-legend-right-normal.png"
														alt=""
														style="position: absolute; top: 0px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 44px; height: 17px; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important;"><span
														style="margin: 0px; border: 0px solid transparent; display: block; font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic, 나눔고딕, Dotum, 돋움, sans-serif; position: relative; z-index: 2; line-height: 17px; color: rgb(255, 255, 255); font-size: 11px; padding: 0px 0px 0px 4px; text-align: center; letter-spacing: -1px; box-sizing: content-box !important;">시,도</span>
												</div>
												<div
													style="position: absolute; top: 163px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 44px; height: 17px; overflow: hidden; box-sizing: content-box !important; visibility: hidden;">
													<img
														src="https://ssl.pstatic.net/static/maps/mantle/1x/zoom-legend-right-normal.png"
														alt=""
														style="position: absolute; top: 0px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 44px; height: 17px; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important;"><span
														style="margin: 0px; border: 0px solid transparent; display: block; font-family: Helvetica, AppleSDGothicNeo-Light, nanumgothic, NanumGothic, 나눔고딕, Dotum, 돋움, sans-serif; position: relative; z-index: 2; line-height: 17px; color: rgb(255, 255, 255); font-size: 11px; padding: 0px 0px 0px 4px; text-align: center; letter-spacing: -1px; box-sizing: content-box !important;">국가</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 아래 주변 맛집 리스트 정보 -->
				<div class="container map_info">
					<ul class="info_list">
						<li>
							<div class="map_marker" role="presentation"
								style="cursor: pointer;">1</div>
							<div class="tit">
								레스빠스<em>cafe</em>
							</div>
							<div class="desc">70년대 농협창고를 리모델링한 카페</div>
						</li>
						<li>
							<div class="map_marker" role="presentation"
								style="cursor: pointer;">2</div>
							<div class="tit">
								가시식당<em>food</em>
							</div>
							<div class="desc">제주식 두루치기와 제주 전통 순대를 맛볼 수 있는 곳</div>
						</li>
						<li>
							<div class="map_marker" role="presentation"
								style="cursor: pointer;">3</div>
							<div class="tit">
								가스름식당<em>food</em>
							</div>
							<div class="desc">현지인들이 많이 찾는 몸순대국 전문 식당</div>
						</li>
						<li>
							<div class="map_marker" role="presentation"
								style="cursor: pointer;">4</div>
							<div class="tit">
								카페 깡<em>cafe</em>
							</div>
							<div class="desc">흑돼지 피자가 맛있는 제주 감성 카페</div>
						</li>
						<li>
							<div class="map_marker" role="presentation"
								style="cursor: pointer;">5</div>
							<div class="tit">
								제주 판타스틱버거<em>food</em>
							</div>
							<div class="desc">편안하고 멋진 분위기의 수제버거 전문점</div>
						</li>
						<li>
							<div class="map_marker" role="presentation"
								style="cursor: pointer;">6</div>
							<div class="tit">
								나목도식당<em>food</em>
							</div>
							<div class="desc">생삼겹살과 두루치기가 유명한 집</div>
						</li>
					</ul>
				</div>
				<!-- 아래 주변 맛집 리스트 정보 끝-->
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
											숙박권
											<div class="line-break"></div>
											양도
										</dt>
										<dd>
											<ul>
												<li>숙박권의 재판매를 비롯하여 양도, 양수, 교환을 금지합니다.</li>
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
