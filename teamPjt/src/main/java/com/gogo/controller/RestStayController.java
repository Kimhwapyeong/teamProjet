package com.gogo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public Map<String, Object> keywordList(@RequestBody StayVO vo, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<StayVO> list = stayService.stayKeywordList(vo, model);
		System.out.println(list);
		map.put("list", list);
		return map;
	}
	
	@GetMapping("category/{encodedCategoryName}")
	public Map<String, Object> categoryList(@PathVariable("encodedCategoryName") String encodedCategoryName, Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		StayVO vo = new StayVO();
		vo.setCategory(encodedCategoryName);
		List<StayVO> list = stayService.stayKeywordList(vo, model);
		map.put("list", list);
		return map;
	}
	
	@PostMapping("insertLike")
	public Map<String, Object> insertLike(@RequestBody StayVO vo, Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		int res = stayService.insertLike(vo);
		return map;
	}
	
	@PostMapping("deleteLike")
	public Map<String, Object> deleteLike(@RequestBody StayVO vo, Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		int res = stayService.deleteLike(vo);
		return map;
	}
}
