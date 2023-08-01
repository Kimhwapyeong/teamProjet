package com.gogo.service;

import org.springframework.stereotype.Service;

import com.gogo.vo.RoomOptionVO;
import com.gogo.vo.RoomVO;
import com.gogo.vo.StayVO;

@Service
public interface MainService {

	public int insert(StayVO vo);
	
	public int insertRoom(RoomVO vo, RoomOptionVO optionVO);
	
}
