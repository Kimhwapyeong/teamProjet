package com.gogo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gogo.vo.StayVO;

@Service
public interface StayService {

	List<StayVO> stayList(Model model);
}
