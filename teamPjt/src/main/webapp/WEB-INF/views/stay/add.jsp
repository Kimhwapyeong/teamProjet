<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>

<div id="contents">
	<div class="container sub_title">
		<div class="txt">Stay 등록</div>
	</div>
	<div class="store_apply">
		<form>
			<div class="store_apply_form">
				<ul class="form_dl">
					<li style="flex-direction: row"><span class="left">담당자
							정보</span><span class="right">* 필수 입력 항목</span></li>
					<li><div class="dt">담당자 성함 *</div>
						<div class="dd">
							<input type="text" class="form_style" name="owner_name" value=""
								placeholder="담당자 성함을 입력해 주세요.">
						</div></li>
					<li><div class="dt">담당자 전화번호 *</div>
						<div class="dd">
							<input type="text" class="form_style" name="phone" value=""
								placeholder="‘-’를 제외한 휴대전화번호를 입력해 주세요.">
						</div></li>
					<li><div class="dt">담당자 이메일 *</div>
						<div class="dd">
							<input type="text" class="form_style" name="email" value=""
								placeholder="담당자 이메일 주소를 입력해 주세요.">
						</div></li>
					<li><div class="dt">숙박업 경험 유무 *</div>
						<div class="dd">
							<label for="has-not-experience" class="radio_skin"><input
								type="radio" id="has-not-experience" name="not_experience_stay"><span
								style="font-size: 12px">경험 없음</span></label><label for="has-experience"
								class="radio_skin"><input type="radio"
								id="has-experience" name="experience_stay"><span
								style="font-size: 12px">경험 있음</span></label>
						</div></li>
					<div class="_contactus_divider__BZ5eb"></div>
					<li><div class="left">스테이 정보</div></li>
					<li><div class="dt">스테이 이름 *</div>
						<div class="dd">
							<input type="text" class="form_style" name="name" value=""
								placeholder="스테이 이름을 입력해 주세요.">
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
					<li><div class="dt">업종 *</div>
						<div class="dd">
							<select style="width: 100%" class="form_style" name="category"><option
									selected="" value="" disabled="" hidden="">업종을 선택해 주세요</option>
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
					<div class="_contactus_divider__BZ5eb"></div>
					<li><div class="left">동영상 및 이미지 제출</div></li>
					<div class="_contactus_video_image_guide__GJRiB">
						<div class="_contactus_video_div__FnIjL">
							<iframe
								src="https://www.youtube.com/embed/QB_pnFzeZmw?enablejsapi=1&amp;origin=https%3A%2F%2Fwww.stayfolio.com"
								title="STAYFOLIO No 023 누와_NUWA"
								class="_contactus_video_iframe__H366f" allowfullscreen=""
								data-gtm-yt-inspected-10="true" id="949712383"
								data-gtm-yt-inspected-13168943_11="true"></iframe>
						</div>
						<div class="_contactus_video_guide__Xu0fB">
							<p class="_contactus_guide_title__ZyIpA">동영상 제출 가이드</p>
							<p class="_contactus_guide_list__ogEdb" style="font-weight: bold">•
								최소 1개 이상 영상을 제출해 주세요. (최대 3개 제출 가능)</p>
							<p class="_contactus_guide_list__ogEdb">• 실내 조명을 모두 켠 상태로 촬영해
								주세요.</p>
							<p class="_contactus_guide_list__ogEdb">• 한 영상에서 모든 공간이 나타나도록
								원 테이크로 촬영해 주세요.</p>
							<p class="_contactus_guide_sub_list__srBT5">(공간이 멀리 떨어져있는 경우
								분할 촬영 가능)</p>
							<p class="_contactus_guide_list__ogEdb">• 숙소 실내/외 모습을 파악할 수
								있도록 촬영해 주세요.</p>
							<p class="_contactus_guide_sub_list__srBT5">￮ 주변과 외관: 주차장,
								대문, 마당, 입구 등</p>
							<p class="_contactus_guide_sub_list__srBT5">￮ 실내: 거실, 주방, 침실,
								화장실 및 부대시설 등</p>
						</div>
						<div class="_contactus_image_div__7cvYh">
							<img width="48%" alt="firstImage"
								src="/web/images/firstImage.jpg"><img width="48%"
								alt="secondImage" src="/web/images/secondImage.jpg">
						</div>
						<div class="_contactus_image_guide__XdOKT">
							<p class="_contactus_guide_title__ZyIpA">이미지 제출 가이드</p>
							<p class="_contactus_guide_list__ogEdb">• 이미지 제출은 선택사항입니다.</p>
							<p class="_contactus_guide_list__ogEdb">• 영상에서 보여주지 못한 이미지를
								자유롭게 첨부해 주세요.</p>
							<p class="_contactus_guide_sub_list__srBT5">￮ 숙소의 기획의도, 특징 등</p>
							<p class="_contactus_guide_sub_list__srBT5">￮ 숙소의 디테일, 경험 등</p>
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
											src="/web/images/file_upload_button.svg"
											style="margin-bottom: 2px; margin-right: 6px">동영상 / 이미지
											첨부</label><input type="file" id="file_attach" multiple=""
											accept="image/png,image/gif,image/jpg,image/jpeg,image/webp,image/tif,image/tiff,image/bmp,video/mp4,application/pdf,video/quicktime">
									</div>
								</div>
								<p style="font-size: 12px; margin-top: 15px; color: #808080">*
									대용량 파일의 경우 업로드까지 3분 이상 소요될 수 있습니다.</p>
							</div>
						</div></li>
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
		</form>
	</div>
</div>

<jsp:include page="../common/footer.jsp"/>