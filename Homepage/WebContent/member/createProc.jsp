<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="utility.*"%>
<%@ page import="org.apache.*"%>
<jsp:useBean id="dao" class="member.MemberDAO" />
<jsp:useBean id="dto" class="member.MemberDTO" />
<%
	request.setCharacterEncoding("utf-8");

	//업로드 폴더와 임시폴더 설정
	String upDir = application.getRealPath("/member/storage");
	String tempDir = application.getRealPath("/member/temp");
	//업로드 처리 모듈객체 생성
	
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	//모듈객체를 이용해서 보내는 파라메터값과 파일받음
	
	FileItem fileItem = upload.getFileItem("picturename");
	int size = (int) fileItem.getSize();
	String picturename = null;
	if (size > 0) {
		picturename = UploadSave.saveFile(fileItem, upDir);
	} else {
		picturename = "member.jpg";
	}

	String id = upload.getParameter("id");
	String password = upload.getParameter("password");
	String phone = upload.getParameter("phone");
	String email = upload.getParameter("email");
	String zipcode = upload.getParameter("zipcode");
	String job = upload.getParameter("job");
	//한글인코딩 추가
	String membername = UploadSave.encode(upload.getParameter("membername"));
	String address1 = UploadSave.encode(upload.getParameter("address1"));
	String address2 = UploadSave.encode(upload.getParameter("address2"));

	//받은 파라메터와 파일을 DTO 객체 담고DAO의 
	//create()로 디비저장

	dto.setId(id);
	dto.setPassword(password);
	dto.setPhone(phone);
	dto.setEmail(email);
	dto.setZipcode(zipcode);
	dto.setJob(job);
	dto.setMembername(membername);
	dto.setAddress1(address1);
	dto.setAddress2(address2);
	dto.setPicturename(picturename);

	int cnt = dao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join us!</title>

</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<jsp:include page="/menu/top.jsp" /><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<!-- *********************************************** -->

<DIV class="title" align="center"><h1>Join my Web Site</h1></DIV>

		

	<DIV class="content" align="center">
	<h3>
		<%
			if (cnt == 1) {
				out.print("Register Success!");

			} else {
				out.print("Register Failed!");

			}
		%>
		</h3>
		<br>
	</DIV>
	<%
		if (cnt == 1) {
	%>
	<DIV class='bottom' align="center">
		<input type='button' value='Login'
			onclick="location.href='loginForm.jsp'" class="btn btn-success"> <input type='button'
			value='Home' onclick="location.href='../index.jsp'" class="btn btn-success">
	</DIV>
	<%
		} else {
	%>
	<DIV class='bottom' align="center">
		<input type='button' value='Retry' onclick="history.back()" class="btn btn-success"> <input
			type='button' value='Home' onclick="location.href='../index.jsp'" class="btn btn-success">
	</DIV>
	<%
		}
	%>
	<!-- *********************************************** -->
<br>
<br>
<br>
<br>
	<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html>
