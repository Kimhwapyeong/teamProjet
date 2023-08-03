package com.gogo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gogo.service.StayService;

@Controller
@RequestMapping("/stay/*")
public class StayController {

	@Autowired
	StayService stayService;
	
	@GetMapping("list")
	public void getList(Model model) {
		stayService.stayList(model);
	}
	
	@GetMapping("room")
	public void roomInfo(String stayName , Model model) {
		stayService.stayRoomList(stayName, model);
		stayService.roomInfo(stayName, model);
	}
	
	@GetMapping("roomInfo")
	public void room(String stayName, String roomName, Model model) {
		stayService.roomInfoPageList(stayName, roomName, model);
		stayService.roomInfoPagePic(stayName, roomName, model);
	}
}
