package com.iu.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.ActionForward;
import com.iu.board.BoardDTO;
import com.iu.board.BoardReplyDTO;
import com.iu.page.MakePager;
import com.iu.page.Pager;
import com.iu.page.RowNumber;

public class QnaService {
	private QnaDAO qnaDAO;
	
	public QnaService() {
		qnaDAO = new QnaDAO();
	}
	
	//selectList
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response){
		ActionForward actionForward = new ActionForward();
		
		int curPage=1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {	}
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");
		
		MakePager makePager = new MakePager(curPage, search, kind);
		RowNumber rowNumber = makePager.makeRow();
		
		try {
			int totalCount = qnaDAO.getCount(rowNumber.getSearch());
			Pager pager = makePager.makePage(totalCount);
			List<BoardDTO> ar = qnaDAO.SelectList(rowNumber);
			actionForward.setPath("../WEB-INF/qna/qnaList.jsp");
			request.setAttribute("pager", pager);
			request.setAttribute("list", ar);
			
		} catch (Exception e) {
			actionForward.setPath("../common/result.jsp");
			request.setAttribute("message", "Fail");
			request.setAttribute("path", "../index.jsp");
		}
		
		
		actionForward.setCheck(true);
		return actionForward;
	}
	
	//selectOne
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		QnaDTO qnaDTO = null;
		int num = Integer.parseInt(request.getParameter("num"));
		try {
			qnaDTO = qnaDAO.selectOne(num);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/qna/qnaSelectOne.jsp");
			request.setAttribute("dto", qnaDTO);
		} catch (Exception e) {
			actionForward.setCheck(false);
			actionForward.setPath("./qna/qnalist.do");
		}
		if(qnaDTO==null) {
			actionForward.setCheck(false);
			actionForward.setPath("./qna/qnalist.do");
		}
		
		return actionForward; 
	}
	
	
}
