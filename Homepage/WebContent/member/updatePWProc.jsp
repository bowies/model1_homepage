<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<% request.setCharacterEncoding("utf-8"); 
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	int cnt = dao.updatePassword(id, password);
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password!</title>


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
	<DIV class="title" align="center"><h1>Password Change!</h1></DIV>

	<FORM name='frm' method='POST' action='./.do'>

		<div class="content"  align="center" >
		
			<% 
  			if(cnt == 1){ 
 			 %>
 			<br>			<h4>Password change success!</h4>
			<br> <input type='button' value='List'
				onclick="location.href='./loginForm.jsp'" class="btn btn-success">
			<%  
 		 }else{ 
  			%>
  			<br>
			<h4>Please retry!</h4><br>
				<input type='button' value='List'
				onclick="location.href='./list.jsp'" class="btn btn-success">
			<input type='button' value='Retry'
				onclick="history.back();" class="btn btn-primary"> 
				
			<% 
  } 
  %>
		</DIV>



		<DIV class='bottom'>
		</DIV>
	</FORM>

<br>
<br>
<br>
<br>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
