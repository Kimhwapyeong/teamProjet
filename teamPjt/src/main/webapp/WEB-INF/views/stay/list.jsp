<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FIND STAY</title>
<link rel="shortcut icon" type="image⁄x-icon" href="https://www.stayfolio.com/web/images/logo.png">
<link href="../resources/css/list/list.css" rel="stylesheet">
<link href="../resources/css/common/48ab7619b7161b1c.css" rel="stylesheet">
<link href="../resources/css//common/5f0d2e1da89b35fb.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="/resources/js/list/list.js"></script>


<style>
        .open {
            visibility: visible;
            opacity: 1;
            transition: all .2s;
            top: 10px;
        }

        ._selector_selected__ciPbE {
            color: #333;
            font-weight: 600
        }

        ._open_toggle {
            visibility: visible;
            opacity: 1;
            transition: all .2s;
            top: 32px;
        }

        .active {
            color: #fff;
            background: #000;
            border-radius: 100px;
            box-shadow: 6px 7px 15px 0 rgba(0, 0, 0, .3);
        }

        .btn_like_after {
            background-position: 100%;
            opacity: 0;
        }
        .modal_hidden {
            visibility: hidden;
            opacity: 0;
            transition: visibility .3s ease-out, opacity .3s ease-out;
        }
    </style>
    <script>
    window.onload = function() {

            // 국내여행 버튼 띄우기
            travelbtn.addEventListener('click', function () {
                document.querySelector("#areaSelect").style.display = 'block';
            })

            // 국내 여행 모달창 클릭
            let searchbtn = document.querySelectorAll('.clearfix li button');
            searchbtn.forEach(button => {
                // 버튼이 클릭되면
                button.addEventListener('click', () => {
                    console.log('a');
                    // 클릭된 버튼만 active 클래스 추가, 나머지는 active 클래스 삭제
                    searchbtn.forEach(otherButton => {
                        if (otherButton === button) {
                            otherButton.classList.add('active');
                        } else {
                            otherButton.classList.remove('active');
                        }
                    });
                })
            })

            // x창
            let clsbtn = document.querySelector('#clsbtn');
            clsbtn.addEventListener('click', function () {
                document.querySelector("#areaSelect").style.display = '';
            })



            // 인원 버튼
            const btn2 = document.querySelectorAll('.btn_select')[2];
            btn2.addEventListener('click', function () {
                selectNumber.classList.add('open');
            })
            let clsbtn3 = document.querySelectorAll('.btn_close')[3];
            clsbtn3.addEventListener('click', function () {
                selectNumber.classList.remove('open');
            })

            // 가격범위
            const btn3 = document.querySelectorAll('.btn_select')[3];
            btn3.addEventListener('click', function () {
                selectPrice.classList.add('open');
            })
            let clsbtn4 = document.querySelectorAll('.btn_close')[4];
            clsbtn4.addEventListener('click', function () {
                selectPrice.classList.remove('open');
            })

            // 스테이 유형
            const btn4 = document.querySelectorAll('.btn_select')[4];
            btn4.addEventListener('click', function () {
                selectType.classList.add('open');
            })
            let clsbtn5 = document.querySelectorAll('.btn_close')[5];
            clsbtn5.addEventListener('click', function () {
                selectType.classList.remove('open');
            })

            // 편의시설
            const btn5 = document.querySelectorAll('.btn_select')[5];
            btn5.addEventListener('click', function () {
                selectTheme.classList.add('open');
            })
            let clsbtn6 = document.querySelectorAll('.btn_close')[6];
            clsbtn6.addEventListener('click', function () {
                selectTheme.classList.remove('open');
            })


            const bb = document.querySelectorAll('#listpick li');
            bb.forEach(button => {
                button.addEventListener('click', () => {
                    bb.forEach(otherButton => {
                        if (otherButton === button) {
                            otherButton.classList.add('oepn');
                        } else {
                            otherButton.classList.remove('oepn');
                        }
                    });
                })
            })



            

            // 추천순, 인기순, ...
            const buttons = document.querySelectorAll('#listpick li');
            buttons.forEach(button => {
                button.addEventListener('click', () => {
                    buttons.forEach(otherButton => {
                        if (otherButton === button) {
                            otherButton.classList.add('_selector_selected__ciPbE');
                        } else {
                            otherButton.classList.remove('_selector_selected__ciPbE');
                        }
                    });
                })
            })


            // 모든 스테이 버튼
            const allstaybtn = document.querySelector('._findstay_sort_selb__JhhC5 li button');
            const allstaylist = document.querySelector('._selector_layer_toggle__U_ckA');
            allstaybtn.addEventListener('click', () => {
                console.log('a');
                if (allstaylist.classList.contains('_open_toggle')) {
                    allstaylist.classList.remove('_open_toggle');
                } else {
                    allstaylist.classList.add('_open_toggle');
                }
            })


            //좋아요
            let likeBtn = document.querySelectorAll('.flist_box .btn_like');
            likeBtn.forEach(button => {
                button.addEventListener('click', () => {
                    likeBtn.forEach(otherButton => {
                        //누른 버튼의 index 번호가 같고
                        if(otherButton === button ){
                            //클래스가 포함되어 있으면
                            if(button.classList.contains('on')){
                                button.classList.remove('on');
                            }else{
                                button.classList.add('on');

                            }
                        }
                    })
                })
            })


			// 프로모션 보여줬다 사라지기            
            const messageElement = document.getElementById('rightnow');
			function showElement() {
			    messageElement.classList.add('modal_hidden');
			}
			setTimeout(showElement, 3000);            

            
           
			// 날짜 선택 버튼
            let calendarContainer = document.querySelector('#iscalendar');
            let iscalendar = document.querySelectorAll('.DateInput input');
            let closeBtn222 = document.getElementById('closeBtn222');

            // Event listener for iscalendar inputs and closeBtn2
            function toggleCalendar() {
	            if (calendarContainer.style.display === 'none') {
	                calendarContainer.style.display = '';
	            } else {
	                calendarContainer.style.display = 'none';
	            }
            }

            iscalendar.forEach(input => {
            input.addEventListener('click', toggleCalendar);
            });
            closeBtn222.addEventListener('click', toggleCalendar);
        


        
/*         function searchlist() {
            let where;
            document.querySelectorAll('.optionPick>li>button').forEach(button => {
                if (button.classList.contains('active')) {
                    where = button.innerHTML;
                    location.href = '/stay/list?=' + where;
                }
            })
        } */
		
				
        		//  인원수 조정 버튼
	            let plusBtns = document.querySelectorAll('.btn_plus');
	            let minusBtns = document.querySelectorAll('.number_count .btn_minus');
	            let inputNums = document.querySelectorAll('.input-num input');
				let totalCnt = document.getElementById('stdPerson');
	
	            plusBtns.forEach((plusBtn, index) => {
		              plusBtn.addEventListener('click', () => {
		                let currentValue = parseInt(inputNums[index].value);
		                console.log(inputNums[index].value);
		                inputNums[index].value = currentValue + 1;
		                
		                calculateTotal();
	              	});
	            });
	           
	           
	            
	           minusBtns.forEach((minusBtn, index) => {
	            	minusBtn.addEventListener('click', () => {
		                let currentValue = parseInt(inputNums[index].value);
		                if (currentValue > 0) {
		                  inputNums[index].value = currentValue - 1;
		                  calculateTotal();
		                }
	              	});
	            }); 
	           
	           function calculateTotal() {
	        	   let sum = 0;
	        	   inputNums.forEach((input, index) => {
	        	     sum += parseInt(input.value);
	        	   });
	        	   totalCnt.value = sum;
	        	 }
	           
	           
	          
	           
/* 	           let submitBtns = document.querySelectorAll('.btn-number-search');
	           // let searchFrom = document.getElementById('searchFrom');
	           
	           submitBtns.forEach((subBtn) => {
	        	   subBtn.addEventListener('click', (event) => {
	        		    event.preventDefault(); 
	        		    console.log('a');
	        	     // stay(스테이) / region(지역) / totalPerson(인원) / startPrice(시작가격) ~ endPrice(끝가격) / 
	        	     searchForm.action = "/stay/keyword";
	        	     searchForm.submit();
	        	     
	        	   });
	        	 }); */
	           
	           
	           
	           
	           
	           
	           
	           
	           
        	};
        
        	document.addEventListener('DOMContentLoaded', function() {
        	  let searchBtn = document.querySelector('.btn_search');
        	  let insertList = document.querySelector('.flist_wrap');
        	  let searchFrom = document.getElementById('searchFrom');

        	  
     
        	  
        	  searchBtn.addEventListener('click', function() {
        			event.preventDefault(); 
        			console.log('a');
        			
        			let stayName = document.getElementById('stayName').value;
        			if(stayName === null){
        				stayView == "";
        			}
        			console.log(stayName);
        			
        			let stayAdress = document.getElementById('stayAdress').value;
        			if(stayAdress === null){
        				stayAdress == "";
        			}
        			console.log(stayAdress);
        			
        			let stayView = document.getElementById('stayView').value;
        			if(stayView === null){
        				stayView == "";
        			}
        			console.log(stayView);
        			
        			let stdPerson = document.getElementById('stdPerson').value;
        			if(stdPerson === null){
        				stdPerson == "";
        			}
        			console.log(stdPerson);
        			
        			let maxPrice = document.getElementById('maxPrice').value * 10000;
        			if(maxPrice === null){
        				maxPrice == "";
        			}
        			console.log(maxPrice);
        			
        			// all로 바꿔야함
        			let stayType = document.querySelector('#stayTypeList li label input').value;
        			if(stayType === null){
        				stayType == "";
        			}
        			console.log(stayType);
        			
        			// all로 바꿔야함
        			let roomOption = document.querySelectorAll('#roomOptionList li label input').value;
        			if(roomOption === null){
        				roomOption == "";
        			}
        			console.log(roomOption);
        			console.log('aaaaaaaaaaaaaaaaaaaaaaaaa');
        			
        			let option = document.querySelectorAll('#roomOptionList li label input');
        			option.forEach((button)=>{
        				// 체크되어있지 않으면
        				if(button.checked){
							option = button.value;
							console.log(option);
        				}
        			})
        			console.log('aaaaaaaaaaaaaaaaaaaaaaaaa');
        			
        			
        			
        			
        			
        			let findStartDate = document.getElementById('reserved_checkIn').value;
        			if(findStartDate === null){
        				findStartDate == "";
        			}
        			console.log(findStartDate);
        			
        			let findEndDate = document.getElementById('reserved_checkOut').value
        			if(findEndDate === null){
        				findEndDate == "";
        			}
        			console.log(findEndDate);
        			
        			let data = {
        					stayName : stayName || "",
        					stayAdress: stayAdress || "",
        					stayView : stayView || "",
        					stdPerson : stdPerson || "",
        					maxPrice : maxPrice || "",
        					stayType : stayType || "",
        					roomOption : roomOption || "",
        					findStartDate : findStartDate || "",
        					findEndDate : findEndDate || ""
        			      };

        			      
        			      fetch("/stst/keyword", {
        			        method : 'post', 
        			        headers : {
        			          'Content-Type': 'application/json'
        			        },
        			        body : JSON.stringify(data)
        			      })
        			      .then(response => response.json())
        			      .then(result =>{console.log(result);})
        			});

        	 
        	
        	  
        	function keywordList(result){
        		let list = result.list;
        		console.log(list);
        		}
        	});
    </script>
</head>

<body style="">
 	<%@include file="../common/header.jsp" %>
    <div role="presentation">
        <div class="container sub_title">
            <div class="tit">FIND STAY</div>
            <div class="txt">머무는 것 자체로 여행이 되는 공간</div>
        </div>
        <form name="searchFrom" id="searchFrom">
            <div class="container findstay_filter" role="presentation">
                <div class="flist_sorting">
                    <div class="row filter_day">
                        <div class="Keyword"><span class="tit">스테이/지역</span><input type="text" class="inp_keyword" name="stayName" id="stayName"
                                >
                        </div>
                        <div class="filter_area"><button type="button" class="btn_select" id='travelbtn' style='margin-top: 16px;'>국내 전체</button>

                            <button class='a'></button>
                            <div id="areaSelect" class="layer_pop" style="display: '';" id='areaSelect'>
                                <div class="layer_pop_wrap layer_area"><button type="button" class="btn_layer_close"
                                        id='clsbtn'>닫기</button>
                                    <h2 class="layer_title">어디로 떠날까요?</h2>
                                    <div class="area_cont">
                                        <div class="box">
                                            <div class="tit cate_stay" style="text-align: left;">국내</div>
                                            <ul class="clearfix">
                                                <li><button type="button" class="active" name="stayAdress" id="stayAdress" value=""
                                                        style="cursor: pointer;">국내전체</button></li>
                                                <li><button type="submit" class="" style="cursor: pointer;" name="stayAdress" id="stayAdress" value="제주">제주</button>
                                                </li>
                                                <li><button type="submit" class="" style="cursor: pointer;" name="stayAdress" id="stayAdress" value="서울">서울</button>
                                                </li>
                                                <li><button type="submit" class="" style="cursor: pointer;" name="stayAdress" id="stayAdress" value="강원">강원</button>
                                                </li>
                                                <li><button type="submit" class="" style="cursor: pointer;" name="stayAdress" id="stayAdress" value="부산">부산</button>
                                                </li>
                                                <li><button type="submit" class="" style="cursor: pointer;" name="stayAdress" id="stayAdress" value="경기">경기</button>
                                                </li>
                                                <li><button type="submit" class="" style="cursor: pointer;" name="stayAdress" id="stayAdress" value="충청">충청</button>
                                                </li>
                                                <li><button type="submit" class="" style="cursor: pointer;" name="stayAdress" id="stayAdress" value="경상">경상</button>
                                                </li>
                                                <li><button type="submit" class="" style="cursor: pointer;" name="stayAdress" id="stayAdress" value="전라">전라</button>
                                                </li>
                                                <li><button type="submit" class="" style="cursor: pointer;" name="stayAdress" id="stayAdress" value="인천">인천</button>
                                                </li>
                                                <li><button type="submit" class="" style="cursor: pointer;" name="stayAdress" id="stayAdress" value="광주">광주</button>
                                                </li>
                                                <li><button type="submit" class="" style="cursor: pointer;" name="stayAdress" id="stayAdress" value="대전">대전</button>
                                                </li>
                                                <li><button type="submit" class="" style="cursor: pointer;" name="stayAdress" id="stayAdress" value="대구">대구</button>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="box">
                                            <div class="tit cate_stay" style="text-align: left;">주변 경치</div>
                                            <ul class="clearfix">
                                             	<li><button type="submit" class="" style="cursor: pointer;" id="stayView" name="stayView" value="">전체</button>
                                                </li>
                                             	<li><button type="submit" class="" style="cursor: pointer;" id="stayView" name="stayView" value="바다">바다</button>
                                                </li>
                                                <li><button type="submit" class="" style="cursor: pointer;" id="stayView" name="stayView" value="산">산</button>
                                                </li>
                                             </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="checkinout">
                            <ul class="sel_cld">
                                <li><span class="check_in ko">체크인</span></li>
                                <li><span class="check_out" style="right:162px">체크아웃</span></li>
                            </ul>
                            <div class="DateRangePicker DateRangePicker_1">
                                <div>
                                    <div
                                        class="DateRangePickerInput DateRangePickerInput_1 DateRangePickerInput__withBorder DateRangePickerInput__withBorder_2">
                                        <div class="DateInput DateInput_1"><input type="text"
                                                class="DateInput_input DateInput_input_1 DateInput_input__readOnly DateInput_input__readOnly_2 DateInput_input__focused DateInput_input__focused_3"
                                                aria-label="체크인" id="findStartDate" name="findStartDate"
                                                value="체크인" placeholder="체크인" autocomplete="off" readonly=""
                                                aria-describedby="DateInput__screen-reader-message-findStartDate">
                                            <p class="DateInput_screenReaderMessage DateInput_screenReaderMessage_1"
                                                id="DateInput__screen-reader-message-findStartDate">Navigate forward to
                                                interact with the calendar and select a date. Press the question mark
                                                key to get the keyboard shortcuts for changing dates.</p>
                                        </div>
                                        <div class="DateRangePicker_picker DateRangePicker_picker_1 DateRangePicker_picker__directionLeft DateRangePicker_picker__directionLeft_2"
                                            style="top: 66px; left: 0px;">
                                            <div class="DayPicker DayPicker_1 DayPicker__horizontal DayPicker__horizontal_2 DayPicker__withBorder DayPicker__withBorder_3"
                                                style="width: 619px; display: none;" id='iscalendar'>
                                                <div>
                                                    <div class="" style="width: 618px; height: 450px; border: 1px solid #e4e4e4; background: #fff; border-radius: 5px;">

                                                        <div class="calendar-wrap" style="padding-top: 0px ">
                                                            <div class="calendar-middle-wrap" style='height: 400px;'>
                                                              <div class="cal_nav">
                                                                <a href="javascript:;" class="nav-btn go-prev"></a>
                                                                <span class="year-month start-year-month"></span>
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
                                                                <div class="dates start-calendar"></div>
                                                              </div>
                                                            </div>
                                                      
                                                            <div class="calendar-middle-wrap" style='height: 400px;'>
                                                              <div class="cal_nav">
                                                                <a href="javascript:;" class="nav-btn go-prev"></a>
                                                                <span class="year-month last-year-month"></span>
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
                                                                <div class="dates last-calendar"></div>
                                                              </div>
                                                            </div>
                                                      
                                                            <div class="checkInOutInfo" style="height:400px;">
                                                              <div>
                                                                <p>
                                                                  <span style="padding-bottom:15px">체크인</span>
                                                                  <label id="check_in_day_list" style='font-size: 20px;'></label>
                                                                </p>
                                                                <p class="space" style="color: #212529;font-size:2em;">~</p>
                                                                <p>
                                                                  <span>체크아웃</span>
                                                                  <label id="check_out_day_list" style='font-size: 20px;'></label>
                                                                </p>
                                                                <br><br>
                                                                <p>
                                                                  <span>총 예약일</span>
                                                                </p>
                                                                <p>
                                                                  <label id="check_out_day" class="check_day_count" style='font-size: 20px;'></label>
                                                                </p>
                                                      
                                                              </div>
                                                            </div>
                                                            <div id="buttonBtn">
                                                                <form action="/reserved/day" method="get" onsubmit="return false;">
                                                                  <input type="hidden" id="reserved_day" name="reserved_day" value="">
                                                                  <input type="hidden" id="reserved_checkIn" name="reserved_checkIn" value="">
                                                                  <input type="hidden" id="reserved_checkOut" name="reserved_checkOut" value="">
                                                        
                                                                  <div class="btn-wrapper" style="position:absolute; bottom:5%; left:35%;">
                                                                    <button style=" border:0px; cursor: pointer;" type="submit"
                                                                      class="btn-number-search">적용하기</button>
                                                                  </div>
                                                                  <button
                                                                    style="padding-bottom:10px; background-color:white; border:0px; cursor: pointer; position:absolute; top:3%; right:2%;"
                                                                    type="button" id="closeBtn222">
                                                                    <img src="https://www.stayfolio.com/web/images/btn_layer_close.png">
                                                                  </button>
                                                                </form>
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
                                        </div>
                                        <div class="DateRangePickerInput_arrow DateRangePickerInput_arrow_1"
                                            aria-hidden="true" role="presentation"><svg
                                                class="DateRangePickerInput_arrow_svg DateRangePickerInput_arrow_svg_1"
                                                focusable="false" viewBox="0 0 1000 1000">
                                                <path
                                                    d="M694 242l249 250c12 11 12 21 1 32L694 773c-5 5-10 7-16 7s-11-2-16-7c-11-11-11-21 0-32l210-210H68c-13 0-23-10-23-23s10-23 23-23h806L662 275c-21-22 11-54 32-33z">
                                                </path>
                                            </svg></div>
                                        <div class="DateInput DateInput_1"><input type="text"
                                                class="DateInput_input DateInput_input_1 DateInput_input__readOnly DateInput_input__readOnly_2"
                                                aria-label="체크아웃" id="findEndDate" name="findEndDate" value=""
                                                placeholder="체크아웃" autocomplete="off" readonly=""
                                                aria-describedby="DateInput__screen-reader-message-findEndDate">
                                            <p class="DateInput_screenReaderMessage DateInput_screenReaderMessage_1"
                                                id="DateInput__screen-reader-message-findEndDate">Navigate backward to
                                                interact with the calendar and select a date. Press the question mark
                                                key to get the keyboard shortcuts for changing dates.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row filter_other">
                        <div class="btn_layer mo_only" role="presentation"><button type="button" class="btn_select">국내
                                전체</button></div>
                        <div class="btn_layer" role="presentation"><button type="button" class="btn_select"
                                id='peopleNum'>인원</button>
                        </div>
                        <div class="btn_layer" role="presentation"><button type="button" class="btn_select">가격
                                범위</button></div>
                        <div class="btn_layer" role="presentation"><button type="button" class="btn_select">스테이
                                유형</button></div>
                        <div class="btn_layer" role="presentation"><button type="button"
                                class="btn_select">편의시설</button>
                        </div>
                    </div>
                    <div class="layer_wrap">
                        <div id="selectArea" class="layer_select area "><button type="button"
                                class="btn_close">닫기</button>
                            <div class="tit">국내</div>
                            <ul class="check_list">
                                <li class="area_mobile_active ko"><button type="button" class="active"
                                        style="cursor: pointer;">국내 전체</button></li>
                                <li class="area_mobile ko"><button type="button" class=""
                                        style="cursor: pointer;">제주</button></li>
                                <li class="area_mobile ko"><button type="button" class=""
                                        style="cursor: pointer;">서울</button></li>
                                <li class="area_mobile ko"><button type="button" class=""
                                        style="cursor: pointer;">강원</button></li>
                                <li class="area_mobile ko"><button type="button" class=""
                                        style="cursor: pointer;">부산</button></li>
                                <li class="area_mobile ko"><button type="button" class=""
                                        style="cursor: pointer;">경기</button></li>
                                <li class="area_mobile ko"><button type="button" class=""
                                        style="cursor: pointer;">충청</button></li>
                                <li class="area_mobile ko"><button type="button" class=""
                                        style="cursor: pointer;">경상</button></li>
                                <li class="area_mobile ko"><button type="button" class=""
                                        style="cursor: pointer;">전라</button></li>
                                <li class="area_mobile ko"><button type="button" class=""
                                        style="cursor: pointer;">인천</button></li>
                                <li class="area_mobile ko"><button type="button" class=""
                                        style="cursor: pointer;">광주</button></li>
                            </ul>
                            <div class="tit" style="margin-top: 20px;">해외</div>
                            <ul class="check_list">
                                <li class="area_mobile"><button type="button" class="" style="cursor: pointer;">해외
                                        전체</button></li>
                                <li class="area_mobile"><button type="button" class=""
                                        style="cursor: pointer;">베트남</button>
                                </li>
                                <li class="area_mobile"><button type="button" class=""
                                        style="cursor: pointer;">태국</button>
                                </li>
                                <li class="area_mobile"><button type="button" class=""
                                        style="cursor: pointer;">대만</button>
                                </li>
                                <li class="area_mobile"><button type="button" class=""
                                        style="cursor: pointer;">인도네시아</button></li>
                                <li class="area_mobile"><button type="button" class=""
                                        style="cursor: pointer;">싱가포르</button></li>
                                <li class="area_mobile"><button type="button" class=""
                                        style="cursor: pointer;">라오스</button>
                                </li>
                                <li class="area_mobile"><button type="button" class=""
                                        style="cursor: pointer;">일본</button>
                                </li>
                                <li class="area_mobile"><button type="button" class=""
                                        style="cursor: pointer;">필리핀</button>
                                </li>
                            </ul>
                            <div class="tit" style="margin-top: 20px;">브랜드</div>
                            <ul class="check_list">
                                <li class="area_mobile"><button type="button" class=""
                                        style="cursor: pointer;">아만</button>
                                </li>
                                <li class="area_mobile"><button type="button" class="" style="cursor: pointer;">호시노
                                        리조트</button></li>
                                <li class="area_mobile"><button type="button" class=""
                                        style="cursor: pointer;">UDS</button>
                                </li>
                            </ul>
                        </div>
                        <div id="selectNumber" class="layer_select number  "><button type="button"
                                class="btn_close">닫기</button>
                            <div class="tit">인원</div>
                            <dl>
                                <dt style="float: left; margin: 12px 0px 0px;"><span>성인</span></dt>
                                <dd class="">
                                    <div class="number_count"><button type="button" class="btn_minus"
                                            >빼기</button><span class="input-num"><input type="number"
                                                value="0"><span class="person-count">명</span></span><button
                                            type="button" class="btn_plus">더하기</button></div>
                                </dd>
                                <dt style="float: left; margin: 12px 0px 0px;">
                                    <span>아동</span>
                                </dt>
                                <dd class="">
                                    <div class="number_count"><button type="button" class="btn_minus"
                                            >빼기</button><span class="input-num"><input type="number"
                                                value="0" id="person"><span class="person-count">명</span></span><button
                                            type="button" class="btn_plus">더하기</button></div>
                                </dd>
                            </dl>
                            <input type="hidden" name="stdPerson" id="stdPerson" value="0">
                            <div class="btn-wrapper"><button type="submit" class="btn-number-search">적용하기</button></div>
                        </div>
                        <div id="selectPrice" class="layer_select price"><button type="button"
                                class="btn_close">닫기</button>
                            <div class="tit">가격 범위</div>
                            <div class="price_wrap">
                                <!-- <div class="price_slid">
                                    <div aria-disabled="false" class="input-range">
                                        <span class="input-range__label input-range__label--min">
                                            <span class="input-range__label-container">0</span>
                                        </span>
                                        <div class="input-range__track input-range__track--background">
                                            <div class="input-range__track input-range__track--active"
                                                style="left: 0%; width: 100%;"></div>
                                            <span class="input-range__slider-container"
                                                style="position: absolute; left: 0%;">
                                                <span class="input-range__label input-range__label--value">
                                                    <span class="input-range__label-container">0</span>
                                                </span>
                                                <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="0"
                                                    class="input-range__slider" draggable="false" role="slider"
                                                    tabindex="0"></div>
                                            </span><span class="input-range__slider-container"
                                                style="position: absolute; left: 100%;"><span
                                                    class="input-range__label input-range__label--value"><span
                                                        class="input-range__label-container">100</span></span>
                                                <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="100"
                                                    class="input-range__slider" draggable="false" role="slider"
                                                    tabindex="0"></div>
                                            </span>
                                        </div><span class="input-range__label input-range__label--max"><span
                                                class="input-range__label-container">100</span></span>
                                    </div>
                                </div> -->
                            </div>
                            <div class="price_input">
                                <div class="input"><small>최저 요금</small><span><input type="text" pattern="[0-9]*"
                                            value="0"
                                            style="width: 85px; font-size: 14px; text-align: right; height: 32px; vertical-align: middle; padding-bottom: 5px;" naame="minPrice" id="minPrice">만원</span>
                                </div><span class="divider" style="border: none; padding: 25px 5px 5px;">-</span>
                                <div class="input"><small>최고 요금</small><span><input type="text" pattern="[0-9]*"
                                            value="100"
                                            style="width: 85px; font-size: 14px; text-align: right; height: 32px; vertical-align: middle; padding-bottom: 5px;" name="maxPrice" id="maxPrice">만원~</span>
                                </div>
                            </div>
                            <div class="btn-wrapper"><button type="submit" class="btn-number-search">적용하기</button></div>
                        </div>
                        <div id="selectType" class="layer_select type "><button type="button"
                                class="btn_close">닫기</button>
                            <div class="tit">스테이 유형</div>
                            <div class="btn-wrapper"><button type="submit" class="btn-number-search">적용하기</button></div>
                            <ul class="check_list" id="stayTypeList">
                                <li class="ko"><label class="check_skin" for="all"><input type="checkbox" 
                                			id="all" name="stayType" value=""><span>전체</span></label></li>
                                <li class="ko"><label class="check_skin" for="pension"><input type="checkbox"
                                            id="pension" name="stayType" value="펜션"><span>펜션</span></label></li>
                                <li class="ko"><label class="check_skin" for="hanok"><input type="checkbox"
                                            id="hanok" name="stayType" value="한옥"><span>한옥</span></label></li>
                                <li class="ko"><label class="check_skin" for="hostel"><input type="checkbox"
                                            id="hostel" name="stayType" value="호스텔"><span>호스텔</span></label></li>
                                <li class="ko"><label class="check_skin" for="bnb"><input type="checkbox"
                                            id="bnb" name="stayType" value="민박"><span>민박</span></label></li>
                                <li class="ko"><label class="check_skin" for="hotel"><input type="checkbox"
                                            id="hotel" name="stayType" value="호텔"><span>호텔</span></label></li>
                            </ul>
                        </div>
                        <div id="selectTheme" class="layer_select theme ">
                        <button type="button" class="btn_close">닫기</button>
                            <div class="tit">편의시설</div>
                            <div class="btn-wrapper"><button type="submit" class="btn-number-search">적용하기</button></div>
                            <ul class="findstay_check_list" id="roomOptionList">
                                 <li class="ko"><label class="check_skin" for="all_theme"><input type="checkbox"
                                            id="all_theme" name="roomOption" value=""><span>전체</span></label></li>
                                <li class="ko"><label class="check_skin" for="bbq_theme"><input type="checkbox"
                                            name="roomOption" id="bbq_theme" value="babiqu"><span>바베큐</span></label></li>
                                <li class="ko"><label class="check_skin" for="pets_theme"><input type="checkbox"
                                            name="roomOption" id="pets_theme" value="pet"><span>반려동물</span></label></li>
                                <li class="ko"><label class="check_skin" for="display_theme"><input type="checkbox"
                                            name="roomOption" id="display_theme" value="beamprojector"><span>빔프로젝터, TV</span></label>
                                </li>
                                <li class="ko"><label class="check_skin" for="pool_theme"><input type="checkbox"
                                            name="roomOption" id="pool_theme" value="pool"><span>풀장</span></label></li>
                                <li class="ko"><label class="check_skin" for="kitchenette_theme"><input type="checkbox"
                                            name="roomOption" id="kitchenette_theme" value="terrace"><span>테라스</span></label></li>
                            </ul>
                           <!--  <fieldset>
                            	<legend>편의시설</legend>
                            	<input type="checkbox" name="roomOption" id="roomOption" value="babiqu">바베큐<br>
                            	<input type="checkbox" name="roomOption" id="roomOption" value="pet">반려동물<br>
                            	<input type="checkbox" name="roomOption" id="roomOption" value="beamprojector">빔프로젝터, TV<br>
                            	<input type="checkbox" name="roomOption" id="roomOption" value="pool">풀장<br>
                            	<input type="checkbox" name="roomOption" id="roomOption" value="terrace">테라스<br>
                            </fieldset> -->
                        </div>
                    </div>
                    <div class="sel_map">
                        <!-- <div class="map_img_off" role="presentation"></div> -->
                    </div><button type="reset" class="btn_reset">초기화</button>
                    <div class="search_btn_wrapper"><button type="submit" class="btn_search">SEARCH</button>
                    </div>
        </form>



        <!-- 목록 리스트 버튼 -->
        <div class="_findstay_findstay_list__1KB6H">
            <div class="_findstay_sort_wrap__JLD12">
                <ul class="_findstay_sort_selb__JhhC5">
                    <li><button type="button" class="_findstay_btn_sort__h6PXi btn_toggle" style="background-size: 15px 15px;">모든 스테이</button>
                        <div class="_tooltips_balloon_desc_black__Xv4MX " id='rightnow'>
                            <div class="_tooltips_alert_cont__K8tDm ">지금 특별 프로모션이 진행 중인 스테이를 만나보세요.</div>
                        </div>
                    </li>
                    <li class="_findstay_mo_only__ojbXn"><button type="button"
                            class="_findstay_btn_sort__h6PXi btn_toggle">추천순</button></li>
                </ul>
                <div class="_selector_layer_toggle__U_ckA _selector_layer_sort__dTSl4 " role="button" tabindex="0">
                    <div class="_selector_layer_cover___d3pB">
                        <ul class="_selector_filter_list__UUNfp">
                            <li class="_selector_selected__ciPbE">모든 스테이</li>
                            <li class="">프로모션</li>
                            <li class="">오직 여기에서만</li>
                        </ul>
                    </div>
                </div>
                <div class="_selector_layer_toggle__U_ckA _selector_layer_sort__dTSl4" role="button" tabindex="0">
                    <div class="_selector_layer_cover___d3pB">
                        <ul class="_selector_filter_list__UUNfp">
                            <li class="">최신순</li>
                            <li class="">인기순</li>
                            <li class="">높은 가격순</li>
                            <li class="">낮은 가격순</li>
                        </ul>
                    </div>
                </div>
                <ul class="_selector_pc_only__XruVD _selector_sort_list__ypbY1" id="listpick">
                    <li class="_selector_selected__ciPbE">• 최신순</li>
                    <li class="">• 인기순</li>
                    <li class="">• 높은 가격순</li>
                    <li class="">• 낮은 가격순</li>
                </ul>
            </div>
        </div>
    </div>
    </div>
    </div>

	<div class="container findstay_list  ">
		<div class="flist_wrap">
			<c:forEach items="${list}" var="list" step="1">
				<div class="flist_box">
					<a href="/stay/room?stayName=${list.stayName}">
						<div class="info_container_wrapper">
							<div class="name info_container" role="presentation">${list.stayName }<span>${list.stayType }</span></div>
							<div class="clearfix"></div>
							<div class="flist_info" role="presentation">
								<p class="address info_container" role="presentation"><span>${list.stayLoc }</span><br>
									 기준 ${list.stdPerson }명&nbsp;(최대 ${list.overPerson }명)<br>₩${list.minPrice } ~ ₩${list.maxPrice }</p>
								<p class="btn_more " role="presentation" tabindex="-1" style="cursor: pointer;">예약하기</p>
							</div>
						</div>
						<div class="flist_img" role="presentation"
							style="padding-top: 0px;">
							<ul class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events slider1 flist_slider">
								<div class="swiper-button-prev "></div>
								<div class="swiper-button-next"></div>
								<div class="swiper-wrapper">
									<li class="swiper-slide img swiper-slide-active"
										style="background: url(&quot;${list.mainPic1}&quot;) center center / cover no-repeat; cursor: pointer; width: 410px;">
									</li>
									<li class="swiper-slide img swiper-slide-next"
										style="background: url(&quot;${list.mainPic2}&quot;) center center / cover no-repeat; cursor: pointer; width: 410px;">
									</li>
								</div>
								<div class="_badge_badge_wrapper__h9IsV">
									<div class="_badge_exclusive__prNZN">
										<span class="_badge_txt__fonwF">${list.badge }</span>
									</div>
								</div>
							</ul>
						</div>
					</a>
					<button type="button" class="btn_like "><span>관심스테이</span></button>
				</div>
			</c:forEach>

			<!--         <div class="flist_box">
                    <div class="info_container_wrapper">
                        <div class="name info_container" role="presentation">단심스테이<span>민박</span></div>
                        <div class="clearfix"></div>
                        <div class="flist_info" role="presentation">
                            <p class="address info_container" role="presentation"><span>제주/서귀포시</span><br>
                            기준 4명&nbsp;(최대 6명)<br>₩450,000 ~ ₩550,000</p>
                            <p class="btn_more " role="presentation" tabindex="-1" style="cursor: pointer;">예약하기</p>
                        </div>
                    </div>
                    <div class="flist_img" role="presentation" style="padding-top: 0px;">
                        <ul class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events slider1 flist_slider">
                            <div class="swiper-button-prev "></div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-wrapper"> 
                                <li class="swiper-slide img swiper-slide-active"
                                    style="background: url(&quot;https://images.stayfolio.com/system/pictures/images/000/162/051/small/0c6d4f002d9ec019336717a93860bda6db5ddb8d.jpg?1674109162&quot;) center center / cover no-repeat; cursor: pointer; width: 389px;">
                                </li>
                                <li class="swiper-slide img swiper-slide-next"
                                    style="background: url(&quot;https://images.stayfolio.com/system/pictures/images/000/162/035/small/76c44f42cc10d2307b01076923a1a9af4252b1c8.jpg?1674109162&quot;) center center / cover no-repeat; cursor: pointer; width: 389px;">
                                </li>
                            </div>
                            <div class="_badge_badge_wrapper__h9IsV">
                                <div class="_badge_exclusive__prNZN"><span
                                        class="_badge_txt__fonwF">EXCLUSIVE</span>
                                </div>
                            </div>
                        </ul>
                    </div>
                <button type="button" class="btn_like "><span>관심스테이</span></button>
            </a>
        </div> -->



			<!-- 페이지 -->
			<div class="paging false">
				<a href="/" class="prev" title="이전 페이지">이전 페이지</a><a href="/"
					class="on">1</a><a href="/" class="">2</a><a href="/" class="">3</a><a
					href="/" class="">4</a><a href="/" class="">5</a>...<a href="/">20</a><a
					href="/" class="next" title="다음 페이지">다음 페이지</a>
			</div>
		</div>
		<!-- </div> -->
		<%@include file="../common/footer.jsp"%>
</body>

</html>