package com.gogo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gogo.service.MessageService;
import com.gogo.vo.MessageVO;


@Controller
@RequestMapping("/chat/*")
public class MessageController {
	
	@Autowired
	MessageService service;
	
	@GetMapping("chat")
	public void chatGet() {
		
		System.out.println("@ChatController, chat GET()");
		
		
	}
	
	
	@PostMapping("insertChat")
	@ResponseBody
	public Map<String, Object> insertChat(@RequestBody Map<String, Object> map) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		System.out.println(map+"호출 성공");
		MessageVO vo = new MessageVO();
		
		vo.setContent(String.valueOf(map.get("content")));
		vo.setRegDate(String.valueOf(map.get("regDate")));
		vo.setWriter(String.valueOf(map.get("writer")));
		vo.setMessageRoom("1");
		int res = service.insertMessage(vo);
		
		if(res>0) {
			System.out.println("메세지 vo 저장 성공");
			result.put("vo", vo);
			result.put("msg", "메세지 저장 성공");
		} else {
			System.out.println("메세지 vo 저장 실패!");
			result.put("msg", "메세지 저장 실패");
		}
		
		return result;
		
		
	}
	
}
