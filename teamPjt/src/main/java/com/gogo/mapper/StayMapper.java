package com.gogo.mapper;

import java.util.List;
import java.util.Map;

import com.gogo.vo.StayVO;

public interface StayMapper {
	
	public List<StayVO> stayList();
	
	public Map<String, String> roomInfo(String stayName);

	public List<Map<String, String>> stayRoomList(String stayName);
}
