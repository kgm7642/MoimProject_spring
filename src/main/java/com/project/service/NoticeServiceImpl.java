package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Criteria;
import com.project.domain.NoticeDTO;
import com.project.mapper.NoticeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NoticeServiceImpl implements NoticeService{

	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
//	============================ 공지사항 리스트 ============================	
	@Override
	public List<NoticeDTO> noticeList(Criteria cri) {
		return mapper.noticeList(cri);
	}
	@Override
	public int noticeTotal(Criteria cri) {
		return mapper.noticeTotal(cri);
	}
	
//	============================ 공지사항 상세보기 ============================
	@Override
	public NoticeDTO getNoticeDetail(String noticenum) {
		return mapper.getNoticeDetail(noticenum);
	}
	@Override
	public void updateViewCnt(String noticenum) {
		mapper.updateViewCnt(noticenum);
	}
}
