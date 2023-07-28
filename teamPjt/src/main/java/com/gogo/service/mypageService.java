package com.gogo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gogo.vo.StayVO;

import lombok.extern.log4j.Log4j;

@Service
public interface mypageService {

	// =========================== admin =================
		public List<StayVO> getList(Model model);
}
