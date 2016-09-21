package image;

public class ImgDTO {
	/** 번호 */
	private int imagenum;
	/** 글쓴이 */
	private String membername;
	/** 제목 */
	private String title;
	/** 내용 */
	private String content;
	/** 패스워드 */
	private String password;
	/** 그룹 번호 */
	private int grpno;
	/** 답변 차수 */
	private int indent;
	/** 답변 순서 */
	private int ansnum;
	/** 이미지파일 */
	private String filename;
	public int getImagenum() {
		return imagenum;
	}
	public void setImagenum(int imagenum) {
		this.imagenum = imagenum;
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
	
}
