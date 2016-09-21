package schedule;

public class ScheduleDTO {

	/*
	CREATE TABLE mycalendar(
			  calendardate  VARCHAR(100)	NOT NULL, 
			  title       	VARCHAR(100)  	NOT NULL, -- 제목(*)
			  content     	VARCHAR(4000)	NOT NULL, -- 글 내용
			  label 		VARCHAR(100)	default 'v',
			  PRIMARY KEY(calendardate)
			);
			
			*/
	
	
	private String calendardate;
	private String title;
	private String content;
	private String label;
	
	public String getCalendardate() {
		return calendardate;
	}
	public void setCalendardate(String calendardate) {
		this.calendardate = calendardate;
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
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	
	
	
	
}
