<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<link href="/resources/css/reserved/calendar.css" rel="stylesheet"/>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src='/resources/js/reserved/payment.js'></script>

<body>
<jsp:include page="../common/header.jsp"/>
<div id="contents">
	<div class="container sub_title">
		<div class="txt">예약 페이지</div>
	</div>
	<div class="store_apply">
		
			<div class="store_apply_form">
				<ul class="form_dl">
					<li style="flex-direction: row"><span class="left"></span><span class="right">* 필수 입력 항목</span></li>
					
					<li><div class="left">예약 정보</div></li>
					<hr style="color:black; opacity: 1; height:30px;">
					<li><div class="dt">스테이 이름</div>
						<div class="dd">
							<input style="font-size: 12px; color:#666;" type="text" class="form_style" name="stayName" value="매화동" readonly>
						</div></li>
					<hr>
					<li><div class="dt">객실 선택 *</div>
						<div class="dd">
						<!-- font-size: 12px;
    							color: #666; -->
							<select class="form_style" name="roomName" style="font-size: 12px; color:#666; width:100%;">
								<option selected>예약할 객실을 선택해 주세요.</option>
								<option value="A호">A호</option>
								<option value="B호">B호</option>
								<option value="C호">C호</option>
							</select>
						</div></li>
					<hr>
					<li><div class="dt">예약 날짜</div>
						<div class="dd">
							<input style="font-size: 12px; color:#666;" type="text" class="form_style" name="stayName" value="2023-07-27 ~ 2023-07-30" readonly>			
						</div></li>
					<hr>	
					<li style="height:200px;"><div class="dt" style="position:relative;">가격</div>
						<div class="dd">
							<span style="font-size:0.85em; position:absolute; right:40%; top:50%; color: #66666682;">객실 요금</span><br>
							<span style="font-size:0.85em; position:absolute; right:3%; top:50%; color: #66666682;">₩900,000</span><br>
							<span style="font-size:0.85em; position:absolute; right:40%; top:53%; color: #66666682;">옵션</span><br>
							<span style="font-size:0.85em; position:absolute; right:5%; top:53%; color: #66666682;">-</span><br>
							<span style="font-size:0.85em; position:absolute; right:40%; top:56%; color: #66666682;">할인 금액</span><br>
							<span style="font-size:0.85em; position:absolute; right:5%; top:56%; color: #66666682;">-</span><br>
							<span style="font-size:2em; position:absolute; right:3%; top:64%;" id="amount" data-amount="900000">₩900,000</span>						
						</div></li>
					
					<hr>
					<li><div class="dt">요청 사항</div>
						<div class="dd">
							<textarea rows="5" class="form_style" name="description"
								placeholder="할말 있음 해라 (최소 50자)"></textarea>
						</div></li>
						
						
					<hr>	
					<li><div class="dt" style="position:relative;">결제 수단</div>
						
							<button id="kakaopay" style="position:absolute; right:19%; bottom:0%;"><img src="/resources/images/kakaopay.JPG"/></button>
							<button id="nice" style="position:absolute; right:3%; bottom:0.6%;"><img src="/resources/images/신용카드.JPG"/></button>
							<script>
								
								$(function(){
									
									$("#kakaopay").click(function(){
										
										purchased('kakaopay');
										
										
									});
									
									$("#nice").click(function(){
										
										purchased('nice');
										
										
									});

									
								});
								
							
							</script>
							
								<script>
 
		var buyer_name = '원준';
		var merchant_uid = '999';
		var canclePay = '';
		var realAmount = '';
		var payInfo = '${sessionScope.userId}';
		var purchaseName = $('input[name=stayName]').val()+", "+$('select[name=roomName]').val();
		var purchaseAmount = $('#amount').attr("data-amount");
		
		$(function(){
			
			$("#canclePayVal").change(function(){
				
				canclePay = $("#canclePayVal").val();
				
			});
			
			$("#realAmountVal").change(function(){
				
				realAmount = $("#realAmountVal").val();
				
			});
			
			$('select[name=roomName]').change(function(){
				
				purchaseName = $('input[name=stayName]').val()+", "+$('select[name=roomName]').val();
				
			});
			
			
		});
	</script>
							
							
							
						</div></li>
					<hr>
				</ul>
			</div>
		
			<div class="store_apply_agree">
				<div class="box">
					<div class="tit">개인정보 수집 및 이용 동의</div>
					<div class="desc">
						(주)스테이폴리오는 아래의 목적으로 개인정보를 수집 및 이용하며, 신청인의 개인정보를 안전하게 취급하는데 최선을
						다합니다.<br>
						<br>1. 수집 항목 : 스테이 이름, 상세 주소, 담당자 성함, 전화번호, 메일 주소, 숙박업 인허가 등록
						여부, 스테이 소개, 첨부 자료<br>2. 수집 및 이용 목적 : 입점 신청에 따른 정보 확인, 입점 가능
						여부 전달 및 문의사항 대응<br>3. 보유 및 이용 기간 : 입점 신청 및 문의를 위해 검토 완료 후,
						3개월 간 보관하며 이후 해당 정보는 파기됩니다.<br>
						<br>
						<span>이외 기타 사항은 별도 고지하는 [<a target="_blank"
							rel="noreferrer" style="display: inline" class="bold_contactus"
							href="https://stayfolio.notion.site/Ver-2-1-1b8348dda5aa42419ed16a27381e8ad6">개인정보
								처리방침</a>]을 참고해 주시기 바랍니다.
						</span><br>
					</div>
				</div>
				<label for="check-policy1" class="check_skin"
					style="width: 100%; display: flex; justify-content: center; margin-top: 34px"><input
					type="checkbox" id="check-policy1"><span
					class="check_policy">개인정보 수집 및 이용에 동의합니다. [필수]</span><span
					class="check_box"></span></label>
			</div>
			<div class="bt_btns">
				<button type="submit" class="btn_bk">제출하기</button>
			</div>
	</div>
</div>
</body>
	<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
    <script src = "/resources/js/reserved/calendar.js"></script>
<jsp:include page="../common/footer.jsp"/>