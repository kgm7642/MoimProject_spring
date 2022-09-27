package com.project.service;

import java.util.List;

import com.project.domain.BoardDTO;
import com.project.domain.Criteria;

public interface BoardService {
	
//	게시글 리스트
	public List<BoardDTO> boardList(Criteria cri);
	public int boardTotal(Criteria cri);
	public boolean insertBoard(BoardDTO boarddto);
	
//	게시글 상세보기
	public BoardDTO getBoardDetail(String boardnum);
	public void updateViewCnt(String boardnum);
	public boolean updateBoard(BoardDTO boarddto);
	public void likeCnt(int boardnum);
	public void dislikeCnt(int boardnum);
	public int getLikeCnt(int boardnum);
	public int getDislikeCnt(int boardnum);
	
//	게시글 삭제
	public boolean removeBoard(String boardnum);
}
