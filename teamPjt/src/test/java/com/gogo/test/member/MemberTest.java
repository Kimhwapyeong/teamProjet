package com.gogo.test.member;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gogo.mapper.MemberMapper;
import com.gogo.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberTest {
	
	@Autowired
	MemberMapper memberMapper;
	
	@Test
	public void test() {
		MemberVO member = new MemberVO();
		member.setMemberId("admin");
		member.setPw("1234");
		
		member = memberMapper.login(member);
		
		log.info(member);
		assertNotNull(member);
	}
	
//	@Test
//	public void testInsert() {
//		Member member = new Member();
//		member.setId("test1");
//		member.setPw("1234");
//		member.setName("name1");
//		
//		int res = memberMapper.insert(member);		
//		
//		assertEquals(1, res);
//	}
//	
//	@Test
//	public void testIdCheck() {
//		Member member = new Member();
//		member.setId("test");
//		
//		int res = memberMapper.idCheck(member);		
//		
//		assertEquals(1, res);
//	}
//	
//	@Test
//	public void testGetMemberRole() {
//		List<String> list = memberMapper.getMemberRole("adminaa");
//		System.out.println(list);
//		System.out.println("관리자권한 : " + list.contains("ADMIN_ROLE"));
//	}
}















