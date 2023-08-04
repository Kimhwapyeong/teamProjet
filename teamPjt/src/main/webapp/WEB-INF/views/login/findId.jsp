<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="w3-content w3-container w3-margin-top">
        <div class="w3-container w3-card-4">
            <div class="w3-center w3-large w3-margin-top">
                <h3>아이디 찾기</h3>
            </div>
            <div>
                <p>
                    <label>Name</label>
                    <input class="w3-input" type="text" id="memberName" name="memberName" placeholder="아이디를 입력해주세요." value="user1" required>
                </p>

                <p>
                    <label>Email</label>
                    <input class="w3-input" type="text" id="memberEmail" name="memberEmail" placeholder="이메일을 입력해주세요." value="user1@naver.com" required>
                </p>

                <p class="w3-center">
                    <button type="button" id='findIdbtn' onclick="findIdAction()" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
                    <button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
                </p>
            </div>

        </div>
    </div>

<script>
/* 아이디 찾기 */ 
// 아이디 값 받고 출력하는 ajax
function findIdAction(){
    var memberName = $('#memberName').val();
    var memberEmail = $('#memberEmail').val();

    $.ajax({
        url: "./login/findIdAction",
        type: "POST",
        data: { "name": memberName, "email": memberEmail },
        success: function(data) {
            if (data == 0) {
                alert("회원 정보를 확인해주세요!");
            } else {
                alert("아이디: " + data);
            }
        },
        error: function() {
            alert("에러입니다");
        }
    });
};
</script>
</body>
</html>