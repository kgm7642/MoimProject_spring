package com.project.service;

import java.util.List;

import com.project.domain.Criteria;
import com.project.domain.NoticeDTO;

public interface NoticeService {
	
//	공지사항 리스트
	public List<NoticeDTO> noticeList(Criteria cri);
	public int noticeTotal(Criteria cri);
	
//	공지사항 상세보기
	public NoticeDTO getNoticeDetail(String noticenum);
	public void updateViewCnt(String noticenum);
}
