package com.gogo.test;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gogo.mapper.StayMapper;
import com.gogo.mapper.TestMapper;
import com.gogo.vo.StayVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class roomTest {

	@Autowired
	StayMapper sm;
	
	
	@Test
	public void stayList() {
		List<StayVO> list = sm.stayList();
		log.info("=========");
		log.info(list);
	}
}
