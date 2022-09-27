package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

import com.project.domain.Criteria;
import com.project.domain.FireMoimDTO;
import com.project.domain.MemberDTO;
import com.project.domain.MoimChatDTO;
import com.project.domain.MoimDTO;
import com.project.domain.MoimJoinDTO;
import com.project.domain.MoimMemberDTO;
import com.project.domain.MoimRecruitDTO;
import com.project.domain.PlaceDTO;
import com.project.domain.UserDTO;

public interface MoimMapper {
	
//	장소 생성
	void insertPlace(PlaceDTO placedto);
	
//	모임 생성
	void insertMoim(MoimDTO moimdto);
	
//	멤버 추가
	void insertMember(@Param("userid") String userid, @Param("moimnum") int moimnum);
	
//	모임 리스트
	int moimTotal(Criteria cri);
	List<MoimDTO> moimList(Criteria cri);
	
//	모임 상세 보기
	List<String> getMemberId(String moimnum);
	UserDTO getMemberInfo(String userid);
	int getPlaceNum(String moimnum);
	MoimDTO getMoimDetail(String moimnum);
	PlaceDTO getPlaceDetail(int placenum);
	int checkAlreadyJoin(@Param("userid") String userid, @Param("moimnum") int moimnum);
	int outMoim(@Param("moimnum") String moimnum, @Param("userid") String userid);
	void updateDislikeMoimnum(int moimnum);
	int getDislikeMoim(int moimnum);
	void deleteChat(String moimnum);
	void deleteMembers(String moimnum);
	void deleteFireMoim(String moimnum);
	void deleteMoimJoin(String moimnum);
	List<Integer> getRecruitnums(String moimnum);
	void deleteRecruit(String moimnum);
	void deleteProReply(String recruitnum);
	void deleteMoim(String moimnum);
	void deletePlace(String placenum);
	
//	모임 채팅
	List<MoimChatDTO> getChatList(String moimnum);
	int insertMoimChat(MoimChatDTO moimchatdto);
	MoimChatDTO getChatLast(String moimnum);
	
//	모임 신청 관리
	List<MoimJoinDTO> getMoimJoinList(String moimnum);
	MoimJoinDTO getMoimJoin(String moimjoinnum);
	void removeJoinList(MoimJoinDTO moimjoindto);
	
//	모임 가입 신청	
	void insertJoinMoim(MoimJoinDTO moimjoindto);
	
//	모임 멤버 관리
	int fireMessage(FireMoimDTO firemoimdto);
	int fireMember(@Param("userid") String userid, @Param("moimnum") int moimnum);
	
//	모임 수정
	void updateMoim(MoimDTO moimdto);
	void updatePlace(PlaceDTO placedto);
	
//	모임 홍보 리스트
	int ProMoimTotal(Criteria cri);
	List<MoimRecruitDTO> proMoimList(Criteria cri);
	int checkKing(String userid);
	List<MoimDTO> getMyMoimList(String userid);
	int insertRecruit(MoimRecruitDTO moimrecruitdto);
	
//	모임 홍보 게시판 상세보기
	MoimRecruitDTO getRecruitDetail(String recruitnum);
	void updateReadCnt(String recruitnum);
	int updateRecruit(MoimRecruitDTO moimrecruitdto);	
	int removeRecruit(String recruitnum);
	int searchReply(String recruitnum);
	int removeReply(String recruitnum);
	void updateDislikeRecruitnum(int recruitnum);
	int getDislikeRecruitnum(int recruitnum);
	
//	내 전체 모임
	List<MoimDTO> getMyMoimListAll(@Param("userid") String userid, @Param("cri") Criteria cri);
	int getMyMoimTotal(String userid);
	
//	내가 방장인 모임
	List<MoimDTO> getMyMoimListKing(@Param("userid") String userid, @Param("cri") Criteria cri);
	int getMyMoimKingTotal(String userid);
	
//	강퇴당한 모임
	List<FireMoimDTO> getMyBanList(@Param("userid") String userid, @Param("cri") Criteria cri);
	int getBanTotal(String userid);
	void deleteMessage(int bannum);
}
