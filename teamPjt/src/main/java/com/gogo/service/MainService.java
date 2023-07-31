package com.gogo.service;

import org.springframework.stereotype.Service;

import com.gogo.vo.StayVO;

@Service
public interface MainService {

	public int insert(StayVO vo);
}
