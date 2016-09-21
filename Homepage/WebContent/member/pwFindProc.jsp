<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<% request.setCharacterEncoding("utf-8");	

	String id = request.getParameter("id");
	String membername = request.getParameter("membername");
	
	String passwd = dao.pwFind(id, membername);

	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Your Password</title> 

</head>
<!-- *********************************************** -->
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
<DIV class="title" align="center"><h1>I Find Your Password</h1></DIV>

	<br>
	<DIV class="content" align="center">
	<h4>
		<%
		if(passwd != ""){
			out.print("Your Password is "+passwd+"!");
		}
		else{
			out.print("Password not found! "+"<br>"+"Please Try Again.");

			}
%>
	</h4>
	</DIV>
	
	<br>

   <DIV class='bottom' align="center">
   

		<input type='button' value='Main Page' onclick="location.href='../index.jsp'" class="btn btn-success">
		<input type='button' value='Login' onclick="location.href='loginForm.jsp'" class="btn btn-primary">


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
