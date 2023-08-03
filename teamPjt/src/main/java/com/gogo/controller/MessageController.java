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
	public void chatGet(@RequestParam(required = false) String roomId
						, HttpSession session
						, Model model) throws Exception {
		
		service.chattingGet(roomId ,session, model);
		
	}
	

	
	@PostMapping("insertChat")
	@ResponseBody
	public Map<String, Object> insertChat(@RequestBody Map<String, Object> map) {
		
		
		return service.insertChatting(map);
		
		
	}
	
}
