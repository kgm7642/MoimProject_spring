package com.project.service;

import java.util.List;
import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.project.domain.UserDTO;
import com.project.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImpl implements UserService{
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private JavaMailSenderImpl mailSender;
	
//	============================ 회원 가입 ============================	
	@Override
	public void insert(UserDTO userdto) {
		mapper.insert(userdto);
	}
	
	@Override
	public boolean checkId(UserDTO userdto) {
		return 1 == mapper.checkId(userdto);
	}

	@Override
	public boolean checkNick(UserDTO userdto) {
		return 1 == mapper.checkNick(userdto);
	}
	
	@Override
	public boolean checkEmail(UserDTO userdto) {
		return 1 == mapper.checkEmail(userdto);
	}
	
	
	// 난수를 생성하는 메소드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}	
	
	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}	
	
	// 회원가입 발송 이메일(인증키 발송)
	public void mailSendWithUserKey(String e_mail, String userid, HttpServletRequest request) {
		log.info("메일 인증 들어왔음");
		String userkey = getKey(false, 20);
		mapper.setKey(userid, userkey); 
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 MS : TOGETHER 입니다!</h2><br><br>" 
				+ "<h3>" + userid + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
				+ "<a href='http://localhost:9090/user/key_alter?userid="+ userid +"&userkey="+userkey+"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[본인인증] MS :p TOGETHER 의 인증메일입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(e_mail));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}	
	
	@Override
	public void completeEmail(String userid, String userkey) {
		mapper.completeEmail(userid, userkey);
	}
	
//	============================ 로그인 ============================
	@Override
	public int login(UserDTO userdto) {
		return mapper.login(userdto);
	}
	
	@Override
	public String findId(UserDTO userdto) {
		return mapper.findId(userdto);
	}
	
	@Override
	public String findPw(UserDTO userdto) {
		return mapper.findPw(userdto);
	}
	
//	============================ 회원 정보 수정 ============================
	@Override
	public void updateInfo(UserDTO userdto) {
		mapper.updateInfo(userdto);
	}
	
	@Override
	public UserDTO userInfo(String userid) {
		return mapper.userInfo(userid);
	}

//	============================ 회원 탈퇴 ============================
	@Override
	public void resign(String userid) {
		List<Integer> moimnums = mapper.selectMoimNum(userid);
		if(moimnums.size()>0) {
			for(Integer moimnum : moimnums) {
				mapper.deleteChat(moimnum);
				log.info("모임 채팅 삭제");
				mapper.deleteMembers(moimnum);
				log.info("모임 멤버 삭제");
				mapper.deleteFireMoim(moimnum);
				log.info("모임 강퇴 메세지 삭제");
				mapper.deleteMoimJoin(moimnum);
				log.info("모임 가입 메세지 삭제");
				
				List<Integer> recruitnums = mapper.getRecruitnums(moimnum);
				if(recruitnums.size()>0) {
					for(Integer recruitnum : recruitnums) {
						mapper.deleteMyProReply(recruitnum);
						log.info("홍보 게시글 댓글 삭제");
						mapper.deleteProReply(userid);
						log.info("홍보 게시글 내가 쓴 댓글 삭제");
						mapper.deleteRecruit(recruitnum);
						log.info("홍보 게시글 삭제");
					}
				}
				
				int placenum  = mapper.getMPlaceNum(moimnum);
				mapper.deleteMoim(moimnum);
				log.info("모임 삭제");
				mapper.deletePlace(placenum);
				log.info("장소 삭제");
			}
		}
		
		mapper.deleteMyChat(userid);
		mapper.deleteMember(userid);
		mapper.deleteFire(userid);
		mapper.deleteJoinJ(userid);
		mapper.deleteJoinK(userid);
		
		List<Integer> boardnums = mapper.selectBoardNum(userid);
		if(boardnums.size()>0) {
			for(Integer boardnum : boardnums) {
				mapper.deleteBoardReply(userid);
				log.info("게시판 댓글 모두 삭제");
				mapper.deleteMyBoardReply(boardnum);
				log.info("내가 작성한 게시판 댓글 삭제");
				mapper.deleteBoard(boardnum);
				log.info("게시판 삭제");
			}
		}
		mapper.deleteUser(userid);
		log.info("회원 정보 삭제");
	}
}
