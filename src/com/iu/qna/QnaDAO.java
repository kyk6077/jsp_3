package com.iu.qna;

import java.util.List;

import com.iu.board.BoardDAO;
import com.iu.board.BoardDTO;
import com.iu.board.BoardReply;
import com.iu.board.BoardReplyDTO;

public class QnaDAO implements BoardDAO, BoardReply {
	
	
	
	//BoardReply

	@Override
	public int reply(BoardReplyDTO boardReplyDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyUpdate(BoardReplyDTO boardReplyDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	//boardDAO
	
	
	@Override
	public List<BoardDTO> SelectList(int startRow, int lastRow, String kind, String search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardDTO selectOne(int num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCount(String kind, String search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
