package com.app.project.board.trip;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.app.project.board.CommentDao;
import com.app.project.board.UploadInfoBean;
import com.app.project.board.UploadInfoDao;

@Service
public class Trip_BoardService {
	
	@Autowired
	private Trip_BoardDao dao;
	@Autowired
	private UploadInfoDao uploadDao;
	@Autowired
	private CommentDao commentDao;

	// 게시글 작성
	public int tripWrite(Trip_BoardBean board) throws IOException {
		
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
	public Trip_BoardBean tripRead(Integer no, String user_id) {
		Trip_BoardBean board = dao.trip_read(no);
		// 로그인했다 && 글쓴이가 아니다
		if(user_id!=null && user_id.equals(board.getUser_id())==false)
			dao.trip_update(Trip_BoardBean.builder().no(no).views(0).build());
		
//		String str = board.getW_date().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
//		board.setW_date(str);
		board.setUpload_info(uploadDao.findAllByBno(board.getNo()));
		board.setComments(commentDao.findAllByBno(board.getNo()));
		return board;
	}
	
	// 게시글 수정
	public int tripUpdate(Trip_BoardBean board) {
		return dao.trip_update(board);
	}
	
	// 게시글 삭제
	public int tripDelete(int no) {
		return dao.trip_delete(no);
	}
}