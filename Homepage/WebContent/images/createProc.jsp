<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<jsp:useBean id="dao" class="image.ImgDAO" />
<jsp:useBean id="dto" class="image.ImgDTO" />
<% 
request.setCharacterEncoding("utf-8"); 

    //업로드 폴더와 임시폴더 설정
    String upDir=application.getRealPath("./images/storage");
    String tempDir = application.getRealPath("./images/temp");
    //업로드 처리 모듈객체 생성
    UploadSave upload = new UploadSave(request,-1,-1,tempDir);   //생성자가 매개변수값이 있는 생성자는 usebean을 사용하지못함. 
    //모듈객체를 이용해서 보내는 파라메터값과 파일받음
    FileItem fileItem = upload.getFileItem("filename");
    int size = (int)fileItem.getSize();
    String filename = null;
    if(size>0){
        filename = UploadSave.saveFile(fileItem, upDir);
    }
    String password=upload.getParameter("password");
    String membername=UploadSave.encode(upload.getParameter("membername"));
    String title=UploadSave.encode(upload.getParameter("title"));
    String content=UploadSave.encode(upload.getParameter("content"));
 
    dto.setFilename(filename);
    dto.setPassword(password);
    dto.setMembername(membername);
    dto.setTitle(title);
    dto.setContent(content);
    
    int cnt = dao.create(dto);   
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Create Image</title> 

</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" />
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
if(cnt==1){
	out.print("Register Success!");

} else {
	out.print("Register Failed!");

}
%>
</h3>
</DIV>
<% if(cnt==1){ %>
<DIV class='bottom' align="center">
  <input type='button' value='Create' onclick="location.href='createForm.jsp'"  class="btn btn-success">
  <input type='button' value='List' onclick="location.href='./list.jsp'"  class="btn btn-primary">
</DIV>
<%}else{ %>
 <DIV class='bottom' align="center">
  <input type='button' value='Redo' onclick="history.back()"  class="btn btn-success">
  <input type='button' value='Main' onclick="location.href='../index.jsp'"  class="btn btn-primary">
</DIV>
<%} %>
<br>
<br>
<br>
<br>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html> 