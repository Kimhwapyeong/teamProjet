<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

						<!-- 여기다 메세지 룸 리스트 ForEach -->
				<div style="line-height:55px;">
					<c:forEach items="${messageRoomList}" var="messageRoom">
						<c:if test="${not empty messageRoom.memberId}">
							<div id="messageList" style="border:1px solid black; width:200px; cursor:pointer;" onclick="location.href='/chat/chat?roomId=${messageRoom.roomId}'">
								<input type="text" id="userMessageMemberId" value="${messageRoom.memberId}" readonly/>
								<input type="text" id="userMessageRoomId" value="${messageRoom.roomId}" readonly/>
								<input type="text" id="userMessageRoomName" value="${messageRoom.roomName}" readonly/>
							</div>
						</c:if>
					</c:forEach>
				</div>

</body>
</html>