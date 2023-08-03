package com.gogo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gogo.vo.RoomPhotoVO;
import com.gogo.vo.StayVO;

public interface StayMapper {
	
	public List<StayVO> stayList();
	
	public Map<String, String> roomInfo(String stayName);

	public List<Map<String, String>> stayRoomList(String stayName);
	
	public Map<String, String> roomInfoPageList(@Param("stayName")String stayName, @Param("roomName")String roomName);
	
	public List<RoomPhotoVO> roomInfoPagePic(@Param("stayName")String stayName, @Param("roomName")String roomName);
}
