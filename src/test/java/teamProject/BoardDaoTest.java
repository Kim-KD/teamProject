package teamProject;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.app.project.board.gh.GH_BoardBean;
import com.app.project.board.gh.GH_BoardDao;
import com.app.project.board.trip.Trip_BoardBean;
import com.app.project.board.trip.Trip_BoardDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*-context.xml")
public class BoardDaoTest {
	
	@Autowired
	GH_BoardDao ghDao;
	@Autowired
	Trip_BoardDao tripDao;

	//@Test
	//@Transactional
	// 게하 기본 게시글 작성
	public void ghInsertTest() {
		GH_BoardBean b = GH_BoardBean.builder().user_id("aaaa").title("제목")
				.content("내용").postcode("우편번호").city("지역주소")
				.address("상세주소").build();
		assertThat(ghDao.gh_Insert(b), is(1));
	}
	
	//@Test
	//@Transactional
	// 게하 상세 게시글 작성
	public void ghMoreInsertTest() {
		GH_BoardBean b = GH_BoardBean.builder().no(7).party_menu("바베큐").alcohol("쌉가능").party_time("8시")
				.off_time("10시").join_man(3).join_girl(3).party_day("5월15일").wifi("y").parking("있음")
				.morning("쌀밥").pet("y").check_in("오전 10시").check_out("오전 12시").build();
		assertThat(ghDao.gh_More_Insert(b), is(1));
	}

	//@Test
	//@Transactional
	// 게하 방정보 작성
	public void ghRoomInsertTest() {
		GH_BoardBean b = GH_BoardBean.builder().no(7).room("트윈룸").room_status("1").price(1000000).photo("사진")
				.room_people(2).build();
		assertThat(ghDao.gh_Room_Insert(b), is(1));
	}
	
	//@Test
	//@Transactional
	// 게하 후기 작성
	public void ghViewInsertTest() {
		GH_BoardBean b = GH_BoardBean.builder().no(7).user_id("aaaa").content("후기 내용").build();
		assertThat(ghDao.gh_View_Insert(b), is(1));
	}
	
	//@Test
	//@Transactional
	// 게하 게시글 수정
	public void ghUpdateTest() {
		GH_BoardBean b = GH_BoardBean.builder().no(3).user_id("aaaa").title("변경 제목")
				.content("변경 내용").postcode("우편번호").city("지역주소")
				.address("상세주소").build();
		assertThat(ghDao.gh_Update(b), is(1));
	}
	
	//@Test
	//@Transactional
	// 게하 게시글 삭제
	public void ghDeleteTest() {
		GH_BoardBean b = GH_BoardBean.builder().no(7).build();
		assertThat(ghDao.gh_Delete(7), is(4));
	}
	
//	//@Test
//	public void countTest() {
//		assertThat(ghDao.count(null), is(124));
//	}
//	
//	//@Test
//	public void findAllTest() {
//		assertThat(ghDao.findAll(1, 10).get(0).getBno(), is(126));
//		assertThat(ghDao.findAll(11, 20).get(0).getBno(), is(116));
//	}
	
	//@Test
	//@Transactional
	// 관광명소 게시글 작성
	public void tripInsertTest() {
		Trip_BoardBean b = Trip_BoardBean.builder().user_id("aaaa").title("제목")
				.content("내용").postcode("우편번호").city("지역주소").admission(2000)
				.opentime("10시").address("상세주소").photo("사진").build();
		assertThat(tripDao.trip_Insert(b), is(1));
	}
	
	//@Test
	//@Transactional
	// 관광명소 후기 작성
	public void tripViewInsertTest() {
		Trip_BoardBean b = Trip_BoardBean.builder().no(1).user_id("aaaa").content("후기 내용").build();
		assertThat(tripDao.trip_View_Insert(b), is(1));
	}
	
	//@Test
	//@Transactional
	// 관광명소 게시글 수정
	public void tripUpdateTest() {
		Trip_BoardBean b = Trip_BoardBean.builder().no(1).title("변경 제목")
				.content("변경 내용").postcode("변경 우편번호").city("변경 지역주소").admission(2000)
				.opentime("변경 10시").address("변경 상세주소").photo("변경 사진").build();
		assertThat(tripDao.trip_Update(b), is(1));
	}
	
	//@Test
	//@Transactional
	// 관광명소 게시글 삭제
	public void tripDeleteTest() {
		Trip_BoardBean b = Trip_BoardBean.builder().no(1).build();
		assertThat(tripDao.trip_Delete(1), is(2));
	}
}
