<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%@ page import=" utility.*, java.util.*,schedule.*"%>
<jsp:useBean id="dao" class="schedule.ScheduleDAO" />


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

	String calendardate = year + "/" + month + "/" + day;

	ScheduleDTO dto = dao.read(calendardate); // 한건의 레코드 가져오기
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Today Schedule</title>
<script type="text/javascript">
	
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
			<td align="center"><h1>Schedule</h1></td>

		</tr>





		<%
			int cnt = dao.labelcount();
			String labelarray[] = new String[364];
			for (int i = 0; i < cnt; i++) {
				labelarray[i] = dao.labelfordate(i + 1);
				if (labelarray[i] != null) {
					if (labelarray[i].substring(7,8).equals("/")){
			%>
			<tr>
	
			
			<td><h3>
				
					<a
						href="read.jsp?year=<%=labelarray[i].substring(0,4)%>&month=<%=labelarray[i].substring(5,7)%>&day=<%=labelarray[i].substring(8)%>"
						style="text-decoration: none;"><%=labelarray[i]%>: <%=dao.labelread(labelarray[i])%></a>
				</h3></td>

		</tr>
		<%}else{%>
		<tr>
	
			
			<td><h3>
				
					<a
						href="read.jsp?year=<%=labelarray[i].substring(0,4)%>&month=<%=labelarray[i].substring(5,6)%>&day=<%=labelarray[i].substring(7)%>"
						style="text-decoration: none;"><%=labelarray[i]%>: <%=dao.labelread(labelarray[i])%></a>
				</h3></td>

		</tr>
		
		<%}}}%>
	</table>

	<a href='list.jsp' style="text-align: center; color: #2C3E50;"><H2>View
			Calendar</H2></a>

	
	<br>
	<br>
	<br>
	<br>
	<br>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
</html>

