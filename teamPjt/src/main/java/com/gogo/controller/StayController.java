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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gogo.service.StayService;
import com.gogo.vo.StayVO;

@Controller
@RequestMapping("/stay/*")
public class StayController {

	@Autowired
	StayService stayService;
	
	@GetMapping("list")
	public void getList(String stayLoc, Model model, HttpServletRequest request) {
		StayVO vo = new StayVO();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memberId");
		if(id != null) {
			vo.setMemberId(id);
		}else {
			vo.setMemberId("");
		}
		if(stayLoc != null && !stayLoc.contentEquals("")) {
			stayService.stayLocList(stayLoc, model);
		}else {
			stayService.stayList(model);
		}
		stayService.likeId(vo, model);
		stayService.stayImgList(model);
	}
	
	@GetMapping("room")
	public void roomInfo(String stayName , Model model, HttpServletRequest request) {
		stayService.stayRoomList(stayName, model);
		stayService.roomInfo(stayName, model);
		stayService.stayRoomImg(stayName, model);
		
		StayVO vo = new StayVO();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memberId");
		if(id != null) {
			vo.setMemberId(id);
		}else {
			vo.setMemberId("");
		}
		stayService.likeId(vo, model);
	}
	
	@GetMapping("roomInfo")
	public void room(String stayName, String roomName, Model model) {
		stayService.roomInfoPageList(stayName, roomName, model);
		stayService.roomInfoPagePic(stayName, roomName, model);
	}
	
	
	
	
	
	/*
	 * @GetMapping("keyword") public void stayKeywordList(String , Model model) {
	 * stayService.stayKeywordList(vo, model); }
	 */
	/*
	 * @GetMapping("keyword") public void zz() {
	 * 
	 * }
	 */
}
