package com.project.mapper;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.NoticeDTO;

public interface NoticeMapper {
//	공지사항 리스트
	List<NoticeDTO> noticeList(Criteria cri);
	int noticeTotal(Criteria cri);
	
//	공지사항 상세보기
	NoticeDTO getNoticeDetail(String noticenum);
	void updateViewCnt(String noticenum);
}
