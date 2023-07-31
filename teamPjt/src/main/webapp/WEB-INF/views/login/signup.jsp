<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../common/header.jsp" />
<html>
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
  margin-left : 7px;
}

.info#info__birth select:first-child {
  margin-left : 0;
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
   
</style>
<script>
	window.addEventListener('load', function(){
		btnSignup.addEventListener('click', function(e){
        	// 기본 이벤트 초기화
        	e.preventDefault();
        	
        	let id = signUpId.value;
        	let pw = signUpPw.value;
        	let name = signUpName.value;
        	
        	if(!id){
        		signupMsg.innerHTML = '아이디를 입력해주세요';
        		return;
        	}
        	if(!pw){
        		signupMsg.innerHTML = '비밀번호를 입력해주세요';
        		return;
        	}
        	if(!name){
        		signupMsg.innerHTML = '이름을 입력해주세요';
        		return;
        	}
        	
        	// 아이디 중복체크 확인 - 중복확인 버튼 만들기
        	if(idCheckRes.value != 1){
        		signupMsg.innerHTML = "아이디 중복체크를 해주세요.";
        		sighUpId.focus();
        		return;
        	}
        	
        	// 비밀번호 일치 확인
        	if(pwCheckRes.value !=1){
        		signupMsg.innerHTML = "비밀번호가 일치하는지 확인해주세요.";
        		pwCheckRes.focus();
        		return;	
        	}
        	
        	
        	obj = {
        			memberId : id
        			, pw : pw
        			, memberName : name
        	}
        	
        	console.log('회원가입 obj : ', obj);
        	
        	// 회원가입 요청
        	fetchPost('/signup'
        				, obj
        				, (map)=>{
				        		if(map.result =='success'){
				        			location.href ='/login/login?msg='+map.msg;
				        		}else{
				        			signupMsg.innerHTML = map.msg;
				        		}
					        	});
        })
	
	})// window.addEventListner 함수 끝
	
</script>    
<body>
<div id="contents">
	<div class="container sub_title">
		<div class="tit">JOIN</div>
		<div class="txt">회원가입</div>
	</div>
	<div class="container">
	<div class="login_wrap">
<form name='signupForm' style='display:none'>
		<div class="form_wrap">
			<div class="input_box">
				<div class="tit">아이디</div>
				<div class="input">
					<input type="text" name="id" id="signUpId" placeholder="아이디를 입력하세요." value="" style="margin-left: 12px;">
				</div>
				<input type="button">
			</div>
			<div class="input_box">
				<div class="tit">이름</div>
				<div class="input">
					<input type="text" name="name" id="signUpName" placeholder="이용자 본인의 이름을 입력하세요."
						value="" style="margin-left: 12px;">
				</div>
			</div>
			<div class="input_box">
				<div class="tit">비밀번호</div>
				<div class="input">
					<input type="password" id="signUpPw" name="password" placeholder="비밀번호를 입력하세요."
						style="margin-left: 12px;">
				</div>
				<ul class="checked" style="margin-left: 12px;">
					<li class="off" style="font-size: inherit;">영문</li>
					<li class="off" style="font-size: inherit;">숫자</li>
					<li class="off" style="font-size: inherit;">특수문자</li>
					<li class="off" style="font-size: inherit;">8자 이상 20자 이하</li>
				</ul>
				<br><br>
					<div class="tit">비밀번호 확인</div>
				<div class="input">
					<input type="password" id="pwCheck" placeholder="비밀번호를 한 번 더 입력하세요."
						style="margin-left: 12px;">
				</div>
			</div>
			<!-- 생년월일-->
			<div class="tit">생년월일</div><br>
			<div class="info" id="info__birth">
				<select class="box" id="birth-year">
					<option disabled selected>출생 연도</option>
				</select> 
				<select class="box" id="birth-month">
					<option disabled selected>월</option>
				</select> 
				<select class="box" id="birth-day">
					<option disabled selected>일</option>
				</select>
			</div>
			<br><br>
			<!-- 성별 체크 -->
			<div class="tit">성별</div>
			<br>
			<div id="genderForm">
				<input type="radio" name="gender" value="male">남 	
				<input type="radio" name="gender" value="female">여
			</div>
			<br>
			<br>
			<br>
			
		<div class="tit">이메일</div>
		<div class="input">
		  <input class="box" name="email" id="email-txt" type="text" placeholder="이메일 아이디를 입력하세요."  />
		  @
		  <input class="box" name="emailDomain" id="domain-txt" type="text" />
		  <select class="box" id="domain-list" onchange="updateEmailDomain()">
		    <option value="type">직접 입력</option>
		    <option value="naver.com">naver.com</option>
		    <option value="google.com">google.com</option>
		    <option value="hanmail.net">hanmail.net</option>
		    <option value="nate.com">nate.com</option>
		  </select>
		</div>
			<br>		
			<br>
			<div class="tit">호스트 여부 
			<br>
			<div>
			  <label for="hostCheckbox"> 호스트이신가요?
			   <br><input type="checkbox" id="hostCheckbox" name="host" value="true">
			  </label></div>
			</div>
		</div>
</form>
		<!--사용자 약관-->
		<div class="agree_box signup-agree">
			<ul class="board_fold" id="listFold">
				<li class="agree_all">
				<label class="check_skin" for="check_all">
					<input type="checkbox" id="check_all" value="all">
					<span>사용자 약관 전체 동의</span>
				</label>
				</li>
				<li>
				<label class="check_skin" for="check_service">
				<input type="checkbox" id="check_service" value="serviceAgree">
				<span>서비스 이용 약관 동의 (필수)</span></label>
					<div class="agree_arrw_down" role="presentation"></div>
					<div class="view" style="display: none;">
						<br> 개인정보 수집 및 이용 동의<br> 1. 수집항목: [필수] 이름, 연락처, 이메일주소,
						인원정보<br> 2. 수집 및 이용목적: 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리
						등 민원 처리, 분쟁조정 해결을 위한 기록보존<br>
					</div></li>
				<li><label class="check_skin" for="check_privacy">
				<input type="checkbox" id="check_privacy" value="privacyAgree">
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
				<li><label class="check_skin" for="check_lifetime">
				<input type="checkbox" id="check_lifetime" value="lifeTimeAgree">
				<span>평생회원제동의 (선택)</span></label>
					<div class="agree_arrw_down" role="presentation"></div>
					<div class="view" style="display: none;">
						평생회원제에 동의할 경우 1년 이상 서비스를 이용하지 않아도<br> 휴면 처리되지 않습니다.
					</div></li>
				<li><label class="check_skin" for="check_marketing">
				<input type="checkbox" id="check_marketing" value="marketingAgree">
				<span>쿠폰,이벤트 등 혜택 알림 동의 (선택)</span></label>
					<div class="agree_arrw_down" role="presentation"></div>
					<div class="view" style="display: none;">
						스테이폴리오에서 제공하는 이벤트 및 혜택 등 다양한 정보를 문자메시지, 이메일 등으로 볼 수 있습니다.<br>
						마케팅 정보 수신 및 활용 동의 여부와 관계없이 회원가입 및 서비스를 이용하실 수 있습니다.<br>
					</div>
				</li>
			</ul>
		</div>
		<div class="login_btns">
			<button type="submit" class="btn_bk" id="btnSignup" >회원가입</button>
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