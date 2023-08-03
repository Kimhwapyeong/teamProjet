package com.gogo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gogo.mapper.StayMapper;
import com.gogo.vo.RoomPhotoVO;
import com.gogo.vo.StayVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class StayServiceImpl implements StayService{

	@Autowired
	StayMapper stayMapper;
	
	@Override
	public List<StayVO> stayList(Model model) {
		List<StayVO> list = stayMapper.stayList();
		
		log.info("===========");
		log.info("list : " + list);
		model.addAttribute("list", list);
		return null;
	}

	@Override
	public Map<String, String> roomInfo(String stayName, Model model) {
		Map<String, String> roomInfo = stayMapper.roomInfo(stayName);
		log.info("===========");
		log.info("list : " + roomInfo);
		model.addAttribute("list", roomInfo);
		return null;
	}

	@Override
	public List<Map<String, String>> stayRoomList(String stayName, Model model) {
		List<Map<String, String>> stayRoomInfo = stayMapper.stayRoomList(stayName);
		log.info("===========");
		log.info("stayRoomInfo : " + stayRoomInfo);
		model.addAttribute("stayRoomInfo", stayRoomInfo);
		return null;
	}

	@Override
	public Map<String, String> roomInfoPageList(String stayName, String roomName, Model model) {
		Map<String, String> roomInfo = stayMapper.roomInfoPageList(stayName, roomName);
		log.info("===========");
		log.info("roomInfo : " + roomInfo);
		model.addAttribute("roomInfo", roomInfo);
		return null;
	}

	@Override
	public List<RoomPhotoVO> roomInfoPagePic(String stayName, String roomName, Model model) {
		List<RoomPhotoVO> picList = stayMapper.roomInfoPagePic(stayName, roomName);
		log.info("===========");
		log.info("picList : " + picList);
		model.addAttribute("picList", picList);
		return null;
	}

	
}
