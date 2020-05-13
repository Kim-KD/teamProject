package teamProject;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import java.time.LocalDateTime;

import org.hamcrest.Matcher;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.app.project.user.UserBean;
import com.app.project.user.UserDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class UserDaotest {
	
	@Autowired
	UserDao dao;
	
	// 일반 회원가입 테스트
	//@Test
	//@Transactional
	public void insertTest() {
		UserBean user = UserBean.builder().user_id("bb").user_status("d")
				.user_pwd("1111").user_name("pjm").user_radio("010")
				.user_cable("0000").user_email("aaa").user_gender("m")
				.user_job("bs").change_pwd("1111").build();
		
		//dao.user_join(user);
		//System.out.println(user);
		assertThat(dao.user_join(user),is(1));
	}
	
	// 일반 정보수정 테스트
	//@Test
	public void updateTest() {
		UserBean user = UserBean.builder().user_id("aa")
				.user_pwd("2222").user_radio("070")
				.user_cable("1010").user_email("aaa@a.com").build();
		assertThat(dao.user_info_update(user), is(1));
	}
	
	// 로그인 테스트
	//@Test
	public void loginTest() {
		UserBean user = UserBean.builder().user_id("aa").user_pwd("2222").build();
		dao.login(user);
		System.out.println(user);
	}
	
	// 아이디 중복 테스트
	//@Test
	public void existByIdTest() {
		assertThat(dao.id_chk("aavvv"), is(1));
	}
}