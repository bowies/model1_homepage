<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="image.*" %>
<jsp:useBean id="dao" class="image.ImgDAO"></jsp:useBean>
<%
String oldfile = request.getParameter("oldfile");
  int imagenum = Integer.parseInt(request.getParameter("imagenum"));
  ImgDTO dto = dao.read(imagenum);

String membername = (String)request.getSession().getAttribute("membername");
String mypassword = (String)request.getSession().getAttribute("mypassword");
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Update Image</title> 
<script type="text/javascript">
	function input(f) {
		if (f.wname.value == "") {
			alert("이름을 입력하세요");
			f.wname.focus();
			return false;
		}

		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}

		if (f.content.value == "") {
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
		if (f.filename.value == "") {
			alert("이미지를 올려주세요");
			f.filename.focus();
			return false;
		}
		var file = frm.filename.value;
		var fileExt = file.substring(file.lastIndexOf('.') + 1); //파일의 확장자를 구합니다.
		if(fileExt!=="jpg"&&"png"&&"gif"&&"jpeg"&&"bmp"){
			alert("JPG,JPEG,GIF,PNG,BMP파일로 올려주세요");
		 return false;
		}
		if (f.passwd.value == "") {
			alert("비밀번호를 입력하세요");
			f.passwd.focus();
			return false;
		}
		
		f.submit(); 
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


<FORM name='frm' method='POST' action='updateProc.jsp' enctype="multipart/form-data"
		  onsubmit="return input(this)">
<input type="hidden" name="imagenum" value="<%=imagenum%>">
<input type="hidden" name="oldfile" value="<%=oldfile%>">

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
		
  <DIV class='bottom' align="center">
  
    <input type='submit' value='Send' class="btn btn-success">
    <input type='button' value='Cancel' onclick="history.back()"  class="btn btn-primary">
     
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
