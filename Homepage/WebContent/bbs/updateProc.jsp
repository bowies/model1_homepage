<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String col =  request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
%>
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty name="dto" property="*"></jsp:setProperty>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script type="text/javascript">
function read() {
	var url = "read.jsp";
	url += "?bbsnum=<%=dto.getBbsnum()%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href = url;
}

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
	<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br><!-- *********************************************** -->

<DIV class="title" align="center"><h1>Update</h1></DIV>

		<DIV class="content" align="center">
		<h3>
		<%
			int cnt = dao.checkpassword(dto.getBbsnum(), dto.getPassword());
			if (cnt == 1) {
				dao.update(dto);
				out.print("Success!");
		%>
		</h3>
		<br>
		<br>
		<DIV class='bottom'>
			<input type='button' value='Read'
				onclick="read()">
			<input type='button' value='List' onclick="listB()">
		</DIV>

		<h3>
		<%
			} else {
				out.print("Fail!");
		%>
		</h3>
		<br>
		<br>
		  
	<DIV class='bottom' align="center">
    <input type='button' value='List' onclick="location.href='list.jsp'"  class="btn btn-success">
    <input type='button' value='Recreate' onclick="location.href='createForm.jsp'" class="btn btn-primary" >
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
