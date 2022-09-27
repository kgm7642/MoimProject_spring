package com.project.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.Criteria;
import com.project.domain.FireMoimDTO;
import com.project.domain.UserDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class MoimMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MoimMapper mapper;
//	
//	@Test
//	public void moimTotalTest() {
//		Criteria cri = new Criteria();
//		cri.setAmount(10);
//		cri.setPagenum(1);
//		cri.setKeyword("바");xt
//		cri.setType("T");
//		log.info("=================="+mapper.moimTotal(cri));
//	}
	
//	@Test
//	public void moimListTest() {
//		Criteria cri = new Criteria();
//		cri.setType("T");
//		cri.setKeyword("바");
//		log.info("=================="+mapper.moimList(cri));
//	}
	
//	@Test
//	public void getPlaceNumTest() {
//		log.info("=========="+mapper.getPlaceNum("21"));
//	}
	
//	@Test
//	public void getMemberInfoTest() {
//		UserDTO MemberInfo = new UserDTO();
//		MemberInfo = mapper.getMemberInfo("apple");
//		log.info("=========="+MemberInfo);
//	}
	
//	@Test
//	public void getMemberIdTest() {
//		log.info(mapper.getMemberId("21"));
//	}
	
//	@Test
//	public void getMoimDetailTest() {
//		log.info(mapper.getMoimDetail("1"));
//	}

//	@Test
//	public void getPlaceDetailTest() {
//		log.info(mapper.getPlaceDetail(1));
//	}
	
//	@Test
//	public void checkKingTest() {
//		log.info(mapper.checkKing("apple"));
//	}
	
//	@Test
//	public void getMoimnumTest() {
//		log.info("================="+mapper.getMoimnum("apple1"));
//	}
	
//	@Test
//	public void getMyMoimListAllTest() {
//		log.info("================="+mapper.getMyMoimListAll(1));
//	}
	
	@Test
	public void fireMessageTest() {
		FireMoimDTO f = new FireMoimDTO();
		f.setMessage("하하");
		f.setMoimnum(1);
		f.setUserid("durian");
		log.info("======================"+mapper.fireMessage(f));
	}
}
