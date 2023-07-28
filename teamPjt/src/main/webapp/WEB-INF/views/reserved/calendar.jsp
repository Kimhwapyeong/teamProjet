<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>달력 만들기</title>

  <link rel="stylesheet" href="/resources/css/reserved/calendar.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  <script src="/resources/js/reserved/calendar.js"></script>

</head>

<body>
  <div class="calendar-wrap">
    <div class="calendar-middle-wrap">
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

    <div class="calendar-middle-wrap">
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

    <div class="checkInOutInfo">
      <div>
        <p>
          <span>체크인</span>
          <label id="check_in_day"></label>
        </p>
        <p class="space">~</p>
        <p>
          <span>체크아웃</span>
          <label id="check_out_day"></label>
        </p>
      </div>
    </div>
    <form action="/reserved/day" method="get" onsubmit="return false;">
    <div class="checkInOutInfo" style="position:absolute; bottom:30%; left:50%;">
       <div>
        <p>
          <span>총 예약일</span>
        </p>
        <p>  
          <label id="check_out_day" class="check_day_count"></label>          
          <input type="hidden" id="reserved_day" name="reserved_day" value="">
          <input type="hidden" id="reserved_checkIn" name="reserved_checkIn" value="">
          <input type="hidden" id="reserved_checkOut" name="reserved_checkOut" value="">
        </p>
      </div>
    </div>
    	<button type="submit" onclick="check(form)">예약하기</button>
    	<button id="reload">초기화</button><br>
    	<button id="back">메인으로</button><br>
    	<button type="button" class="btn_close" id="closeBtn2">닫기</button>
    </form>
    <script>
    
    	window.addEventListener('load', function(){
    		
    		// 예약 페이지에선 닫기 버튼 안보여주기
    		if($('.modalOverlay2').attr('style') == null){
    			
    			$('#closeBtn2').attr('style', 'display:none;');
    			
    		}
    		
    		
    		
    		reload.addEventListener('click', function(e){
    			
    			e.preventDefault();
    			
    			window.location.reload();
    			
    		});
    		
    		back.addEventListener('click', function(e){
    			
    			e.preventDefault();
    			
    			location.href='/main';
    			
    		});
    		
    	});
    	
    	// 날짜 유효성 검사
    	function check(form){
    		
    		if(checkInDate==""){
    			
    				
    			alert('체크인 날짜를 선택해 주세요');
    			
    			return false;
    		}
    		
    		if(checkOutDate==""){
    			
    				
    			alert('체크아웃 날짜를 선택해 주세요');
    			
    			return false;
    		}
    		
    		form.submit();
    		
    			
    		
    	}
    	
    </script>
    
  </div>
</body>

</html>