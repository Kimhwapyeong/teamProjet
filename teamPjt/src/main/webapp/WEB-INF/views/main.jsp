<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="common/header.jsp" />

<div id="carouselExampleInterval" class="carousel slide"
	data-bs-ride="carousel">
	<div class="carousel-inner main_visual">
		<div class="carousel-item active" data-bs-interval="10000">
			<img
				src="https://www.stayfolio.com/_next/image?url=http%3A%2F%2F%2F%2Fimages.stayfolio.com%2Fsystem%2Fpictures%2Fimages%2F000%2F189%2F599%2Foriginal%2Fe8dbf1066b38f29e02f2d956869a3c56041db8f5.jpg%3F1690539716&w=3840&q=75"
				class="d-block w-100" alt="...">
			</div>
			<div class="house_info">
				<p class="h_logo">
					<img
						src="//images.stayfolio.com/system/pictures/images/000/188/390/original/7a8a974ed01035f780b9246580258800b25c6a57.jpg?1689657777"
						alt="logo_url"
						style="height: 67px; background-repeat: no-repeat; background-position: center; background-size: cover; object-fit: contain">
				</p>
				<p class="txt">
					역사와 현재가<br>공존하는 특별한 공간
				</p>
				<p class="event">LAUNCHING</p>
				<p class="more">read more</p>
		</div>
		<div class="carousel-item" data-bs-interval="10000">
			<img
				src="https://www.stayfolio.com/_next/image?url=http%3A%2F%2F%2F%2Fimages.stayfolio.com%2Fsystem%2Fpictures%2Fimages%2F000%2F189%2F249%2Foriginal%2Feda1432e5b8e820c70878394eb7b3b82f0f893eb.jpg%3F1690249445&w=3840&q=75"
				class="d-block w-100" alt="...">
		</div>
		<div class="carousel-item" data-bs-interval="10000">
			<img
				src="https://www.stayfolio.com/_next/image?url=http%3A%2F%2F%2F%2Fimages.stayfolio.com%2Fsystem%2Fpictures%2Fimages%2F000%2F189%2F324%2Foriginal%2F8d7cdcb954c7aead4949f62290232de057461ef2.jpg%3F1690333777&w=3840&q=75"
				class="d-block w-100" alt="...">
		</div>
	</div>
	<button class="carousel-control-prev" type="button"
		data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#carouselExampleInterval" data-bs-slide="next">
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