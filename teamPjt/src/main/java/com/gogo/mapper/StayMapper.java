package com.gogo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import com.gogo.vo.FileuploadVO;
import com.gogo.vo.RoomPhotoVO;
import com.gogo.vo.StayVO;

public interface StayMapper {
	
	public List<StayVO> stayList();
	
	public List<StayVO> stayKeywordList(StayVO vo);
	
	public Map<String, String> roomInfo(String stayName);

	public List<Map<String, String>> stayRoomList(String stayName);
	
	public Map<String, String> roomInfoPageList(@Param("stayName")String stayName, @Param("roomName")String roomName);
	
	public List<RoomPhotoVO> roomInfoPagePic(@Param("stayName")String stayName, @Param("roomName")String roomName);
	
	public int insertLike(StayVO vo);
	
	public List<StayVO> likeId(StayVO vo);
	
	public int deleteLike(StayVO vo);
	
	public List<FileuploadVO>stayRoomImg(String stayName);
	
	public List<FileuploadVO> stayImgList();

	public List<StayVO> stayLocList(String stayLoc);
	
	public List<StayVO> likeIdRest(StayVO vo);
}
