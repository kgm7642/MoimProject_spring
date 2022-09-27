package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.Criteria;
import com.project.domain.ReplyDTO;

public interface ReplyBoardMapper {

//	댓글 등록
	int insertBoardReply(ReplyDTO replydto);
	
//	댓글 리스트
	int getBoardReplyTotal(String boardnum);
	List<ReplyDTO> getBoardReplyList(@Param("cri") Criteria cri,@Param("boardnum") String boardnum);
	
//	댓글 삭제	
	int BoardReplyRemove(String boardnum);	
	
//	댓글 수정
	int BoardReplyUpdate(ReplyDTO replydto);
}
