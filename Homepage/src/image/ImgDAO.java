package image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class ImgDAO {
	/**
	 * 1. create
	 * 
	 * @param dto
	 * @return
	 */
	public int create(ImgDTO dto) {
		int cnt = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("insert into myimage(imagenum,membername,title,content,password,filename,grpno) ");
		sql.append("values((SELECT NVL(MAX(imagenum), 0) + 1 as imagenum FROM myimage), ");
		sql.append("?,?,?,?,?,(SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM myimage)) ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMembername());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPassword());
			pstmt.setString(5, dto.getFilename());

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
	 * 2. update
	 * 
	 * @param dto
	 * @return
	 */
	public int update(ImgDTO dto) {
	    int cnt = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer(); // String 보다 처리 속도가 수만배 빠름.

		sql.append(" UPDATE myimage ");
		sql.append(" SET membername=?, title=?, content=? ,filename=? ");
		sql.append(" WHERE imagenum = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMembername());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getFilename());
			pstmt.setInt(5, dto.getImagenum());

			cnt = pstmt.executeUpdate(); // 0 or 1
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}

	/**
	 * 3.updatefile
	 * 
	 * @param dto
	 * @return
	 */
	public int updateFile(String fname, String imagenum) {
		int cnt = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE myimage  ");
		sql.append(" SET fname = ?  ");
		sql.append(" WHERE id = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setString(2, imagenum);

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
	 * 4.passwordCheck
	 * 
	 * @param dto
	 * @return
	 */
	public int passwordCheck(int imagenum, String password) {
		int cnt = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer(); // String 보다 처리 속도가 수만배 빠름.

		sql.append(" SELECT COUNT(imagenum) as cnt"); // 알리아스가 하나의 컬럼명
		sql.append(" FROM myimage");
		sql.append(" WHERE imagenum=? AND password=?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imagenum);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();

			if (rs.next() == true) {
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return cnt;
	}

	/**
	 * 5.list
	 * 
	 * @param dto
	 * @return
	 * 
	 */

	public List<ImgDTO> list(Map map) {
		List<ImgDTO> list = new ArrayList<ImgDTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");
		String col = (String) map.get("col");
		String word = (String) map.get("word");

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT membername, title, content, filename, grpno, indent, ansnum, imagenum, r ");
		sql.append(" FROM(  ");
		sql.append(" 	SELECT membername, title, content, filename, grpno, indent, ansnum, imagenum , rownum r  ");
		sql.append(" 	FROM(	   ");
		sql.append(" 		SELECT membername, title, content, filename, grpno, indent,ansnum , imagenum ");
		sql.append(" 		FROM myimage ");
		if (word.trim().length() > 0)
			sql.append(" 		WHERE " + col + " LIKE '%'||?||'%' "); // "+col+"
																		// 위치에
																		// 검색할
																		// 컬럼이
																		// 온다.
																		// 아이디
																		// or 이름
																		// or
																		// 이메일
		sql.append(" 		ORDER BY grpno DESC, ansnum ");
		sql.append(" 	) ");
		sql.append(" ) ");
		sql.append(" where r>=? and r<=? ");

		try {
			int i = 0;

			pstmt = con.prepareStatement(sql.toString());

			if (word.trim().length() > 0)
				pstmt.setString(++i, word);
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ImgDTO dto = new ImgDTO();
				dto.setMembername(rs.getString("membername"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setFilename(rs.getString("filename"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setImagenum(rs.getInt("imagenum"));

				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}

	/**
	 * 6.read
	 * 
	 * @param dto
	 * @return
	 */
	
	public ImgDTO read(int imagenum) {
		ImgDTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select * from myimage ");
		sql.append(" where imagenum = ?  ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imagenum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new ImgDTO();
				dto.setImagenum(rs.getInt("imagenum"));
				dto.setMembername(rs.getString("membername"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPassword(rs.getString("password"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setFilename(rs.getString("filename"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;
	}
	
	/**
	 * 7.addAnsnum
	 * 
	 * @param dto
	 * @return
	 */
	
	public void addAnsnum(int grpno, int ansnum){ 
	    Connection con = DBOpen.getConnection();  
	    PreparedStatement pstmt = null; 
	     
	    try{ 
	      StringBuffer sql = new StringBuffer(); 
	      sql.append(" UPDATE myimage"); 
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
	 * 8.total
	 * 
	 * @param dto
	 * @return
	 */	
	public int total(String col, String word){
		int total = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select count(*) from myimage ");
		if(word.trim().length()>0)
			sql.append(" where " +col + "like '%'||?||'%' ");
		
	try{	
		pstmt = con.prepareStatement(sql.toString());
		if(word.trim().length()>0)
			pstmt.setString(1, word);
		rs = pstmt.executeQuery();
		if(rs.next()){
			total=rs.getInt(1);
		}
	
	}catch (SQLException e){
		e.printStackTrace();
	}finally{
		DBClose.close(con, pstmt, rs);
	}
		
		return total;
	}
	
	/**
	 * 9.imageRead
	 * 
	 * @param dto
	 * @return
	 */	
	
	public List<String> imageRead(int imagenum){
		List<String> list = new ArrayList<String>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();

		sql.append("  SELECT * FROM    ");
		sql.append("    (    ");
		sql.append("       select imagenum, filename,     ");
		sql.append("           lag(imagenum,2)     over (order by imagenum)  pre_imagenum2,     ");
		sql.append("           lag(filename,2)  over (order by imagenum) pre_file2,      ");
		sql.append("           lag(imagenum,1)     over (order by imagenum ) pre_imagenum1,     ");
		sql.append("           lag(filename,1)  over (order by imagenum ) pre_file1,     ");
		sql.append("           lead(imagenum,1)    over (order by imagenum) nex_imagenum1,     ");
		sql.append("           lead(filename,1) over (order by imagenum) nex_file1,   ");
		sql.append("           lead(imagenum,2)    over (order by imagenum) nex_imagenum2,     ");
		sql.append("           lead(filename,2) over (order by imagenum) nex_file2    ");
		sql.append("           from (    ");
		sql.append("                SELECT imagenum, filename     ");
		sql.append("                FROM myimage   ");
		sql.append("                ORDER BY imagenum DESC    ");		
		sql.append("           )    ");
		sql.append("    )    ");
		sql.append("    WHERE imagenum = ?   ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imagenum);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()){
				String [] arr = new String [10];
				
				//01234 = imagenum(2전 1전 자기자신 1다음 2다음)
				//56789 = filename
				arr[0] = rs.getString("pre_imagenum2");
				arr[5] = rs.getString("pre_file2");
				
				arr[1] = rs.getString("pre_imagenum1");
				arr[6] = rs.getString("pre_file1");
				
				arr[2] = rs.getString("imagenum");
				arr[7] = rs.getString("filename");
				
				arr[3] = rs.getString("nex_imagenum1");
				arr[8] = rs.getString("nex_file1");
				
				arr[4] = rs.getString("nex_imagenum2");
				arr[9] = rs.getString("nex_file2");
				
				for(int i = 0; i<10; i++){
					list.add(arr[i]);
				}
								
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		
		return list;
	}
	
	/**
	 * 10.delete
	 * 
	 * @param dto
	 * @return
	 */	
	
	public int delete(int imagenum) {
		int cnt = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql= new StringBuffer();

		sql.append(" delete from myimage ");
		sql.append(" where imagenum=?  ");
		try {
			pstmt= con.prepareStatement(sql.toString());
			pstmt.setInt(1, imagenum);
		
			
			cnt=pstmt.executeUpdate();
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}
		return cnt;
	}
	
	/**
	 * 답변등록
	 * 
	 * @param dto
	 * @return
	 */
	public int reply(ImgDTO dto) {
		int cnt = 0;
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into myimage(imagenum, membername, title, content ,password, grpno, indent, ansnum, filename)");
		sql.append(" values((select nvl(max(imagenum),0)+1 as imagenum from myimage),?,?,?,?,?,?,?,?)");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMembername());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPassword());
			pstmt.setInt(5, dto.getGrpno());
			pstmt.setInt(6, dto.getIndent()+1);
			pstmt.setInt(7, dto.getAnsnum()+1);
			pstmt.setString(8, dto.getFilename());
			
			cnt=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.toString());
		}finally{
			DBClose.close(con, pstmt);
		}
		
		
		return cnt;
	}

	/**
	 * 답변처리를 위해서 부모의 grpno, indent, ansnum을 가져오는 것
	 * title, imagenum 포함해서 가져오기
	 * 
	 * @param imagenum
	 * @return
	 */
	public ImgDTO readReply(int imagenum) {
		Connection con=DBOpen.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		ImgDTO dto = null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select imagenum,title,grpno,indent,ansnum ");
		sql.append(" from myimage ");
		sql.append(" where imagenum = ? ");
		
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, imagenum);
			
			rs=pstmt.executeQuery();
			
			if(rs.next() == true){
		        String title = rs.getString("title"); 
		        int grpno = rs.getInt("grpno");
		        int indent = rs.getInt("indent");
		        int ansnum = rs.getInt("ansnum");
		        
		        dto = new ImgDTO();         // 하나의 레코드를 하나의 객체로 변환
		        dto.setImagenum(imagenum);
		        dto.setTitle(title);
		        dto.setGrpno(grpno);
		        dto.setIndent(indent);
		        dto.setAnsnum(ansnum);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;
	}
}

	




