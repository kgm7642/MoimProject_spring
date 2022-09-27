package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.UserDTO;

public interface UserMapper {
	
//	회원 가입
	void insert(UserDTO userdto);
	int checkId(UserDTO userdto);
	int checkNick(UserDTO userdto);
	int checkEmail(UserDTO userdto);
	
//	로그인
	int login(UserDTO userdto);
	String findId(UserDTO userdto);
	String findPw(UserDTO userdto);
	
//	회원 정보 수정
	void updateInfo(UserDTO userdto);
	UserDTO userInfo(String userid);
	
//	회원탈퇴
	List<Integer> selectMoimNum(String userid);
	void deleteChat(int moimnum);
	void deleteMembers(int moimnum);
	void deleteFireMoim(int moimnum);
	void deleteMoimJoin(int moimnum);
	List<Integer> getRecruitnums(int moimnum);
	void deleteMyProReply(int recruitnum);
	void deleteProReply(String userid);
	void deleteRecruit(int recruitnum);
	int getMPlaceNum(int moimnum);
	void deleteMoim(int moimnum);
	void deletePlace(int placenum);
	void deleteFire(String userid);
	void deleteMyChat(String userid);
	void deleteJoinJ(String userid);
	void deleteJoinK(String userid);
	void deleteMember(String userid);
	List<Integer> selectBoardNum(String userid);
	void deleteMyBoardReply(int boardnum);
	void deleteBoard(int boardnum);
	void deleteBoardReply(String userid);
	void deleteUser(String userid);
	
	void setKey(@Param("userid") String userid, @Param("userkey")  String userkey); 
	void completeEmail(@Param("userid") String userid, @Param("userkey")  String userkey);
}
