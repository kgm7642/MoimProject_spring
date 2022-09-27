package com.project.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MoimServiceTests {

	@Setter(onMethod_ = @Autowired)
	private MoimService service;
	
//	@Test
//	public void checkKingTest() {
//		log.info(service.checkKing("apple1"));
//	}

//	@Test
//	public void getRecruitDetail() {
//		log.info(service.getRecruitDetail("2"));		
//	}
	
//	@Test
//	public void getMoimnumTest() {
//		service.getMoimnum("apple1");
//	}
	
//	@Test
//	public void getMyMoimListAll() {
//		log.info("-=-=-=-=--=-==--==-=-"+service.getMyMoimListAll("apple1", new Criteria()));
//	}
	
	@Test
	public void getMyBanList() {
		log.info(service.getMyBanList("cherry", new Criteria()));
	}
}
