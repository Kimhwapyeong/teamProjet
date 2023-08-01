<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<jsp:include page="../common/header.jsp" />
<html>
	<!-- jQuery 라이브러리 추가 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- ?v=<new java.util.Date().getTime()>을 붙이면 수정사항이 바로바로 새로고침 됨-->
<script src="/resources/js/member/signupCheck.js"></script>
<head>
<meta charset="UTF-8">
<title>SIGN UP</title>
</head>
<style>
/* SECTION - BIRTH */
.info#info__birth {
	display: flex;
}

.info#info__birth select {
	margin-left: 7px;
}

.info#info__birth select:first-child {
	margin-left: 0;
}

.info#info__birth select::-webkit-scrollbar {
	width: 10px;
}

.info#info__birth select::-webkit-scrollbar-thumb {
	background-color: #b6b6b6;
	border-radius: 3px;
}

.info#info__birth select::-webkit-scrollbar-track {
	background-color: #ebe9e9;
	border-radius: 6px;
}

select.box {
	width: 80%;
	height: 50px;
	box-sizing: border-box;
	margin-left: 3px;
	padding: 2px 0 5px 6px;
	border-radius: 4px;
	border: 1px solid #d9d6d6;
	color: #383838;
	background-color: #ffffff;
	font-family: 'Montserrat', 'Pretendard', sans-serif;
}

option {
	font-size: 16px;
}

.info .box#domain-list option {
	font-size: 14px;
	background-color: #ffffff;
}
/* 라디오 버튼 컨테이너 스타일 설정 */
#genderForm {
	display: flex;
	align-items: center;
}

/* 라디오 버튼 스타일 설정 */
#genderForm input[type="radio"] {
	display: inline-block;
	width: 20px;
	height: 20px;
	margin-right: 10px;
	border: 1px solid #ccc;
	border-radius: 50%;
	cursor: pointer;
}

/* 라디오 버튼 선택 시 스타일 설정 */
#genderForm input[type="radio"]:checked {
	background-color: #007bff;
}
/* 체크박스 스타일 */
#hostCheckbox {
	/* 체크박스 크기 설정 */
	width: 20px;
	height: 20px;
	/* 체크박스 배경색과 테두리 설정 */
	background-color: #fff;
	border: 1px solid #999;
	/* 체크박스 체크 표시 모양 설정 */
	border-radius: 4px;
}

/* 체크박스 체크 표시 스타일 */
#hostCheckbox:checked {
	background-color: #999;
}

/* 라벨 스타일 (체크박스와 텍스트 정렬) */
label {
	display: flex;
	align-items: center;
}

select.box {
	width: 100%;
	height: 50px;
	box-sizing: border-box;
	margin-left: 5px;
	padding: 5px 0 5px 10px;
	border-radius: 4px;
	border: 1px solid #d9d6d6;
	color: #383838;
	background-color: #ffffff;
	font-family: 'Montserrat', 'Pretendard', sans-serif;
}

option {
	font-size: 16px;
}

.info .box#domain-list option {
	font-size: 14px;
	background-color: #ffffff;
}
/* 중복확인버튼*/
#btnid{
	border: 1px solid pink;
	margin: 0px;
	padding: 0px;
	display: flex;
	background-color: pink;
	font-size: 12px;
}
/* 이메일박스 */
.box{
	border-radius: 4px;
	border: 1px solid #d9d6d6;
}
table tr td {
	text-align: left;
}

table tr td input[name=tel] {
	width: 40px;
}

table tr td input[name=addr] {
	width: calc(100% - 14px);
	/* {속성값 !important } 우선순위 지정 */
}

.ui-datepicker select {
	vertical-align: middle;
	height: 28px;
}
	
.valid, .invalid { 
	font-size: 11px;
	font-weight: bold; 
}

.valid { color: blue; }

.invalid { color: red; }	
}
a:hover { cursor:pointer; }

a.btn-fill-s { 
	background-color: #bacdfa;
}
a.btn-empty-s { 
	background-color: #fff;
}
table td a:hover { font-weight: bold; }

.btnSet { margin-top: 20px;	}

a.btn-fill, a.btn-empty {
	text-align: center;
	padding: 3px 10px;
	border:1px solid #3367d6;
	border-radius: 1px;
	box-shadow: 2px 2px 2px #022d72;
	/* 오른쪽, 아래쪽, 번진 정도 */
}

a.btn-fill { 
	background-color: #3367d6;
	color: #fff;
}

a.btn-empty { 
	background-color: #fff;
	color: #3367d6
}

a.btn-fill-s, a.btn-empty-s {
	text-align: center;
	padding: 1px 10px;
	border:1px solid #c4dafc
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	font-size: 13px;
}
a:link, a:visited {
	text-decoration: none;
	color: #000;
}

#content {
	padding: 20px 0;
	min-width: 1024px;	/* 창의 최소 크기 지정 */
}

</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
//아이디 중복 검사
$(document).ready(function() {
	$('#btnid').on('click', function() {
		idCheck();
	});

//유효성 검사
$('.chk').on('keyup', function(){
	if($(this).attr('name') == 'id') {
		if(event.keyCode == 13) { idCheck(); }
		else {
			$(this).removeClass('chked');
			validate( $(this) );
		}
	} else {
		validate($(this));
	}
});	
	
})

//올바른 아이디 입력 형태인지 파악하여 유효하지 않다면 중복확인 불필요
function idCheck() {
	var $id = $('[name=id]');
	if($id.hasClass('chked')) return;
	console.log('go check');
	
	var data = signup.tag_status($id);
	if(data.code != 'valid') {
		alert('아이디 중복 확인 불필요\n' + data);
		$id.focus();
		return;
	}

	   $.ajax({
	        type: 'post',
	        url: '/idCheck',
	        contentType: 'application/json', // 데이터 전송 형식을 JSON으로 설정
	        data: JSON.stringify({memberId: $id.val()}), // 아이디 정보를 JSON 형식으로 변환하여 전송
	        success: function(data) {
	            data = signup.id_usable(data);
	            console.log('data1', data);
	            console.log(data);
	            // 중복 확인 결과에 따라 아이디 입력란 옆에 메시지를 표시
	            $('.valid').eq(0).html(data.msg);
	            display_status($id.siblings('div'), data.msg);
	            $id.addClass('chked');
	        },
	        error: function(req, text) {
	            alert(text + ': ' + req.status);
	        }
	    });
}
// 입력 요소를 검증하고 검증 결과에 따라 상태를 업데이트
function validate(t) {
	var data = signup.tag_status(t);
	display_status(t.siblings('div'), data);
}

// 요소의 내용과 클래스를 업데이트
function display_status(div, data) {
	div.text(data.desc);
	// 이전에 적용된 클래스들 모두 제거
	div.removeClass();
	div.addClass(data.code)
}

function go_join() {
	if( $('[name=name]').val() == '') {
		alert('이름을 입력하세요!');
		$('[name=name]').focus();
		return;
	}

	//필수 항목의 유효성을 판단하도록 한다.
	//중복확인 한 경우
	if($('[name=id]').hasClass('chked') ) {
		//이미 사용중인 경우는 회원가입 불가
		if($('[name=id]').siblings('div').hasClass('invalid')) {
			alert('회원가입 불가\n' + signup.id.unusable.desc);
			$('[name=id]').focus();
			return;
		}
	} else {
		//중복 확인 하지 않은 경우
		if( !item_check($('[name=id]')) ) return;
		else {
			alert('회원가입 불가\n' + signup.id.valid.desc);
			$('[name=id]').focus();
			return;
		}
	}
	
	if(!item_check($('[name=pw]'))) return;
	if(!item_check($('[name=pw_ck]'))) return;
	if(!item_check($('[name=email]'))) return;
	
	$('form').submit();
}

function item_check(item) {
	var data = signup.tag_status(item);
	if(data.code == 'invalid') {
		alert('회원가입 불가! \n' + data.desc);
		item.focus();
		return false;
	} else return true;
}
</script>
<body>
	<div id="contents">
		<div class="container sub_title">
			<div class="tit">JOIN</div>
			<div class="txt">회원가입</div>
		</div>
	<form name='signupForm'>
		<div class="container">
			<div class="login_wrap">
					<div class="form_wrap">
<p class="w-pct60 right" style="margin: 0 auto; padding-bottom: 5px; font-size: 11px; align-text: left;">*는 필수 입력 항목입니다.</p>
						<div class="input_box">
							<table>
							  <tr>
							    <th class="tit">아이디 *</th>
							    <td>
							    <div style="display: flex">
							      <input type="text" name="id" id="signUpId" class="chk" placeholder="아이디를 입력하세요." value="">
							      <a id="btnid" class='btn-fill-s'>중복확인</a><br>
							    </div>  
							      <div class='valid'>아이디를 입력하세요(영문 소문자, 숫자만 입력 가능)</div>
							    </td>
							  </tr>
							  <tr>
							    <th class="tit">이름 *</th>
							    <td>
							      <input type="text" name="name" id="signUpName" placeholder="이용자 본인의 이름을 입력하세요." value="">
							    </td>
							  </tr>
							  <tr>
							    <th class="tit">비밀번호 *</th>
							    <td>
							      <input type="password" id="signUpPw" name="pw" placeholder="비밀번호를 입력하세요.">
							     <div class="valid">영문 대/소문자, 숫자를 모두 포함, 8자 이상 20자 미만</div>
							      
							    </td>
							  </tr>
							  <tr>
							      <th class="tit">비밀번호 확인 *</th>
							      	<td>
							        	<input type="password" id="pwCheck" name="pw_ck" class="chk" placeholder="비밀번호를 한 번 더 입력하세요.">
							        	<div class="valid">비밀번호를 한 번 더 입력하세요.</div>
							    	</td>
							   </tr> 	
							  <!-- 생년월일 -->
							  <tr>
							    <th class="tit">생년월일</th>
							    <td>
							      <div class="info" id="info__birth">
							        <select class="box" id="birth-year">
							          <option disabled selected >출생연도</option>
							        </select>
							        <select class="box" id="birth-month">
							          <option disabled selected>월</option>
							        </select>
							        <select class="box" id="birth-day">
							          <option disabled selected>일</option>
							        </select>
							      </div>
							    </td>
							  </tr>
							  <!-- 성별 체크 -->
							  <tr>
							    <th class="tit">성별</th>
							    <td id="genderForm">
							      <label><input type="radio" name="gender" value="male">남</label>
							      <label><input type="radio" name="gender" value="female" checked>여</label>
							    </td>
							  </tr>
							  <tr>
							    <th class="tit">이메일 *</th>
							    <td>
							    <div style="display: flex">
							      <input class="box" name="email" id="email-txt" type="text" placeholder="이메일 아이디를 입력하세요." /> @ <input class="box"
							        name="emailDomain" id="domain-txt" type="text" />
							      <select class="box" id="domain-list" onchange="updateEmailDomain()">
							        <option value="type">직접 입력</option>
							        <option value="naver.com">naver.com</option>
							        <option value="google.com">google.com</option>
							        <option value="hanmail.net">hanmail.net</option>
							        <option value="nate.com">nate.com</option>
							      </select>
							      </div>
							        <div class="valid">이메일을 입력하세요</div>
							    </td>
							  </tr>
							  <tr>
							    <th class="tit">호스트이신가요?*</th>
							    <td id="genderForm">
							    	<div>
							      	<input type="radio" name="hostyn" value="n" checked>아니요,일반이용자입니다.
							     
							      	<input type="radio" name="hostyn" value="y"> 네,숙소 호스트입니다.
							      	</div>
							    </td>
							  </tr>
							</table>
						</div>
					</div>
				<!--사용자 약관-->
				<div class="agree_box signup-agree">
					<ul class="board_fold" id="listFold">
						<li class="agree_all"><label class="check_skin"
							for="check_all"> <input type="checkbox" id="check_all"
								value="all"> <span>사용자 약관 전체 동의</span>
						</label></li>
						<li><label class="check_skin" for="check_service"> <input
								type="checkbox" id="check_service" value="serviceAgree">
								<span>서비스 이용 약관 동의 (필수)</span></label>
							<div class="agree_arrw_down" role="presentation"></div>
							<div class="view" style="display: none;">
								<br> 개인정보 수집 및 이용 동의<br> 1. 수집항목: [필수] 이름, 연락처, 이메일주소,
								인원정보<br> 2. 수집 및 이용목적: 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리
								등 민원 처리, 분쟁조정 해결을 위한 기록보존<br>
							</div></li>
						<li><label class="check_skin" for="check_privacy"> <input
								type="checkbox" id="check_privacy" value="privacyAgree">
								<span>개인정보처리방침 동의 (필수)</span></label>
							<div class="agree_arrw_down" role="presentation"></div>
							<div class="view" style="display: none;">
								제 1조 (총칙)<br>1. 개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명,
								주민등록번호 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보 (당해 정보만으로는 특정 개인을 식별할 수
								없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함합니다.) 를 말합니다.<br>2.
								스테이폴리오는 귀하의 개인정보 보호를 매우 중요시하며, ‘정보통신망 이용촉진 및 정보보호에 관한 법률’ 상의
								개인정보 보호규정 및 정보통신부가 제정한 ‘개인정보 보호지침’을 준수하고 있습니다.<br>3.
								스테이폴리오는 개인정보처리방침을 정하고 이를 귀하께서 언제나 쉽게 확인할 수 있게 공개하도록 하고 있습니다.<br>
							</div></li>
						<li><label class="check_skin" for="check_above"><input
								type="checkbox" id="check_above" value="aboveAgree"><span>만
									14세 이상 확인 (필수)</span></label>
							<div class="agree_arrw_down" role="presentation"></div>
							<div class="view" style="display: none;">
								정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 만 14세 미만 아동의 개인정보 수집 시 법정대리인의 동의를
								받도록 규정하고 있습니다.<br> 만 14세 미만 아동이 법정대리인 동의 없이 회원가입을 할 경우 회원탈퇴
								또는 서비스 이용에 제한이 있을 수 있습니다.
							</div></li>
						<li><label class="check_skin" for="check_lifetime"> <input
								type="checkbox" id="check_lifetime" value="lifeTimeAgree">
								<span>평생회원제동의 (선택)</span></label>
							<div class="agree_arrw_down" role="presentation"></div>
							<div class="view" style="display: none;">
								평생회원제에 동의할 경우 1년 이상 서비스를 이용하지 않아도<br> 휴면 처리되지 않습니다.
							</div></li>
						<li><label class="check_skin" for="check_marketing">
								<input type="checkbox" id="check_marketing"
								value="marketingAgree"> <span>쿠폰,이벤트 등 혜택 알림 동의
									(선택)</span>
						</label>
							<div class="agree_arrw_down" role="presentation"></div>
							<div class="view" style="display: none;">
								스테이폴리오에서 제공하는 이벤트 및 혜택 등 다양한 정보를 문자메시지, 이메일 등으로 볼 수 있습니다.<br>
								마케팅 정보 수신 및 활용 동의 여부와 관계없이 회원가입 및 서비스를 이용하실 수 있습니다.<br>
							</div></li>
					</ul>
				</div>
				<div class="login_btns">
					<button type="submit" class="btn_bk" id="btnSignup" onclick="go_join()">회원가입</button>
				</div>
				<div id='signupMsg'></div>
				<div class="sns_login">
					<div class="tit">SNS 계정으로 로그인하기</div>
					<ul>
						<li><a class="btn_naver" href="/">네이버</a>
							<div id="naverIdLogin" style="display: none;">
								<a id="naverIdLogin_loginButton" href="#"><img
									src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.1"
									height="50"></a>
							</div></li>
						<li><a class="btn_kakao" href="/">카카오</a></li>
					</ul>
				</div>
			</div>
		</div>
	</form>
	</div>
	
<script>	
  // '출생 연도' 셀렉트 박스 option 목록 동적 생성
  const birthYearEl = document.querySelector('#birth-year')
	  // option 목록 생성 여부 확인
	  isYearOptionExisted = false;
	  birthYearEl.addEventListener('focus', function () {
	  // year 목록 생성되지 않았을 때 (최초 클릭 시)
	  if(!isYearOptionExisted) {
	      isYearOptionExisted = true
	      for(var i = 1940; i <= 2022; i++) {
	      // option element 생성
	      const YearOption = document.createElement('option')
	      YearOption.setAttribute('value', i)
	      YearOption.innerText = i
	      // birthYearEl의 자식 요소로 추가
	      this.appendChild(YearOption);
	      }
	  }
  });

 const birthMonthEl = document.querySelector('#birth-month')
     // option 목록 생성 여부 확인
     isMonthOptionExisted = false;
     birthMonthEl.addEventListener('focus', function () {
     // Month 목록 생성되지 않았을 때 (최초 클릭 시)
     if(!isMonthOptionExisted) {
         isMonthOptionExisted = true
         for(var i = 1; i <= 12; i++) {
         // option element 생성
         const MonthOption = document.createElement('option')
         MonthOption.setAttribute('value', i)
         MonthOption.innerText = i
         // birthMonthEl의 자식 요소로 추가
         this.appendChild(MonthOption);
         }
     }
     });

 // 
 const birthDayEl = document.querySelector('#birth-day')
     // option 목록 생성 여부 확인
     isDayOptionExisted = false;
     birthDayEl.addEventListener('focus', function () {
     // day 목록 생성되지 않았을 때 (최초 클릭 시)
     if(!isDayOptionExisted) {
         isDayOptionExisted = true
         for(var i = 1; i <= 31; i++) {
         // option element 생성
         const DayOption = document.createElement('option')
         DayOption.setAttribute('value', i)
         DayOption.innerText = i
         // birthDayEl의 자식 요소로 추가
         this.appendChild(DayOption);
         }
     }
     });       
     function updateEmailDomain() {
         var domainList = document.getElementById("domain-list");
         var selectedDomain = domainList.value;
         var domainTxt = document.getElementById("domain-txt");
     
         if (selectedDomain === "type") {
           domainTxt.value = "";
           domainTxt.removeAttribute("disabled");
         } else {
           domainTxt.value = selectedDomain;
           domainTxt.setAttribute("disabled", "disabled");
         }
       }

        
</script>
</body>
<jsp:include page="../common/footer.jsp" />
</html>