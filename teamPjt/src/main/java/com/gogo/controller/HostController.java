package com.gogo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gogo.service.MessageService;
import com.gogo.service.ReservedService;
import com.gogo.service.myPagingService;
import com.gogo.service.mypageService;
import com.gogo.vo.AnswerVO;
import com.gogo.vo.Criteria;
import com.gogo.vo.PageDto;
import com.gogo.vo.QuestionVO;
import com.gogo.vo.ReservedVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/host/*")
public class HostController extends CommonRestController{
	
	@Autowired
	mypageService mypageService;
	
	@Autowired
	MessageService service_msg;
	
	@Autowired
	ReservedService service_r;
	
	@Autowired
	myPagingService paging;
	
	// 숙소 관리
	@GetMapping(value = {"stayhost", "roomInfo"})
	public String stayhost(Model model, Criteria cri, HttpServletRequest request) {
		mypageService.getStay(model);
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		log.info("memberId : " + memberId);
		
		mypageService.roomInfo(memberId, model);
		
		return "member/host/stayhost";
	}
	
	// 객실 삭제
	@GetMapping("deleteRoom")
	public String delete(Model model, RedirectAttributes rttr, String roomName) {
		System.out.println("roomName: " + roomName);
		return null;
//		int res = mypageService.deleteRoom(roomName);
//		System.out.println("삭제res:" + res);
//		
//		String msg = "";
//		if(res > 0) {
//			msg = roomName + "객실이 삭제되었습니다";
//			rttr.addFlashAttribute("msg", msg);  
//			return "redirect:/member/host/stayhost";
//		} else {
//			msg = "객실 삭제에 실패하였습니다";
//			rttr.addFlashAttribute("msg", msg);  
//			return "redirect:/member/host/stayhost";
//		}
	}
	
	// 예약 관리
	@GetMapping("reservation")
	public void reservation(Model model) {
		mypageService.reservinfo(model);
		mypageService.reservpic(model);
	}
	
	// 수입 현황
	@GetMapping("income")
	public String income() {
		return "/member/host/profit";
	}
	
	// 수입 현황
	@RequestMapping("profit")
	public @ResponseBody List<ReservedVO> profit(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		
		String memberId = (String)session.getAttribute("memberId");
		List<ReservedVO> list = mypageService.profit(memberId);
		model.addAttribute("chart", list);
		
		log.info("============");
	    log.info("chart : " + list);
	    return list;
	}
	
	
	// 호스트 가이드
	@GetMapping("guide")
	public void guide() {
		
	}
	
	// 호스트 가이드 -문의
	@PostMapping("write")
	public String insert(QuestionVO qa, Model model, RedirectAttributes rttr) {
		int res;
	
		String msg = "";
		res = mypageService.insert(qa);
		
		if(res > 0) {
			msg="문의 되었습니다";
			rttr.addFlashAttribute("msg", msg);  
			return "redirect:/member/host/qaList";
		} else {
			return "redirect:/member/host/guide";
		}
	}
	
	
	// 문의 목록 -> 답변 있을 시 답변 출력
	@GetMapping("qaList")
	public void qaList(Model model, QuestionVO vo) {
		List<QuestionVO> question = mypageService.qaList(model, vo);
		
		
		
//	    model.addAttribute("answer", answer);
	    
	}
	
	
	// admin 답변 출력
	@GetMapping(value = {"answer", "answerInfo"})
	   public String answer(QuestionVO vo, Model model){
	    QuestionVO que = mypageService.getOne(vo.getQueNo());
	    model.addAttribute("que", que);

	    AnswerVO answer = mypageService.answerInfo(vo.getQueNo());
	    model.addAttribute("answer", answer);
	    
	    log.info("==============");
	    log.info("답 : " + answer);
	    
	    return "member/host/answer";
	   }
	
	// 호스트 스테이 메세지 관리
	@GetMapping("message")
	public void message(Model model
						, HttpSession session
						, @RequestParam(required=false, name="pageNo", defaultValue = "1")
								int pageNo) {
		
		String memberId = (String)session.getAttribute("memberId");
		
		
		service_msg.chatListGet(model, memberId, pageNo);
	}
	
	
}
