package memo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class MemoDAO{
	
	public int total(String col, String word){
		int total = 0;
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from  mymemo ");
		
		if(word.trim().length()>0){
			sql.append(" where " +col+ " like '%' || ? || '%' ");
		}	
			
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0){
				pstmt.setString(1,word);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				total = rs.getInt(1);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		
		
		return total;
		
	}
	
	public void upviewcount(int memonum){
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE mymemo  ");
		sql.append(" SET viewcount = viewcount + 1 ");
		sql.append(" WHERE memonum = ? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memonum);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}
		
		
	}

	public List<MemoDTO> list(Map map) {
		List<MemoDTO> list = new ArrayList<MemoDTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT memonum, title, viewcount, to_char(memodate, 'yyyy-mm-dd') memodate, r ");
		sql.append(" FROM( ");
		sql.append(" 	SELECT memonum, title, viewcount, memodate, rownum r ");
		sql.append(" 	FROM(	 ");
		sql.append(" 		SELECT memonum, title, viewcount, memodate ");
		sql.append(" 		FROM mymemo ");
		if(word.trim().length()>0){
			sql.append("	 where " +col+ " like '%' || ? || '%' ");
		}
		sql.append(" 		ORDER BY memonum DESC ");
		sql.append(" 	) ");
		sql.append(" ) ");
		sql.append(" WHERE r >= ? and r <= ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			int i = 1;
			
			if(word.trim().length()>0){
				pstmt.setString(i++, word);
			}
			pstmt.setInt(i++, sno);
			pstmt.setInt(i++, eno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemoDTO vo = new MemoDTO();
				vo.setMemonum(rs.getInt("memonum"));
				vo.setTitle(rs.getString("title"));
				vo.setViewcount(rs.getInt("viewcount"));
				vo.setMemodate(rs.getString("memodate"));

				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt, rs);
		}

		return list;

	}

	public int delete(int memonum) {
		int cnt = 0;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" DELETE FROM mymemo ");
		sql.append(" WHERE memonum = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memonum);// ★

			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}

	public int update(MemoDTO vo) {
		int cnt = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" UPDATE mymemo ");
		sql.append(" SET title = ?, ");
		sql.append(" content = ? ");
		sql.append(" WHERE memonum = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getMemonum());

			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}

	public MemoDTO read(int memonum) {
		MemoDTO vo = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT * from mymemo ");
		sql.append(" where memonum = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memonum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new MemoDTO();
				vo.setMemonum(rs.getInt("memonum"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setViewcount(rs.getInt("viewcount"));
				vo.setMemodate(rs.getString("memodate"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);

		}

		return vo;
	}

	public int create(MemoDTO vo) {
		int cnt = 0;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" insert into mymemo(memonum, title, content, memodate)  ");
		sql.append(" values(mymemo_seq.nextval,?,?,sysdate) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());

			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}

}
