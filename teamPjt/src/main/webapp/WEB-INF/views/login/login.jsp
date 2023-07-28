<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <div class="tit">Login</div>
                    <div class="txt">로그인</div>
                </div>
                <div class="container">
                    <form class="login_wrap">
                        <div class="form_wrap">
                            <div class="input_box">
                                <div class="input">
                                    <input type="text" name="email" placeholder="아이디"/>
                                </div>
                                <div class="input">
                                    <input type="password" name="password" placeholder="비밀번호"/>
                                </div>
                            </div>
                        </div>
                        <div class="login_btns">
                            <button type="submit" class="btn_bk btn_login">LOGIN</button>
                        </div>
                        <div>
                            <button type="button" class="btn-sign-in">회원가입</button>
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