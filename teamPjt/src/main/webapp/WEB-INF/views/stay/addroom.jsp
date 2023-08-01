<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<link href="/resources/main/add.css">
<script type="text/javascript">
	window.addEventListener('load', ()=>{
		
		btnAddRoom.addEventListener('click', (e)=>{
			e.preventDefault();
			
			let optionCheck = document.querySelectorAll("input[type=checkbox]");
			// option 체크박스 돌면서
			optionCheck.forEach((option)=>{
				// 체크되어있지 않으면
				if(!option.checked){
					// value를 N으로 바꾸고
					option.value='N';
					// checked설정
					option.checked=true;
				}
			})
			
			addRoomForm.submit();
			
		})
	})

</script>
<div id="contents">
	<div class="container sub_title">
		<div class="txt">room 등록</div>
	</div>
	<div class="store_apply">
		<form name="addRoomForm" method="post" enctype="multipart/form-data" action="/addRoomAction">
			<div class="store_apply_form">
				<ul class="form_dl">
					<div class="_contactus_divider__BZ5eb"></div>
					<li style="flex-direction: row"><span class="left">room 정보</span>
					<span class="right">* 필수 입력 항목</span></li>
					<li><div class="dt">room 이름 *</div>
						<div class="dd">
							<input type="text" class="form_style" name="roomName" value=""
								placeholder="room 이름을 입력해 주세요.">
						</div></li>
					<li><div class="dt">객실 유형 *</div>
						<div class="dd">
							<select class="form_style" name="roomType" style="width:100%">
								<option selected="" value="">Type을 선택해 주세요.</option>
								<option value="게스트하우스">게스트하우스</option>
								<option value="렌탈하우스">렌탈하우스</option>
								<option value="펜션">펜션</option>
								<option value="한옥">한옥</option>
								<option value="캠핑&아웃도어">캠핑&아웃도어</option>
								<option value="호스텔">호스텔</option>
								<option value="리조트">리조트</option>
								<option value="민박">민박</option>
								<option value="호텔">호텔</option>
							</select>
						</div>
					</li>
					<li style="width:53%"><div class="dt">기준인원 *</div>
						<div class="dd" style="width:200px">
							<select style="width: 100%" class="form_style" name="stdPerson"><option
									selected="" value="0">선택해 주세요</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select>
						</div>
					</li>
					<li style="width:53%">
						<div class="dt">최대인원 *</div>
						<div class="dd" style="width:200px">
							<select style="width: 100%" class="form_style" name="overPerson">
								<option selected="" value="0">선택해 주세요</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select>
						</div>
					</li>
					<li><div class="dt">옵션 *</div>
						<div class="dd">
							<label for="bathroom" class="check_skin">
								<input type="checkbox" id="bathroom" value="Y" name="bathroom">
									<span style="font-size: 12px">화장실</span>
								</label>
							<label for="kitchen" class="check_skin">
								<input type="checkbox" id="kitchen" value="Y" name="kitchen">
									<span style="font-size: 12px">부엌</span>
								</label>
							<label for="parking" class="check_skin">
								<input type="checkbox" id="parking" value="Y" name="parking">
									<span style="font-size: 12px">주차장</span>
								</label>
							<label for="babiqu" class="check_skin">
								<input type="checkbox" id="babiqu" value="Y" name="babiqu">
									<span style="font-size: 12px">부엌</span>
								</label>
							<label for="pet" class="check_skin">
								<input type="checkbox" id="pet" value="Y" name="pet">
									<span style="font-size: 12px">부엌</span>
								</label>
							<label for="terrace" class="check_skin">
								<input type="checkbox" id="terrace" value="Y" name="terrace">
									<span style="font-size: 12px">테라스</span>
								</label>
							<label for="pool" class="check_skin">
								<input type="checkbox" id="pool" value="Y" name="pool">
									<span style="font-size: 12px">풀장</span>
								</label>
							<label for="mountain" class="radio_skin">
								<input type="radio" id="mountain" name="viewRoom" value="산">
									<span style="font-size: 12px">산</span>
								</label>
							<label for="ocean" class="radio_skin">
								<input type="radio" id="ocean" name="viewRoom" value="바다">
									<span style="font-size: 12px">바다</span>
								</label>
						<div class="dd" style="width:110px; display:flex">
							<select style="width: 100%" class="form_style" value="Y" name="bed"><option
									selected="" value="">침구 갯수</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select>
						</div>
							</div>
						</li>
					<li><div class="dt">1박 가격 *</div>
						<div class="dd">
							<input type="text" class="form_style" name="price" value=""
								placeholder="단위 구분 기호(,) 사용하지 않고 숫자만으로 입력해주세요. 단위 : 원">
						</div></li>
					<li><div class="dt">room 소제목 *</div>
						<div class="dd">
							<input type="text" class="form_style" name="info" value=""
								placeholder="room의 소제목을  간단하게 입력해주세요. (최대 50자)">
						</div></li>
					<li><div class="dt">room 소개 *</div>
						<div class="dd">
							<textarea rows="5" class="form_style" name="roomInfo"
								placeholder="공간의 구조, 컨셉, 스토리 등을 자유롭게 작성해 주세요. (최소 50자)"></textarea>
						</div></li>
					<div class="_contactus_divider__BZ5eb"></div>
					
					<li><div class="left">이미지 제출</div></li>
					<div class="container text-start lh-base" style="background-color: white">
						<div class="row g-1">
							<div class="col-6">
								<div class="p-1 bg-white">
									<img
										src="/resources/images/room/roomphoto2.JPG"
										style="width: 100%;">
								</div>
							</div>
							<div class="col-6">
								<div class="p-1 bg-white">
									<img alt=""
										src="/resources/images/room/roomphoto1.JPG"
										style="width: 100%">
								</div>
							</div>
							<div class="col-6">
								<div class="p-1 bg-white">
									<img alt=""
										src="/resources/images/room/roomphoto3.JPG"
										style="width: 100%">
								</div>
							</div>
							<div class="col-6">
								<div class="p-1 bg-white">
									<p class="_contactus_guide_title__ZyIpA">이미지 제출 가이드</p>
									<p class="_contactus_guide_list__ogEdb">• 이미지 제출은 필수 사항 입니다.</p>
									<p class="_contactus_guide_list__ogEdb">• 이미지를 자유롭게 첨부해 주세요.</p>
									<p class="_contactus_guide_sub_list__srBT5">￮ room의 외부 사진</p>
									<p class="_contactus_guide_sub_list__srBT5">￮ room의 디테일</p>
								</div>
							</div>
						</div>
					</div>


<!-- 					부트스트랩 파일첨부 input		
							<div class="mb-3">
								<label for="formFileMultiple" class="form-label"></label> 
								<input class="form-control" type="file"
									id="formFileMultiple" multiple>
							</div> -->
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
									* room 사진은 최대 최대 10장 등록 가능합니다.</p>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<input type="hidden" name="stayNo" value="1">
			<div class="bt_btns">
				<button type="submit" class="btn_bk" id="btnAddRoom">등록하기</button>
				<button type="reset" class="btn_bk">초기화</button>
			</div>
		</form>
	</div>
</div>

<jsp:include page="../common/footer.jsp"/>