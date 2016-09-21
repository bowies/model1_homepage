<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty name="dto" property="*"></jsp:setProperty>

<% 
   // 답변 순서의 증가 
   dao.addAnsnum(dto.getGrpno(), dto.getAnsnum()); // 부모보다 큰 순서는 전부 한칸씩 이동 

	String col =  request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
   
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reply</title>

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

<DIV class="title" align="center"><h1>Reply</h1></DIV>
<br>
	<DIV class="content" align="center">
		<% 
if (dao.reply(dto) == 1){%>
	<h3>
		Success!<br><br>
	 
	</h3>
		
		
		<input type='button' value='Reply'
			onclick="location.href='./createForm.jsp'"  class="btn btn-success"> <input
			type='button' value='List' onclick="listB()"  class="btn btn-primary"> 

		<% 
}else{ 
%>
<h3>
		Fail!<br><br>
		 
		</h3>
		<input type='button' value='Redo' onclick="history.back();"  class="btn btn-success"> 
		<input type='button' value='List' onclick="listB()"  class="btn btn-primary">

		<%} %>
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
