package com.gogo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gogo.service.StayService;
import com.gogo.vo.StayVO;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class RestStayController {
	
	@Autowired
	StayService stayService;
	
	@GetMapping("/stay/keyword")
	public void keywordList(@RequestParam("stay") String stayName,
			@RequestParam("stayAdress") String stayAdress,
			@RequestParam("stayView") String stayView,
			@RequestParam("stdPerson") String stdPerson,
			@RequestParam("maxPrice") String maxPrice,
			@RequestParam("stayType") String stayType,
			@RequestParam("roomOption") String roomOption,
							Model model) {
		StayVO vo = new StayVO(); 
		vo.setStayName(stayName);
		vo.setStayAdress(stayAdress);
		vo.setStayView(stayView);
		vo.setStdPerson(stdPerson);
		vo.setMaxPrice(maxPrice);
		vo.setStayType(stayType);
		vo.setRoomOption(roomOption);
		
		stayService.stayKeywordList(vo, model);
	}
}
