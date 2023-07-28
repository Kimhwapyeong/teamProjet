<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    window.addEventListener('load', function(){
    	// btnWhere 클릭되면 모달창 보이기
    	btnWhere.addEventListener('click', function(){
            document.querySelector("div[class=modalOverlay]").style.display='';
        })

        // closeBtn 클릭되면 모달창 가리기
        closeBtn.addEventListener('click', function(){
            document.querySelector("div[class=modalOverlay]").style.display='none';
        })
        
        // 언제 떠날까요? 달력
        btnWhen.addEventListener('click', function(){
            document.querySelector("div[class=modalOverlay2]").style.display='';
        })
        
        closeBtn2.addEventListener('click', function(){
            document.querySelector("div[class=modalOverlay2]").style.display='none';
        })
		// 언제 떠날까요? 달력 끝

		
        // a 요소 (button 의 자식 a)
        let buttons = document.querySelectorAll("button>a");
        
        buttons.forEach(button => {
        	// 버튼이 클릭되면
            button.addEventListener('click', () => {
            	// 클릭된 버튼만 active 클래스 추가, 나머지는 active 클래스 삭제
                buttons.forEach(otherButton => {
                    if (otherButton === button) {
                        otherButton.classList.add('active');
                    } else {
                        otherButton.classList.remove('active');
                    }
                });
            })
        })
    })
    
    function searchWhere(){
    	let where;
    	document.querySelectorAll('button>a').forEach(button =>{
    		console.log(button.classList.contains('active'));
            if(button.classList.contains('active')){
    		 	where = button.innerHTML;
    		 	location.href='/stay/list?='+where;
    		}
        })
    }

</script>
<!-- where modal -->
	<div class="modalOverlay" style="display: none;">
		<div class="modalWrapper">
			<div class="modalInner">
				<div class="layer layer_whe where open"
					style="position: relative; display: block; height: auto;">
					<div class="container">
						<button type="button" class="btn_close" id="closeBtn">닫기</button>
						<div class="whe_tit" style="text-align: left;">어디로 떠날까요?</div>
						<div class="whe_wrap">
							<div class="where_search">
								<input type="text" placeholder="원하는 스테이 혹은 지역을 검색해 보세요.">
							</div>
							<div class="whe_cont">
								<div class="box">
									<div class="tit" style="text-align: left;">국내</div>
									<ul class="clearfix">
										<li><button type="button">
												<a class="">국내 전체</a>
											</button></li>
										<li><button type="button">
												<a class="">제주</a>
											</button></li>
										<li><button type="button">
												<a class="">서울</a>
											</button></li>
										<li><button type="button">
												<a class="">강원</a>
											</button></li>
										<li><button type="button">
												<a class="">부산</a>
											</button></li>
										<li><button type="button">
												<a class="">경기</a>
											</button></li>
										<li><button type="button">
												<a class="">충청</a>
											</button></li>
										<li><button type="button">
												<a class="">경상</a>
											</button></li>
										<li><button type="button">
												<a class="">전라</a>
											</button></li>
										<li><button type="button">
												<a class="">인천</a>
											</button></li>
										<li><button type="button">
												<a class="">광주</a>
											</button></li>
										<li><button type="button">
												<a class="">대전</a>
											</button></li>
										<li><button type="button">
												<a class="">대구</a>
											</button></li>
										<li><button type="button">
												<a class="">울산</a>
											</button></li>
									</ul>
								</div>
								<div class="box">
									<div class="tit" style="text-align: left;">스테이유형</div>
									<ul class="clearfix">
										<li><button type="button">
												<a class="">게스트하우스</a>
											</button></li>
										<li><button type="button">
												<a class="">렌탈하우스</a>
											</button></li>
										<li><button type="button">
												<a class="">펜션</a>
											</button></li>
										<li><button type="button">
												<a class="">한옥</a>
											</button></li>
										<li><button type="button">
												<a class="">캠핑&아웃도어</a>
											</button></li>
										<li><button type="button">
												<a class="">호스텔</a>
											</button></li>
										<li><button type="button">
												<a class="">리조트</a>
											</button></li>
										<li><button type="button">
												<a class="">민박</a>
											</button></li>
										<li><button type="button">
												<a class="">호텔</a>
											</button></li>
									</ul>

								</div>
							</div>
							<a href="#none" onclick="searchWhere()" style="display: flex; justify-content: center;"><button
									type="button" class="btn-searchstay" id="gigi"
									style="order: 0; margin-bottom: 30px;">SEARCH</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- when modal -->
	<div class="modalOverlay2" style="display: none;">
		<jsp:include page="/WEB-INF/views/reserved/calendar.jsp"/>
	</div>