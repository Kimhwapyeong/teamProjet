package com.gogo.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.WebSocketSession;

import com.gogo.service.MessageService;
import com.gogo.vo.MessageRoomVO;
import com.gogo.vo.MessageVO;
import com.gogo.webSocket.EchoHandler;


@Controller
@RequestMapping("/chat/*")
public class MessageController {
	
	@Autowired
	MessageService service;

	
	
	@GetMapping("chat")
	public void chatGet(@RequestParam String roomId
						, HttpSession session
						, Model model) throws Exception {
		
		String check = service.getRoomId(roomId);
		if(check==null || "".equals(check)) {
			
			service.insertMessageRoom();
		}
	
		
		
		String memberId = (String)session.getAttribute("memberId");
		
		System.out.println(memberId+"님 "+roomId+"번 채팅방 입장");
		
		String enter = memberId+"님 "+roomId+"번 채팅방 입장";
		
		model.addAttribute("enter", enter);
		
		
	}
	

	
	@PostMapping("insertChat")
	@ResponseBody
	public Map<String, Object> insertChat(@RequestBody Map<String, Object> map) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		
		
		
		System.out.println(map+"호출 성공");
		MessageVO vo = new MessageVO();
		
		if(map.get("enterMsg")!=null && !"".equals(map.get("enterMsg"))) {
			
			vo.setContent(String.valueOf(map.get("enterMsg")));
		} else {
			
			vo.setContent(String.valueOf(map.get("content")));
		}
		
		
		vo.setRegDate(String.valueOf(map.get("regDate")));
		vo.setWriter(String.valueOf(map.get("writer")));
		vo.setMessageRoom(String.valueOf(map.get("roomId")));
		vo.setType(String.valueOf(map.get("type")));
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
