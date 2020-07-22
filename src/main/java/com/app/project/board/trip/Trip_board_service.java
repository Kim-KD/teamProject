package com.app.project.board.trip;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.app.project.board.UploadInfoBean;
import com.app.project.board.UploadInfoDao;
import com.app.project.util.Page;
import com.app.project.util.PagingUtil;

@Service
public class Trip_board_service {
	
	@Autowired
	private Trip_board_dao dao;
	@Autowired
	private UploadInfoDao uploadDao;

	public Page tripList(Integer pageno, String user_id, String on_off) {
		Integer countOfBoard = dao.trip_count(user_id,on_off);
		Page page = PagingUtil.getPage(pageno, countOfBoard);
		Integer srn = page.getStartRowNum();
		Integer ern = page.getEndRowNum();
		List<Trip_board_bean> boardList = dao.trip_find_all(srn, ern,user_id,on_off);
		page.setTrip_list(boardList);
		return page;
	}
	
	// 게시글 작성
	public Integer trip_write(Trip_board_bean board) throws IOException {
		
		dao.trip_insert(board);
		
		List<MultipartFile> uploadInfo = board.getUpload();
		if(uploadInfo!=null) {
			for(MultipartFile mf:uploadInfo) {
				UploadInfoBean a = new UploadInfoBean();
				String file_name = mf.getOriginalFilename();
				long time = System.nanoTime();
				String save_name = time + "-" + file_name;
				a.setNo(board.getNo()).setUser_id(board.getUser_id())
					.setFile_size((int)mf.getSize()).setFile_name(file_name)
					.setSave_name(save_name);
				File file = new File("d:/upload/attachment", save_name);
				FileCopyUtils.copy(mf.getBytes(), file);
				uploadDao.insert(a);
			}
		}
		return board.getNo();
	}
	
	// 게시글 읽기
	public Trip_board_bean trip_read(Integer no, String user_id) {
		Trip_board_bean board = dao.trip_read(no);
		// 로그인했다 && 글쓴이가 아니다
		if(user_id!=null && user_id.equals(board.getUser_id())==false)
			dao.trip_update(Trip_board_bean.builder().no(no).build());
		
//		String str = board.getW_date().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
//		board.setW_date(str);
		board.setUpload_info(uploadDao.findAllByBno(board.getNo()));
		board.setComments(dao.trip_view_find_all(board.getNo()));
		return board;
	}
	
	// 게시글 수정
	public Integer trip_update(Trip_board_bean board) {
		return dao.trip_update(board);
	}
	
	// 관리자 게시글 공개여부 수정
	public Integer admin_trip_update(String board) {
//		dao.trip_update(board);
		return null;
	}
	
	// 게시글 삭제
	public Integer trip_delete(Integer no) {
		return dao.trip_delete(no);
	}
	
	// 관리자 게시글 삭제
	public Integer admin_trip_delete(String no) {
		String no_str1 = no.replace("[","");
		String no_str2 = no_str1.replace("]","");
		String no_str3 = no_str2.replace("\"","");
		String[] no_list = no_str3.split(",");
		if(no_list!=null) {
			for (String number : no_list) {
				System.out.println("확인==========="+number);
				dao.trip_delete(Integer.parseInt(number));
			}
			return 1;
		}
		return 0;
	}
	
	// 후기 start
	// 게스트하우스 후기 작성
	public List<Trip_view_bean> trip_view_insert(Trip_view_bean view) {
		dao.trip_view_insert(view);
		return dao.trip_view_find_all(view.getNo());
	}

	// 게스트하우스 후기 읽기
	public Trip_view_bean trip_view_read(Integer vno) {
		return dao.trip_view_read(vno);
	}

	// 게스트하우스 후기 삭제
	public List<Trip_view_bean> trip_view_delete(Integer no, Integer vno) {
		dao.trip_view_delete(vno);
		return dao.trip_view_find_all(no); 
	}

	// 게스트하우스 후기 수정
	public Integer trip_view_update(Trip_view_bean view) {
		return dao.trip_view_update(view);
	}
}