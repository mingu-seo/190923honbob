package member;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/*-servlet.xml"}) // classpath : 클래스파일이 존재하는 위치

@WebAppConfiguration
public class MemberList {

	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc; // mock : 목업(가상)
	
	// JUnit 실행순서
	// before -> test -> after
	// @Before -> @Test -> @After
	
	@Before
	public void init() {
		// test 전에 초기화(기본 설정)
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void memberList2() throws Exception {
		// 가상의 mock을 통해 get방식으로 /memberList2.do URL 대입해서 객체 생성
		RequestBuilder req = MockMvcRequestBuilders.get("/memberList2.do")
				.param("from", "2019-12-01")
				.param("to", "2019-12-10");
		mockMvc.perform(req);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
