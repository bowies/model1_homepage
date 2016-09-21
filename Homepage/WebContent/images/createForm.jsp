<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String membername = (String)request.getSession().getAttribute("membername");
String mypassword = (String)request.getSession().getAttribute("mypassword");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function input(f) {
		if (f.wname.value == "") {
			alert("Please insert your Name.");
			f.wname.focus();
			return false;
		}

		if (f.title.value == "") {
			alert("Please insert title.");
			f.title.focus();
			return false;
		}

		if (f.content.value == "") {
			alert("Please insert contents.");
			f.content.focus();
			return false;
		}
		if (f.filename.value == "") {
			alert("Please insert image.");
			f.filename.focus();
			return false;
		}
		var file = frm.filename.value;
		var fileExt = file.substring(file.lastIndexOf('.') + 1); //파일의 확장자를 구합니다.
		switch(fileExt){
		case'jpg':
			break;
		case'jpeg':

			break;
		case'gif':

			break;
		case'png':

			break;
			
		case'bmp':
			break;	
		default:
				alert("file types are JPG,JPEG,GIF,PNG,BMP only!");
				return false;
		
		}
			
		
		if (f.passwd.value == "") {
			alert("Please insert password.");
			f.passwd.focus();
			return false;
		}
		
		f.submit(); 
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Image</title>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<form name="frm" action="createProc.jsp" method="post"
		enctype="multipart/form-data" onsubmit="return input(this)">
		<DIV class="title" align="center">
			<h1>Create</h1>
		</DIV>
		<br>
		<TABLE style="margin: 0 auto; line-height: 3.3em;">
			<tr>
				<th style="text-align: right;">Image:　</th>

				<td><label class="btn btn-success"> <input type='file'
						name='filename' style="display: none;">Input File
				</label></td>

			</tr>
			<tr>
				<th style="text-align: right;">Name:　</th>
				<td><input type="text" name="membername"
					value=<%=membername%> class="form-control" style="width: 30%;"></td>
			</tr>
		

			<tr>
				<th style="text-align: right;">Title:　</th>
				<td><input type="text" maxlength="16" name="title" size="50%"
					class="form-control"></td>
			</tr>
			<tr>
				<th style="text-align: right;">Content:　</th>
				<td><textarea rows="10" cols="50" name="content"
						class="form-control"></textarea></td>
			</tr>

			<TR>
				<TH style="text-align: right;">Password:　</TH>
				<TD><input type="password" name="password" class="form-control"></TD>
			</TR>
		</table>

		<br>
		<br>
		<div class="bottom" align="center">
			<input type="submit" value="Create" class="btn btn-success">&nbsp;<input
				type="button" value="List" onclick="location.href='list.jsp'"
				class="btn btn-primary">
		</div>


	</form>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>