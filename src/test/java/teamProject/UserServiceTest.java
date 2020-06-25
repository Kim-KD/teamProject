package teamProject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.app.project.user.User_bean;
import com.app.project.user.User_service;

import lombok.Builder;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class UserServiceTest {

	@Autowired
	private User_service usvc;
	
	@Test
	public void update() {
		User_bean user = User_bean.builder().user_id("test1234").user_pwd("test1234!")
				.user_status("0").build();
		usvc.userInfoUpdate(user);
	}
}
