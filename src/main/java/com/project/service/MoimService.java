package com.project.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.Criteria;
import com.project.domain.FireMoimDTO;
import com.project.domain.MemberDTO;
import com.project.domain.MoimChatDTO;
import com.project.domain.MoimChatListDTO;
import com.project.domain.MoimDTO;
import com.project.domain.MoimJoinDTO;
import com.project.domain.MoimMemberDTO;
import com.project.domain.MoimRecruitDTO;
import com.project.domain.PlaceDTO;
import com.project.domain.UserDTO;

public interface MoimService {

//	장소 생성
	public void insertPlace(PlaceDTO placedto);
	
//	모임 생성
	public void insertMoim(MoimDTO moimdto);
	
//	멤버 추가
	public void insertMember(String userid, int moimnum);
	
//	모임 리스트
	public int moimTotal(Criteria cri);
	public List<MoimDTO> moimList(Criteria cri);
	
//	모임 상세 보기
	public List<String> getMemberId(String moimnum);
	public UserDTO getMemberInfo(String userid);
	public int getPlaceNum(String moimnum);
	public MoimDTO getMoimDetail(String moimnum);
	public PlaceDTO getPlaceDetail(int placenum);
	public boolean checkAlreadyJoin(String userid, int moimnum);
	public boolean outMoim(String moimnum, String userid);
	public void updateDislikeMoimnum(int moimnum);
	public int getDislikeMoim(int moimnum);
	public void cancelMoim(String moimnum, String placenum);
	
//	모임 채팅
	public MoimChatListDTO getChatList(String moimnum);
	public boolean insertMoimChat(MoimChatDTO moimchatdto);
	public MoimChatDTO getChatLast(String moimnum);
	
//	모임 신청 관리
	public List<MoimJoinDTO> getMoimJoinList(String moimnum);
	public MoimJoinDTO getMoimJoin(String moimjoinnum);
	public void removeJoinList(MoimJoinDTO moimjoindto);
	
//	모임 가입 신청
	public void insertJoinMoim(MoimJoinDTO moimjoindto);
	
//	모임 멤버 관리
	public boolean fireMessage(FireMoimDTO firemoimdto);
	public boolean fireMember(String userid, int moimnum);
	
//	모임 수정
	public void updateMoim(MoimDTO moimdto);
	public void updatePlace(PlaceDTO placedto);
	
//	모임 홍보 리스트
	public int ProMoimTotal(Criteria cri);
	public List<MoimRecruitDTO> proMoimList(Criteria cri);
	public boolean checkKing(String userid);
	public List<MoimDTO> getMyMoimList(String userid);
	public boolean insertRecruit(MoimRecruitDTO moimrecruitdto);

//	모임 홍보 게시판 상세보기
	public MoimRecruitDTO getRecruitDetail(String recruitnum);
	public void updateReadCnt(String recruitnum);
	public boolean updateRecruit(MoimRecruitDTO moimrecruitdto);
	public void updateDislikeRecruitnum(int recruitnum);
	public int getDislikeRecruitnum(int recruitnum);
	
//	모임 홍보 게시판 삭제
	public boolean removeRecruit(String recruitnum);

//	내 전체 모임
	public List<MoimDTO> getMyMoimListAll(String userid, Criteria cri);
	public int getMyMoimTotal(String userid);
	
//	내가 방장인 모임
	public List<MoimDTO> getMyMoimListKing(String userid, Criteria cri);
	public int getMyMoimKingTotal(String userid);
	
//	강퇴당한 모임
	public List<FireMoimDTO> getMyBanList(String userid, Criteria cri);
	public int getBanTotal(String userid);
	public void deleteMessage(int bannum);
}
