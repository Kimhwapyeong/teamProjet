package com.gogo.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gogo.mapper.mypageMapper;
import com.gogo.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class mypageTest {

	@Autowired
	mypageMapper mapper;
	
	@Test
	public void getMember() {
		List<MemberVO> member = mapper.getMember();
		log.info("=========");
		log.info("member : " + member);
	}
	
}
