<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");

String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Schedule!</title> 


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
	
<DIV class="title" align="center"><h1>Create</h1></DIV>

	<form name="frm" method="POST" action="./createProc.jsp">
		<input	type='hidden' name='year' value='<%=year%>'>
		<input	type='hidden' name='month' value='<%=month%>'>
		<input	type='hidden' name='day' value='<%=day%>'>
		<TABLE style="margin: 0 auto;line-height: 3.3em;">
		
			<tr>
				<th style="text-align: right;">Date:　</th>
				<td><input type='text' name='calendardate'  class="form-control" value='<%=year%>/<%=month%>/<%=day%>'></td>
			</tr>
			<tr>
				<th style="text-align: right;">Label:　</th>
				<td><input type='text' name='label'  class="form-control" size="10"></td>
			</tr>
			<tr>
				<th style="text-align: right;">Title:　</th>
				<td><input type='text' name='title'  class="form-control" size="10"></td>
			</tr>

			<tr>
				<th style="text-align: right;">Content:　</th>
				<td><textarea name='content' class="form-control" rows='10' cols='30'></textarea></td>
			</tr>

		</table>
<br>
		<!-- 하단 메뉴 -->
		<DIV class='bottom'  align="center">
    <input type='submit' value='Send'class="btn btn-success">&nbsp;
    <input type='button' value='Cancel' onclick="history.back()" class="btn btn-primary">
  </DIV>
		
	</form>

<br>
<br>
<br>
<br>
	<jsp:include page="/menu/bottom.jsp"></jsp:include>

</body>
</html>