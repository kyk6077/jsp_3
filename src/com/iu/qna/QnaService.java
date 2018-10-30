package com.iu.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iu.action.ActionForward;
import com.iu.board.BoardDTO;
import com.iu.board.BoardReplyDTO;
import com.iu.board.BoardService;
import com.iu.page.MakePager;
import com.iu.page.Pager;
import com.iu.page.RowNumber;

public class QnaService implements BoardService{
	private QnaDAO qnaDAO;
	
	public QnaService() {
		qnaDAO = new QnaDAO();
	}
	
	
	
	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
//		qnaDAO.insert(boardDTO);
		
		
		
		return actionForward;
	}



	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
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
			actionForward.setPath("../WEB-INF/view/board/boardList.jsp");
			request.setAttribute("pager", pager);
			request.setAttribute("list", ar);
			request.setAttribute("board", "qna");
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
			actionForward.setPath("../WEB-INF/view/board/boardSelectOne.jsp");
			request.setAttribute("board","qna");
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
