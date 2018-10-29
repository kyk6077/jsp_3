package com.iu.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.board.BoardReplyDTO;
import com.iu.page.MakePager;
import com.iu.page.Pager;
import com.iu.page.RowNumber;

public class QnaService {
	
	//selectList
	public List<BoardReplyDTO> selectList(HttpServletRequest request, HttpServletResponse response){
		List<BoardReplyDTO> ar = null;
		QnaDAO qnaDAO = new QnaDAO(); 
		
		int curPage=1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {	}
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");
		
		MakePager makePager = new MakePager(curPage, search, kind);
		RowNumber rowNumber = makePager.makeRow();
		
		
		int totalCount;
		try {
			totalCount = qnaDAO.getCount(rowNumber.getSearch());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		makePager.makePage(totalCount);
		
		
		return ar;
	}
	
	
}
