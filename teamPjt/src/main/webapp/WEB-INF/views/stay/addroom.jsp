<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
<link href="/resources/main/add.css">
<script type="text/javascript">
	let regex = /^\s*$/;

	window.addEventListener('load', ()=>{
		
		let inputRoomName = document.querySelector('input[name=roomName]');
		let selectRoomType = document.querySelector('select[name=roomType]');
		let selectStdPerson = document.querySelector('select[name=stdPerson]');
		let selectOverPerson = document.querySelector('select[name=overPerson]');
		let selectBed = document.querySelector('select[name=bed]');
		let inputPrice = document.querySelector('input[name=price]');
		let inputInfo = document.querySelector('input[name=info]');
		let textareaRoomInfo = document.querySelector('textarea[name=roomInfo]');
		let inputFiles = document.querySelector('input[name=files]');
		
		// input 요소 클릭 시 backgroundColor = white
		let inputList = document.querySelectorAll('form[name=addRoomForm] input');
		console.log(inputList);
		inputList.forEach( e => {
			e.addEventListener('click', ()=>{
				e.style.backgroundColor='white';
			})
		})
		
		// area 요소 클릭 시 backgroundColor = white
		let areaList = document.querySelectorAll('form[name=addRoomForm] textarea');
		areaList.forEach( e => {
			e.addEventListener('click', ()=>{
				e.style.backgroundColor='white';
			})
		})
		
		// select 요소 클릭 시 backgroundColor = white
		let selectList = document.querySelectorAll('form[name=addRoomForm] select');
		selectList.forEach( e => {
			e.addEventListener('click', ()=>{
				e.style.backgroundColor='white';
			})
		})
		
		selectOverPerson.addEventListener('click', ()=>{
			liOverPerson.style.width='53%';
			divOverPerson.style.width='200px';
			selectOverPerson.firstElementChild.innerHTML='선택해 주세요';
		})
		
		// room 등록 버튼 클릭 이벤트
		btnAddRoom.addEventListener('click', (e)=>{
			e.preventDefault();
			
			if(valueCheck(inputRoomName, '객실 이름을 입력해주세요.')){
				return;
			}else{
				let regex1 = new RegExp("^.{1,30}$");
				if(valueLengthCheck(regex1, inputRoomName, '객실 이름은 30자 이내로 입력해야 합니다.')){
					return;
				}
			}
			
			if(valueCheck(selectRoomType, '객실 타입을 선택해주세요.')){
				return;
			}
			
			if(valueCheck(selectStdPerson, '기준 인원을 선택해주세요.')){
				return;
			}
			
			if(valueCheck(selectOverPerson, '최대 인원을 선택해주세요.')){
				return;
			}
			
			// 최대 인원이 기준 인원보다 작으면 return
			if(selectOverPerson.value < selectStdPerson.value){
				selectOverPerson.value = '';
				liOverPerson.style.width='78%';
				divOverPerson.style.width='400px';
				document.querySelector('select[name=overPerson]').firstElementChild.innerHTML='최대인원은 기준인원보다 작거나 같아야 합니다.';
				document.querySelector('select[name=overPerson]').firstElementChild.selected=true;
				selectOverPerson.style.backgroundColor='#eee';
				selectOverPerson.focus();
				return;
			}
			
			if(valueCheck(selectBed, '침구 갯수를 선택해주세요.')){
				return;
			}
			
			if(valueCheck(inputPrice, '1박 가격을 입력해주세요. (가격은 숫자로만 입력해주세요.)')){
				return;
			}else{
				let regex2 = new RegExp('^[1-9][0-9]{0,9}$', 'm');
				if(valueLengthCheck(regex2, inputPrice, '가격은 숫자로만 입력할 수 있고, 10자리를 넘길 수 없습니다.')){
					return;
				}
			}
			
			if(valueCheck(inputInfo, '객실 소제목을 입력해주세요.')){
				return;
			}else{
				let regex3 = new RegExp('^.{1,50}$');
				if(valueLengthCheck(regex3, inputInfo, '객실 소제목은 50글자 이내로 입력해야 합니다.')){
					return;
				}
			}
			
			if(valueCheck(textareaRoomInfo, '객실 소개를 입력해주세요.')){
				return;
			}else{
				let regex4 = new RegExp("^.{50,300}$","s");
				if(valueLengthCheck(regex4, textareaRoomInfo, '객실 소개는 50자 이상 300자 이내로 입력해주세요.')){
					return;
				}
			}
			
			if(inputFiles.value == ''){
				picCheck('사진 파일을 업로드 해주세요.');
				return;
			}
			
			// roomOption 체크박스 확인
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
	
	// 업로드 사진 미리보기
	function setThumbnail(event) {
		document.querySelector("div.drag").style.display='none';
		document.querySelector('div[class=form_style]').style.backgroundColor='white';
		// 기존 사진 제거
		let imageContainer = document.querySelector("div#image_container");
		let images = document.querySelectorAll("#image_container img");
		images.forEach((image) => {
			imageContainer.removeChild(image);
		})
		
		var fileList = event.target.files;
		// 업로드 파일이 없으면 div.drag display:block;
		if(fileList.length == 0){
			document.querySelector("div.drag").style.display='block';
		}
		
		// 사진 파일 검사
		let regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif)")
		for(let i=0; i<fileList.length; i++){
			if(!regex.test(fileList[i].name) && fileList.length!=0){
				picCheck('사진파일만 업로드 가능합니다.');
				return;
			}
		}
		
		if(fileList.length < 2){
			picCheck('사진은 최소 2장 업로드 해야 합니다.');
			return;
		}
		
		if(fileList.length > 10){
			picCheck('스테이 사진은 최대 10장 등록  가능합니다.');
			return;
		}
		
		var totalSize = 0;
		for(let i=0; i<fileList.length; i++){
	        var reader = new FileReader();
	
	        reader.onload = function(event) {
	          var img = document.createElement("img");
	          img.setAttribute("src", event.target.result);
	          img.setAttribute("id", 'thumnailImg'+i);
	          img.style='width:150px; height:85px; padding:5px; border-radius:12px';
	       	  //document.querySelector("div#image_container").
	          document.querySelector("div#image_container").appendChild(img);
	        };
	        totalSize += event.target.files[i].size;
	        reader.readAsDataURL(event.target.files[i]);
	    }
		console.log('totalSize', totalSize);
		totalSize = (totalSize/(1024*1024)).toFixed(3);
		if(totalSize >= 30){
			picCheck('업로드 가능 용량이 초과되었습니다(30MB)');
			totalSize = 0;
			return;
		}
		document.querySelector("div[class=file_desc]").firstChild.textContent=totalSize;
		
	}
	
	// 사진 체크 후 조건에 걸렸을 때 실행될 함수
	function picCheck(msg){
		document.querySelector('div[class=drag]').innerHTML = msg;
		document.querySelector("div.drag").style.display='block';
		document.querySelector('div[class=drag]').focus();
		document.querySelector('input[name=files]').value='';
		document.querySelector('div[class=form_style]').style.backgroundColor='#eee';
	}
	
	// input value 빈문자열 혹은 띄어쓰기만 있는 경우 체크
	function valueCheck(doc, msg){
		if(doc.value == '' || regex.test(doc.value)){
			doc.value = '';
			doc.placeholder=msg;
			doc.style.backgroundColor='#eee';
			doc.focus();
			return true;
		}
	}

	// input value 길이 체크
	function valueLengthCheck(regex, doc, msg){
		if(!regex.test(doc.value)){
			doc.value = '';
			doc.placeholder=msg;
			doc.focus();
			doc.style.backgroundColor='#eee';
			return true;
		}
	}
	
	// 사진 업로드 미리보기 창 클릭 시 input:file 실행
	function fileUpload(){
		file_attach.click();
	}

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
								placeholder="room 이름을 입력해 주세요. (30자 이내)">
						</div></li>
					<li><div class="dt">객실 유형 *</div>
						<div class="dd">
							<select class="form_style" name="roomType" style="width:100%">
								<option selected="" value="">Type을 선택해 주세요.</option>
								<option value="렌탈하우스">렌탈하우스</option>
								<option value="펜션">펜션</option>
								<option value="한옥">한옥</option>
								<option value="호스텔">호스텔</option>
								<option value="민박">민박</option>
								<option value="호텔">호텔</option>
							</select>
						</div>
					</li>
					<li style="width:53%"><div class="dt">기준인원 *</div>
						<div class="dd" style="width:200px">
							<select style="width: 100%" class="form_style" name="stdPerson"><option
									selected="" value="">선택해 주세요</option>
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
					<li style="width:53%" id="liOverPerson">
						<div class="dt">최대인원 *</div>
						<div class="dd" style="width:200px" id="divOverPerson">
							<select style="width: 100%" class="form_style" name="overPerson">
								<option selected="" value="">선택해 주세요</option>
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
							<label for="babiqu" class="check_skin">
								<input type="checkbox" id="babiqu" value="Y" name="babiqu">
									<span style="font-size: 12px">바비큐</span>
								</label>
							<label for="kitchen" class="check_skin">
								<input type="checkbox" id="kitchen" value="Y" name="kitchen">
									<span style="font-size: 12px">부엌</span>
								</label>
							<label for="pet" class="check_skin">
								<input type="checkbox" id="pet" value="Y" name="pet">
									<span style="font-size: 12px">반려동물</span>
								</label>
							<label for="pool" class="check_skin">
								<input type="checkbox" id="pool" value="Y" name="pool">
									<span style="font-size: 12px">풀장</span>
								</label>
							<label for="terrace" class="check_skin">
								<input type="checkbox" id="terrace" value="Y" name="terrace">
									<span style="font-size: 12px">테라스</span>
								</label>
							<label for="parking" class="check_skin">
								<input type="checkbox" id="parking" value="Y" name="parking">
									<span style="font-size: 12px">주차장</span>
								</label>
							<label for="beamProjector" class="check_skin">
								<input type="checkbox" id="beamProjector" value="Y" name="beamProjector">
									<span style="font-size: 12px">빔프로젝터</span>
								</label>
						
						<div class="dd" style="width:200px; display:flex; padding-top:10px">
							<select style="width: 100%" class="form_style" value="Y" name="bed"><option
									selected="" value="">침구 갯수</option>
								<option value="0">0</option>
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
										src="/resources/images/room/roomphoto3.JPG"
										style="width: 100%;">
								</div>
							</div>
							<div class="col-6">
								<div class="p-1 bg-white">
									<img alt=""
										src="/resources/images/room/roomphoto2.JPG"
										style="width: 100%">
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
									<p class="_contactus_guide_title__ZyIpA">이미지 제출 가이드</p>
									<p class="_contactus_guide_list__ogEdb">• room 이미지 제출은 필수 사항 입니다.</p>
									<p class="_contactus_guide_list__ogEdb">• room 이미지는 최대 10장까지 제출 할 수 있습니다.</p>
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
								<div class="form_style" style="padding: 0; align-items: center" role="presentation"
									tabindex="0" id="image_container" onclick="fileUpload()">
									<div class="drag" role="button" style="cursor: pointer"
										tabindex="0">
										<i class="ico_addfile"></i>첨부파일 올리기/미리보기
									</div>
								</div>
								<div class="file_desc">
									0
									<!-- -->
									MB / 30 MB
									<div class="file_att" style="margin-top: -7px">
										<label for="file_attach"><img alt="file_upload_button"
											src="https://www.stayfolio.com/web/images/file_upload_button.svg"
											style="margin-bottom: 2px; margin-right: 6px">이미지
											첨부</label><input type="file" name="files" id="file_attach" multiple onchange="setThumbnail(event)"
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