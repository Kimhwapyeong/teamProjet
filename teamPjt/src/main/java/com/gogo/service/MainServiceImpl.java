package com.gogo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gogo.mapper.MainMapper;
import com.gogo.vo.StayVO;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainMapper mainMapper;
	
	@Override
	public int insert(StayVO vo) {
		
		return mainMapper.insert(vo);
	}

}
