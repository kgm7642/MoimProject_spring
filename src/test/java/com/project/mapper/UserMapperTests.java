package com.project.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.domain.Criteria;
import com.project.domain.UserDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTests {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
//	@Test
//	public void loginTest() {
//		UserDTO userdto = new UserDTO();
//		userdto.setUserid("apple");
//		userdto.setUserpw("123");
//		log.info("========================================================"+mapper.login(userdto));
//	}
}
