<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <!-- fetchGet, fetchPost -->
    <script type="text/javascript" src="/resources/js/common.js"></script>
    
    <script type="text/javascript">
    window.addEventListener('load', function(){
    	
	    changeInfo.addEventListener('click', function(e){
	   		e.preventDefault();
	   	 
		   	let memberEmail = email.value;
		   	let pw = newpww.value;
		   	let newpw= newpwCheck.value;
		   	let memberId = id.value;
		   	
		     if(!memberEmail){
		   	  signupMsg.innerHTML="이메일을 입력해주세요";
		   	  return;
		     }
		     if(!pw){
		   	  signupMsg.innerHTML="비밀번호를 입력해주세요";
		   	  return;
		     }
		     if(!newpw){
		   	  signupMsg.innerHTML="비밀번호를 다시 한번 입력해주세요";
		   	  return;
		     }
		     
		     if(newpww.value == newpwCheck.value){
		    	 
		     } else{
		    	 signupMsg.innerHTML = "비밀번호가 일치하지 않습니다";
		    	 newpww.focus();  // 비밀번호 재입력 포커스
		    	 newpww.value='';  
		    	 newpwCheck.value='';
	       		 return;
		     }
		     
	          obj ={memberEmail:memberEmail, pw:pw, memberId:memberId}
	          
	          console.log("회원정보수정 obj", obj)
	          
	          fetchPost('/member/mypage/infoFrm', obj, result);
		});
    });
    
    function result(map){
		if(map.result == 'success'){   
  			location.href='/member/mypage/info?msg='+map.msg;
		} else{
			signupMsg.innerHTML="회원 정보 수정에 실패하였습니다";
		}	
    }
    </script>
</head>

<body style="overflow: visible;">
    <!-- 헤더 -->
    <%@ include file="../../common/header.jsp" %>
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
                <div class="container sub_title">
                    <div class="tit">MY PAGE</div>
                </div>
                <div class="container mypage_wrap">
                    <div class="mypage_myinfo">
                        <div class="tit">${sessionScope.memberId}님 반가워요!</div>
                        <div class="my-count" role="link" tabindex="0">함께  ${travelCnt }번의 여행을 했어요.</div>
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
                            
                             <!-- ▶▶▶  forEach ▶▶▶  -->
                             <c:forEach items="${mem}" var="member" step="1">
                             <c:if test="${sessionScope.memberId == member.memberId}">
                             
                             
                            <form name="infoFrm" method="post" action="/member/user/infoFrm">
                                        <input type="hidden" name="memberId" value=${member.memberId } id ='id'>
                                        <!-- 프로필 사진 -->
                                  <div class="profile_photo">
                                    <div class="input_box">
                                    	<input type="file" id="imgFile" name="imgFile" title="프로필 사진" class="photo" style="">
                                        <input type="file" id="imgFileBtn" name="imgFile" title="프로필 사진" class="btn_photo"
                                            accept="image/jpeg, image/png">
                                    </div>
                                    <script>
                                    	$(function(){
                                    		
                                    		$('#imgFileBtn').change(function(){
                                    			
                                    			$('#imgFile').val($('#imgFileBtn').val());
                                    			
                                    		});
                                    		
                                    		if($('#imgFile').val()!=null){
                                    			
                                    			$('#imgFile').attr("style", "background-image: url('${sessionScope.member.profile}'); background-size : 100%;");
                                    		}
                                    		
                                    	});
                                    </script>
                                </div>   
                                <div class="myedit_box">
                                    <div class="input_box">
                                        <div class="tit">이메일</div>
                                        <div class="input">
                                        <input type="email" name="memberEmail" placeholder="@이메일 형식으로 입력해주세요"
                                                style=" -webkit-text-fill-color: black; margin-left: 12px;" value=${member.memberEmail } id='email'>
                                        </div>
                                    </div>
                                    <div class="input_box">
                                        <div class="tit">이름</div>
                                        <div class="input">
                                        	<input type="text" name="memberName" id='name'
                                                value=${member.memberName } style="color: rgb(128, 128, 128); -webkit-text-fill-color: rgb(128, 128, 128); margin-left: 12px;" readonly>
                                        </div>
                                    </div>
                                   
                                    <div class="input_box">
                                        <div class="tit">비밀번호</div>
                                        
                                        <div class="input">
	                                        <label style="display: flex;">
	                                        <input class="mypage_account_edit_password" type="password" name="password" id="currentpw"
	                                                    placeholder="현재 비밀번호" value="${member.pw }" style="margin-left: 8px;">
	                                        <button type="button" style="margin-right: -15px;">
	                                        	<img src="/web/images/password-deactivate-icon.svg" alt="">
	                                        </button>
	                                        </label>
                                        </div>
                                        
                                        <div class="input">
	                                        <label style="display: flex;">
	                                        <input class="mypage_account_edit_password" type="password" id="newpww"
	                                                    name="pw" placeholder="변경할 비밀번호" style="margin-left: 8px;">
	                                        </label>
                                        </div>
                                        
                                        <div class="input">
	                                        <label style="display: flex;">
	                                        <input class="mypage_account_edit_password" type="password" id="newpwCheck"
	                                                    name="newpw" placeholder="변경할 비밀번호 확인" style="margin-left: 8px;">
	                                        </label>
                                        </div>
                                    </div>
                                    <div id="signupMsg" style="display: flex; justify-content: center; color:red"></div>  <!-- msg 출력 -->
                                    <button type="button" class="btn_bk btn_sm" style="margin: 20px 0px; width: 100%;" id='changeInfo'>회원정보 변경</button>
                                </div>
                             </form>
                      			
               				</c:if>
                            </c:forEach>
                                
                            <div class="tit" style="padding-top: 22px; margin-left: 8px;"></div>
                            <div class="agree_box">
       					</div>
        		</div>
        	</div>
        </div>
    </div>
    </div>
    <!-- 푸터 -->
	<%@ include file="../../common/footer.jsp" %> -->
    <script src="/static/js/channelService.js"></script>
