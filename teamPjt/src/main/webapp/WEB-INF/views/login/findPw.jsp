<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="contents">
		<div class="container sub_title">
			<div class="tit">FIND PASSWORD</div>
			<div class="txt">비밀번호 찾기</div>
		</div>
		<div class="container">
			<div class="login_wrap">
				<div class="txt">이름과 이메일을 입력하세요.</div>
				<div class="w3-content w3-container w3-margin-top">
					<div class="w3-container w3-card-4">
						<div class="w3-center w3-large w3-margin-top">
							<div>
								<p>
									<label>이름</label> 
									<input class="w3-input" type="text"
										id="memberName" name="memberName" placeholder="이름을 입력해주세요."
										value="user1" required>
								</p>

								<div class='input_box'>
								
								<p>
									<label>Email</label> <input class="w3-input" type="text"
										id="memberEmail" name="memberEmail"
										placeholder="이메일을 입력해주세요." value="user1@naver.com" required>
								</p>
									<div class="input"></div>
			
								</div>

								<p class="w3-center findidBtn" style="display: flex; align-items: center; justify-content:center;">
									<button type="button" id='findPwbtn' onclick="findPwAction()"
										class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round"
										style="width: 45px; height: 30px; border: 1px solid #ebebeb; background-color: #fff; border-radius:20px;">find</button>
									<button type="button" onclick="history.go(-1);"
										class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round" 
										style="width: 45px; height: 30px; border: 1px solid #ebebeb; background-color: #fff; border-radius:20px; margin:left;">Cancel</button>
								</p>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp" />
</html>