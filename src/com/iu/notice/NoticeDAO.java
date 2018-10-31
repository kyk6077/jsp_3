package com.iu.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.board.BoardDAO;
import com.iu.board.BoardDTO;
import com.iu.page.RowNumber;
import com.iu.page.Search;
import com.iu.util.DBConnector;
import com.oreilly.servlet.MultipartRequest;

public class NoticeDAO implements BoardDAO{

	
	
	@Override
	public List<BoardDTO> SelectList(RowNumber rowNumber) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "SELECT * FROM "
				+ "(select rownum R, N.* from "
				+ "(select num, title, writer, reg_date, hit from notice "
				+ "where "+rowNumber.getSearch().getKind()+" like ? "
				+ "order by num desc) N) " 
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+rowNumber.getSearch().getSearch()+"%");
		st.setInt(2, rowNumber.getStartRow());
		st.setInt(3, rowNumber.getLastRow());
		ResultSet rs = st.executeQuery();
		List<BoardDTO> ntList = new ArrayList<>();
		while(rs.next()) {
			NoticeDTO nt = new NoticeDTO();
			nt.setNum(rs.getInt("num"));
			nt.setTitle(rs.getString("title"));
			nt.setWriter(rs.getString("writer"));
			nt.setReg_date(rs.getDate("reg_date"));
			nt.setHit(rs.getInt("hit"));
			ntList.add(nt);
		}
		
		DBConnector.disConnect(rs, st, con);
		return ntList;
	}

	//selectOne
	public NoticeDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from notice where num=? order by reg_date asc";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
//		rs.get NoticeDTO 사용
		NoticeDTO nt = new NoticeDTO();
		if(rs.next()) {
			nt.setNum(rs.getInt(1));
			nt.setTitle(rs.getString(2));
			nt.setContents(rs.getString(3));
			nt.setWriter(rs.getString(4));
			nt.setReg_date(rs.getDate(5));
			nt.setHit(rs.getInt(6));
		}
		DBConnector.disConnect(rs, st, con);		
		return nt;
	}
	//seq
	public int getNum() throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select notice_seq.nextval from dual";
		PreparedStatement st =  con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int num = rs.getInt(1); 
		DBConnector.disConnect(rs, st, con);
		return num;
	}
	
	//insert
	public int insert(BoardDTO boardDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "Insert into notice values(?,?,?,?,sysdate,0)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, boardDTO.getNum());
		st.setString(2, boardDTO.getTitle());
		st.setString(3, boardDTO.getContents());
		st.setString(4, boardDTO.getWriter());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update notice set title=?,contents=?,reg_date=sysdate where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1,boardDTO.getTitle());
		st.setString(2,boardDTO.getContents());
		st.setInt(3,boardDTO.getNum());
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

	@Override
	public int delete(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "delete notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

	@Override
	public int getCount(Search search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "SELECT count(num) from notice "
				+ "Where "+search.getKind()+" like ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search.getSearch()+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	
}
