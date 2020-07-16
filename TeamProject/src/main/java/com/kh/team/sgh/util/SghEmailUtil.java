package com.kh.team.sgh.util;

import java.util.UUID;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

import com.kh.team.sgh.domain.SghEmailDto;

public class SghEmailUtil {
	// 임시 비밀번호 생성
	public static String emailRandomPwMake() throws Exception {
		UUID uuid = UUID.randomUUID();
		String str_uuid = String.valueOf(uuid);
		int start_uuid_index = str_uuid.lastIndexOf("-") + 1;
		String tmp_pw = str_uuid.substring(start_uuid_index);
		return tmp_pw;
	}
	
	// 임시 비밀번호 보내는 메일
	public static SghEmailDto tmpPwSubmitEmail(String user_id, String tmp_pw, String to) throws Exception {
		String subject = "안녕하십니까 허니박스입니다. 고객님께서 요청하신 비밀번호 변경에 대해 메일드렸습니다.";
		String contents = "고객님께서 요청하신 아이디 " + user_id + "의 비밀번호가 저희 쪽에서 준비한 임시 비밀번호로 변경되었습니다. 로그인을 하신 다음 비밀번호를 바로 바꾸시는걸 추천드립니다.";
		contents += "\n\n변경된 고객님의 비밀번호는 " + tmp_pw + " 입니다. 감사합니다.";
		
		SghEmailDto emailDto = new SghEmailDto();
		emailDto.setSubject(subject);
		emailDto.setContents(contents);
		emailDto.setTo(to);
		emailDto.setUser_id(user_id);
		System.out.println("emailDto :" + emailDto);
		
		return emailDto;
	}
	
	// 이메일 인증 문자 생성
	public static SghEmailDto emailCheck(String to) throws Exception {
		int randomNum = (int)(Math.random() * 999999) + 100000;
		
		String subject = "안녕하십니까 허니박스입니다. 회원가입 인증 문자 메일 입니다.";
		String contents = "회원가입을 진행해주셔서 감사합니다. 회원가입 진행에 필요한 인증 번호입니다.";
		contents += "\n\n인증번호는 " + randomNum + " 입니다.";
		
		SghEmailDto emailDto = new SghEmailDto();
		emailDto.setSubject(subject);
		emailDto.setContents(contents);
		emailDto.setTo(to);
		emailDto.setRandomNum(randomNum);
		
		return emailDto;
	}
	
	// 이메일 인증 보내기
	public static void submitEmailCheck(SghEmailDto sghEmailDto, JavaMailSender mailSender) throws Exception {
		// 메일보내기
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
				helper.setFrom(sghEmailDto.getFrom());
				helper.setTo(sghEmailDto.getTo());
				helper.setSubject(sghEmailDto.getSubject());
				helper.setText(sghEmailDto.getContents());
			}
		};
		mailSender.send(preparator);
	}
}
