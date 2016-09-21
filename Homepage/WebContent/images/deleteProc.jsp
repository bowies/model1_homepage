<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="utility.*" %>
 
<jsp:useBean id="dao" class="image.ImgDAO" />
<%  //삭제위해 실경로설정
String upDir=application.getRealPath("/member/storage");
 
request.setCharacterEncoding("utf-8"); 
int imagenum = Integer.parseInt(request.getParameter("imagenum"));
String password = request.getParameter("password");
String oldfile = request.getParameter("oldfile");
 
int cnt =dao.passwordCheck(imagenum, password);
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Delete Image</title> 
<script type="text/javascript">
function listB(){
	var url="list.jsp";
	
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<DIV class="title" align="center"><h1>Delete Image</h1></DIV>
 <br>
<div class="content" align="center">
<h5>
<%
  if(cnt==1){
    	dao.delete(imagenum);
    	out.print("Delete Image Success!");
 
}else{
    out.print("Delete Image Fail!");
}
 
%>
</h5>
</div>
<%if(cnt==1){%> 
<DIV class='bottom' align="center">
  <input type='button' value='Main' onclick="location.href='../index.jsp'" class="btn btn-success">
  <input type='button' value='List' onclick="listB()" class="btn btn-primary">
</DIV>
<%}else{ %>
<DIV class='bottom' align="center">
  <input type='button' value='Redo' onclick="history.back()" class="btn btn-success">
</DIV>
<%} %> 
 
<br>
<br>
<br>
<br>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 