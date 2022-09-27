package com.project.mapper;

import java.util.List;

import com.project.domain.BoardDTO;
import com.project.domain.Criteria;
import com.project.domain.MoimDTO;
import com.project.domain.MoimMemberDTO;
import com.project.domain.MoimRecruitDTO;
import com.project.domain.NoticeDTO;
import com.project.domain.PlaceDTO;
import com.project.domain.UserDTO;

public interface AdminMapper {
	
//	공지사항 리스트
	List<NoticeDTO> adminNoticeList(Criteria cri);
	int adminNoticeTotal(Criteria cri);
	
//	공지사항 작성하기
	int insertAdminNotice(NoticeDTO noticedto);
	
//	공지사항 상세보기
	NoticeDTO getAdminNoticeDetail(String noticenum);
	
//	공지사항 수정하기
	int updateAdminNotice(NoticeDTO noticedto);
	
//	공지사항 삭제하기
	int removeAdminNotice(String noticenum);
	
//	관리자 모임 리스트
	int adminMoimTotal(Criteria cri);
	List<MoimDTO> adminMoimList(Criteria cri);
	
//	관리자 모임 상세보기
	List<String> adminGetMemberId(String moimnum);
	UserDTO adminGetMemberInfo(String userid);
	int adminGetPlaceNum(String moimnum);
	MoimDTO adminGetMoimDetail(String moimnum);
	PlaceDTO adminGetPlaceDetail(int placenum);
	
//	관리자 모임 삭제하기
	void adminDeleteChat(String moimnum);
	void adminDeleteMembers(String moimnum);
	void adminDeleteFireMoim(String moimnum);
	void adminDeleteMoimJoin(String moimnum);
	List<Integer> adminGetRecruitnums(String moimnum);
	void adminDeleteRecruit(String moimnum);
	void adminDeleteProReply(String recruitnum);
	void adminDeleteMoim(String moimnum);
	void adminDeletePlace(String placenum);
	
//	관리자 모임 홍보 리스트
	List<MoimRecruitDTO> adminProMoimList(Criteria cri);
	int adminProMoimTotal(Criteria cri);
	
//	관리자 모임 홍보 상세보기
	MoimRecruitDTO adminGetRecruitDetail(String recruitnum);
	int adminRemoveRecruit(String recruitnum);
	int adminSearchReply(String recruitnum);
	int adminRemoveReply(String recruitnum);
	
//	관리자 게시글 리스트
	List<BoardDTO> adminBoardList(Criteria cri);
	int adminBoardTotal(Criteria cri);	
	
//	관리자 게시글 상세보기
	BoardDTO adminGetBoardDetail(String boardnum);
	int adminRemoveBoard(String boardnum);
	int adminSearchBoardReply(String boardnum);
	int adminRemoveBoardReply(String boardnum);
}
