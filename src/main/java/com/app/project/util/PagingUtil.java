package com.app.project.util;

import com.app.project.board.Page;

public class PagingUtil {
	// 페이지당 글의 개수
		private final static int numberOfBoardPerPage = 12;
	// 블록당 페이지의 개수
		private final static int numberOfPagePerBlock = 5;	
	
	public static Page getPage(int pageno, int countOfBoard) {
		int countOfPage = countOfBoard/numberOfBoardPerPage+1;
		// 나머지가 0일 경우 처리 
		if(countOfBoard%numberOfBoardPerPage==0)
			countOfPage--;
		if(pageno>countOfPage)
			pageno=1;
		
		
		int startRowNum = (pageno-1) * numberOfBoardPerPage;
		int endRowNum = startRowNum + numberOfBoardPerPage-numberOfBoardPerPage*pageno;
		endRowNum = (endRowNum==0)?numberOfBoardPerPage:endRowNum;
		endRowNum = (endRowNum>countOfBoard)?countOfBoard:endRowNum;
		
		int blockNo = (pageno-1)/numberOfPagePerBlock ;
		int startPage = blockNo * numberOfPagePerBlock + 1;
		int endPage = startPage + numberOfPagePerBlock - 1;		//5		10
		//마지막 페이지가 페이지의 개수보다 클 수 없다
		endPage = (endPage>countOfPage)?countOfPage:endPage;
		
		boolean isPrev = blockNo>0? true : false;
		boolean isNext = endPage != countOfPage? true:false;
		
		return Page.builder().startPage(startPage).endPage(endPage).startRowNum(startRowNum).endRowNum(endRowNum)
				.pageno(pageno).isPrev(isPrev).isNext(isNext).build();
	}
}
