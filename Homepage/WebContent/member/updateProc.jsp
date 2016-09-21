<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="member.MemberDAO" />
<jsp:useBean id="dto" class="member.MemberDTO" />
<jsp:setProperty name="dto" property="*" />

<%
int cnt = dao.update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update My Information</title>


</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<jsp:include page="/menu/top.jsp" /><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<!-- *********************************************** -->

<DIV class="title" align="center"><h1>Change My Information</h1></DIV>

<br>
	<div class="content" align="center">
	<h4>
	
		<%
if(cnt==1){
   out.print("Change Information!");
}else{
   out.print("Please try again.");
}
 
%>
</h4>
	</div>
	<br>

	<% if(cnt==1){ %>
	<DIV class='bottom' align="center">
		<input type='button' value='My Info'
			onclick="location.href='read.jsp?id=<%=dto.getId()%>'"  class="btn btn-success" >
	</DIV>
	<%}else{ %>
	<DIV class='bottom' align="center">
		<input type='button' value='Retry' onclick="history.back()"  class="btn btn-success" >
	</DIV>
	<%} %>
<br>
<br>
<br>
<br>
	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html>
