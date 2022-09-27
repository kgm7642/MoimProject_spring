package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.Criteria;
import com.project.domain.ReplyBoardPageDTO;
import com.project.domain.ReplyDTO;
import com.project.service.ReplyBoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replyB/")
@Log4j
@RestController// : JSON 형태로 객체 데이터를 반환하기 위한 Controller
public class ReplyBoardController {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyBoardService service;

	@PostMapping(value = "/regist", consumes = "application/json")
	public ResponseEntity<String> regist(@RequestBody ReplyDTO replydto){
		log.info(replydto);
		boolean check = service.insertBoardReply(replydto);
		log.info("댓글 등록 성공");
		return check ? new ResponseEntity<String>("success",HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/pages/{boardnum}/{pagenum}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE,
					MediaType.APPLICATION_XML_VALUE
			}
			)
	public ResponseEntity<ReplyBoardPageDTO> moimReplyList(@PathVariable("boardnum") String boardnum,@PathVariable("pagenum") int pagenum) {
		Criteria cri = new Criteria(pagenum, 5);
		log.info("댓글 페이지 리스트");
		return new ResponseEntity<ReplyBoardPageDTO>(service.getBoardReplyList(cri, boardnum),HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{replynum}", produces = MediaType.TEXT_PLAIN_VALUE)
	public  ResponseEntity<String> remove(@PathVariable("replynum") String replynum) {
		log.info("댓글 삭제 완료");
		return service.BoardReplyRemove(replynum)?
				new ResponseEntity<String>("success",HttpStatus.OK):
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(
			method = {RequestMethod.PUT,RequestMethod.PATCH}, value = "/{replynum}",
			consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE			
	)
	public  ResponseEntity<String> modify(@RequestBody ReplyDTO replydto) {
		if(service.BoardReplyUpdate(replydto)) {
			log.info("댓글 수정 완료");
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
		else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
