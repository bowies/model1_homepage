package bbs; 
 
public class BbsDTO { 
  /** 번호 */ 
  private int bbsnum; 
  /** 글쓴이 */ 
  private String membername; 
  /** 제목 */ 
  private String title; 
  /** 내용 */ 
  private String content; 
  /** 패스워드 */ 
  private String password; 
  /** 조회수 */ 
  private int viewcount; 
  /** 등록일 */ 
  private String listdate; 
  /** 그룹 번호 */ 
  private int grpno; 
  /** 답변 차수 */ 
  private int indent; 
  /** 답변 순서 */ 
  private int ansnum;
  
public int getBbsnum() {
	return bbsnum;
}
public void setBbsnum(int bbsnum) {
	this.bbsnum = bbsnum;
}
public String getMembername() {
	return membername;
}
public void setMembername(String membername) {
	this.membername = membername;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public int getViewcount() {
	return viewcount;
}
public void setViewcount(int viewcount) {
	this.viewcount = viewcount;
}
public String getListdate() {
	return listdate;
}
public void setListdate(String listdate) {
	this.listdate = listdate;
}
public int getGrpno() {
	return grpno;
}
public void setGrpno(int grpno) {
	this.grpno = grpno;
}
public int getIndent() {
	return indent;
}
public void setIndent(int indent) {
	this.indent = indent;
}
public int getAnsnum() {
	return ansnum;
}
public void setAnsnum(int ansnum) {
	this.ansnum = ansnum;
}
  
  
  
   
} 