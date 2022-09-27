package com.project.mapper;

import java.util.List;

import com.project.domain.BoardDTO;
import com.project.domain.Criteria;

public interface BoardMapper {

//	게시글 리스트
	List<BoardDTO> boardList(Criteria cri);
	int boardTotal(Criteria cri);
	int insertBoard(BoardDTO boarddto);
	
//	게시판 상세보기
	BoardDTO getBoardDetail(String boardnum);
	void updateViewCnt(String boardnum);
	int updateBoard(BoardDTO boarddto);
	void likeCnt(int boardnum);
	void dislikeCnt(int boardnum);
	int getLikeCnt(int boardnum);
	int getDislikeCnt(int boardnum);
	
//	게시판 삭제
	int removeBoard(String boardnum);
	int searchBoardReply(String boardnum);
	int removeBoardReply(String boardnum);
	

}
