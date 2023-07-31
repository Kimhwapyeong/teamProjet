package com.gogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gogo.mapper.StayMapper;
import com.gogo.vo.StayVO;

@Service
public class StayServiceImpl implements StayService{

	@Autowired
	StayMapper stayMapper;
	
	@Override
	public List<StayVO> stayList(int stayNo) {
		return stayMapper.stayList(stayNo);
	}

}
