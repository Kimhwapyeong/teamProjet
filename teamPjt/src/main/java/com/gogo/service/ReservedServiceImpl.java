package com.gogo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gogo.mapper.ReservedMapper;
import com.gogo.vo.ReservedVO;
import com.gogo.vo.RoomVO;
import com.gogo.vo.StayVO;

@Service
public class ReservedServiceImpl implements ReservedService{
	
	@Autowired
	ReservedMapper reservedMapper;
	
	
	@Override
	public int insertReserved(ReservedVO vo) {
		
		return reservedMapper.insertReserved(vo);
	}


	@Override
	public RoomVO selectOne_room(String roomNo) {
		return reservedMapper.selectOne_room(roomNo);
	}


	@Override
	public StayVO selectOne_stay(String stayNo) {
		return reservedMapper.selectOne_stay(stayNo);
	}


	@Override
	public String reservedDay(String reservationNo) {
		return reservedMapper.reservedDay(reservationNo);
	}


	@Override
	public String reservedDay2(String checkIn, String checkOut) {
		return reservedMapper.reservedDay2(checkIn, checkOut);
	}
		
}
