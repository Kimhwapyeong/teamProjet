package com.gogo.test;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gogo.mapper.mypageMapper;
import com.gogo.vo.MemberVO;
import com.gogo.vo.QuestionVO;
import com.gogo.vo.ReservedVO;
import com.gogo.vo.StayVO;

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
	
	@Test
	public void getStay() {
		List<StayVO> list = mapper.getStay();
		log.info("=========");
		log.info("list : " + list);
	}
	
	@Test
	public void reserveinfo() {
		List<ReservedVO> list = mapper.reservinfo();
		log.info("list : " + list);
	}
	
	@Test
	public void reservpic() {
		List<Map<String, String>> list = (List<Map<String, String>>) mapper.reservpic();
		log.info("=========");
		log.info("list : " + list);
	}
	
	@Test
	public void insert() {
		QuestionVO qa = new QuestionVO();
		qa.setQueNo(4);
		qa.setMemberId("user1");
		qa.setTitle("제목");
		qa.setContent("내용");
		//qa.setContentDate(new Date());
		
		mapper.insert(qa);
	}
	
	@Test
	public void qaList() {
		List<QuestionVO> list = mapper.qaList();
		log.info("=========");
		log.info("list : " + list);
	}
	
	@Test
	public void getOne() {
		QuestionVO one = mapper.getOne(1);
		log.info("=========");
		log.info("one : " + one);
	}
	
}
