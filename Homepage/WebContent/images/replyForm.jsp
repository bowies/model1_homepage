<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ page import="image.*" %>
<jsp:useBean id="dao" class="image.ImgDAO"></jsp:useBean>

<%
int imagenum=Integer.parseInt(request.getParameter("imagenum"));


ImgDTO dto=dao.readReply(imagenum);
String membername = (String)request.getSession().getAttribute("membername");
String mypassword = (String)request.getSession().getAttribute("mypassword");
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Reply Image</title>
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
		<DIV class="title" align="center">
			<h1>Reply Image</h1>
		</DIV>
 
 <br>
<FORM name='frm' method='POST' action='./replyProc.jsp' enctype="multipart/form-data"
  onsubmit="return input(this)">
<input type="hidden"	name="imagenum"	value="<%=imagenum %>">
<input type="hidden"	name="grpno"	value="<%=dto.getGrpno() %>">
<input type="hidden"	name="indent"	value="<%=dto.getIndent() %>">
<input type="hidden"	name="ansnum"	value="<%=dto.getAnsnum() %>">

  <TABLE style="margin: 0 auto; line-height: 3.3em;">
       <TR>
      <TH style="text-align: right;">Image:　</TH>
      <td><label class="btn btn-success"> <input type='file'
						name='filename' style="display: none;">Input File
				</label></td>
    </TR>
    <TR>
      <TH style="text-align: right;">Reply:　</TH>
      <TD><input type="text" name="membername"  style="width: 30%;" class="form-control" ></TD>
    </TR>
 
    <TR>
      <TH style="text-align: right;">Title:　</TH>
      <TD><input type="text" name="title" size="50%" value="<%=dto.getTitle()%>" class="form-control" ></TD>
    </TR>
    
    <TR>
      <TH style="text-align: right;">Content:　</TH>
      <TD><textarea name="content" rows="10" cols="50" class="form-control" ></textarea></TD>
    </TR>
  
    <TR>
      <TH style="text-align: right;">Password:　</TH>
      <TD><input type="password" name="password"  class="form-control" ></TD>
    </TR>
    
  </TABLE>
  <br>
  <br>
  <DIV class='bottom' align="center">
    <input type='submit' value='Send' class="btn btn-success">
    <input type='button' value='Cancel' onclick="history.back()" class="btn btn-primary">
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
