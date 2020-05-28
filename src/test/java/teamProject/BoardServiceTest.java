package teamProject;

import java.util.Map;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.app.project.board.gh.GH_BoardService;
import com.app.project.board.trip.Trip_BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class BoardServiceTest {

	@Autowired
	GH_BoardService gsvc;
	@Autowired
	Trip_BoardService tsvc;
	
	//@Test
	public void ghReadTest() {
		Map<String,Object> map = gsvc.ghRead(5);
		System.out.println(map.get("info"));
		System.out.println(map.get("view"));
	}
	
}