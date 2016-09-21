<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty name = "dto" property="*"></jsp:setProperty>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Create Document!</title> 


</head> 
<!-- *********************************************** -->
<body>
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


<DIV class="title" align="center"><h1>Create</h1></DIV>

	<DIV class="content" align="center">
		<h3>
<%
	int cnt =dao.create(dto); 

	if(cnt>0){
		out.print("Success!");
	}
	else{
		out.print("Fail!");
	}
%>
</h3>
</DIV>
 
 <br>
<FORM name='frm' method='POST' action='./.do'>

  
	<DIV class='bottom' align="center">
    <input type='button' value='List' onclick="location.href='list.jsp'"  class="btn btn-success">
    <input type='button' value='Recreate' onclick="location.href='createForm.jsp'" class="btn btn-primary" >
  </DIV>
</FORM>
<br>
<br>
<br>
<br>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 