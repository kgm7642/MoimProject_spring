package com.project.mapper;

import java.util.List;

import com.project.domain.BoardDTO;
import com.project.domain.MoimDTO;

public interface IndexMapper {

//	오늘의 모임 리스트
	List<MoimDTO> getTodayMoimList();
	
//	나의 오늘의 모임 개수
	int todayMoimCnt(String userid);
	
//	나의 오늘의 모임들
	MoimDTO todayMyMoim(String userid);
	List<MoimDTO> todayMyMoimList(String userid);
	
//	인기 게시글
	List<BoardDTO> getIndexBoardList();
	
	
}
