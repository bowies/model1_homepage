package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import member.MemberDTO;
import utility.DBClose;
import utility.DBOpen;

public class MemberDAO {

	public int duplicateEmail(String email) {
		Connection con = DBOpen.getConnection(); // DBMS 연결
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;

		try {
			StringBuffer sql = new StringBuffer(); // 문자열 편집 지원

			sql.append(" SELECT COUNT(*) as cnt");
			sql.append(" FROM mymember ");
			sql.append(" WHERE email=?");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next() == true) { // 첫번째 레코드로 이동, 다음부터 다음레코드로 이동
				cnt = rs.getInt("cnt");
			}

		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return cnt;
	}

	public int duplicateId(String id) {
		int cnt = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		ResultSet rs = null;

		sql.append("  SELECT count(id) FROM mymember  ");
		sql.append("  WHERE id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return cnt;
	}

	public int updatePassword(String id, String password) {
		int cnt = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append("  update mymember set password = ? where id = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, password);
			pstmt.setString(2, id);

			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;

	}

	public int update(MemberDTO dto) {
		int cnt = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append("  UPDATE mymember  ");
		sql.append("  SET phone = ? , email = ? , zipcode = ? , address1 = ? , address2 = ? , job = ? ");
		sql.append("  WHERE id = ?   ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPhone());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setString(6, dto.getJob());
			pstmt.setString(7, dto.getId());

			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}

	public int updateFile(String id, String picturename) {
		int cnt = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append("  update mymember  ");
		sql.append("  set picturename = ?  ");
		sql.append("  where id = ?   ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, picturename);
			pstmt.setString(2, id);

			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}

	public int delete(String id) {
		int cnt = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" DELETE FROM mymember WHERE id=?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;

	}

	public String getPicturename(String id) {
		String picturename = "";
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append("  Select picturename from mymember where id = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				picturename = rs.getString("picturename");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return picturename;
	}

	public int total(String col, String word) {
		int total = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append("  SELECT count(*) FROM mymember  ");
		if (word.trim().length() > 0) {
			sql.append("  WHERE  " + col + "  LIKE '%' || ? || '%'  ");
		}

		try {
			pstmt = con.prepareStatement(sql.toString());

			if (word.trim().length() > 0) {
				pstmt.setString(1, word);
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {
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

	public List<MemberDTO> list(Map map) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");
		String col = (String) map.get("col");
		String word = (String) map.get("word");

		sql.append("  SELECT id, membername, phone, email, address1, address2, picturename, r  ");
		sql.append("  FROM(  ");
		sql.append("  	SELECT id, membername, phone, email, address1, address2, picturename, rownum r  ");
		sql.append("  	FROM(  ");
		sql.append("  		SELECT  id, membername, phone, email, address1, address2, picturename  ");
		sql.append("  		FROM mymember  ");
		if (word.trim().length() > 0) {
			sql.append("  		WHERE " + col + " like '%' || ? || '%'  ");
		}
		sql.append("  		ORDER BY id ASC  ");
		sql.append("  	 )  ");
		sql.append("   )  ");
		sql.append("   WHERE r >= ? and r <= ?  ");

		try {
			int i = 0;

			pstmt = con.prepareStatement(sql.toString());

			if (word.trim().length() > 0) {
				pstmt.setString(++i, word);
			}

			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPhone(rs.getString("phone"));
				dto.setMembername(rs.getString("membername"));
				dto.setPicturename(rs.getString("picturename"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));

				list.add(dto); // 담아줌! :>
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return list;
	}

	public MemberDTO read(String id) {
		MemberDTO dto = new MemberDTO();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  SELECT * FROM mymember  ");
		sql.append("  WHERE id = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setJob(rs.getString("job"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setPicturename(rs.getString("picturename"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setJoindate(rs.getString("joindate"));
				dto.setMembername(rs.getString("membername"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;

	}

	public String pwFind(String id, String membername) {
		String password = "";
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  SELECT password from mymember  ");
		sql.append("  WHERE id = ? and membername = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, membername);

			rs = pstmt.executeQuery();
			if (rs.next() == true) {
				password = rs.getString("password");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return password;
	}

	public String idFind(String membername, String email) {
		String id = "";
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  SELECT id from mymember  ");
		sql.append("  WHERE membername = ? and email = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, membername);
			pstmt.setString(2, email);

			rs = pstmt.executeQuery();
			if (rs.next() == true) {
				id = rs.getString("id");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return id;
	}

	public String getPassword(String id){
		String password = "";
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  SELECT password from mymember where id = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				password = rs.getString("password");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		
		return password;
	}
	
	public String getMembername(String id){
		String membername = "";
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  SELECT membername from mymember where id = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				membername = rs.getString("membername");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		
		return membername;
	}
	
	public String getGrade(String id) {
		String membergrade = "";
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  SELECT membergrade from mymember where id = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				membergrade = rs.getString("membergrade");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return membergrade;
	}

	public int loginCheck(String id, String password) {
		int cnt = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		ResultSet rs = null;

		sql.append("  SELECT count(id) as cnt from mymember  ");
		sql.append("  WHERE id = ? and password = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return cnt;
	}

	public int create(MemberDTO dto) {
		int cnt = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append("  INSERT into mymember  ");
		sql.append("  (id, password, membername, phone, email, zipcode,  ");
		sql.append("  address1, address2, job, joindate, picturename)  ");
		sql.append("  VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?)  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getMembername());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());
			pstmt.setString(10, dto.getPicturename());

			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.toString());
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}

}
