package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.UserDTO;
import com.project.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/")
public class UserController {
	
	@Setter(onMethod_ = @Autowired)
	private UserService service;
	
	@GetMapping("login")
	public void login() {
		log.info("로그인 페이지 이동");
	}
	
	@GetMapping("join")
	public void join(Model model) {
		log.info("회원가입 페이지 이동");
	}
	
	@ResponseBody
	@PostMapping(value="checkId",  consumes = "application/json")
	public ResponseEntity<String> checkId(@RequestBody UserDTO userdto){
		boolean check = service.checkId(userdto);
		log.info("아이디 중복 체크 성공");
		return check ? new ResponseEntity<String>("fail",HttpStatus.OK) : new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping(value="checkNick",  consumes = "application/json")
	public ResponseEntity<String> checkNick(@RequestBody UserDTO userdto){
		boolean check = service.checkNick(userdto);
		log.info("닉네임 중복 체크 성공");
		return check ? new ResponseEntity<String>("fail",HttpStatus.OK) : new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping(value="checkEmail",  consumes = "application/json")
	public ResponseEntity<String> checkEmail(@RequestBody UserDTO userdto){
		boolean check = service.checkEmail(userdto);
		log.info("이메일 중복 체크 성공");
		return check ? new ResponseEntity<String>("fail",HttpStatus.OK) : new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	@PostMapping("join")
	public String join(UserDTO userdto, Model model, HttpServletRequest req) {
		service.insert(userdto);
		log.info("조인 컨트롤러 접근");
		service.mailSendWithUserKey(userdto.getUseremail(), userdto.getUserid(), req);
		log.info("회원가입 성공");
		return "redirect:/user/waitEmailCheck";
	}
	
	@GetMapping("waitEmailCheck")
	public void waitEmailCheck() {
		log.info("이메일 인증 대기 페이지 이동");
	}
	
	@GetMapping("key_alter")
	public String key_alter(@RequestParam("userid") String userid, @RequestParam("userkey")  String userkey) {
		service.completeEmail(userid, userkey);
		log.info("이메일 인증 완료");
		return "redirect:/user/login?emailCheck=true&userid="+userid;
	}
	
	@PostMapping("login")
	public String login(UserDTO userdto, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(service.login(userdto) == 1) {
			log.info("로그인 성공");
			session.setAttribute("session", service.userInfo(userdto.getUserid()));
			return "redirect: /index/index";			
		}else {
			log.info("로그인 로그인 실패");
			model.addAttribute("flag", "로그인 실패");
			return "/user/login";
		}
	}
	
	@GetMapping("logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		log.info("로그아웃 성공");
		return "redirect: /index";
	}
	
	@GetMapping("findId")
	public void findId(String ff, Model model) {
		log.info("아이디 찾기 페이지 이동");
		model.addAttribute("ff", ff);
	}
	
	@PostMapping("findId")
	public String findId(UserDTO userdto, Model model) {
		if(service.findId(userdto) == null) {
			log.info("아이디 찾기 실패");
			return "redirect: /user/findId?ff=fail";
		}else {
			model.addAttribute("userid", service.findId(userdto));
			log.info("아이디 찾기 성공");
			return "/user/showId";			
		}
	}
	
	@GetMapping("findPw")
	public void findPw(String ff, Model model) {
		log.info("비밀번호 찾기 페이지 이동");
		model.addAttribute("ff", ff);
	}
	
	@PostMapping("findPw")
	public String findPw(UserDTO userdto, Model model) {
		if(service.findPw(userdto) == null) {
			log.info("비밀번호 찾기 실패");
			return "redirect: /user/findPw?ff=fail";
		}else {
			model.addAttribute("userpw", service.findPw(userdto));
			log.info("비밀번호 찾기 성공");
			return "/user/showPw";			
		}
	}
	
	@GetMapping("myPageIndex")
	public void myPageIndex() {
		log.info("마이페이지 인덱스로 이동");
	}
	
	
	@GetMapping("pwCheckUpdate")
	public void pwCheckUpdate() {
		log.info("회원정보 수정 전 PW 확인 페이지 이동");
	}
	
	@GetMapping("updateInfo")
	public void updateInfo() {
		log.info("회원정보수정 페이지 이동");
	}
	
	@PostMapping("updateInfo")
	public String updateInfo(UserDTO userdto, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		service.updateInfo(userdto);
		UserDTO updateUser = service.userInfo(userdto.getUserid());
		session.setAttribute("session", updateUser);
		model.addAttribute("user", updateUser);
		log.info("회원정보 수정 완료");
		return "/user/updateFinish";
	}

	@GetMapping("pwCheckOut")
	public void pwCheckOut() {
		log.info("회원탈퇴 전 PW확인 페이지 이동");
	}
	
	@GetMapping("resign")
	public String resign(String userid, HttpServletRequest req) {
		service.resign(userid);
		HttpSession session = req.getSession();
		session.invalidate();
		log.info("회원 탈퇴 완료");
		return "redirect:/index/";
	}
}
