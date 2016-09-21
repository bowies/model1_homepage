<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	int year;
	int month;
	Calendar today = Calendar.getInstance();
	Calendar cal = new GregorianCalendar();
	year = (request.getParameter("year") == null) ? today.get(Calendar.YEAR)
			: Integer.parseInt(request.getParameter("year").trim());
	month = (request.getParameter("month") == null) ? today.get(Calendar.MONTH) + 1
			: Integer.parseInt(request.getParameter("month").trim());
	if (month <= 0) {
		month = 12;
		year = year - 1;
	} else if (month >= 13) {
		month = 1;
		year = year + 1;
	}
	cal.set(Calendar.YEAR, year);
	cal.set(Calendar.MONTH, (month - 1));
	cal.set(Calendar.DATE, 1);
%>
</head>
<body>
	<table align="center">
		<tr>
			<td align="center" colspan="7">　<a
				href='calendar.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH) + 1) - 1)%>'>←</a>　<%=cal.get(Calendar.YEAR)%> / <%=(cal.get(Calendar.MONTH) + 1)%>　<a
				href='calendar.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH) + 1) + 1)%>'>→</a>　</td>
		</tr>
		<tr align="right">
			<td>　Sun　</td>
			<td>　Mon　</td>
			<td>　Tue　</td>
			<td>　Wed　</td>
			<td>　Thu　</td>
			<td>　Fri　</td>
			<td>　Sat　</td>
		</tr>
		<%
			cal.set(year, month - 1, 1);
			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		%>
		<tr align="right">
			<%
				for (int i = 1; i < dayOfWeek; i++) {
			%><td align="right"></td>
			<%
				}
				for (int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
			%>
			<td><a
				href='day.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH) + 1))%>&day=<%=i%>'><%=i%></a>
			</td>
			<%
				if ((dayOfWeek - 1 + i) % 7 == 0) {
			%>
		</tr>
		<tr align="right">
			<% }
  }%>

		</tr>
	</table>
</body>
</html>