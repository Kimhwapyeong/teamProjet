package com.gogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gogo.mapper.StayMapper;
import com.gogo.vo.StayVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class StayServiceImpl implements StayService{

	@Autowired
	StayMapper stayMapper;
	
	@Override
	public List<StayVO> stayList(Model model) {
		List<StayVO> list = stayMapper.stayList();
		
		log.info("===========");
		log.info("list : " + list);
		model.addAttribute("list", list);
		return null;
	}
}
