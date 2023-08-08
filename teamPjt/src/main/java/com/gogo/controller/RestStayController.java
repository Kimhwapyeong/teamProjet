package com.gogo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gogo.service.StayService;
import com.gogo.vo.StayVO;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/stst/*")
public class RestStayController {
	
	@Autowired
	StayService stayService;
	
	@PostMapping("keyword")
//	public void keywordList(@RequestParam("stayName") String stayName,
//			@RequestParam("stayAdress") String stayAdress,
//			@RequestParam("stayView") String stayView,
//			@RequestParam("stdPerson") String stdPerson,
//			@RequestParam("maxPrice") String maxPrice,
//			@RequestParam("stayType") String stayType,
//			@RequestParam("roomOption") String roomOption,
//			@RequestParam("findStartDate") String findStartDate,
//			@RequestParam("findEndDate") String findEndDate,
	public Map<String, Object> keywordList(@RequestBody StayVO vo, Model model) {
//		StayVO vo = new StayVO(); 
//		vo.setStayName(stayName);
//		vo.setStayAdress(stayAdress);
//		vo.setStayView(stayView);
//		vo.setStdPerson(stdPerson);
//		vo.setMaxPrice(maxPrice);
//		vo.setStayType(stayType);
//		vo.setRoomOption(roomOption);
//		vo.setRoomOption(findStartDate);
//		vo.setRoomOption(findEndDate);
		Map<String, Object> map = new HashMap<String, Object>();
		List<StayVO> list = stayService.stayKeywordList(vo, model);
		System.out.println(list);
		map.put("list", list);
		return map;
	}
}
