package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.BoardDTO;
import com.project.domain.Criteria;
import com.project.domain.MoimDTO;
import com.project.domain.MoimRecruitDTO;
import com.project.domain.NoticeDTO;
import com.project.domain.PlaceDTO;
import com.project.domain.UserDTO;
import com.project.mapper.AdminMapper;
import com.project.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService{

	@Setter(onMethod_ = @Autowired)
	private AdminMapper mapper;
	
//	============================ 공지사항 리스트 ============================
	@Override
	public List<NoticeDTO> adminNoticeList(Criteria cri) {
		return mapper.adminNoticeList(cri);
	}
	
	@Override
	public int adminNoticeTotal(Criteria cri) {
		return mapper.adminNoticeTotal(cri);
	}
	
//	============================ 공지사항 작성하기 ============================
	@Override
	public boolean insertAdminNotice(NoticeDTO noticedto) {
		return 1 == mapper.insertAdminNotice(noticedto);
	}
	
//	============================ 공지사항 상세보기 ============================
	@Override
	public NoticeDTO getAdminNoticeDetail(String noticenum) {
		return mapper.getAdminNoticeDetail(noticenum);
	}
	
//	============================ 공지사항 수정하기 ============================
	@Override
	public boolean updateAdminNotice(NoticeDTO noticedto) {
		return 1 == mapper.updateAdminNotice(noticedto);
	}
	
//	============================ 공지사항 삭제하기 ============================
	@Override
	public boolean removeAdminNotice(String noticenum) {
		return 1 == mapper.removeAdminNotice(noticenum);
	}
	
//	============================ 관리자 모임 리스트 ============================
	@Override
	public int adminMoimTotal(Criteria cri) {
		return mapper.adminMoimTotal(cri);
	}

	@Override
	public List<MoimDTO> adminMoimList(Criteria cri) {
		return mapper.adminMoimList(cri);
	}
	
//	============================ 관리자 모임 상세보기 ============================
	@Override
	public List<String> adminGetMemberId(String moimnum) {
		return mapper.adminGetMemberId(moimnum);
	}
	
	@Override
	public UserDTO adminGetMemberInfo(String userid) {
		return mapper.adminGetMemberInfo(userid);
	}
	
	@Override
	public int adminGetPlaceNum(String moimnum) {
		return mapper.adminGetPlaceNum(moimnum);
	}
	
	@Override
	public MoimDTO adminGetMoimDetail(String moimnum) {
		return mapper.adminGetMoimDetail(moimnum);
	}
	
	@Override
	public PlaceDTO adminGetPlaceDetail(int placenum) {
		return mapper.adminGetPlaceDetail(placenum);
	}
	
//	============================ 관리자 모임 삭제하기 ============================
	@Override
	public void adminCancelMoim(String moimnum, String placenum) {
		mapper.adminDeleteChat(moimnum);
		mapper.adminDeleteMembers(moimnum);
		mapper.adminDeleteFireMoim(moimnum);
		mapper.adminDeleteMoimJoin(moimnum);
		List<Integer> recruitnums = mapper.adminGetRecruitnums(moimnum);
		if(recruitnums.size() > 0) {
			for(Integer recruitnum : recruitnums) {
				mapper.adminDeleteProReply(""+recruitnum);
			}
		}
		mapper.adminDeleteRecruit(moimnum);
		mapper.adminDeleteMoim(moimnum);
		mapper.adminDeletePlace(placenum);
	}
	
//	============================ 관리자 모임 홍보 리스트 ============================
	@Override
	public List<MoimRecruitDTO> adminProMoimList(Criteria cri) {
		return mapper.adminProMoimList(cri);
	}
	
	@Override
	public int adminProMoimTotal(Criteria cri) {
		return mapper.adminProMoimTotal(cri);
	}
	
//	============================ 관리자 모임 홍보 상세보기 ============================
	@Override
	public MoimRecruitDTO adminGetRecruitDetail(String recruitnum) {
		return mapper.adminGetRecruitDetail(recruitnum);
	}
	
	@Override
	public boolean adminRemoveRecruit(String recruitnum) {
		boolean check = false;
		if(mapper.adminSearchReply(recruitnum)>0) {
			mapper.adminRemoveReply(recruitnum);
		}
		if(mapper.adminRemoveRecruit(recruitnum)==1) {
			check = true;
		}
		return check;
	}
	
//	============================ 관리자 게시글 리스트 ============================
	@Override
	public List<BoardDTO> adminBoardList(Criteria cri) {
		return mapper.adminBoardList(cri);
	}
	
	@Override
	public int adminBoardTotal(Criteria cri) {
		return mapper.adminBoardTotal(cri);
	}
	
//	============================ 관리자 게시글 상세보기 ============================
	@Override
	public BoardDTO adminGetBoardDetail(String boardnum) {
		return mapper.adminGetBoardDetail(boardnum);
	}
	
	@Override
	public boolean adminRemoveBoard(String boardnum) {
		boolean check = false;
		if(mapper.adminSearchBoardReply(boardnum)>0) {
			mapper.adminRemoveBoardReply(boardnum);
		}
		if(mapper.adminRemoveBoard(boardnum)==1) {
			check = true;
		}
		return check;
	}	
}
