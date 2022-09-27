package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.BoardDTO;
import com.project.domain.Criteria;
import com.project.domain.PageDTO;
import com.project.domain.UserDTO;
import com.project.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/")
public class BoardController {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@GetMapping("boardList")
	public void boardList(Criteria cri, Model model) {
		model.addAttribute("boardList", service.boardList(cri));
		model.addAttribute("pageMaker", new PageDTO(service.boardTotal(cri), cri));
		log.info("자유게시판 리스트 페이지 이동");
	}
	
	@GetMapping("boardWrite")
	public void boardWrite(@ModelAttribute("cri")Criteria cri, Model model) {
		model.addAttribute("pageMaker", new PageDTO(service.boardTotal(cri), cri));
		log.info("게시글 작성 페이지 이동");
	}
	
	@PostMapping("boardWrite")
	public String boardWrite(BoardDTO boarddto) {
		boolean check = false;
		if(service.insertBoard(boarddto)) {
			check = true;
		}
		log.info("게시글 작성 완료");
		return "redirect:/board/boardView?boardnum="+boarddto.getBoardnum()+"&writeCheck="+check;
	}
	
	@GetMapping("boardView")
	public void boardView(@ModelAttribute("writeCheck")String writeCheck, @ModelAttribute("modifyCheck")String modifyCheck, @ModelAttribute("cri")Criteria cri, String boardnum, Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		BoardDTO boarddto = service.getBoardDetail(boardnum);
		if(!(((UserDTO)session.getAttribute("session")).getUserid()).equals(boarddto.getUserid())) {
			service.updateViewCnt(boardnum);
			boarddto.setViews(boarddto.getViews()+1);
		}
		model.addAttribute("board", boarddto);
		log.info("게시글 상세보기");
	}	
	
	@GetMapping("boardModify")
	public void boardModify(String boardnum, Model model) {
		model.addAttribute("board", service.getBoardDetail(boardnum));
		log.info("게시글 수정 페이지 이동");
	}
	
	@PostMapping("boardModify")
	public String boardModify(BoardDTO boarddto) {
		boolean check = false;
		if(service.updateBoard(boarddto)) {
			check = true;
		}
		log.info("게시글 수정 완료");
		return "redirect: /board/boardView?boardnum="+boarddto.getBoardnum()+"&modifyCheck="+check;
	}
	
	@GetMapping("boardRemove")
	public String boardRemove(String boardnum) {
		boolean check = service.removeBoard(boardnum);
		log.info("게시글 삭제 완료");
		return "redirect:/board/boardList?removeCheck="+check;
	}

	@ResponseBody
	@PostMapping(value="likeCnt",  consumes = "application/json", produces = MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE)
	public ResponseEntity<Integer> likeCnt(@RequestBody BoardDTO boarddto){
		service.likeCnt(boarddto.getBoardnum());
		int like = service.getLikeCnt(boarddto.getBoardnum());
		log.info("좋아요 1증가");
		return new ResponseEntity<Integer>(like, HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping(value="dislikeCnt",  consumes = "application/json", produces = MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE)
	public ResponseEntity<Integer> dislikeCnt(@RequestBody BoardDTO boarddto){
		service.dislikeCnt(boarddto.getBoardnum());
		int dislike = service.getDislikeCnt(boarddto.getBoardnum());
		log.info("싫어요 1증가");
		return new ResponseEntity<Integer>(dislike, HttpStatus.OK);
	}
}
