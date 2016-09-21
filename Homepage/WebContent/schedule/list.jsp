<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>

<title>Calendar</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
	<%

	String root = request.getContextPath();
	String id = (String) session.getAttribute("id");
	
	if (id==null){ %>
     <script>location.href ="<%=root%>/member/loginForm.jsp"; </script>
	<%} else{%>
	
 <br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<jsp:useBean id="min" class='schedule.Schedule'/>
<jsp:setProperty name='min' property='year'/>
<jsp:setProperty name='min' property='month'/>
<jsp:getProperty name='min' property='calendar'/>

<br>
<br>
<br>
<br>
 
<%} %>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>