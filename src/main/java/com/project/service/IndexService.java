package com.project.service;

import java.util.List;

import com.project.domain.BoardDTO;
import com.project.domain.MoimDTO;

public interface IndexService {
	
//	오늘의 모임 리스트
	public List<MoimDTO> getTodayMoimList();
	
//	나의 오늘의 모임 개수
	public int todayMoimCnt(String userid);
	
//	나의 오늘의 모임들
	public MoimDTO todayMyMoim(String userid);
	public List<MoimDTO> todayMyMoimList(String userid);
	
//	인기 게시글
	public List<BoardDTO> getIndexBoardList();
	
}
