package com.project.service;

import com.project.domain.Criteria;
import com.project.domain.MoimReplyDTO;
import com.project.domain.ReplyProPageDTO;

public interface ReplyProService {
	
//	댓글 등록
	public boolean insertMoimReply(MoimReplyDTO moimreplydto);
	
//	댓글 페이지 리스트
	public ReplyProPageDTO getMoimReplyList(Criteria cri, String recruitnum);
	
//	댓글 삭제
	public boolean MoimReplyRemove(String replynum);
	
//	댓글 수정
	public boolean MoimReplyUpdate(MoimReplyDTO moimreplydto);
}
