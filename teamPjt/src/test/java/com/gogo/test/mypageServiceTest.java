package com.gogo.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gogo.service.mypageService;
import com.gogo.vo.MemberVO;
import com.gogo.vo.QuestionVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class mypageServiceTest {

	@Autowired
	mypageService service;
	
	@Test
	public void getMember() {
		//List<MemberVO> member = service.getMember();
		log.info("========");
		//log.info("member : " + member);
	}
	

	
}
