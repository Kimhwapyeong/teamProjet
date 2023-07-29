<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>

<div id="contents">
	<div class="container sub_title">
		<div class="txt">Stay 수정</div>
	</div>
	<div class="store_apply">
		<form name="addStayForm">
			<div class="store_apply_form">
				<ul class="form_dl">
					<div class="_contactus_divider__BZ5eb"></div>
					<li style="flex-direction: row"><span class="left">스테이
							정보</span><span class="right">* 필수 입력 항목</span></li>
					<li><div class="dt">스테이 이름 *</div>
						<div class="dd">
							<input type="text" class="form_style" name="name" value=""
								placeholder="스테이 이름을 입력해 주세요.">
						</div></li>
					<li><div class="dt">지역 *</div>
						<div class="dd">
							<select style="width: 100%" class="form_style" name="stayLoc"><option
									selected="" value="" disabled="" hidden="">지역을 선택해 주세요</option>
								<option value="hanok">제주</option>
								<option value="home_stay">서울</option>
								<option value="residence">강원</option>
								<option value="hotel_hostel">부산</option>
								<option value="etc">경기</option>
								<option value="etc">충청</option>
								<option value="etc">경상</option>
								<option value="etc">전라</option>
								<option value="etc">인천</option>
								<option value="etc">광주</option>
								<option value="etc">대전</option>
								<option value="etc">대구</option>
								<option value="etc">울산</option>
							</select>
						</div></li>
					<li><div class="dt">상세 주소 *</div>
						<div class="dd">
							<input type="text" class="form_style" name="address" value=""
								placeholder="정확한 주소를 입력해 주세요.">
						</div></li>
					<li><div class="dt">웹사이트 및 SNS 주소</div>
						<div class="dd">
							<textarea class="form_style" name="website"
								placeholder="스테이 공간 / 브랜드를 살펴볼 수 있는 웹사이트 및 SNS 주소를 기재해 주세요."></textarea>
						</div></li>
					<li><div class="dt">숙박업 사업자 등록 여부 *</div>
						<div class="dd">
							<label for="radio-check3" class="radio_skin"><input
								type="radio" id="radio-check3" name="not_register"><span
								style="font-size: 12px">준비 중</span></label><label for="radio-check4"
								class="radio_skin"><input type="radio" id="radio-check4"
								name="register"><span style="font-size: 12px">등록
									완료</span></label>
						</div></li>
					<li><div class="dt">분류 *</div>
						<div class="dd">
							<select style="width: 100%" class="form_style" name="category"><option
									selected="" value="" disabled="" hidden="">선택해 주세요</option>
								<option value="hanok">한옥체험업</option>
								<option value="home_stay">민박업</option>
								<option value="residence">생활 숙박시설 운영업</option>
								<option value="hotel_hostel">호텔/호스텔업</option>
								<option value="etc">기타</option></select>
						</div></li>
					<li><div class="dt">스테이 소개 *</div>
						<div class="dd">
							<textarea rows="5" class="form_style" name="description"
								placeholder="공간의 구조, 컨셉, 스토리 등을 자유롭게 작성해 주세요. (최소 50자)"></textarea>
						</div></li>
					<li><div class="dt">뱃지 *</div>
						<div class="dd">
							<input type="text" class="form_style" name="bedge" value=""
								placeholder="뱃지는 ... 입니다.">
						</div></li>
					<div class="_contactus_divider__BZ5eb"></div>
					
					<li><div class="left">이미지 제출</div></li>
					<div class="container text-start lh-base" style="background-color: white">
						<div class="row g-1">
							<div class="col-6">
								<div class="p-1 bg-white">
									<img
										src="https://images.stayfolio.com/system/pictures/images/000/026/062/original/6be1c115d15928bfd8cdece979778e183b380f30.jpg?1523266043"
										style="width: 100%;">
								</div>
							</div>
							<div class="col-6">
								<div class="p-1 bg-white">
									<img alt=""
										src="https://www.stayfolio.com/_next/image?url=http%3A%2F%2F%2F%2Fimages.stayfolio.com%2Fsystem%2Fpictures%2Fimages%2F000%2F187%2F276%2Foriginal%2Fc0769ad4ba823cca80805714a5c6734a6421f10b.jpg%3F1688627296&w=3840&q=75"
										style="width: 100%">
								</div>
							</div>
							<div class="col-6">
								<div class="p-1 bg-white">
									<img alt=""
										src="https://www.stayfolio.com/_next/image?url=https%3A%2F%2Fimages.stayfolio.com%2Fsystem%2Fpictures%2Fimages%2F000%2F013%2F971%2Foriginal%2F39825fb5a1aa7be5ef4a72f3ae2cd000e453583a.jpg%3F1481683602&w=2048&q=75"
										style="width: 100%">
								</div>
							</div>
							<div class="col-6">
								<div class="p-1 bg-">
									<p class="_contactus_guide_title__ZyIpA">이미지 제출 가이드</p>
									<p class="_contactus_guide_list__ogEdb">• 숙소 이미지 제출은 필수 입니다.</p>
									<p class="_contactus_guide_list__ogEdb">• 숙소 이미지는 2장만 제출할 수 있습니다.</p>
									<p class="_contactus_guide_sub_list__srBT5">￮ 전체으로 나온 숙소의 사진</p>
									<p class="_contactus_guide_sub_list__srBT5">￮ 숙소에 있는 대표 room의 사진</p>
								</div>
							</div>
						</div>
					</div>

					<li><div class="dt">파일 첨부 *</div>
						<div class="dd">
							<div class="file_wrap">
								<div class="form_style" style="padding: 0" role="presentation"
									tabindex="0">
									<div class="drag" role="button" style="cursor: pointer"
										tabindex="0">
										<i class="ico_addfile"></i>첨부 파일을 마우스로 끌어서 넣어주세요.
									</div>
								</div>
								<div class="file_desc">
									0
									<!-- -->
									MB / 1024 MB
									<div class="file_att" style="margin-top: -7px">
										<label for="file_attach"><img alt="file_upload_button"
											src="https://www.stayfolio.com/web/images/file_upload_button.svg"
											style="margin-bottom: 2px; margin-right: 6px">이미지
											첨부</label><input type="file" id="file_attach" multiple=""
											accept="image/png,image/gif,image/jpg,image/jpeg,image/webp,image/tif,image/tiff,image/bmp,video/mp4,application/pdf,video/quicktime">
									</div>
								</div>
								<p class="lh-base" style="font-size: 12px; margin-top: 15px; color: #808080">*
									대용량 파일의 경우 업로드까지 3분 이상 소요될 수 있습니다.<br>
									* 숙소사진 2장은 필수 입니다.</p>
							</div>
						</div></li>
				</ul>
			</div>

			<div class="bt_btns">
				<button type="submit" class="btn_bk" id=btnAddStay>수정하기</button>
				<button type="reset" class="btn_bk">초기화</button>
			</div>
		</form>
	</div>
</div>

<jsp:include page="../common/footer.jsp"/>