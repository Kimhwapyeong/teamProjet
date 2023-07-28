package com.gogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gogo.mapper.mypageMapper;
import com.gogo.vo.StayVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class mypageServiceImpl implements mypageService {
	
	@Autowired
	mypageMapper mypageMapper;
	// =========================== admin =================
	@Override
		public List<StayVO> getList(Model model) {
			List<StayVO> list =mypageMapper.getList();
			log.info("===========");
			log.info("list : " + list);
			model.addAttribute("list", list);
			return null;
			
		}
}
