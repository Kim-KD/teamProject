package com.app.project.board.trip;

import java.io.File;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.app.project.board.gh.GH_BoardBean;

@Service
public class Trip_BoardService {
	
	@Autowired
	private Trip_BoardDao dao;

	// 게시글 작성
	public int tripWrite(Trip_BoardBean board) {
//		Trip_BoardBean board = modelMapper.map(dto, Board.class);
//		if(dto.getAttachments()!=null)
//			board.setAttachmentCnt(dto.getAttachments().size());
//		else
//			board.setAttachmentCnt(0);
		dao.trip_insert(board);
		
//		List<MultipartFile> attachments = dto.getAttachments();
//		List<Attachment> list = new ArrayList<Attachment>();
//		if(attachments!=null) {
//			for(MultipartFile mf:attachments) {
//				Attachment a = new Attachment();
//				String originalFileName = mf.getOriginalFilename();
//				long time = System.nanoTime();
//				String saveFileName = time + "-" + originalFileName;
//				boolean isImage = mf.getContentType().toLowerCase().startsWith("image/");
//				a.setBno(board.getBno()).setIsImage(isImage)
//					.setWriter(board.getWriter())
//					.setLength((int)mf.getSize())
//					.setOriginalFileName(originalFileName)
//					.setSaveFileName(saveFileName);
//				File file = new File("d:/upload/attachment", saveFileName);
//				FileCopyUtils.copy(mf.getBytes(), file);
//				attachmentDao.insert(a);
//			}
//		}
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
//		if(board.getAttachmentCnt()>0)
//			board.setAttachments(attachmentDao.findAllByBno(board.getNo()));
//		if(board.getCommentCnt()>0)
//			board.setComments(commentDao.findAllByBno(board.getNo()));
		return board;
	}
	
	// 게시글 수정
	public int tripUpdate(Trip_BoardBean boardBean) {
		return dao.trip_update(boardBean);
	}
	
	// 게시글 삭제
	public int tripDelete(int no) {
		return dao.trip_delete(no);
	}
}