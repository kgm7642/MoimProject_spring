package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Criteria;
import com.project.domain.ReplyBoardPageDTO;
import com.project.domain.ReplyDTO;
import com.project.domain.ReplyProPageDTO;
import com.project.mapper.ReplyBoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyBoardServiceImpl implements ReplyBoardService{
	
	@Setter(onMethod_ = @Autowired)
	private ReplyBoardMapper mapper;
	
//	============================ 댓글 등록 ============================	
	@Override
	public boolean insertBoardReply(ReplyDTO replydto) {
		return 1 == mapper.insertBoardReply(replydto);
	}

//	============================ 댓글 페이지 리스트 ============================
	@Override
	public ReplyBoardPageDTO getBoardReplyList(Criteria cri, String boardnum) {
		return new ReplyBoardPageDTO(mapper.getBoardReplyTotal(boardnum), mapper.getBoardReplyList(cri, boardnum));
	}
	
//	============================ 댓글 삭제 ============================
	@Override
	public boolean BoardReplyRemove(String boardnum) {
		return 1 == mapper.BoardReplyRemove(boardnum);
	}	
	
//	============================ 댓글 수정 ============================
	@Override
	public boolean BoardReplyUpdate(ReplyDTO replydto) {
		return 1 == mapper.BoardReplyUpdate(replydto);
	}
}
