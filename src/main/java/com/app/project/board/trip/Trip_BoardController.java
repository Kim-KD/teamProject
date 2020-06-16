package com.app.project.board.trip;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class Trip_BoardController {
	
	@Autowired
	private Trip_BoardService svc;
	
    // 이미지 업로드
    // product_edit페이지에서 맵핑되는 메소드
    @RequestMapping("imgeUpload")
    // 이미지를 저장하고, 불러오고, 업로드하기위해 매개변수를 선언
    public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload)
    //MultipartFile 타입은 ckedit에서 upload란 이름으로 저장하게 된다
            throws Exception {
 
        // 한글깨짐을 방지하기위해 문자셋 설정
        response.setCharacterEncoding("utf-8");
 
        // 마찬가지로 파라미터로 전달되는 response 객체의 한글 설정
        response.setContentType("text/html; charset=utf-8");
 
        // 업로드한 파일 이름
        String fileName = upload.getOriginalFilename();
 
        // 파일을 바이트 배열로 변환
        byte[] bytes = upload.getBytes();
 
        // 이미지를 업로드할 디렉토리(배포 디렉토리로 설정)
        String uploadPath = "D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\spring02\\WEB-INF\\views\\images\\";
        
        OutputStream out = new FileOutputStream(new File(uploadPath + fileName));
        
        // 서버로 업로드
        // write메소드의 매개값으로 파일의 총 바이트를 매개값으로 준다.
        // 지정된 바이트를 출력 스트립에 쓴다 (출력하기 위해서)
        out.write(bytes);
 
        // 클라이언트에 결과 표시
        String callback = request.getParameter("CKEditorFuncNum");
 
        // 서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
        PrintWriter printWriter = response.getWriter();
        String fileUrl = request.getContextPath() + "/images/" + fileName;
        printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
                + "','이미지가 업로드되었습니다.')" + "</script>");
        printWriter.flush();
    }
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/board/write")
	public String write(Trip_BoardBean board, Principal principal, HttpServletRequest request) {
		board.setUser_id(principal.getName());
		try {
			return "redirect:/trip/trip_read?bno=" + svc.tripWrite(board);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/trip";
	}
}