package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class BbsDAO {
	/**
	 * 전체 레코드 개수 가져옴
	 * @param col
	 * @param word
	 * @return int total
	 * */
	public int total(String col, String word){
		int total = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) FROM mybbs ");
		if(word.trim().length()>0){
			sql.append(" WHERE " +col+ " LIKE '%'||?||'%' ");
		}
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0){
				pstmt.setString(1, word);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				total = rs.getInt(1); //데이터가 1개밖에 없으니까 'ㅁ')...
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		
	
		
		return total;
	}

	/** 
	   * 답변 등록, 등록한 레코드 갯수 리턴: 0 , 1 
	   *  
	   * @param dto 
	   *          저장할 객체 
	   * @return 저장된 레코드 수 
	   */ 
	  public int reply(BbsDTO dto) { 
	    Connection con = DBOpen.getConnection(); // DBMS 연결 
	    PreparedStatement pstmt = null; 
	    int cnt = 0; 

	    try { 
	      StringBuffer sql = new StringBuffer(); 
	      sql.append(" INSERT INTO mybbs(bbsnum, membername, title, content, password, viewcount, listdate, grpno, indent, ansnum)"); 
	      sql.append(" VALUES((SELECT NVL(MAX(bbsnum), 0) + 1 as bbsnum FROM mybbs), ?, ?, ?, ?, 0, sysdate, ?, ?, ?)"); 

	      pstmt = con.prepareStatement(sql.toString()); 
	      pstmt.setString(1, dto.getMembername()); 
	      pstmt.setString(2, dto.getTitle()); 
	      pstmt.setString(3, dto.getContent()); 
	      pstmt.setString(4, dto.getPassword()); 
	      pstmt.setInt(5, dto.getGrpno()); // 부모의그룹번호 
	      pstmt.setInt(6, dto.getIndent()+1); 
	      pstmt.setInt(7, dto.getAnsnum()+1); 

	      cnt = pstmt.executeUpdate(); 
	    } catch (Exception e) { 
	      System.out.println(e.toString()); 
	    } finally { 
	      DBClose.close(con, pstmt); 
	    } 

	    return cnt; 
	  } 

	  /** 
	   * 답변 순서 증가 
	   * @param grpno 그룹 번호 
	   * @param ansnum 답변 순서 
	   */ 
	  public void addAnsnum(int grpno, int ansnum){ 
	    Connection con = DBOpen.getConnection();  // DBMS 연결 
	    PreparedStatement pstmt = null; 
	     
	    try{ 
	      StringBuffer sql = new StringBuffer(); 
	      sql.append(" UPDATE mybbs"); 
	      sql.append(" SET ansnum = ansnum + 1"); 
	      sql.append(" WHERE grpno=? AND ansnum > ?"); 

	      pstmt = con.prepareStatement(sql.toString()); 
	      pstmt.setInt(1, grpno); 
	      pstmt.setInt(2, ansnum); 

	      pstmt.executeUpdate(); 
	    }catch(Exception e){ 
	      System.out.println(e.toString()); 
	    }finally{ 
	      DBClose.close(con, pstmt); 
	    } 
	     
	  }   


	
	/**
	 * 답변을 위한 조회
	 * 
	 * @param bbsnum
	 *            조회할 글 번호
	 * @return dto -bbsnum,title,grpno,indent,ansnum
	 */
	public BbsDTO readReply(int bbsnum) {
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
		BbsDTO dto = null; // 하나의 글에 해당
		
		sql = new StringBuffer();
        sql.append(" SELECT bbsnum, title, grpno, indent, ansnum");
        sql.append(" FROM mybbs");
        sql.append(" where bbsnum=?");
        
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsnum);

			rs = pstmt.executeQuery();

			if (rs.next() == true) {
				String title = rs.getString("title");
				int grpno = rs.getInt("grpno");
				int indent = rs.getInt("indent");
				int ansnum = rs.getInt("ansnum");

				dto = new BbsDTO(); // 하나의 레코드를 하나의 객체로 변환
				dto.setBbsnum(bbsnum);
				dto.setTitle(title);
				dto.setGrpno(grpno);
				dto.setIndent(indent);
				dto.setAnsnum(ansnum);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;
	}

	/**
	 * 글을 삭제합니다.
	 * 
	 * @param 삭제할
	 *            글 번호
	 * @return 삭제된 레코드 갯수
	 */
	public int delete(int bbsnum) {
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
		int cnt = 0; // return 할 레코드 갯수

		sql = new StringBuffer();
		sql.append(" DELETE FROM mybbs ");
		sql.append(" WHERE bbsnum = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsnum);

			cnt = pstmt.executeUpdate(); // 0 or 1
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}

	/**
	 * 메모를 수정합니다.
	 * 
	 * @param vo
	 *            수정할 데이터가 있는 객체
	 * @return 저장된 레코드 갯수
	 */
	public int update(BbsDTO dto) {
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
		int cnt = 0; // return 할 레코드 갯수

		sql = new StringBuffer();
		sql.append(" UPDATE mybbs");
		sql.append(" SET membername=?, title=?, content=?");
		sql.append(" WHERE bbsnum = ?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMembername());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getBbsnum());

			cnt = pstmt.executeUpdate(); // 0 or 1
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}

	/**
	 * 패스워드를 검사합니다.
	 * 
	 * @param bbsnum
	 *            글 번호
	 * @param password
	 *            패스워드
	 * @return 0: 패스워드 일치하지 않음, 1: 패스워드 일치
	 */
	public int checkpassword(int bbsnum, String password) {
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
		int cnt = 0; // 레코드 갯수

		sql = new StringBuffer();
		sql.append(" SELECT COUNT(bbsnum) as cnt");
		sql.append(" FROM mybbs");
		sql.append(" WHERE bbsnum=? AND password=?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsnum);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();

			if (rs.next() == true) {
				cnt = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return cnt;
	}

	/**
	 * 조회
	 * 
	 * @param bbsnum
	 *            조회할 글 번호
	 * @return
	 */
	public BbsDTO read(int bbsnum) {
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
		BbsDTO dto = null; // 하나의 글에 해당

		sql = new StringBuffer();
		sql.append(" SELECT bbsnum, membername, title, content, viewcount, listdate");
		sql.append(" FROM mybbs");
		sql.append(" WHERE bbsnum = ?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsnum);

			rs = pstmt.executeQuery();

			if (rs.next() == true) {
				String title = rs.getString("title");
				String content = rs.getString("content");
				String membername = rs.getString("membername");
				int viewcount = rs.getInt("viewcount");
				String listdate = rs.getString("listdate");

				dto = new BbsDTO(); // 하나의 레코드를 하나의 객체로 변환
				dto.setBbsnum(bbsnum);
				dto.setMembername(membername);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setViewcount(viewcount);
				dto.setListdate(listdate);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;
	}

	/**
	 * 조회수 증가
	 * 
	 * @param memono
	 *            조회수 증가할 글 번호
	 */
	public void increaseviewcount(int bbsnum) {
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.

		sql = new StringBuffer();
		sql.append(" UPDATE mybbs");
		sql.append(" SET viewcount = viewcount + 1");
		sql.append(" WHERE bbsnum = ?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsnum);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

	}

	public int create(BbsDTO dto) {
		int cnt = 0;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" INSERT INTO mybbs(bbsnum, membername, title, content, password, listdate, grpno)   ");
		sql.append(" VALUES((SELECT NVL(MAX(bbsnum), 0) + 1 as bbsnum FROM mybbs),  ");
		sql.append(" ?, ?, ?, ?, sysdate, (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM mybbs))                   ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getMembername());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPassword());

			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return cnt;
	}

	/**
	 * 목록
	 * 
	 * @return List 목록
	 */
	public List<BbsDTO> list(Map map) {
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
		List<BbsDTO> list = null;

		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");
		String col = (String)map.get("col");
		String word = (String)map.get("word");

		sql = new StringBuffer();
		sql.append(" SELECT bbsnum, membername, title, viewcount, listdate, grpno, indent, ansnum, r    ");
		sql.append(" FROM( ");
		sql.append(" 	SELECT bbsnum, membername, title, viewcount, listdate, grpno, indent, ansnum, rownum r    ");
		sql.append(" 	FROM( ");
		sql.append(" 	   	SELECT bbsnum, membername, title, viewcount, listdate, grpno, indent, ansnum  ");
		sql.append(" 		FROM mybbs ");
		if(word.trim().length() > 0)
			sql.append("	WHERE "+col+" LIKE '%' || ? || '%' ");
		sql.append(" 		ORDER BY grpno desc, ansnum ASC");
		sql.append(" 	) ");
		sql.append(" ) WHERE r >= ? and r <= ? ");

		try {
			int i = 1;
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length() > 0){
				pstmt.setString(i++, word);
			}
			pstmt.setInt(i++, sno);
			pstmt.setInt(i++, eno);

			rs = pstmt.executeQuery();
			list = new ArrayList<BbsDTO>();

			while (rs.next() == true) {
				int bbsnum = rs.getInt("bbsnum"); // 컬럼 -> 변수로 변환, DBMS -> JAVA
				String membername = rs.getString("membername");
				String title = rs.getString("title");
				int viewcount = rs.getInt("viewcount");
				String listdate = rs.getString("listdate");
				int grpno = rs.getInt("grpno");
				int indent = rs.getInt("indent");
				int ansnum = rs.getInt("ansnum");

				BbsDTO dto = new BbsDTO(); // 하나의 레코드를 하나의 객체로 변환
				dto.setBbsnum(bbsnum);
				dto.setMembername(membername);
				dto.setTitle(title);
				dto.setViewcount(viewcount);
				dto.setListdate(listdate);
				dto.setGrpno(grpno);
				dto.setIndent(indent);
				dto.setAnsnum(ansnum);

				list.add(dto); // 저장소에 하나의 객체를 저장★

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return list;
	}
}