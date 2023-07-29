<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<link rel="stylesheet" href="/resources/css/mypage/reservation.css">
</head>

<body style="overflow: visible;">
    <!-- 헤더 -->
    <!-- <%@ include file="../../common/header.jsp" %> -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-M24ZFBJ"
            height="0" width="0" title="googletagmanager-iframe"
            style="display:none;visibility:hidden"></iframe></noscript>
    <div id="fb-root" class=" fb_reset">
        <script async="" src="https://connect.facebook.net/en_US/all.js"></script>
        <div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
            <div></div>
        </div>
    </div>
   
    <script src="/static/js/common.js"></script>
    <div id="__next" data-reactroot="">
        <div>
            <div class=""></div>
            <div id="gnbBgColor">
            
            </div>
            <div id="contents">
                <div class="container sub_title">
                    <div class="tit">MY PAGE</div>
                </div>
                <div class="container mypage_wrap">
                    <div class="mypage_myinfo">
                        <div class="tit">000님 반가워요!</div>
                        <div class="my-count" role="link" tabindex="0">함께 0번의 여행을 했어요.</div>
                    </div>
                    <div class="newmypage_menu pc_only">
                        <ul>
                            <li class=""><a href="./reservation">예약 정보</a></li>
                            <li class=""><a href="./cancel">취소 내역</a></li>
                            <li class=""><a href="./likestay">관심 스테이</a></li>
                            <li class="active"><a href="./info">회원 정보 수정</a></li>
							<li><a href="./message">메시지</a></li>
                        </ul>
                    </div>
                    <div class="mypage_content">
                        <div class="myedit_wrap">
                            <h3 class="my_tit pc_only">회원 정보 수정</h3>
                            <form>
                                <div class="profile_photo">
                                    <div class="input_box">
                                        <div class="tit">프로필 사진</div>
                                        <div class="photo" style="">profile photo</div><input type="file" id="imgFile"
                                            name="imgFile" title="프로필 사진" class="btn_photo"
                                            accept="image/jpeg, image/png">
                                    </div>
                                </div>
                                <div class="myedit_box">
                                    <div class="input_box">
                                        <div class="tit">이메일</div>
                                        <div class="input"><input type="email" name="email"
                                                placeholder="example@example.com" disabled=""
                                                value="@naver.com"
                                                style="color: rgb(128, 128, 128); -webkit-text-fill-color: rgb(128, 128, 128); margin-left: 12px;">
                                        </div>
                                    </div>
                                    <div class="input_box">
                                        <div class="tit">이름</div>
                                        <div class="input"><input type="text" name="name"
                                                placeholder="이용자 본인의 이름을 입력하세요." value="000" style="color: rgb(128, 128, 128); -webkit-text-fill-color: rgb(128, 128, 128); margin-left: 12px;" readonly>
                                        </div>
                                    </div>
                                    <div class="input_box">
                                        <div>
                                            <div class="tit">휴대전화번호</div>
                                            
                                            <div class="input"><label style="display: flex;"><input
                                                        class="mypage_account_edit_phone_number" type="number"
                                                        name="mobilePhone" placeholder="- 없이 휴대전화번호를 입력하세요."
                                                        maxlength="20" value="010"
                                                        style="margin-left: 7px;"></label></div>
                                            <div>
                                                <div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="input_box">
                                        <div class="tit">비밀번호</div>
                                        <div class="input"><label style="display: flex;"><input
                                                    class="mypage_account_edit_password" type="password" name="password"
                                                    placeholder="현재 비밀번호" value="" style="margin-left: 8px;"><button
                                                    type="button" style="margin-right: -15px;"><img
                                                        src="/web/images/password-deactivate-icon.svg"
                                                        alt=""></button></label></div>
                                        <div class="input"><label style="display: flex;"><input
                                                    class="mypage_account_edit_password" type="password"
                                                    name="newPassword" placeholder="변경할 비밀번호" value=""
                                                    style="margin-left: 8px;"><button type="button"
                                                    style="margin-right: -15px;"><img
                                                        src="/web/images/password-deactivate-icon.svg"
                                                        alt=""></button></label></div>
                                        
                                        <div class="input"><label style="display: flex;"><input
                                                    class="mypage_account_edit_password" type="password"
                                                    name="newPasswordConfirm" placeholder="변경할 비밀번호 확인" value=""
                                                    style="margin-left: 8px;"><button type="button"
                                                    style="margin-right: -15px;"><img
                                                        src="/web/images/password-deactivate-icon.svg"
                                                        alt=""></button></label></div>
                                    </div><button type="button" class="btn_bk btn_sm"
                                        style="margin: 10px 0px; width: 100%;">비밀번호 변경</button>
                                </div>
                                <div class="tit" style="padding-top: 22px; margin-left: 8px;"></div>
                                <div class="agree_box">
                                    
            </nav>
        </div>
    </div>
    <!-- 푸터 -->
	<!-- <%@ include file="../../common/footer.jsp" %> -->
    <script src="/static/js/channelService.js"></script>
    </div>
</body>

</html>