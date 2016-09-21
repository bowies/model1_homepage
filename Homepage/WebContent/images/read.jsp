<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, image.*, utility.*"%>
<jsp:useBean id="dao" class="image.ImgDAO" />
<%
	request.setCharacterEncoding("utf-8"); 
	int imagenum = Integer.parseInt(request.getParameter("imagenum"));
	
	List list = dao.imageRead(imagenum);
	ImgDTO dto = dao.read(imagenum);
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

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
<DIV class="title" align="center">
		<h1>Image Read</h1>
	</DIV>
	
	<DIV class = "content">
	<TABLE  style="margin: 0 auto; line-height: 3.3em;">
		<TR>
			<TH colspan="5" style="text-align: center; padding: 15px" ><img src="./storage/<%=dto.getFilename()%>" style="max-width: 500px; height: auto;"></TH>
		</TR>

		<TR>
			<%for(int i = 5; i < 7; i++){ %>
			<%if(list.get(i)!=null){ %>
			<TD style="padding: 5px;"><A href='./read.jsp?imagenum=<%=list.get(i-5)%>'><img src="./storage/<%=list.get(i)%>" width="200px" height ="200px" class="img-circle"></a></TD>
			<%}
			else{%>
			<TD style="padding: 5px;" ><img src="./storage/imgfornull.gif" width="200px" height ="200px" class="img-circle"></TD> 
			<%	}} %>
			
			<TD  style="border:15px solid #18BC9C; border-radius:50%;" ><img src="./storage/<%=dto.getFilename()%>" width="200px" height ="200px"   class="img-circle"></TD>
			
			<%for(int i = 8; i < 10; i++){ %>
			<%if(list.get(i)!=null){ %>
			<TD style="padding: 5px;"><A href='./read.jsp?imagenum=<%=list.get(i-5)%>'><img src="./storage/<%=list.get(i)%>" width="200px" height ="200px" class="img-circle"></a></TD>
			<%} else {%>			
			<TD style="padding: 5px;"><img src="./storage/imgfornull.gif" width="200px" height ="200px" class="img-circle"></TD>
			<% }}%>
			



		</TR>
	</TABLE>
	</DIV> <br>
  
  <DIV class='bottom' align="center">
		<input type='button' value='Back' onclick="history.back()"  class="btn btn-primary">
		<input type='button' value='List' onclick="location.href='list.jsp'"  class="btn btn-success">
		<br><br>
		<input type='button' value='Reply' onclick="location.href='replyForm.jsp?imagenum=<%=dto.getImagenum()%>'"  class="btn btn-success">
		<input type='button' value='Update' onclick="location.href='updateForm.jsp?imagenum=<%=dto.getImagenum()%>&oldfile=<%=dto.getFilename()%>'"  class="btn btn-success">
		<input type='button' value='Delete' onclick="location.href='deleteForm.jsp?imagenum=<%=dto.getImagenum()%>&oldfile=<%=dto.getFilename()%>'"  class="btn btn-success">
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