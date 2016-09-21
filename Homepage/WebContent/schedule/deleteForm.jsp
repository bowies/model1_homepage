<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import=" utility.*, java.util.*,schedule.*"%>
<jsp:useBean id="dao" class = "schedule.ScheduleDAO" />

	
<% request.setCharacterEncoding("utf-8");

String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");


String calendardate = year+"/"+month+"/"+day;

ScheduleDTO dto = dao.read(calendardate); // 한건의 레코드 가져오기 


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Delete Schedule!</title> 


</head>
<body>
	<jsp:include page="/menu/top.jsp"></jsp:include>
 <br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

	<!-- 상단 메뉴 -->
	
<DIV class="title" align="center"><h1>Delete</h1></DIV>

	<form name="frm" method="POST" action="./deleteProc.jsp">
		<input	type='hidden' name='year' value='<%=year%>'>
		<input	type='hidden' name='month' value='<%=month%>'>
		<input	type='hidden' name='day' value='<%=day%>'>
		
		<DIV class = "content" align="center"><br><br>
			 <input type='submit' value='Delete'  class="btn btn-success"> <input
				type='button' value='List' onclick="location.href='./list.jsp'"  class="btn btn-primary">
		</DIV>
<br>
		
	</form>

<br>
<br>
<br>
<br>
	<jsp:include page="/menu/bottom.jsp"></jsp:include>

</body>
</html>