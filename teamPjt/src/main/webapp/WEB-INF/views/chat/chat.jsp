<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

</head>
<body>
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="전송"/>
	<input type="button" id="closeBtn" value="연결 끊기"/>
	<div id="messageArea"></div>
</body>
<script type="text/javascript">
	$("#sendBtn").click(function() {
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
		
		if(${sessionScope.naverYN eq 'Y'}){
			
			sock.send("<네이버>${sessionScope.userName}님의 메세지 : "+$("#message").val());
			
		} else {
			
			sock.send("<기존 회원>${sessionScope.userId}님의 메세지 : "+$("#message").val());
		
		}
		
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		console.log(msg);
		var data = msg.data;
		$("#messageArea").append(data + "<br/>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");

	}
</script>
</html>