package com.gogo.service;



import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.gogo.mapper.MemberMapper;
import com.gogo.vo.MemberVO;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;

	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Override
	public MemberVO loginAction(MemberVO paramMember) {
		// 사용자 정보 조회
		MemberVO member = memberMapper.loginAction(paramMember);
		
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
//			return memberMapper.loginAction(member);
		}
        // 로그인 실패
        return null;
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
	public void insertMemberRole(String memberId, String role_id) {
	    // 회원 역할 정보 저장 로직
	    memberMapper.insertMemberRole(memberId, role_id);
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
	@Override
	public List<String> getMemberRole(String memberId) {
		return memberMapper.getMemberRole(memberId);
	}
	
	
	// 이메일 발송
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
	
	// 카카오 API - Access token 요청
	// 화면에서 파라미터로 넘겨준 code값을 받아오고 POST로 요청을 보내서 토큰을 발급받기 
//	 public String getAccessToken(String authorize_code) {
//	     System.out.println("----------------------------토큰발급---------------------------");
//	     String access_Token = "";
//	     String refresh_Token = "";
//	     
//	     //토큰발급 요청을 보낼 주소
//	     String reqURL = "https://kauth.kakao.com/oauth/token";
//	        
//	        try {
//	            //URL객체 생성
//	            URL url = new URL(reqURL);
//	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//	            
//	            // POST 요청을 위해 기본값이 false인 setDoOutput을 true로 
//	            //.setDoOutput(true): URLConnection이 서버에 데이터출력할 수 있는 지의 여부를 설정
//	            conn.setRequestMethod("POST");
//	            conn.setDoOutput(true);
//	            
//	            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
//	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
//	            StringBuilder sb = new StringBuilder();
//	            
//	            sb.append("grant_type=authorization_code");
//	            sb.append("&client_id=7801f55d59a73a55013d6f22a1a3e9a1");
//	            sb.append("&redirect_uri=http://localhost:8080/login/kakaoAction");
//	            sb.append("&code=" + authorize_code);
//	            bw.write(sb.toString());
//	            bw.flush();
//	            
//	            // 결과코드 200이면 정상
//	            int responseCode = conn.getResponseCode();
//	            System.out.println("responseCode : " + responseCode);
//	 
//	            //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
//	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//	            String line = "";
//	            String result = "";
//	            
//	            // 응답 데이터 반복문 돌려서 line에 담긴 데이터를 result로 만들기
//	            while ((line = br.readLine()) != null) {
//	                result += line;
//	            }
//	            System.out.println("response body : " + result);
//	            
//	            // Gson 라이브러리에 포함된 클래스로 JSON 파싱 객체 생성
//	            JsonParser jsonParser = new JsonParser();
//	            JsonElement jsonElement = jsonParser.parse(result);
//	            // jsonElement : 응답받은 데이터 저장
//	            
//	            access_Token = jsonElement.getAsJsonObject().get("access_token").getAsString();
//	            refresh_Token = jsonElement.getAsJsonObject().get("refresh_token").getAsString();
//	            
//	            System.out.println("access_token : " + access_Token);
//	            System.out.println("refresh_token : " + refresh_Token);
//	            
//	            br.close();
//	            bw.close();
//	        } catch (IOException e) {
//	            e.printStackTrace();
//	        } 
//	        
//	        return access_Token;
//	 }
//	 
//	  // 카카오 API - Access token보내 사용자 정보 요청 
	  public MemberVO KakaoInfo(String access_Token)throws IOException{
	  System.out.println("-------------------------사용자 정보 보기---------------------------");  
	 
	  MemberVO kakaoInfo = new MemberVO();
	 
	  // 토큰을 이용하여 카카오에 회원의 정보를 요청 
	  // v1을 통한 '사용자 정보 요청'은 만료됨
	  String reqURl = "https://kapi.kakao.com/v2/user/me";
	 
	  try {
	  // URL 객체 생성
	  URL url = new URL(reqURl);
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("POST");
		// 연결 완료
	
		// 헤더 필드 읽기 
		// 요청에 필요한 Header에 포함 될 내용 
		// 문서에서 지정해둔 양식 
		conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	
		// 응답코드 확인
		int responseCode = conn.getResponseCode(); 
		System.out.println("responseCode: "+ responseCode);
	
		// 입력스트림을 가지고 오고 데이터 읽기
		// inputStream은 데이터를 바이트의 배열로 읽어 오는 low-level의 메서드
		// 따라서 데이터를 문자 '데이터'로 읽기 위해서 InputStreamReader로 매핑
		// 데이터를 문자'열'로 읽기 위해서 inputStream을 BufferedReader로 매핑하기
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
	
		String line="";
		String result ="";
	
		while((line= br.readLine()) != null) {
		result += line;
		}
		System.out.println("response body: " + result);
	
		// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	    JsonParser jsonParser = new JsonParser();
	    JsonElement jsonElement = jsonParser.parse(result);
	    // jsonElement : 응답받은 데이터 저장
	    
	    // JsonElement.getAsJsonObject().get("key value").getAs타입(); 의 형태로 파싱
	    // 응답데이터(JSON)
	    JsonObject properties = jsonElement.getAsJsonObject().get("properties").getAsJsonObject();
	    JsonObject kakao_account = jsonElement.getAsJsonObject().get("kakao_account").getAsJsonObject();
	    Long memberId = jsonElement.getAsJsonObject().get("id").getAsLong();
	    
	    // 파싱된 json데이터를 string에 담기
	    // properties
	    String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	  
	    //kakao_account
	    String name = kakao_account.getAsJsonObject().get("name").getAsString();
	    String email = kakao_account.getAsJsonObject().get("email").getAsString();
	    String gender = kakao_account.getAsJsonObject().get("gender").getAsString();
	    String birthday = kakao_account.getAsJsonObject().get("birthday").getAsString();
	    String age_range = kakao_account.getAsJsonObject().get("age_range").getAsString();
	    
	    System.out.println("memberId: "+ memberId);
	    
	    //setter이용하여 memberVO에 담기 
	    kakaoInfo.setMemberName(name);
	    kakaoInfo.setMemberEmail(email);
	    kakaoInfo.setGender(gender);
	    kakaoInfo.setBirthday(birthday);
	    kakaoInfo.setAge_group(age_range);
	
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		  return kakaoInfo;
		  }

}
