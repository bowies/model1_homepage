package guest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class GuestDAO{
	
	public int total(String col, String word){
		int total = 0;
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from  myguest ");
		
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
	
	public void upViewCnt(int guestnum){
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE myguest  ");
		sql.append(" SET viewcount = viewcount + 1 ");
		sql.append(" WHERE guestnum = ? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, guestnum);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}
		
		
	}

	public List<GuestDTO> list(Map map) {
		List<GuestDTO> list = new ArrayList<GuestDTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT guestnum, title, viewcount, to_char(guestdate, 'yyyy-mm-dd') guestdate, r ");
		sql.append(" FROM( ");
		sql.append(" 	SELECT guestnum, title, viewcount, guestdate, rownum r ");
		sql.append(" 	FROM(	 ");
		sql.append(" 		SELECT guestnum, title, viewcount, guestdate ");
		sql.append(" 		FROM myguest ");
		if(word.trim().length()>0){
			sql.append("	 where " +col+ " like '%' || ? || '%' ");
		}
		sql.append(" 		ORDER BY guestnum DESC ");
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
				GuestDTO vo = new GuestDTO();
				vo.setGuestnum(rs.getInt("guestnum"));
				vo.setTitle(rs.getString("title"));
				vo.setViewcount(rs.getInt("viewcount"));
				vo.setGuestdate(rs.getString("guestdate"));

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

	public int delete(int guestnum) {
		int cnt = 0;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" DELETE FROM myguest ");
		sql.append(" WHERE guestnum = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, guestnum);// ★

			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}

	public int update(GuestDTO vo) {
		int cnt = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" UPDATE guestnum ");
		sql.append(" SET title = ?, ");
		sql.append(" content = ? ");
		sql.append(" WHERE guestnum = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getGuestnum());

			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}

	public GuestDTO read(int guestnum) {
		GuestDTO vo = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT * from myguest ");
		sql.append(" where guestnum = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, guestnum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new GuestDTO();
				vo.setGuestnum(rs.getInt("guestnum"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setViewcount(rs.getInt("viewcount"));
				vo.setGuestdate(rs.getString("guestdate"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);

		}

		return vo;
	}

	public int create(GuestDTO vo) {
		int cnt = 0;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" insert into myguest(guestnum, title, content, guestdate)  ");
		sql.append(" values(myguest_seq.nextval,?,?,sysdate) ");

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
