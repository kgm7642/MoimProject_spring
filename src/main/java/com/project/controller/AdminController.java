package com.project.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.Criteria;
import com.project.domain.NoticeDTO;
import com.project.domain.PageDTO;
import com.project.domain.UserDTO;
import com.project.service.AdminService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/")
public class AdminController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminService service;
	
	@GetMapping("adminNoticeList")
	public void adminNoticeList(Criteria cri, Model model) {
		model.addAttribute("noticeList", service.adminNoticeList(cri));
		model.addAttribute("pageMaker", new PageDTO(service.adminNoticeTotal(cri), cri));
		log.info("공지사항 리스트 페이지 이동");
	}
	
	@GetMapping("adminNoticeWrite")
	public void adminNoticeWrite(@ModelAttribute("cri")Criteria cri, Model model) {
		model.addAttribute("pageMaker", new PageDTO(service.adminNoticeTotal(cri), cri));
		log.info("공지사항 작성 페이지 이동");
	}
	
	@PostMapping("adminNoticeWrite")
	public String adminNoticeWrite(NoticeDTO noticedto) {
		boolean check = false;
		if(service.insertAdminNotice(noticedto)) {
			check = true;
		}
		log.info("공지사항 작성 완료");
		return "redirect:/admin/adminNoticeView?noticenum="+noticedto.getNoticenum()+"&writeCheck="+check;
	}
	
	@GetMapping("adminNoticeView")
	public void adminNoticeView(@ModelAttribute("writeCheck")String writeCheck, @ModelAttribute("modifyCheck")String modifyCheck, @ModelAttribute("cri")Criteria cri, String noticenum, Model model) {
		model.addAttribute("notice", service.getAdminNoticeDetail(noticenum));
		log.info("공지사항 상세보기");
	}
	
	@GetMapping("adminNoticeModify")
	public void adminNoticeModify(String noticenum, Model model) {
		model.addAttribute("notice", service.getAdminNoticeDetail(noticenum));
		log.info("공지사항 수정 페이지 이동");
	}

	@PostMapping("adminNoticeModify")
	public String adminNoticeModify(NoticeDTO noticedto) {
		log.info(noticedto);
		
		boolean check = false;
		if(service.updateAdminNotice(noticedto)) {
			check = true;
		}
		log.info("공지사항 수정 완료");
		return "redirect: /admin/adminNoticeView?noticenum="+noticedto.getNoticenum()+"&modifyCheck="+check;
	}
	
	@GetMapping("removeAdminNotice")
	public String removeAdminNotice(String noticenum) {
		boolean check = false;
		if(service.removeAdminNotice(noticenum)) {
			check = true;
		}
		log.info("공지사항 삭제 완료");
		return "redirect: /admin/adminNoticeList?removeCheck="+check;
	}
	
	@GetMapping("adminMoimList")
	public void adminMoimList(Criteria cri, Model model) {
		model.addAttribute("adminMoimList", service.adminMoimList(cri));
		model.addAttribute("pageMaker", new PageDTO(service.adminMoimTotal(cri), cri));
		log.info("관리자 모임 페이지 이동");
	}
	
	@GetMapping("adminGetMoimInfo")
	public void adminGetMoimInfo(String moimnum, Model model) {
		int placenum = service.adminGetPlaceNum(moimnum);
		List<String> members = service.adminGetMemberId(moimnum);
		List<UserDTO> memberInfo = new ArrayList<UserDTO>();
		for(String member : members) {
			memberInfo.add(service.adminGetMemberInfo(member));
		}
		model.addAttribute("moim", service.adminGetMoimDetail(moimnum));
		model.addAttribute("place", service.adminGetPlaceDetail(placenum));
		model.addAttribute("members", memberInfo);
		log.info("관리자 모임 상세보기");
	}
	
	@GetMapping("adminCancelMoim")
	public String adminCancelMoim(String moimnum, String placenum) {
		service.adminCancelMoim(moimnum, placenum);
		log.info("모임 취소 완료");
		return "redirect:/admin/adminMoimList";
	}
	
	@GetMapping("adminProMoimList")
	public void adminProMoimList(Criteria cri, Model model) {
		model.addAttribute("adminProMoimList", service.adminProMoimList(cri));
		model.addAttribute("pageMaker", new PageDTO(service.adminProMoimTotal(cri), cri));
		log.info("관리자 모임 홍보 리스트 이동");
	}
	
	@GetMapping("adminProMoimView")
	public void adminProMoimView(@ModelAttribute("cri")Criteria cri, String moimnum, String recruitnum, Model model) {
		log.info(moimnum);
		log.info(recruitnum);
		model.addAttribute("moim", service.adminGetMoimDetail(moimnum));
		model.addAttribute("place", service.adminGetPlaceDetail(service.adminGetPlaceNum(moimnum)));
		model.addAttribute("moimrecruit", service.adminGetRecruitDetail(recruitnum));
		log.info("모임 홍보 상세보기");
	}
	
	@GetMapping("adminRemovePro")
	public String adminRemovePro(String recruitnum) {
		boolean check = service.adminRemoveRecruit(recruitnum);
		log.info("홍보 게시글 삭제 완료");
		return "redirect:/admin/adminProMoimList?removeCheck="+check;
	}
	
	@GetMapping("adminBoardList")
	public void adminBoardList(Criteria cri, Model model) {
		model.addAttribute("boardList", service.adminBoardList(cri));
		model.addAttribute("pageMaker", new PageDTO(service.adminBoardTotal(cri), cri));
		log.info("관리자 자유게시판 리스트 페이지 이동");
	}
	
	@GetMapping("adminBoardView")
	public void adminBoardView(@ModelAttribute("cri")Criteria cri, String boardnum, Model model) {
		model.addAttribute("board", service.adminGetBoardDetail(boardnum));
		log.info("관리자 게시글 상세보기");
	}
	
	@GetMapping("adminBoardRemove")
	public String adminBoardRemove(String boardnum) {
		boolean check = service.adminRemoveBoard(boardnum);
		log.info("게시글 삭제 완료");
		return "redirect:/admin/adminBoardList?removeCheck="+check;
	}
}