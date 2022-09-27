package com.project.service;

import com.project.domain.Criteria;
import com.project.domain.ReplyBoardPageDTO;
import com.project.domain.ReplyDTO;

public interface ReplyBoardService {
	
//	댓글 등록
	public boolean insertBoardReply(ReplyDTO replydto);
	
//	댓글 페이지 리스트
	public ReplyBoardPageDTO getBoardReplyList(Criteria cri, String boardnum);
	
//	댓글 삭제
	public boolean BoardReplyRemove(String boardnum);	
	
//	댓글 수정
	public boolean BoardReplyUpdate(ReplyDTO replydto);
}
