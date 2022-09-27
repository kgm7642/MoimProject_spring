package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.project.mapper.MoimMapper;
import com.project.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MoimServiceImpl implements MoimService{
	
	@Setter(onMethod_ = @Autowired)
	private MoimMapper mapper;
	
//	============================ 장소 생성 ============================
	@Override
	public void insertPlace(PlaceDTO placedto) {
		mapper.insertPlace(placedto);
	}
	
//	============================ 모임 생성 ============================
	@Override
	public void insertMoim(MoimDTO moimdto) {
		mapper.insertMoim(moimdto);
	}
	
//	============================ 멤버 추가 ============================
	@Override
	public void insertMember(String userid, int moimnum) {
		mapper.insertMember(userid, moimnum);
	}
	
//	============================ 모임 리스트 ============================
	@Override
	public List<MoimDTO> moimList(Criteria cri) {
		return mapper.moimList(cri);
	}
	
	@Override
	public int moimTotal(Criteria cri) {
		return mapper.moimTotal(cri);
	}
	
//	============================ 모임 상세 보기 ============================
	@Override
	public List<String> getMemberId(String moimnum) {
		return mapper.getMemberId(moimnum);
	}
	
	@Override
	public UserDTO getMemberInfo(String userid) {
		return mapper.getMemberInfo(userid);
	}
	
	@Override
	public int getPlaceNum(String moimnum) {
		return mapper.getPlaceNum(moimnum);
	}
	
	@Override
	public MoimDTO getMoimDetail(String moimnum) {
		return mapper.getMoimDetail(moimnum);
	}
	
	@Override
	public PlaceDTO getPlaceDetail(int placenum) {
		return mapper.getPlaceDetail(placenum);
	}
	
	@Override
	public boolean checkAlreadyJoin(String userid, int moimnum) {
		return 0 == mapper.checkAlreadyJoin(userid, moimnum);
	}	
	
	@Override
	public boolean outMoim(String moimnum, String userid) {
		return 1 == mapper.outMoim(moimnum, userid);
	}
	
	@Override
	public void updateDislikeMoimnum(int moimnum) {
		mapper.updateDislikeMoimnum(moimnum);
	}
	
	@Override
	public int getDislikeMoim(int moimnum) {
		return mapper.getDislikeMoim(moimnum);
	}
	
//	============================ 모임 삭제하기 ============================	
	@Override
	public void cancelMoim(String moimnum, String placenum) {
		mapper.deleteChat(moimnum);
		mapper.deleteMembers(moimnum);
		mapper.deleteFireMoim(moimnum);
		mapper.deleteMoimJoin(moimnum);
		List<Integer> recruitnums = mapper.getRecruitnums(moimnum);
		if(recruitnums.size() > 0) {
			for(Integer recruitnum : recruitnums) {
				mapper.deleteProReply(""+recruitnum);
			}
		}
		mapper.deleteRecruit(moimnum);
		mapper.deleteMoim(moimnum);
		mapper.deletePlace(placenum);
	}
	
//	============================ 모임 채팅 ============================	
	@Override
	public MoimChatListDTO getChatList(String moimnum) {
		return new MoimChatListDTO(mapper.getChatList(moimnum));
	}
	
	@Override
	public boolean insertMoimChat(MoimChatDTO moimchatdto) {
		return 1 == mapper.insertMoimChat(moimchatdto);
	}
	
	@Override
	public MoimChatDTO getChatLast(String moimnum) {
		return mapper.getChatLast(moimnum);
	}
	
//	============================ 모임 신청 관리 ============================
	@Override
	public List<MoimJoinDTO> getMoimJoinList(String moimnum) {
		return mapper.getMoimJoinList(moimnum);
	}
	
	@Override
	public MoimJoinDTO getMoimJoin(String moimjoinnum) {
		return mapper.getMoimJoin(moimjoinnum);
	}
	
	@Override
	public void removeJoinList(MoimJoinDTO moimjoindto) {
		mapper.removeJoinList(moimjoindto);
	}
	
//	============================ 모임 가입 신청 ============================
	@Override
	public void insertJoinMoim(MoimJoinDTO moimjoindto) {
		mapper.insertJoinMoim(moimjoindto);
	}
	
//	============================ 모임 멤버 관리 ============================
	@Override
	public boolean fireMessage(FireMoimDTO firemoimdto) {
		return 1 == mapper.fireMessage(firemoimdto);	
	}
	
	@Override
	public boolean fireMember(String userid, int moimnum) {
		return 1 == mapper.fireMember(userid, moimnum);
	}
	
//	============================ 모임 수정 ============================
	@Override
	public void updateMoim(MoimDTO moimdto) {
		mapper.updateMoim(moimdto);
	}
	
	@Override
	public void updatePlace(PlaceDTO placedto) {
		mapper.updatePlace(placedto);
	}
	
//	============================ 모임 홍보 리스트 ============================
	@Override
	public int ProMoimTotal(Criteria cri) {
		return mapper.ProMoimTotal(cri);
	}
	
	@Override
	public List<MoimRecruitDTO> proMoimList(Criteria cri) {
		return mapper.proMoimList(cri);
	}
	
	@Override
	public boolean checkKing(String userid) {
		return 0 == mapper.checkKing(userid);
	}
	
	@Override
	public List<MoimDTO> getMyMoimList(String userid) {
		return mapper.getMyMoimList(userid);
	}
	
	@Override
	public boolean insertRecruit(MoimRecruitDTO moimrecruitdto) {
		return 1 == mapper.insertRecruit(moimrecruitdto);
	}
	
//	============================ 모임 홍보 게시판 상세보기 ============================
	@Override
	public MoimRecruitDTO getRecruitDetail(String recruitnum) {
		return mapper.getRecruitDetail(recruitnum);
	}
	
	@Override
	public void updateReadCnt(String recruitnum) {
		mapper.updateReadCnt(recruitnum);
	}
	
	@Override
	public boolean updateRecruit(MoimRecruitDTO moimrecruitdto) {
		return 1 == mapper.updateRecruit(moimrecruitdto);
	}
	
	@Override
	public boolean removeRecruit(String recruitnum) {
		boolean check = false;
		if(mapper.searchReply(recruitnum)>0) {
			mapper.removeReply(recruitnum);
		}
		if(mapper.removeRecruit(recruitnum)==1) {
			check = true;
		}
		return check;
	}
	
	@Override
	public void updateDislikeRecruitnum(int recruitnum) {
		mapper.updateDislikeRecruitnum(recruitnum);
	}
	
	@Override
	public int getDislikeRecruitnum(int recruitnum) {
		return mapper.getDislikeRecruitnum(recruitnum);
	}

//	============================ 내 전체 모임 ============================	
	
	@Override
	public List<MoimDTO> getMyMoimListAll(String userid, Criteria cri) {
		return mapper.getMyMoimListAll(userid, cri);
	}
	@Override
	public int getMyMoimTotal(String userid) {
		return mapper.getMyMoimTotal(userid);
	}
	
//	============================ 내가 방장인 모임 ============================	
	@Override
	public List<MoimDTO> getMyMoimListKing(String userid, Criteria cri) {
		return mapper.getMyMoimListKing(userid, cri);
	}
	
	@Override
	public int getMyMoimKingTotal(String userid) {
		return mapper.getMyMoimKingTotal(userid);
	}
	
//	============================ 강퇴당한 모임 ============================	
	@Override
	public List<FireMoimDTO> getMyBanList(String userid, Criteria cri) {
		return mapper.getMyBanList(userid, cri);
	}
	@Override
	public int getBanTotal(String userid) {
		return mapper.getBanTotal(userid);
	}
	@Override
	public void deleteMessage(int bannum) {
		mapper.deleteMessage(bannum);
	}
}

