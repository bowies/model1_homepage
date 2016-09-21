<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
	%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
  
<title>Welcome!</title>

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
<DIV class="title" align="center"><h1>Login</h1></DIV>
<FORM name='frm' method='POST' action='./loginProc.jsp'>

  <br>
  <TABLE style="text-align: center; margin: auto;">
    <TR>
      <TH>　　　 ID:　</TH>
      <TD><input type ="text" name = "id" autofocus  class="form-control" placeholder="ID"></TD>
  
    </TR>
  
    
    <TR>
  	
      <TH>Password:　</TH>
      <TD><input type = "password" name = "password"class="form-control"   placeholder="Password"></TD>
    </TR>

  </TABLE>
  <br>
  <DIV class='bottom' align="center">
    <input type='submit' value='Sign in' class="btn btn-success">
  <br>
  <br>
    <input type='button' value='Register' onclick="location.href='agreement.jsp'" class="btn btn-success"> &nbsp;
    <input type='button' value='Find ID' onclick="location.href='idFindForm.jsp'" class="btn btn-primary"> &nbsp;
    <input type='button' value='Find PW' onclick="location.href='pwFindForm.jsp'" class="btn btn-primary"> &nbsp;
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