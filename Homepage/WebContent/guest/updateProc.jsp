<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "./ssi.jsp" %>
<jsp:useBean id="dao" class = "guest.GuestDAO" />
<jsp:useBean id="vo" class = "guest.GuestDTO" />
<jsp:setProperty property="*" name="vo"/>

<%
	cnt = dao.update(vo);
String col =  request.getParameter("col");
String word = request.getParameter("word");
String nowPage = request.getParameter("nowPage");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit GuestBook!</title>


<script>

function listM(){
	var url = "list.jsp";
	url += "?col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href = url;
	
	
}
function createM(){
	var url = "createForm.jsp";
	url += "?col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href = url;
	
	
}

</script>
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
<br><DIV class="title" align="center"><h1>Edit GuestBook!</h1></DIV>

	
	<DIV class="content" align="center">
	<h3>
		
		<%
			if (cnt == 1) {
				out.println("Edit Memo success!");
			} else {
				out.println("Please try again!");
			}
		%>
		</h3>
		
	<br> <input	type='button' value='List' onclick="listM()"  class="btn btn-primary">
	</DIV>
<br>
<br>
<br>
<br>
	<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body>
</html>