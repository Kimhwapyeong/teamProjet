<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="common/header.jsp" />

<style>
@media ( max-width : 900px) {
	.max-width900 {
		display: none;
	}
}

#carouselExampleInterval {
	
}

/* @media ( max-width : 1024px) {
	#carouselExampleInterval {
		top: 60px;
	}
}

@media ( max-width : 1024px) {
	#carouselExampleIndicators {
		top: 60px;
	}
} */

@media ( max-width : 1024px ){
	.main_visual .house_info{
		top: 57%;
	} 
}	

h_logo img {
	height: 67px;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	object-fit: contain
}
</style>
<script>
window.addEventListener('load', ()=>{
	setMainImgsHeight();
	
})
window.addEventListener('resize', setMainImgsHeight);

// 메인 이미지 height 값 조절 ( width 대비 0.45배 )
function setMainImgsHeight(){
	let mainImgs = document.querySelectorAll('div.carousel-item>a');
	let mainImg = document.querySelector('div.carousel-item.active>a');
	let height;
	let width
	
	for(i=0; i<mainImgs.length; i++){
		width = mainImg.clientWidth;
		height = width * 0.45;
		
		mainImgs[i].style.height = height + 'px';
	}
}
</script>
<div id="carouselExampleIndicators" class="carousel slide">
	<div class="carousel-indicators">
		<c:forEach items="${ listStay }" var="i" varStatus="status">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="${ status.index }" class="${ status.index eq 0 ? 'active' : ''}" aria-current="${ status.index eq 0 ? true : '' }"
				aria-label="Slide ${ status.index + 1 }"></button>
		</c:forEach>
	</div>
	<div class="carousel-inner main_visual container_wide">
		<c:forEach items="${ listStay }" var="stay" varStatus="status">
			<div class="carousel-item ${ status.index eq 0 ? 'active' : '' }">
				<a href="/stay/room?stayName=${ stay.stayName }" style="display:flex; align-items:center">
				<img
					src="/resources/images/${ stay.mainPic1 }"
					class="d-block" style="width:100%" alt="..."></a>
				<!-- 네모박스 (info) -->
				<div class="house_info max-width900">
					<p class="h_logo">
						<img
							src="//images.stayfolio.com/system/pictures/images/000/188/390/original/7a8a974ed01035f780b9246580258800b25c6a57.jpg?1689657777"
							alt="logo_url">
					</p>
					<p class="txt">
						${ stay.stayInfo }
					</p>
					<p class="event">${ stay.stayName }</p>
					<p class="more">read more</p>
				</div>
			</div>
		</c:forEach>
	</div>
	<button class="carousel-control-prev" type="button"
		data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
</div>



<div
	style="height: 500px; text-align: center; padding-top: 200px; font-size: 30px">
	<a href="/reserved/reserved">예약</a><br> <a href="/addstay">숙소등록</a><br>
	<a href="/addroom">room등록</a>
</div>

<jsp:include page="common/footer.jsp" />