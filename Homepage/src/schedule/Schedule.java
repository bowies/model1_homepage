package schedule;
import java.util.Calendar;
public class Schedule {
 private int year;
 private int month;
 ScheduleDAO dao = new ScheduleDAO();
 
 public Schedule() {
  Calendar cal=Calendar.getInstance();
  year=cal.get(Calendar.YEAR);
  month=cal.get(Calendar.MONTH) + 1   ;//0월~11월
 }// 
 public int getYear() {
  return year;
 }
 public void setYear(int year) {
  this.year = year;
 }
 public int getMonth() {
  return month;
 }
 public void setMonth(int month) {
  if(month<1){
   this.month = 12;
   this.year=year-1;
  }else if(month>12){
   this.month = 1;
   this.year=year+1;
  }else{
   this.month = month;
  }
 }
 public String getCalendar(){
  StringBuffer sb=new StringBuffer();
  Calendar cal=Calendar.getInstance();
  cal.set(year,month-1,1);//
  //요일 -->일 1
  int dayOfWeek=cal.get(Calendar.DAY_OF_WEEK);
  sb.append("<table align ='center'>")
  .append("<tr>")
  .append("<td align='center'>");
  String sright=String.format("?year=%d&month=%d",year,month+1);
  String sleft=String.format("?year=%d&month=%d",year,month-1);
  String stf=
   String.format(
		    "<h2  style='display: inline;'><a href='list.jsp%s' style='text-decoration:none;'>◀</a></h2>"
		    + "　　<h1 style='display: inline;'>%d/<font color='#18BC9C'>%d</font></h1>　　"
		    + "<h2  style='display: inline;'><a href='list.jsp%s' style='text-decoration:none;'>▶</a></h2>"
		    ,
		    sleft,year,month,sright );
  
  sb.append(stf)
  .append("</td>")
  .append("</tr>")
  .append("<tr>")
  .append("<td align='center'>");
  sb.append("<table>")
  .append("<tr>")
  .append("<td><h4>　Sun　</h4></td>")
  .append("<td><h4>　Mon　</h4></td>")
  .append("<td><h4>　Tue　</h4></td>")
  .append("<td><h4>　Wed　</h4></td>")
  .append("<td><h4>　Thu　</h4></td>")
  .append("<td><h4>　Thu　</h4></td>")
  .append("<td><h4>　Sat　</h4></td>")
  .append("</tr>")
  .append("<tr><br>");
  


  

  for(int i=1; i<dayOfWeek;i++){
   sb.append("<td>&nbsp;</td>");
  }
  for(int i=1;
  i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
  i++){
   String ssf=(dayOfWeek+i-1)%7==1?
     "#18BC9C": "#2C3E50";

	Calendar today = Calendar.getInstance();
	 int tday = today.get(Calendar.DATE);
	 int tmonth = today.get(Calendar.MONTH)+1;
	 int tyear = today.get(Calendar.YEAR);


	
	
	 
	 if(i==tday&&month==tmonth&&year==tyear){
		 sb.append("<td align='center'><h1><a href='read.jsp?year="+year+"&month="+month+"&day="+i+"' style='text-decoration:none; color:gold;'>"+i+"</a></h1>　</td>");
		 
	 }else{
		 
		 sb.append("<td align='center'><h3><a href='read.jsp?year="+year+"&month="+month+"&day="+i+"' style='text-decoration:none; color:"+ssf+";'>"+i+"</a></h3>　</td>");
	 }
   if((dayOfWeek+i-1)%7==0){
    sb.append("</tr><tr>");
   }
  }
  sb.append("</tr>")
  .append("</table>");
  sb.append("</td>")
  .append("</tr>")
  .append("</table>");
  return sb.toString();
 }
}
