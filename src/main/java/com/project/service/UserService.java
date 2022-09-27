package com.project.service;

import javax.servlet.http.HttpServletRequest;

import com.project.domain.UserDTO;

public interface UserService {
	
//	회원 가입
	public void insert(UserDTO userdto);
	public boolean checkId(UserDTO userdto);
	public boolean checkNick(UserDTO userdto);
	public boolean checkEmail(UserDTO userdto);
	
//	이메일 인증
	public void mailSendWithUserKey(String useremail, String userid, HttpServletRequest req);
	public void completeEmail(String userid, String userkey);
	
//	로그인
	public int login(UserDTO userdto);
	public String findId(UserDTO userdto);
	public String findPw(UserDTO userdto);
	
//	회원 정보 수정
	public void updateInfo(UserDTO userdto);
	public UserDTO userInfo(String userid);
	
//	회원탈퇴
	public void resign(String userid);
}
