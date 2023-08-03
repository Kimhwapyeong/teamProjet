package com.gogo.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gogo.vo.StayVO;

@Service
public interface StayService {

	List<StayVO> stayList(Model model);
	
	Map<String, String> roomInfo(String stayName, Model model);
	
	List<Map<String, String>> stayRoomList(String stayName, Model model);
}
