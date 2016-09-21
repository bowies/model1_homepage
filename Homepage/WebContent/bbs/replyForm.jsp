<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="bbs.*"%>
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>

<%
	int bbsnum = Integer.parseInt(request.getParameter("bbsnum"));

	String col =  request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	BbsDTO dto = dao.readReply(bbsnum);

String membername = (String)request.getSession().getAttribute("membername");
String mypassword = (String)request.getSession().getAttribute("mypassword");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reply Page</title>

<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
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
	<FORM name='frm' method='POST' action='replyProc.jsp'>
		<input type='hidden' name='bbsnum'value='<%=bbsnum%>'> 
		<input	type='hidden' name='grpno' value='<%=dto.getGrpno()%>'> 
		<input type='hidden' name='indent' value='<%=dto.getIndent()%>'> 
		<input	type='hidden' name='ansnum' value='<%=dto.getAnsnum()%>'>
		<input type = "hidden" name="col" value="<%=col%>">
		<input type = "hidden" name="word" value="<%=word%>">
		<input type = "hidden" name="nowPage" value="<%=nowPage%>">
		
	 <TABLE style="margin: 0 auto;line-height: 3.3em;"> 
			<TR>
				  <TH style="text-align: right;">Name:　</TH>
				   	<TD><input type = "text" name = "membername" value=<%=membername%> class="form-control" style="width: 30%;"></TD>
			</TR>
			<TR>
   				   <TH style="text-align: right;">Title:　</TH>
   				    <TD><input type = "text"  value='<%=dto.getTitle()%>' name = "title" class="form-control" style="width: 30%;" ></TD>
			
			</TR>
			<TR>
				<TH></TH>
      			<TD><textarea name = "content" class="form-control"></textarea></TD>
			</TR>
			<TR>
      <TH style="text-align: right;">Password:　</TH>
			<TD><input type = "password" name = "password" value=<%=mypassword%> class="form-control" style="width: 30%;" ></TD>
   	</TR>

		</TABLE>
		<br><br>
		<DIV class='bottom'  align="center">
    <input type='submit' value='Send'class="btn btn-success">&nbsp;
    <input type='button' value='Cancel' onclick="history.back()" class="btn btn-primary">
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
