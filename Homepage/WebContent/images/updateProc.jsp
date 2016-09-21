<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<% request.setCharacterEncoding("utf-8"); 


 %> 
 <jsp:useBean id="dao" class="image.ImgDAO"></jsp:useBean>
 <jsp:useBean id="dto" class="image.ImgDTO" />

 <%
 String upDir=application.getRealPath("./images/storage");
 String tempDir = application.getRealPath("./images/temp");
 //업로드 처리 모듈객체 생성
 UploadSave upload = new UploadSave(request,-1,-1,tempDir);   //생성자가 매개변수값이 있는 생성자는 usebean을 사용하지못함. 
 //모듈객체를 이용해서 보내는 파라메터값과 파일받음
 String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
 FileItem fileItem = upload.getFileItem("filename");
 int size = (int)fileItem.getSize();
 String filename = null;
 if(size>0){
		   if(oldfile!=null )
		       Utility.deleteFile(upDir,oldfile);
     filename = UploadSave.saveFile(fileItem, upDir);
 }
int imagenum=Integer.parseInt(upload.getParameter("imagenum"));
String password=upload.getParameter("password");
String membername=UploadSave.encode(upload.getParameter("membername"));
String title=UploadSave.encode(upload.getParameter("title"));
String content=UploadSave.encode(upload.getParameter("content"));

dto.setContent(content);
dto.setTitle(title);
dto.setMembername(membername);
dto.setFilename(filename);
dto.setPassword(password);
dto.setImagenum(imagenum);

 %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Update Image</title> 
<script type="text/javascript">
function read(){
	var url = "read.jsp";
	url += "?imagenum=<%=dto.getImagenum()%>";	
    location.href=url;	
}
function listB(){
	var url = "list.jsp";	
	
    location.href=url;	
}


</script>
 
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
<DIV class="title" align="center"><h1>Update Image</h1></DIV>
 

<DIV class="content" align="center">
<h3>
 <%
 	 int  cnt = dao.passwordCheck(imagenum, password);  //셋프로펄티로 dto에 저장되어있음
     if(cnt==1){
    	 dao.update(dto);
    	 out.print("Update Image!");
    	 %>
</h3>
    	  <br>
    	    <DIV class='bottom'  align="center">
    	      <input type='button' value='Read' onclick="read()"  class="btn btn-success">
    	      <input type='button' value='List' onclick="listB()"  class="btn btn-primary">
    	    </DIV>  	 
    
    <h3>
    <%
    }else{
      out.print("Please Retry!");
     %>
     </h3>
     
     <br>
      <DIV class='bottom'  align="center">
      <input type='button' value='List' onclick="listB()"  class="btn btn-success">
      <input type='button' value='Redo' onclick="history.back();"  class="btn btn-primary">       
     
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
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
