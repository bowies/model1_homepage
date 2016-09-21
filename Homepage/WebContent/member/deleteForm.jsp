<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String id = request.getParameter("id");
 	String oldfile = request.getParameter("oldfile");
 	
 	if(id==null){//탈퇴or 삭제하려고 저장한 것을 받아오는 것
 		id = (String)session.getAttribute("id");
 	}
 	
 	if(oldfile==null){//이미 삭제한 사람의 정보를 지우려고 받아오는 것
 		oldfile = dao.getPicturename(id);
 	}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unsubscribe Page</title>

 
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" /><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<!-- *********************************************** -->

<DIV class="title" align="center"><h1>Unsubscribe Page!</h1></DIV>

	<FORM name='frm' method='POST' action='./deleteProc.jsp'>
	<input type = "hidden" name = "id" value = "<%=id%>">
	<input type = "hidden" name = "oldfile" value = "<%=oldfile%>">
	
	<div class ="content" align="center">
	<h3>
	Thank you and come again!<br>
	</h3>
	<h4>
	If you wanna unsubscribe click the button!
	</h4>
	</div>
	<br>

		<DIV class='bottom' align="center">
			<input type='submit' value='Unsubscribe'  class="btn btn-success"> 
			<input type='button' value='Cancel'  class="btn btn-primary" onclick="history.back()">
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
