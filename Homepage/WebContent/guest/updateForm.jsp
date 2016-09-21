<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "./ssi.jsp" %>
<%@ page import="java.util.*, utility.*, guest.*"%>
<jsp:useBean id="dao" class = "guest.GuestDAO"></jsp:useBean>

<%
	int guestnum = Integer.parseInt(request.getParameter("guestnum"));

	GuestDTO vo = dao.read(guestnum);
	String col =  request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Guestbook!</title>

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
	
<DIV class="title" align="center"><h1>Edit GuestBook!</h1></DIV>

	<form name="frm" method="POST" action="./updateProc.jsp">

	 
	  <input type='hidden' name='guestnum' size='30' value='<%= guestnum %>'>
		<input	type='hidden' name='col' value='<%=col%>'>
		<input	type='hidden' name='word' value='<%=word%>'>
		<input	type='hidden' name='nowPage' value='<%=nowPage%>'>
		
	<TABLE style="margin: 0 auto;line-height: 3.3em;">
				<tr>
				<th style="text-align: right;">Title:　</th>
					<td><input type='text' name='title' size='10' class="form-control"
					value='<%=vo.getTitle()%>'></td>
			</tr>

			<tr>
				<th style="text-align: right;">Content:　</th>
				<td><textarea name='content' class="form-control" rows='10' cols='30'><%=vo.getContent()%></textarea></td>
			</tr>

		</table>
<br>
			<!-- 하단 메뉴 -->
		<DIV class='bottom'  align="center">
    <input type='submit' value='Send'class="btn btn-success">&nbsp;
    <input type='button' value='Cancel' onclick="history.back()" class="btn btn-primary">
  </DIV>
	</form>
<br>
<br>
<br>
<br>
	
	<jsp:include page="/menu/bottom.jsp"></jsp:include>

</body>
</html>

