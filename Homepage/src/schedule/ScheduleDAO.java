package schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utility.DBClose;
import utility.DBOpen;

public class ScheduleDAO {
	/*
	CREATE TABLE mycalendar(
			  calendardate  VARCHAR(100)	NOT NULL, 
			  title       	VARCHAR(100)  	NOT NULL, -- 제목(*)
			  content     	VARCHAR(4000)	NOT NULL, -- 글 내용
			  label 		VARCHAR(100)	default 'v',
			  PRIMARY KEY(calendardate)
			);
	
		private String calendardate;
		private String title;
		private String content;
		private String label;
			
			*/
	public int labelcount() {
		int cnt = 0;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select count(*) as cnt from mycalendarindex ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");				
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}
	
	public String labelread(String calendardate) {
		String string = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT label from mycalendar ");
		sql.append(" where calendardate = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, calendardate);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				string = rs.getString("label");				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);

		}

		return string;
	}

	
	public String labelfordate(int calendarnum) {
		String string = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT calendardate from mycalendarindex ");
		sql.append(" where calendarnum = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, calendarnum);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				string = rs.getString("calendardate");				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);

		}

		return string;
	}
	
	
	public int delete(String calendardate) {
		int cnt = 0;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
//
//		sql.append(" DELETE FROM mycalendar ");
//		sql.append(" WHERE calendardate = ? ");
//		

		sql.append(" UPDATE mycalendar ");
		sql.append(" SET title = ?, ");
		sql.append(" content = ?, ");
		sql.append(" label = ? ");
		sql.append(" WHERE calendardate = ? ");
		

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, "　");//
			pstmt.setString(2, "　");// 
			pstmt.setString(3, "　");// 			
			pstmt.setString(4, calendardate);// ★

			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}


	
	
	
	public int update(ScheduleDTO dto) {
		int cnt = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" UPDATE mycalendar ");
		sql.append(" SET title = ?, ");
		sql.append(" content = ?, ");
		sql.append(" label = ? ");
		sql.append(" WHERE calendardate = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getLabel());
			pstmt.setString(4, dto.getCalendardate());

			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}

	
	public int create(ScheduleDTO dto) {
		int cnt = 0;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" insert into mycalendar(calendardate, title, content, label)  ");
		sql.append(" values(?, ?,?,?) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getCalendardate());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getLabel()                                                                                                                                                                                                                                                                                                                                                                                                                                                                           );

			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}
	
	public int indexcreate(ScheduleDTO dto) {
		int cnt = 0;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" insert into mycalendarindex(calendarnum, calendardate)  ");
		sql.append(" values(mycalendarindex_seq.nextval, ?) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getCalendardate());   
			
			cnt = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}
	
	
	public ScheduleDTO read(String calendardate) {
		ScheduleDTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT * from mycalendar ");
		sql.append(" where calendardate = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, calendardate);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new ScheduleDTO();
				dto.setCalendardate(rs.getString("calendardate"));
				dto.setContent(rs.getString("content"));
				dto.setLabel(rs.getString("label"));
				dto.setTitle(rs.getString("title"));
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);

		}

		return dto;
	}


	
	
}
