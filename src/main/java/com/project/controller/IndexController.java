package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.MoimDTO;
import com.project.domain.UserDTO;
import com.project.service.IndexService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/index")
public class IndexController {
	
	@Setter(onMethod_ = @Autowired)
	private IndexService service;
	
	@GetMapping("")
	public String index() {
		return "/index/index";
	}
	
	@GetMapping("/index")
	public String indexLogin(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		if((((UserDTO)session.getAttribute("session")) == null)) {
			return "redirect:/index";
		}
		String userid = ((UserDTO)session.getAttribute("session")).getUserid();
		int moimCnt = service.todayMoimCnt(userid);
		model.addAttribute("todayMoimList", service.getTodayMoimList());
		if(moimCnt == 1) {
			MoimDTO moim = service.todayMyMoim(userid);
			model.addAttribute("todayMyMoim", moim);
			model.addAttribute("moimCnt", moimCnt);
		}else if(moimCnt > 1) {
			List<MoimDTO> moimList = service.todayMyMoimList(userid);
			model.addAttribute("todayMyMoimList", moimList);
			model.addAttribute("moimCnt", moimCnt);
		}else {
			model.addAttribute("moimCnt", moimCnt);			
		}
		model.addAttribute("boardList", service.getIndexBoardList());
		return "/index/index";
	}
	
}
