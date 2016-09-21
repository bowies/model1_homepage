<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8"); 
%>

<%@ page import=" utility.*, java.util.*,schedule.*"%>
<jsp:useBean id="dao" class = "schedule.ScheduleDAO" />


<%
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		Calendar today = Calendar.getInstance();
		int tday = today.get(Calendar.DATE);
		int tmonth = today.get(Calendar.MONTH) + 1;
		int tyear = today.get(Calendar.YEAR);

		if (year == null) {
			year = Integer.toString(tyear);
		}
		if (month == null) {
			month = Integer.toString(tmonth);
		}
		if (day == null) {
			day = Integer.toString(tday);
		}
		

		String calendardate = year+"/"+month+"/"+day;
		
		ScheduleDTO dto = dao.read(calendardate); // 한건의 레코드 가져오기 
	%>
<html>
<head>
<meta http-equiv="Content-Type" 
content="text/html; charset=UTF-8">

<title>Today Schedule</title>
<script type="text/javascript">

function created(){
	var url = "./createForm.jsp";
	url += "?year=<%=year%>";
	url += "&month=<%=month%>";
	url += "&day=<%=day%>";
	
	location.href = url; 
	
}

function updated(){
	var url = "./updateForm.jsp";
	url += "?year=<%=year%>";
	url += "&month=<%=month%>";
	url += "&day=<%=day%>";
	
	location.href = url; 
	
}

function deleted(){
	var url = "./deleteForm.jsp";
	url += "?year=<%=year%>";
	url += "&month=<%=month%>";
	url += "&day=<%=day%>";
	
	location.href = url; 
	
}

</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	
	<table style="margin: 0 auto; line-height: 3.3em;">
		<tr>
			<td align="center"><h1>Schdeule</h1></td>

		</tr>
		<tr>
			<td align="center"><h1><%=year%>/<%=month%>/<%=day%></h1></td>
		</tr>


	</table>
	
	<%if(dto!=null){ %>
	<TABLE  style="margin: 0 auto;line-height: 3.3em;">
	
		<TR>
			<TH style="text-align: right;">Label:　</TH>
			<TD><%=dto.getLabel()%></TD>
		</TR>
	
		<TR>
			<TH style="text-align: right;">Title:　</TH>
			<TD><%=dto.getTitle()%></TD>
		</TR>
		<TR>
			<TH style="text-align: right;">Content:　</TH>
			<TD><%=dto.getContent()%></TD> <!-- 내용하고 등록일은 그대로 냅두려고 -->
		</TR>
<!-- 		<TR> -->
<!-- 			<TH style="text-align: right;">Calendardate:　</TH> -->
<%-- 			<TD><%=dto.getCalendardate()%></TD> --%>
<!-- 		</TR> -->
	
	</table>
	<%} %>

	<a href="javascript:history.back()"
		style="text-align: center;"><H1>Back</H1></a>
		
			<%

	String root = request.getContextPath();
	String id = (String) session.getAttribute("id");
	
	if (id.equals("admin")){ %>
   	<a href='list.jsp?year=<%=year%>&month=<%=month%>'
		style="text-align: center;"><H1>Calendar</H1></a>
		
<div align="center">	
		<%if(dto==null){ %>
	<input type="button" value='Create' onclick="created()"  class="btn btn-success">
	<%} else{ %>
	<input type="button" value='Update' onclick="updated()"  class="btn btn-success">
	<input type="button" value='Delete' onclick="deleted()"  class="btn btn-primary">
		
	
	<%}} %>
	
	</div>
	
	
	<br>

	<br>
	<br>
	<br>
	<br>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
</html>

