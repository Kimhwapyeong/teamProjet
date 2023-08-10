package com.gogo.mapper;

import java.util.List;

import com.gogo.vo.MessageRoomVO;
import com.gogo.vo.MessageVO;

public interface MessageMapper {
	
	
	public int insertMessage(MessageVO vo);
	public List<MessageVO> getList(String roomId);
	
	public String getSysdate();
	
	public int insertMessageRoom(); 
	public int insertMessageRoomCustom(String roomId);
	
	
	public String getRoomId(String roomId);
	
	public String getNewRoomId();
	
	public int joinYN(MessageVO vo); // 입 퇴장 기록이 있는지 체크
	public int joinYN2(MessageVO vo); // 입 퇴장 기록이 있는지 체크
	
	// TALK 가 두개 이상인 roomID 의 모든 정보 (방 개설자도..)
	public List<MessageRoomVO> messageRoomList(String memberId);
	
	public List<MessageRoomVO> messageRoomListUser(String memberId);
	
	
	// 방 개설자 구하기
	public String getMessageRoomOwner(String roomId);
	
}
