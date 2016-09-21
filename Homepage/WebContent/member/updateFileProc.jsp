<%@page import="utility.*"%>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
String upDir = application.getRealPath("/member/storage");
String tempDir = application.getRealPath("/member/temp");

	
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	
	String id = upload.getParameter("id");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	
	FileItem fileItem = upload.getFileItem("picturename");
	//-_-?fileItem을 참조함.... - 이유 : 크기 그거하려고	
	int size = (int)fileItem.getSize();
	
	String picturename = "member.jpg";
	
	if(size>0){
		if(oldfile!=null && !oldfile.equals("member.jpg")){ //ㅋㅋㅋㅋㅋㅋ not 조심하기
			Utility.deleteFile(upDir, oldfile);
		}
		picturename = UploadSave.saveFile(fileItem, upDir);
		
	}
	
	int cnt = dao.updateFile(id, picturename);
	
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Update File Page</title> 


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
<DIV class="title" align="center"><h1>Change Picture!</h1></DIV>
<br>
 
<DIV class="content" align="center">
<h3>
<%
if(cnt==1){
   out.print("Change Picture!");
}else{
   out.print("Please try again!");
}
 
%>
</h3>
</DIV>
<br>

<% if(cnt==1){ %>
<DIV class='bottom' align="center">
  <input type='button' value='My Info' onclick="location.href='read.jsp?id=<%=id%>'" class="btn btn-success">
</DIV>
<%}else{ %>
 <DIV class='bottom'>
  <input type='button' value='Retry' onclick="history.back()" class="btn btn-primary">
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