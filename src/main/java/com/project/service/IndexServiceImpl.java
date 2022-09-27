package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.BoardDTO;
import com.project.domain.MoimDTO;
import com.project.mapper.IndexMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class IndexServiceImpl implements IndexService{
	@Setter(onMethod_ = @Autowired)
	
	private IndexMapper mapper;
	
//	============================ 오늘의 모임 리스트 ============================
	@Override
	public List<MoimDTO> getTodayMoimList() {
		return mapper.getTodayMoimList();
	}
	
//	============================ 나의 오늘의 모임 개수 ============================
	@Override
	public int todayMoimCnt(String userid) {
		return mapper.todayMoimCnt(userid);
	}
	
//	============================ 나의 오늘의 모임들 ============================
	@Override
	public MoimDTO todayMyMoim(String userid) {
		return mapper.todayMyMoim(userid);
	}
	
	@Override
	public List<MoimDTO> todayMyMoimList(String userid) {
		return mapper.todayMyMoimList(userid);
	}
	
//	============================ 인기 게시글 ============================
	@Override
	public List<BoardDTO> getIndexBoardList() {
		return mapper.getIndexBoardList();
	}
}
