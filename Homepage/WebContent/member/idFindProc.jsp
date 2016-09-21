<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");

	String membername = request.getParameter("membername");
	String email = request.getParameter("email");

	String id = dao.idFind(membername, email);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Your ID</title>


</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<!-- *********************************************** -->

<DIV class="title" align="center"><h1>I Find Your ID</h1></DIV>

	<br>
	<DIV class="content" align="center">
		<h4><%
			if (id != "") {
				out.print("Your ID is " + id + "!");
			} else {
				out.print("ID not found! "+"<br>"+"Please Try Again.");
			}
		%></h4>
	</DIV>

	<br>
 
   <DIV class='bottom' align="center">
   

		<input type='button' value='Find Your Password'
			onclick="location.href='pwFindForm.jsp'"  class="btn btn-success"> 
			&nbsp;
			<input
			type='button' value='Login' onclick="location.href='loginForm.jsp'"  class="btn btn-primary">


	</DIV>

<br>
<br>
<br>
<br>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
