<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id = "dao" class ="schedule.ScheduleDAO" ></jsp:useBean>
<jsp:useBean id = "dto" class = "schedule.ScheduleDTO"> </jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
	

<% request.setCharacterEncoding("utf-8");

String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");

String calendardate = year+"/"+month+"/"+day;

int cnt = dao.delete(calendardate);

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete Memo!</title> 

<link href="../css/style.css" rel="stylesheet">
<script>

function listM(){
	var url = "list.jsp";
	url += "?year=<%=year%>";
	url += "&month=<%=month%>";
	
	location.href = url;
	
	
}

</script>

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
	
<DIV class="title" align="center"><h1>Delete</h1></DIV>
	<DIV class="content" align="center">
		<h3>
		<%
			if (cnt == 1) {
				out.println("Delete schedule!");
			} else {
				out.println("Please try again!");
			}
		%>
	</h3>
		<br> <input	type='button' value='List' onclick="listM()"  class="btn btn-primary">
	</DIV>
<br>
<br>
<br>
<br>
	<jsp:include page="/menu/bottom.jsp"></jsp:include>

</body>
</html>
