package memo;

public class MemoDTO {

	private int memonum;
	private String title;
	private String content;
	private String memodate;
	private int viewcount;
	
	public int getMemonum() {
		return memonum;
	}
	public void setMemonum(int memonum) {
		this.memonum = memonum;
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
	public String getMemodate() {
		return memodate;
	}
	public void setMemodate(String memodate) {
		this.memodate = memodate;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	
}
