<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="image.ImgDAO" />
<%  
request.setCharacterEncoding("utf-8"); 
String imagenum=request.getParameter("imagenum");
String oldfile = request.getParameter("oldfile");

%>  
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Delete Image</title> 

</head> 
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
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
<DIV class="title" align="center"><h1>Delete Image</h1></DIV>
 <br>
<FORM name='frm' method='POST' action='./deleteProc.jsp'>
  <input type="hidden" name="imagenum" value="<%=imagenum%>">
   <input type="hidden" name="oldfile" value="<%=oldfile%>">
  
  <div class="content" align="center">
  <h5 style="float: left; margin-left: 38%;">
 	Insert Password:　
	</h5>	
	<input type ="password" name="password"  class="form-control" style="width: 150px; float: left;">
  
  </div>
  
  <br>
  <br>
  <br>
  <br>
  
  <DIV class='bottom' align="center">
  
    <input type='submit' value='Delete'  class="btn btn-success"> 
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
 