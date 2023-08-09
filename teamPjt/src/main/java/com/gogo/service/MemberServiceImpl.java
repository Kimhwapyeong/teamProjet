package com.gogo.service;



import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.gogo.mapper.MemberMapper;
import com.gogo.vo.MemberRoleVO;
import com.gogo.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;

	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Override
	public MemberVO login(MemberVO paramMember) {
		// 사용자 정보 조회
		MemberVO member = memberMapper.login(paramMember);
		
		if(member != null) {
			// 사용자가 입력한 비밀번호가 일치하는지 확인
			// 사용자가 입력한 비밀번호, 데이터베이스에 암호화되어 저장된 비밀번호
			boolean res = 
					encoder.matches(paramMember.getPw(), member.getPw());
			
			// 비밀번호 인증이 성공하면 member객체를 반환
			if(res) {
				// 사용자 권한을 조회
				member.setRole(memberMapper.getMemberRole(member.getMemberId()));
				
				return member;
			}
		}
		return member;
	}
	@Override
	public int signupAction(MemberVO member) {
		
		// 암호화된 비번을 다시 비번에 넣어줌
		member.setPw(encoder.encode(member.getPw()));
		
		System.out.println("pw : "+ member.getPw());
		// Mapper의 쿼리 호출
		return memberMapper.signupAction(member);
	}

	@Override
	public int idCheck(MemberVO member) {
		return memberMapper.idCheck(member);
	}
	
	@Override
	public void insertMemberRole(MemberRoleVO memberRole) {
	    // 회원 역할 정보 저장 로직
	    memberMapper.insertMemberRole(memberRole);
	}
	
	@Override
	public int updateNaver(MemberVO member) {
		return memberMapper.updateNaver(member);
	}
	@Override
	public String getPw(MemberVO member) {
		return memberMapper.getPw(member);
	}
	@Override
	public MemberVO selectOne(MemberVO member) {
		return memberMapper.selectOne(member);
	}
	@Override
	public String findIdAction(MemberVO member) {
		return memberMapper.findIdAction(member);
	}
	// 비밀번호 찾기 
	@Override
	public int findPwAction(MemberVO member) {
		return memberMapper.findPwAction(member);
	}
	@Override
	public void passwordUpdate(MemberVO member) {
		memberMapper.passwordUpdate(member);
	}
	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(MemberVO member, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; 
		String hostSMTPid = "goddns815@naver.com"; // 보내는 사람 이메일 주소
		String hostSMTPpwd = "5bG-Qy3-X0E-oQp"; // 보내는 사람 이메일 비번

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "goddns815@naver.com"; // 보내는 사람 이메일주소(받는 사람 이메일에 표시됨)
		String fromName = "STAY OLLE GALLE";
		String subject = "";
		String msg = "";

		if(div.equals("findPwAction")) {
			subject = "스테이 올래갈래 임시 비밀번호 입니다.";
			msg += "<div style=\"text-align: center; width: 470px; height: 850px; line-height: 70px;\">";
			msg += "<img src=\"https://i.ibb.co/M7mS3X2/stay2.png\" alt=\"Facebook Logo\" height=\"33\" style='max-width: 100%; height: auto;'>";
			msg += "<p style=\"color:#565a5c;font-size:18px;\">"+member.getMemberName()+"님, 안녕하세요.</p>";
			msg += "<p style=\"color:#565a5c;font-size:18px;\">STAY OLLAE에 다시 로그인할 수 있는 방법을 안내해 드리겠습니다.</p>";
			msg += "<p style=\"color:#565a5c;font-size:18px;\">임시 비밀번호를 통해 로그인을 시도해 주세요!</p>";
			msg += "<p style=\"color:#565a5c;font-size:32px;\">"+member.getPw()+"</p>";
			msg += " <p style=\"color:#565a5c;font-size:16px;\">\r\n" + 
					"            로그인 링크나 비밀번호 재설정을 요청하지 않은 경우 이 메시지를 무시하고 ";
			msg += "<a href=\"https://www.google.com/search?q=%EB%8B%88+%EC%95%8C%EC%95%84%EC%84%9C+%ED%95%B4%EB%9D%BC&sxsrf=AB5stBgrmFyK4Y01FqLnq9wBDtGVcOgngQ%3A1691547017698&source=hp&ei=ifXSZLnTKM3m1e8P9_6esA8&iflsig=AD69kcEAAAAAZNMDmX_RLDzcxmiHaOOB3o_gIut_TU8A&ved=0ahUKEwj5u-_Yv86AAxVNc_UHHXe_B_YQ4dUDCAs&uact=5&oq=%EB%8B%88+%EC%95%8C%EC%95%84%EC%84%9C+%ED%95%B4%EB%9D%BC&gs_lp=Egdnd3Mtd2l6IhTri4gg7JWM7JWE7IScIO2VtOudvDIFEAAYgARI3RdQAFiSF3AIeACQAQKYAYUBoAG9EaoBBDEuMTm4AQPIAQD4AQGoAgrCAgcQIxiKBRgnwgIEECMYJ8ICCxAAGIAEGLEDGIMBwgIREC4YgAQYsQMYgwEYxwEY0QPCAgsQLhiABBixAxiDAcICBxAjGOoCGCfCAgQQLhgDwgIIEAAYgAQYsQPCAg4QLhiABBixAxjHARjRA8ICCBAuGIAEGLEDwgIFEC4YgATCAggQLhiABBjUAsICCRAAGA0YExiABMICCBAAGB4YDRgTwgIKEAAYCBgeGA0YE8ICChAAGB4YDRgTGArCAgoQABgFGB4YDRgTwgIHEAAYDRiABMICCBAAGAgYHhgNwgIKEAAYBRgeGA0YD8ICBBAAGB7CAgYQABgFGB7CAggQABgFGB4YD8ICBhAAGAgYHg&sclient=gws-wiz\" style=\"color:#1b74e4;text-decoration:none;\">메시지를 받은 이유에 대해 자세히 알아보세요</a>.";
			msg += "</p>";
			msg += "<img src=\"https://static.xx.fbcdn.net/rsrc.php/v3/y3/r/Bqo9-L659wB.png\" alt=\"Facebook Logo\" height=\"26\" width='52'>";
			msg += " <p style=\"color:#abadae;font-size:11px;\">© STAY OLLE. Meta Platforms, Inc., 1601 Willow Road, HWA YOU, CA 94025</p>";
			msg += "</div>";
		} 
		if(div.equals("signupAction")) {
			subject = "스테이 올래갈래 회원이 되신걸 환영합니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h4 style='color: green;'>";
			msg += member.getMemberName()+"님 환영합니다.</h4>";
			msg += "스테이 올래갈래와 함께 멋진 순간을 만들어봐요!<br>";
			msg += "<a href='http://localhost:8080/main'>OLLE GALLE 바로가기</a></p></div>";
		} 

		// 받는 사람 E-Mail 주소
		String mail = member.getMemberEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	


	

	
}


















