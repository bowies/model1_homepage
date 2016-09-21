<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import = "utility.*" %>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<% request.setCharacterEncoding("utf-8"); 
	
	String upDir = application.getRealPath("/member/storage");
	
	String id = request.getParameter("id");
	String oldfile = request.getParameter("oldfile");
	
	int cnt = dao.delete(id);

%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Unsubscribe Page</title>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<!-- *********************************************** -->
 
<DIV class="title" align="center"><h1>Unsubscribe Page!</h1></DIV>
 
<DIV class ="content" align="center">
<h3>
<%
	if(cnt==1){
		out.print("Thank you and come again!");
		session.invalidate();
		if(oldfile != null && !oldfile.equals("member.jpg")){
			Utility.deleteFile(upDir, oldfile);
		}
	}
	else{
		out.print("Please Retry or Don't leave me!");
	}
		
%>
</h3>

</DIV>
<br>

  <DIV class='bottom' align="center">
  <%if(cnt==1){ %>
    <input type='button' value='Main Page' onclick="location.href='../index.jsp'"  class="btn btn-success">

  <%}else{%>
  
  
    <input type='button' value='Retry' onclick="history.back()"  class="btn btn-success">
   
  <%} %>
 </DIV>
 
 
<br>
<br>
<br>
<br>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 