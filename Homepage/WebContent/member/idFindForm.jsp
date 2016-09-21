
<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Find Your ID</title> 


</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<!-- *********************************************** -->
 

<DIV class="title" align="center"><h1>Find Your ID</h1></DIV>
 <br>
<FORM name='frm' method='POST' action='./idFindProc.jsp'>
  <TABLE style="margin: 0 auto;line-height: 3.3em;">
    <TR>
      <TH>Name:　</TH>
      <TD><input name="membername" type="text"   class="form-control" placeholder="Name"></TD>
    </TR> 
     <TR>
      <TH>Email:　</TH>
      <TD><input name="email" type="text" class="form-control"  placeholder="Email"></TD>
    </TR>
  </TABLE>
  <br>
  
   <DIV class='bottom' align="center">
   
    <input type='submit' value='Confirm'  class="btn btn-success"> &nbsp;
    <input type='button' value='Back' onclick="history.back()"  class="btn btn-primary">
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