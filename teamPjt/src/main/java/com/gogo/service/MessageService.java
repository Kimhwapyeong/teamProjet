package com.gogo.service;


import org.springframework.stereotype.Service;

import com.gogo.vo.MessageVO;

@Service
public interface MessageService {



	
	public int insertMessage(MessageVO vo);


}
