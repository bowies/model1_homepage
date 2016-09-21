<%@ page language="java" contentType="text/html; charset=UTF-8" 
	  pageEncoding="UTF-8"%>
<%@ include file ="./ssi.jsp" %>

<jsp:useBean id="dao" class = "memo.MemoDAO" />

<%
	
	int memonum = Integer.parseInt(request.getParameter("memonum"));
	

String col =  request.getParameter("col");
String word = request.getParameter("word");
String nowPage = request.getParameter("nowPage");
	dao.upviewcount(memonum); //조회수 증가 
	MemoDTO vo = dao.read(memonum); // 한건의 레코드 가져오기 
	
	String content = vo.getContent().replaceAll("\r\n","<br>");

	String memodate = vo.getMemodate().substring(0, 10);
		//		substring(beginIndex, endIndex);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" 
content="text/html; charset=UTF-8">

<title>Memo Read</title>


<link href="../css/style.css" rel="stylesheet">


<script type = "text/javascript">
function updateM(){
	var url = "updateForm.jsp";
	url += "?memonum=<%=memonum%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href = url;
	//
}

function deleteM(){
	var url = "deleteForm.jsp";
	url += "?memonum=<%=memonum%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href = url;
	
	
}

function createM(){
	var url = "createForm.jsp";
	url += "?memonum=<%=memonum%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href = url;
	
	
}
function listM(){
	var url = "list.jsp";
	url += "?memonum=<%=memonum%>";
	url += "&col=<%=col%>";
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
<br>
	
<DIV class="title" align="center"><h1>Read</h1></DIV>

 <TABLE  style="margin: 0 auto;line-height: 3.3em;">
		<TR>
			<TH style="text-align: right;">Title:　</TH>
			<TD><%=vo.getTitle()%></TD>
		</TR>
		<TR>
			<TH style="text-align: right;">Content:　</TH>
			<TD><%=content%></TD> <!-- 내용하고 등록일은 그대로 냅두려고 -->
		</TR>
		<TR>
			<TH style="text-align: right;">View:　</TH>
			<TD><%=vo.getViewcount()%></TD>
		</TR>
		<TR>
			<TH style="text-align: right;">Date:　</TH>
			<TD><%=memodate%></TD>
		</TR>
	</table>


	<DIV class = "bottom" align="center">
<br>	 	 
		<input type='button' value='Create'
		onclick="createM()"  class="btn btn-success">
			
	 	<input type='button' value='List' 
	 	onclick="listM()" class="btn btn-primary">
	<br>
	<br>
	 	
	 	<input type='button' value='Edit' 
	 	onclick="updateM()"  class="btn btn-success">

	 	 
	 	<input type='button' value='Delete' 
	 	onclick="deleteM()"  class="btn btn-primary"> 
	</DIV>
<br>
<br>
<br>
<br>
	<jsp:include page="/menu/bottom.jsp"></jsp:include>





</body>
</html>
