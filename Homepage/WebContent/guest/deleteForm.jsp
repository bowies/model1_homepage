<%@ page contentType="text/html; charset=UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<%
int guestnum = Integer.parseInt(request.getParameter("guestnum"));

String col =  request.getParameter("col");
String word = request.getParameter("word");
String nowPage = request.getParameter("nowPage");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete Guestbook!</title>
<link href="../css/style.css" rel="stylesheet">


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
	

	<Form name='frm' method='POST' action='./deleteProc.jsp'>
		<input type='hidden' name='guestnum' size='30' value='<%=guestnum%>'>
		<input	type='hidden' name='col' value='<%=col%>'>
		<input	type='hidden' name='word' value='<%=word%>'>
		<input	type='hidden' name='nowPage' value='<%=nowPage%>'>

		<DIV class = "content" align="center"><br><br>
			 <input type='submit' value='Delete Memo'  class="btn btn-success"> <input
				type='button' value='List' onclick="location.href='./list.jsp'"  class="btn btn-primary">
		</DIV>
	</Form>
<br>
<br>
<br>
<br>

	 <jsp:include page="/menu/bottom.jsp"></jsp:include>
	
</body>
</html>
