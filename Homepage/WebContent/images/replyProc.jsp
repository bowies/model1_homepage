<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="utility.*" %>
<jsp:useBean id="dao" class="image.ImgDAO"></jsp:useBean>
<jsp:useBean id="dto" class="image.ImgDTO"></jsp:useBean>

<% request.setCharacterEncoding("utf-8"); 
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
int grpno=Integer.parseInt(upload.getParameter("grpno"));
int indent=Integer.parseInt(upload.getParameter("indent"));
int ansnum=Integer.parseInt(upload.getParameter("ansnum"));

dto.setFilename(filename);
dto.setPassword(password);
dto.setMembername(membername);
dto.setTitle(title);
dto.setContent(content);
dto.setGrpno(grpno);
dto.setIndent(indent);
dto.setAnsnum(ansnum);


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reply Image</title>
<script type="text/javascript">
function listB(){
	var url="list.jsp";
	
	location.href=url;
}
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

		<DIV class="title" align="center">
			<h1>Reply Image</h1>
		</DIV>
 
	<DIV class="content" align="center">
	<h3>
		<%
dao.addAnsnum(dto.getGrpno(), dto.getAnsnum());
int cnt= dao.reply(dto);
if(cnt==1){
	out.print("Reply Image Success!");


%>
</h3>
		<DIV class='bottom'  align="center">
			<input type='button' value='List' onclick="listB()" class="btn btn-success">
		</DIV>
		<h3>
		<%
}else{
	out.print("Please Retry!");
	%>
	</h3>
	<br><br>

		<DIV class='bottom'  align="center">
			<input type='button' value='Redo' onclick="history.back();" class="btn btn-primary">
			<input type='button' value='List' onclick="listB()" class="btn btn-success">
		</DIV>
		<%} %>
	</div>


<br>
<br>
<br>
<br>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
