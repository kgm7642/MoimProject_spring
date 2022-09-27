package com.project.service;

import java.util.List;

import com.project.domain.BoardDTO;
import com.project.domain.Criteria;
import com.project.domain.MoimDTO;
import com.project.domain.MoimRecruitDTO;
import com.project.domain.NoticeDTO;
import com.project.domain.PlaceDTO;
import com.project.domain.UserDTO;

public interface AdminService {
	
//	공지사항 리스트
	public List<NoticeDTO> adminNoticeList(Criteria cri);
	public int adminNoticeTotal(Criteria cri);
	
//	공지사항 작성하기
	public boolean insertAdminNotice(NoticeDTO noticedto);
	
//	공지사항 상세보기
	public NoticeDTO getAdminNoticeDetail(String noticenum);
	
//	공지사항 수정하기
	public boolean updateAdminNotice(NoticeDTO noticedto);
	
//	공지사항 삭제하기
	public boolean removeAdminNotice(String noticenum);
	
//	관리자 모임 리스트
	public int adminMoimTotal(Criteria cri);
	public List<MoimDTO> adminMoimList(Criteria cri);
	
//	관리자 모임 상세보기
	public List<String> adminGetMemberId(String moimnum);
	public UserDTO adminGetMemberInfo(String userid);
	public int adminGetPlaceNum(String moimnum);
	public MoimDTO adminGetMoimDetail(String moimnum);
	public PlaceDTO adminGetPlaceDetail(int placenum);
	
//	관리자 모임 삭제하기
	public void adminCancelMoim(String moimnum, String placenum);
	
//	관리자 모임 홍보 리스트
	public List<MoimRecruitDTO> adminProMoimList(Criteria cri);
	public int adminProMoimTotal(Criteria cri);
	
//	관리자 모임 홍보 상세보기
	public MoimRecruitDTO adminGetRecruitDetail(String recruitnum);
	
//	관리자 모임 홍보 게시글 삭제
	public boolean adminRemoveRecruit(String recruitnum);
	
//	관리자 게시글 리스트
	public List<BoardDTO> adminBoardList(Criteria cri);
	public int adminBoardTotal(Criteria cri);
	
//	관리자 게시글 상세보기
	public BoardDTO adminGetBoardDetail(String boardnum);
	
//	관리자 게시글 삭제
	public boolean adminRemoveBoard(String boardnum);
}
