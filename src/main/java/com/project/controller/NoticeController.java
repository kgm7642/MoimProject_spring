package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.Criteria;
import com.project.domain.NoticeDTO;
import com.project.domain.PageDTO;
import com.project.domain.UserDTO;
import com.project.service.NoticeService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/")
public class NoticeController {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeService service;
	
	@GetMapping("noticeList")
	public void noticeList(Criteria cri, Model model) {
		model.addAttribute("noticeList", service.noticeList(cri));
		model.addAttribute("pageMaker", new PageDTO(service.noticeTotal(cri), cri));
		log.info("공지사항 리스트 페이지 이동");
	}
	
	@GetMapping("noticeView")
	public void noticeView(@ModelAttribute("cri")Criteria cri, String noticenum, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		NoticeDTO noticedto = service.getNoticeDetail(noticenum);
		if(!(((UserDTO)session.getAttribute("session")).getUserid()).equals(noticedto.getUserid())) {
			service.updateViewCnt(noticenum);
			noticedto.setViews(noticedto.getViews()+1);
		}
		model.addAttribute("notice", noticedto);
		log.info("공지사항 상세보기");
	}
	
	
}
