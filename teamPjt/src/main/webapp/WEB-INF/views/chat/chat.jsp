<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>

<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/reserved/calendar.css" rel="stylesheet"/>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src='/resources/js/reserved/payment.js'></script>
<meta charset="UTF-8">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>


	




</head>





<body>
<jsp:include page="../common/header.jsp"/>

<div style="position: absolute; top: 80px; width: 100%; text-align: center; padding: 38px; border-bottom: 1px solid rgb(242, 242, 242); background-color: white;">
	<p style="letter-spacing: 15px; text-indent: 15px; margin-bottom: 12px; font-family: Lato-Bold;">MESSAGE</p>
	<p style="font-size: 12px;">호스트와 대화를 나눠보세요.</p>
</div>
<div id="contents" style="position: absolute; top:200px; width: 100%; text-align: center;">
	<div>
		<div class="chat-list-pc" style="position: relative; align:right;">
				<hr style="position:absolute;color: #f2f2f2; opacity: 1; height:30px; width:100%; top:5%;">
				<div id="messageList" style=" position:absolute; left:0;display: inline-block;text-align: center;  width:30%; height: 100%; border:1px solid #f2f2f2;">
					<img onclick="history.go(-1);" src="https://chat.stayfolio.com/img/back.svg" style="    vertical-align: middle;
																				    border: 0;
																				    position: absolute;
																				    top: 7px;
																				    left: 20px;
																				    cursor: pointer;">
					<span id="backBtn" style="    position: absolute;
												    top: 20px;
												    left: 80px;
												    font-size: 20px;
												    font-weight: bold;">
						메시지
					</span>
					<div id="messageRoom" style="position: absolute;
														    background-color: white;
														    width: 100%;
														    height: 87.6%;
														    top: 7%;
														    overflow: scroll;
														    vertical-align: text-bottom;""></div>
				</div>
				<div id="messageArea" style=" position:absolute; right:0;display: inline-block;text-align: center; width:70%; height: 100%; vertical-align: bottom">
						<div id="chatList" style="position: absolute;
														    background-color: white;
														    width: 100%;
														    height: 87.6%;
														    top: 7%;
														    overflow: scroll;
														    vertical-align: text-bottom;">
						</div>
						
						<div id="messageBtn" style=" position:absolute; bottom:0; width: 100%; border:1px solid #f2f2f2;">
							<input type="text" id="message" style="width:300px; border:1px solid #f2f2f2;"/>
							<input type="button" class="btnStyle" id="sendBtn" value="전송" style="border:1px solid #f2f2f2;"/>
						</div>
				</div>
				
		</div>
	</div>
		<jsp:include page="../common/footer.jsp"/>
</div>
</body>










<script type="text/javascript">
		

	
	
		var message = '';
		var role = "<유저>"		
		var memberId = '${sessionScope.memberId}';
		var content = ''

	$("#sendBtn").click(function() {
		// 길이 제한
		if($("#message").val().length > 85){
			
			$("#message").val('메세지는 85자를 초과할 수 없습니다.')
			
		}
		
		content = $('#message').val();

		sendMessage();
		$('#message').val('')
	});
	
	$("#closeBtn").click(function(){
		onClose(this);
	});

	let sock = new SockJS("http://localhost:8080/echo");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
			
			sock.send(role+memberId+"님의 메세지 : "+$("#message").val());
		
	}



	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		console.log(msg);
		message = msg.data;
		
		let roomId = '${param.roomId}';
		
		var regDate = new Date(msg.timeStamp);
		var data = {
		
				content : content
				, regDate : regDate
				, writer : memberId
				, roomId : roomId
				
		}
		
		
		$.ajax({
			
			type: "POST"
			, url : "/chat/insertChat"
			, contentType : "application/json"
			, data : JSON.stringify(data)
			
		}).done(function(res){
			
			console.log(res);
			
			if(res.vo != null){
				console.log(res.vo);
			}
			
			alert(res.msg);
			
		});

		$("#chatList").append("<p style='padding:5px;'>"+ message + "</p><br/>");
		
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");

	}
	
	

	
	window.addEventListener('load', function(){
		
		
		setTimeout(function(){
			sock.send('${enter}');
			
		}, 1000);
		
		
	});


</script>
	<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
    <script src = "/resources/js/reserved/calendar.js"></script>
</html>