<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
 <script>
//get방식 요청 함수(url과 callback함수만 넣어주면 호출 가능)
 function fetchGet(url, callback){
 	try{
 		// url 요청
 		fetch(url)
 			// 요청결과 json문자열을 javascript 객체로 반환
 			.then(response => response.json())
 			// 콜백함수 실행
 			.then(map => callback(map));			
 	}catch(e){
 		console.log('fetchGet',e);
 	}
 }

 //post방식 요청
 function fetchPost(url, obj, callback){
 	try{
 		// url 요청
 		fetch(url
 				, {
 					method : 'post'
 					, headers : {'Content-Type' : 'application/json'}
 					, body : JSON.stringify(obj)
 				})
 			// 요청결과 json문자열을 javascript 객체로 반환
 			.then(response => response.json())
 			// 콜백함수 실행
 			.then(map => callback(map));			
 	}catch(e){
 		console.log('fetchPost', e);
 	}
 	
 }
 
 window.addEventListener('load',function(){
     // 로그인
     btnSignin.addEventListener('click', function(e){
			// 기본이벤트 제거
			e.preventDefault();
			
			
			// 사용자가 입력한 아이디와 비밀번호 값을 수집하여 obj 객체에 저장
			let obj={
					memberId : loginForm.id.value,
					pw : loginForm.password.value
			}
			
			console.log(obj);
			
			// 요청
			fetchPost('/login/loginAction', obj, loginCheck);
		})
   })
   
   // 로그인 버튼 클릭 시 로그인 처리
   function loginCheck(map){
		// 로그인 성공 -> list 로 이동
		if(map.result == 'success'){
			location.href = map.url;
			model.addAttribute("msg", member.getMemberId+ "환영합니다.");
		} else {
			// 로그인 실패 시 메시지 처리
			alert(map.msg);
			msg.innerHTML = map.msg;
		}
		console.log(map);
	 }
 
 	document.getElementById("btnSignup").addEventListener("click", function() {
	    window.location.href = "/login/signup";
	});
 
</script>
</head>
<body>

 	<div id="contents">
       <div class="container sub_title">
           <div class="tit">Login</div>
           <div class="txt">로그인</div>
	</div>
       <div class="container">
       <form class="login_wrap" name="loginForm">
               <div class="form_wrap">
                   <div class="input_box">
                       <div class="input">
                           <input type="text" name="memberId" id="id" placeholder="아이디" value="user1" required="required"/>
                       </div>
                       <div class="input">
                           <input type="password" name="pw" id="password" placeholder="비밀번호" value="1234" required="required"/>
                       </div>
                   </div>
               </div>
               <div class="login_btns">
                   <button type="submit" class="btn_bk btn_login" id='btnSignin'>LOGIN</button>
               </div>
               <div>
              	 <a href="/login/signup">
                   <button type="button" class="btn-sign-in" id='btnSignup'>회원가입 </button>
                 </a>
               </div>

        <div class="etc">
            <div class="find">
                <a class="find-id" href="/">아이디 찾기</a>
                <a class="find-password" href="/">비밀번호 찾기</a>
            </div>
        </div>
        <div class="sns_login">
            <div class="tit">SNS 계정으로 로그인하기</div>
            <ul>
                <li>
                    <a class="btn_naver" href="/">네이버</a>
                    <div id="naverIdLogin" style="display:none"></div>
                </li>
                <li>
                    <a class="btn_kakao" href="/">카카오</a>
                </li>
            </ul>
          </div>
        </form>
    </div>
</div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>