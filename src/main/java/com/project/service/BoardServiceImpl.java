package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.BoardDTO;
import com.project.domain.Criteria;
import com.project.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	
//	============================ 게시글 리스트 ============================
	@Override
	public List<BoardDTO> boardList(Criteria cri) {
		return mapper.boardList(cri);
	}
	
	@Override
	public int boardTotal(Criteria cri) {
		return mapper.boardTotal(cri);
	}
	
	@Override
	public boolean insertBoard(BoardDTO boarddto) {
		return 1 == mapper.insertBoard(boarddto);
	}
	
//	============================ 게시글 상세보기 ============================
	@Override
	public BoardDTO getBoardDetail(String boardnum) {
		return mapper.getBoardDetail(boardnum);
	}
	
	@Override
	public void updateViewCnt(String boardnum) {
		mapper.updateViewCnt(boardnum);
	}

	@Override
	public boolean updateBoard(BoardDTO boarddto) {
		return 1 == mapper.updateBoard(boarddto);
	}
	
	@Override
	public boolean removeBoard(String boardnum) {
		boolean check = false;
		if(mapper.searchBoardReply(boardnum)>0) {
			mapper.removeBoardReply(boardnum);
		}
		if(mapper.removeBoard(boardnum)==1) {
			check = true;
		}
		return check;
	}

	@Override
	public void likeCnt(int boardnum) {
		mapper.likeCnt(boardnum);
	}
	
	@Override
	public void dislikeCnt(int boardnum) {
		mapper.dislikeCnt(boardnum);
	}
	
	@Override
	public int getLikeCnt(int boardnum) {
		return mapper.getLikeCnt(boardnum);
	}
	
	@Override
	public int getDislikeCnt(int boardnum) {
		return mapper.getDislikeCnt(boardnum);
	}
}






