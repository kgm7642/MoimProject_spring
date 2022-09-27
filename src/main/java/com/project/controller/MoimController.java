package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Receiver;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.Criteria;
import com.project.domain.FireMoimDTO;
import com.project.domain.MemberDTO;
import com.project.domain.MoimChatDTO;
import com.project.domain.MoimChatListDTO;
import com.project.domain.MoimDTO;
import com.project.domain.MoimJoinDTO;
import com.project.domain.MoimMemberDTO;
import com.project.domain.MoimRecruitDTO;
import com.project.domain.PageDTO;
import com.project.domain.PlaceDTO;
import com.project.domain.ReplyProPageDTO;
import com.project.domain.UserDTO;
import com.project.service.MoimService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/moim/")
public class MoimController {

	@Setter(onMethod_ = @Autowired)
	private MoimService service;
	
	@GetMapping("createPlace")
	public void createPlace() {
		log.info("모임 장소 생성 페이지 이동");
	}
	
	@PostMapping("createPlace")
	public String createPlace(PlaceDTO placedto) {
		service.insertPlace(placedto);
		log.info("모임 장소 생성 완료");
		return "redirect: /moim/createMoim?placenum="+placedto.getPlacenum();
	}
	
	@GetMapping("createMoim")
	public void createMoim(@ModelAttribute("placenum")int placenum, Model model) {
		log.info("모임 정보 생성 페이지 이동");
	}
	
	@PostMapping("completeMoim")
	public String completeMoim(MoimDTO moimdto) {
		service.insertMoim(moimdto);
		service.insertMember(moimdto.getUserid(), moimdto.getMoimnum());
		log.info("모임 생성, 멤버 추가 성공");
		return "redirect:/moim/completeMoim";
	}
	
	@GetMapping("completeMoim")
	public void completeMoim() {
		log.info("모임 생성 완료 페이지 이동");
	}
	
	@GetMapping("moimList")
	public void moimList(Criteria cri, Model model) {
		model.addAttribute("moimList", service.moimList(cri));
		model.addAttribute("pageMaker", new PageDTO(service.moimTotal(cri), cri));
		log.info("모임 리스트 페이지 이동");
	}
	
	@GetMapping("getMoimInfo")
	public void getMoimInfo(String moimnum, Model model) {
		int placenum = service.getPlaceNum(moimnum);
		List<String> members = service.getMemberId(moimnum);
		List<UserDTO> memberInfo = new ArrayList<UserDTO>();
		for (String member : members) {
			memberInfo.add(service.getMemberInfo(member));
		}
		model.addAttribute("moim", service.getMoimDetail(moimnum));
		model.addAttribute("place", service.getPlaceDetail(placenum));
		model.addAttribute("members", memberInfo);
		log.info("모임 상세보기 페이지 이동");
	}
	
	@GetMapping("chat")
	public void moimChat(String moimnum, Model model) {
		model.addAttribute("moim", service.getMoimDetail(moimnum));
		log.info("모임 채팅창 열기");
	}
	
	@ResponseBody
	@GetMapping(value="/getChatList/{moimnum}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_XML_VALUE
			}	
	)
	public ResponseEntity<MoimChatListDTO> getChatList(@PathVariable String moimnum){
		log.info("채팅 리스트 가져오기");
		return new ResponseEntity<MoimChatListDTO>(service.getChatList(moimnum),HttpStatus.OK);
	}
	
	@GetMapping("applyMoimInfo")
	public void applyMoimInfo(String moimnum, Model model) {
		model.addAttribute("joinList", service.getMoimJoinList(moimnum));
		model.addAttribute("moim", service.getMoimDetail(moimnum));
		log.info("모임 신청 관리 페이지 이동");
	}
	
	@GetMapping("applyMoimInfoC")
	public void applyMoimInfoC(String moimnum, String moimjoinnum, Model model) {
		model.addAttribute("moimJoin", service.getMoimJoin(moimjoinnum));
		model.addAttribute("moim", service.getMoimDetail(moimnum));
		log.info("모임 신청서 상세보기 페이지 이동");
	}
	
	@GetMapping("manageApply")
	public String manageApply(String join, MoimJoinDTO moimjoindto) {
		if(join.equals("true")) {
			service.insertMember(moimjoindto.getJoinuserid(), moimjoindto.getMoimnum());
		}
		service.removeJoinList(moimjoindto);
		log.info("모임 멤버 수락/거절 완료");
		return "redirect:/moim/applyMoimInfo?moimnum="+moimjoindto.getMoimnum();
	}
	
	@ResponseBody
	@PostMapping(value="checkAlreadyJoin",  consumes = "application/json")
	public ResponseEntity<String> checkAlreadyJoin(@RequestBody MoimDTO moimdto) {
		boolean check = service.checkAlreadyJoin(moimdto.getUserid(), moimdto.getMoimnum());
		log.info("이미 모임멤버인지 체크 성공");
		return check ? new ResponseEntity<String>("success",HttpStatus.OK) : new ResponseEntity<String>("fail",HttpStatus.OK);
	}
	
	@GetMapping("adMoimJoin")
	public void adMoimJoin(@ModelAttribute("joinType")String joinType, String moimnum, Model model) {
		model.addAttribute("moim", service.getMoimDetail(moimnum));
		log.info("모임 가입 신청서 작성 페이지 이동");
	}
	
	@PostMapping("adMoimJoin")
	public String adMoimJoin(@ModelAttribute("cri")Criteria cri, String joinType, MoimDTO moimdto, MoimJoinDTO moimjoindto, Model model) {
		service.insertJoinMoim(moimjoindto);
		log.info("모임 신청서 제출 성공");
		if(joinType.equals("search")) {
			return "redirect:/moim/moimList?join=true";
		}else {
			return "redirect:/moim/proMoimList?join=true";
		}
	}

	@GetMapping("outMoim")
	public String outMoim(String moimnum, String userid) {
		boolean check = false;
		if(service.outMoim(moimnum, userid)) {
			check = true;
		}
		log.info("모임 탈퇴 완료");
		return "redirect:/moim/myMoimAll?userid="+userid+"&outCheck="+check;
	}
	
	@GetMapping("manageMember")
	public void manageMember(String moimnum, Model model) {
		List<String> members = service.getMemberId(moimnum);
		List<UserDTO> memberInfo = new ArrayList<UserDTO>();
		for (String member : members) {
			memberInfo.add(service.getMemberInfo(member));
		}
		model.addAttribute("moim", service.getMoimDetail(moimnum));
		model.addAttribute("members", memberInfo);
		log.info("모임 멤버 관리 페이지 이동");
	}
	
	@GetMapping("fireMessage")
	public void fireMessage(@ModelAttribute("fire") FireMoimDTO firemoimdto, Model model) {
		log.info("모임 멤버 강퇴 메세지 작성 페이지 이동");
	}
	
	@ResponseBody
	@PostMapping(value="fireMessage",  consumes = "application/json")
	public ResponseEntity<String> fireMessage(@RequestBody FireMoimDTO firemoimdto) {
		boolean check = service.fireMessage(firemoimdto);
		check = service.fireMember(firemoimdto.getUserid(), firemoimdto.getMoimnum());
		log.info("모임 멤버 강퇴 메세지 작성 완료");
		return check ? new ResponseEntity<String>("success",HttpStatus.OK) : new ResponseEntity<String>("fail",HttpStatus.OK);
	}
	
	@GetMapping("updateMoim")
	public void updateMoim(String moimnum, Model model) {
		model.addAttribute("moim", service.getMoimDetail(moimnum));
		model.addAttribute("place", service.getPlaceDetail(service.getPlaceNum(moimnum)));
		log.info("모임 정보 수정 페이지 이동");
	}
	
	@GetMapping("updatePlace")
	public void updatePlace(String moimnum, Model model) {
		model.addAttribute("place", service.getPlaceDetail(service.getPlaceNum(moimnum)));
		model.addAttribute("moimnum", moimnum);
		log.info("모임 장소 수정 페이지 이동");
	}
	
	@PostMapping("updateMoim")
	public String updateMoim(MoimDTO moimdto, String moimnum) {
		service.updateMoim(moimdto);
		log.info("모임 정보 수정 완료");
		return "redirect:/moim/getMoimInfo?moimnum="+moimnum;
	}
	
	@PostMapping("updatePlace")
	public String updatePlace(PlaceDTO placedto, String moimnum) {
		service.updatePlace(placedto);
		log.info("모임 장소 수정 완료");
		return "redirect:/moim/getMoimInfo?moimnum="+moimnum;
	}
	
	@GetMapping("proMoimList")
	public void proMoimList(Criteria cri, Model model) {
		model.addAttribute("proMoimList", service.proMoimList(cri));
		model.addAttribute("pageMaker", new PageDTO(service.ProMoimTotal(cri), cri));
		log.info("모임 홍보 리스트 페이지 이동");
	}
	
	@ResponseBody
	@PostMapping(value="checkKing",  consumes = "application/json")
	public ResponseEntity<String> checkKing(@RequestBody UserDTO userdto) {
		boolean check = service.checkKing(userdto.getUserid());
		log.info(check);
		log.info("모임장인지 체크 완료");
		return check ? new ResponseEntity<String>("success",HttpStatus.OK) : new ResponseEntity<String>("fail",HttpStatus.OK);
	}
	
	@GetMapping("proMoimWrite")
	public void proMoimWrite(@ModelAttribute("cri")Criteria cri, String userid, Model model) {
		model.addAttribute("myMoimList", service.getMyMoimList(userid));
		log.info("홍보 게시글 작성 페이지 이동");
	}
	
	@PostMapping("proMoimWrite")
	public String proMoimWrite(MoimRecruitDTO moimrecruitdto) {
		boolean check = false;
		if(service.insertRecruit(moimrecruitdto)) {
			check = true;
		}
		log.info("홍보 게시글 작성 완료");
		return "redirect:/moim/proMoimView?moimnum="+moimrecruitdto.getMoimnum()+"&recruitnum="+moimrecruitdto.getRecruitnum()+"&writeCheck="+check;
	}
	
	@GetMapping("proMoimView")
	public void proMoimView(@ModelAttribute("writeCheck")String writeCheck, @ModelAttribute("modifyCheck")String modifyCheck, @ModelAttribute("cri")Criteria cri, String moimnum, String recruitnum, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		MoimRecruitDTO moimrecruitdto = service.getRecruitDetail(recruitnum);
		if(!(((UserDTO)session.getAttribute("session")).getUserid()).equals(moimrecruitdto.getUserid())) {
			service.updateReadCnt(recruitnum);
			moimrecruitdto.setReadcnt(moimrecruitdto.getReadcnt()+1);
		}
		model.addAttribute("moim", service.getMoimDetail(moimnum));
		model.addAttribute("place", service.getPlaceDetail(service.getPlaceNum(moimnum)));
		model.addAttribute("moimrecruit", moimrecruitdto);
		log.info("홍보 게시글 상세보기");
	}
	
	@GetMapping("proMoimModify")
	public void proMoimModify(String recruitnum, Model model) {
		model.addAttribute("moimrecruit", service.getRecruitDetail(recruitnum));
		log.info("홍보 게시글 수정 페이지 이동");
	}
	
	@PostMapping("proMoimModify")
	public String proMoimModify(MoimRecruitDTO moimrecruitdto) {
		boolean check = false;
		if(service.updateRecruit(moimrecruitdto)) {
			check = true;
		}
		log.info("홍보 게시글 수정 완료");
		return "redirect:/moim/proMoimView?moimnum="+moimrecruitdto.getMoimnum()+"&recruitnum="+moimrecruitdto.getRecruitnum()+"&modifyCheck="+check;
	}
	
	@GetMapping("proMoimRemove")
	public String proMoimRemove(String recruitnum) {
		boolean check = service.removeRecruit(recruitnum);
		log.info("홍보 게시글 삭제 완료");
		return "redirect:/moim/proMoimList?removeCheck="+check;
	}
	
	@ResponseBody
	@PostMapping(value="cntDislike",  consumes = "application/json", produces = MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE)
	public ResponseEntity<Integer> cntDislike(@RequestBody MoimRecruitDTO moimrecruitdto) {
		int dislike = 0;
		if(moimrecruitdto.getRecruitnum() == 0) {
			service.updateDislikeMoimnum(moimrecruitdto.getMoimnum());
			dislike = service.getDislikeMoim(moimrecruitdto.getMoimnum());
		}else {
			service.updateDislikeRecruitnum(moimrecruitdto.getRecruitnum());
			dislike = service.getDislikeRecruitnum(moimrecruitdto.getRecruitnum());
		}
		log.info("싫어요 1 증가");
		return new ResponseEntity<Integer>(dislike, HttpStatus.OK);
	}

	@GetMapping("cancelMoim")
	public String cancelMoim(String moimnum, String placenum, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String userid = ((UserDTO)session.getAttribute("session")).getUserid();
		service.cancelMoim(moimnum, placenum);
		log.info("모임 취소 완료");
		return "redirect:/moim/myMoimAll?userid="+userid;
	}
	
	@GetMapping("myMoimAll")
	public void myMoimAll(Criteria cri, String userid, Model model) {
		model.addAttribute("moimList", service.getMyMoimListAll(userid, cri));
		model.addAttribute("pageMaker", new PageDTO(service.getMyMoimTotal(userid), cri));
		log.info("내 전체 모임 페이지로 이동");
	}

	@GetMapping("myMoimKing")
	public void myMoimKing(Criteria cri, String userid, Model model) {
		model.addAttribute("moimList", service.getMyMoimListKing(userid, cri));
		model.addAttribute("pageMaker", new PageDTO(service.getMyMoimKingTotal(userid), cri));
		log.info("내가 방장인 모임 페이지로 이동");
	}
	
	@GetMapping("myMoimBan")
	public void myMoimBan(Criteria cri, String userid, Model model) {
		model.addAttribute("Firelist", service.getMyBanList(userid, cri));
		model.addAttribute("pageMaker", new PageDTO(service.getBanTotal(userid), cri));
		log.info("강퇴당한 모임 페이지로 이동");	
	}
	
	@ResponseBody
	@PostMapping(value="deleteMessage",  consumes = "application/json")
	public ResponseEntity<String> deleteMessage(@RequestBody FireMoimDTO firemoimdto) {
		log.info(firemoimdto.getBannum());
		service.deleteMessage(firemoimdto.getBannum());
		log.info("강퇴 메세지 삭제 ");
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
}
