package com.gogo.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gogo.vo.RoomPhotoVO;
import com.gogo.vo.StayVO;

@Service
public interface StayService {

	List<StayVO> stayList(Model model);
	
	Map<String, String> roomInfo(String stayName, Model model);
	
	List<Map<String, String>> stayRoomList(String stayName, Model model);
	
	Map<String, String> roomInfoPageList(@Param("stayName")String stayName, @Param("roomName")String roomName, Model model);
	
	List<RoomPhotoVO> roomInfoPagePic(@Param("stayName")String stayName, @Param("roomName")String roomName, Model model);
}
