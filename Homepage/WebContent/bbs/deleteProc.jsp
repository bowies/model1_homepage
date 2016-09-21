<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>

<%
	request.setCharacterEncoding("UTF-8");

	int bbsnum = Integer.parseInt(request.getParameter("bbsnum"));
	String password = request.getParameter("password");
	int cnt = dao.checkpassword(bbsnum, password); //변수명을 맞추니 편함

	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Page</title>
<script type="text/javascript">


function listB(){
	var url = "list.jsp";
	url += "?col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";

		location.href = url;

	}
</script>

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

<DIV class="title" align="center"><h1>Delete</h1></DIV>

	<DIV class="content" align="center">
	<h3>
		<%
			if (cnt == 1) {
				dao.delete(bbsnum);
				out.print("Delete!");
		%>
		</h3>
		<br>
		<DIV class='bottom'>
			<input type='button' value='List' onclick="listB()" class="btn btn-success">
		</DIV>
		<h3>
		<%
			} else {
				out.print("Please insert password again.");
		%>
		</h3>
		<br>

		<DIV class='bottom'>
			<input type='button' value='Redo' onclick="history.back()" class="btn btn-success">
		</DIV>

		<%
			}
		%>

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
