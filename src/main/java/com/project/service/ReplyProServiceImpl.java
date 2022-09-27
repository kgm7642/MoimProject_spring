package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Criteria;
import com.project.domain.MoimReplyDTO;
import com.project.domain.ReplyProPageDTO;
import com.project.mapper.ReplyProMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyProServiceImpl implements ReplyProService{
	
	@Setter(onMethod_ = @Autowired)
	private ReplyProMapper mapper;
	
//	============================ 댓글 등록 ============================	
	@Override
	public boolean insertMoimReply(MoimReplyDTO moimreplydto) {
		return 1 == mapper.insertMoimReply(moimreplydto);
	}

//	============================ 댓글 페이지 리스트 ============================
	@Override
	public ReplyProPageDTO getMoimReplyList(Criteria cri, String recruitnum) {
		return new ReplyProPageDTO(mapper.getMoimReplyTotal(recruitnum), mapper.getMoimReplyList(cri, recruitnum));
	}
	
//	============================ 댓글 삭제 ============================
	@Override
	public boolean MoimReplyRemove(String replynum) {
		return 1 == mapper.MoimReplyRemove(replynum);
	}
	
//	============================ 댓글 수정 ============================
	@Override
	public boolean MoimReplyUpdate(MoimReplyDTO moimreplydto) {
		return 1 == mapper.MoimReplyUpdate(moimreplydto);
	}
}
