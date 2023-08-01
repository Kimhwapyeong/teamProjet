package com.gogo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.gogo.service.MainService;
import com.gogo.vo.RoomOptionVO;
import com.gogo.vo.RoomVO;
import com.gogo.vo.StayVO;

@Controller
public class MainController {

	@Autowired
	MainService mainService;
	
	@GetMapping("/main")
	public void getMain() {
		
	}
	
	// 임시 매핑용
	@GetMapping("/addstay")
	public String addStay() {
		
		return "/stay/addstay";
	}

	// 임시
	@PostMapping("/addStayAction")
	public String addStayAction(StayVO vo, Model model) {
		
		int res = mainService.insert(vo);
		if(res > 0) {
			model.addAttribute("msg", "숙소 등록 완료");
		}else {
			model.addAttribute("msg", "숙소 등록 실패");
		}
		
		return "/main";
	}
	
	@PostMapping("/addRoomAction")
	public String addRoomAction(RoomVO roomVO
						, RoomOptionVO optionVO, Model model) {
		
		int res = mainService.insertRoom(roomVO, optionVO);
		if(res > 0) {
			model.addAttribute("msg", "room 등록 완료");
		}else {
			model.addAttribute("msg", "room 등록 실패");
		}
		return "/main";
	}
	
	// 임시 매핑용
	@GetMapping("/addroom")
	public String addRoom() {
		
		return "/stay/addroom";
	}
	
	// 임시 매핑용
	@GetMapping("/editstay")
	public String editStay() {
		
		return "stay/editstay";
	}

	// 임시 매핑용
	@GetMapping("/editroom")
	public String editRoom() {
		
		return "stay/editroom";
	}
	
	@GetMapping("/joosoSearch")
	public String joosoSearch() {
		return "stay/joosoSearch";
	}
	
	@GetMapping("/fileupload")
	public String fileupload() {
		
		return "/fileupload";
	}
	
	@PostMapping("/fileuploadAction")
	public String fileuploadAction(List<MultipartFile> files, String stayNo, String roomNo) {
		
		int res = mainService.roomFileupload(files, stayNo, roomNo);
		System.out.println("maincontroller : " + res);
		return "/fileupload";
	}

}
