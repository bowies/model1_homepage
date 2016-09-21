<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<% 
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	int cnt = 0;
	String grade = ""; //회원 등급
	String membername = dao.getMembername(id);
	String mypassword = dao.getPassword(id);
	cnt = dao.loginCheck(id, password);
	
	if(cnt==1){
		grade = dao.getGrade(id);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>


</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** --><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<DIV class="title" align="center"><h1>Login</h1></DIV>

	<div class="content"  align="center" >
	 <h4>
		<% 
if(cnt==1){
    session.setAttribute("id", id);
    session.setAttribute("grade", grade);
    session.setAttribute("membername", membername);
    session.setAttribute("mypassword", mypassword);
    out.print("Login Success.");
}else{
    out.print("Please reconfirm Id and Password."); 
    
}
%>
</h4>
	</div>
	<br>
	<% if(cnt==1){ %>
	<DIV class='bottom'  align="center" >
		<input type='button'  class="btn btn-success" value='Main Page' onclick="location.href='../index.jsp'">
	</DIV>
	<%}else{ %>
	<DIV class='bottom'  align="center" >
		<input type='button'  class="btn btn-success" value='Retry' onclick="history.back()">
	</DIV>
	<%} %>

<br>
<br>
<br>
<br>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
