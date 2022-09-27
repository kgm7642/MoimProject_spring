package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.Criteria;
import com.project.domain.MoimReplyDTO;

public interface ReplyProMapper {

//	댓글 등록
	int insertMoimReply(MoimReplyDTO moimreplydto);
	
//	댓글 리스트
	int getMoimReplyTotal(String recruitnum);
	List<MoimReplyDTO> getMoimReplyList(@Param("cri") Criteria cri,@Param("recruitnum") String recruitnum);

//	댓글 삭제	
	int MoimReplyRemove(String replynum);	
	
//	댓글 수정
	int MoimReplyUpdate(MoimReplyDTO moimreplydto);
}
