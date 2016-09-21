<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Find Your Password</title> 


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
<DIV class="title" align="center"><h1>Find Your Password</h1></DIV>
 
  <br>
<FORM name='frm' method='POST' action='./pwFindProc.jsp'>
  <TABLE style="margin: 0 auto;line-height: 3.3em;">
    <TR>
      <TH>ID:　</TH>
      <TD><input name="id" type="text" class="form-control" placeholder="ID"></TD>
    </TR> 
     <TR>
      <TH>Name:　</TH>
      <TD><input name="membername"  class="form-control" placeholder="Name"></TD>
    </TR>
  </TABLE>
  
  <br>
   <DIV class='bottom' align="center">
   
    <input type='submit' value='Confirm' class="btn btn-success"> &nbsp;
    <input type='button' value='Back' onclick="history.back()" class="btn btn-primary">
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