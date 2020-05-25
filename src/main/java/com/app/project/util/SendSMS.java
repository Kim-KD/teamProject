package com.app.project.util;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class SendSMS {

	@RequestMapping(value = "/send_sms", method = RequestMethod.POST)
	public String sendSMS() { // String userPhoneNumber 휴대폰 문자보내기

		String api_key = "NCSCZLR4KJEVU3RV";
		String api_secret = "AIUPIRJ1TRJHKETGJI9I9MNDYTQNAGJO";
		Coolsms coolsms = new Coolsms(api_key, api_secret); // 메시지보내기 객체 생성
		String key = null; // 인증키 생성
		int num = new Random().nextInt(9999);
		key = ""+num;
		
		//userService.insertAuthCode(userPhoneNumber, key); // 휴대폰 인증 관련 서비스
		/*
		 * Parameters 관련정보 : http://www.coolsms.co.kr/SDK_Java_API_Reference_ko#toc-0
		 */
		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", "01079793021"); // 수신번호
		set.put("from", "01079793021"); // 발신번호
		set.put("text", "안녕하세요 홍길동입니다. 인증번호는 [" + key + "] 입니다."); // 문자내용
		set.put("type", "sms"); // 문자 타입

		JSONObject result = coolsms.send(set); // 보내기&전송결과받기
		if (result.get("status") != null) {
			// 메시지 보내기 성공 및 전송결과 출력
			System.out.println("성공");
			System.out.println(result.get("status")); // 성공여부
			System.out.println(result.get("group_id")); // 그룹아이디
			System.out.println(result.get("result_code")); // 결과코드
			System.out.println(result.get("result_message")); // 결과 메시지
			System.out.println(result.get("success_count")); // 메시지아이디
			System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
			return "success";
		} else {
			// 메시지 보내기 실패
			System.out.println("실패");
			System.out.println(result.get("code")); // REST API 에러코드
			System.out.println(result.get("message")); // 에러메시지
			return "fail";
		}
	}
}
