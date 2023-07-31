package com.gogo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gogo.vo.StayVO;

@Service
public interface StayService {

	List<StayVO> stayList(int stayNo);
}
