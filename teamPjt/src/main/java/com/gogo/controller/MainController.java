package com.gogo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gogo.service.MainService;
import com.gogo.vo.FileuploadVO;
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
	public String addStayAction(StayVO vo, List<MultipartFile> files, RedirectAttributes rttr) {
		
		int res = mainService.insertStay(vo, files);
		if(res > 0) {
			rttr.addFlashAttribute("msg", "숙소 등록 완료");
		}else {
			rttr.addFlashAttribute("msg", "숙소 등록 실패");
		}
		
		return "redirect:/main";
	}
	
	// 임시 매핑용
	@GetMapping("/addroom")
	public String addRoom() {
		
		return "/stay/addroom";
	}

	@PostMapping("/addRoomAction")
	public String addRoomAction(RoomVO roomVO
						, RoomOptionVO optionVO
						, String stayNo
						, List<MultipartFile> files
						, RedirectAttributes rttr) {
		
		int res = mainService.insertRoom(roomVO, optionVO, files, stayNo);
		if(res > 0) {
			rttr.addFlashAttribute("msg", "room 등록 완료");
		}else {
			rttr.addFlashAttribute("msg", "room 등록 실패");
		}
		return "redirect:/main";
	}
	
	// 임시 매핑용
	@GetMapping("/editstay")
	public String editStay(StayVO vo, Model model) {
		
		mainService.getStay(vo, model);
		
		return "stay/editstay";
	}
	
	public String editStayAction(StayVO vo, List<MultipartFile> files, Model model) {
		
		
				// 마이페이지로 포워드
		return "/main";
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

	// fileupload test용
//	@PostMapping("/fileuploadAction")
//	public String fileuploadAction(List<MultipartFile> files, FileuploadVO vo) {
//		
//		int res = mainService.roomFileupload(files, vo);
//		System.out.println("maincontroller : " + res);
//		return "/fileupload";
//	}

}
