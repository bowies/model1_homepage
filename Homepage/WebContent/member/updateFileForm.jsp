<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); 

String id = request.getParameter("id");
String oldfile = request.getParameter("oldfile");




%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Update File Page</title> 


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
<DIV class="title" align="center"><h1>Change Picture!</h1></DIV>
<br>
 
<FORM name='frm' method='POST' action='./updateFileProc.jsp' enctype = "multipart/form-data">
<input type = "hidden" name = "id" value ="<%=id%>">
<input type = "hidden" name = "oldfile" value ="<%=oldfile%>">

  <TABLE style="margin: 0 auto;line-height: 3.9em;" >
  
    <TR>
      <TH style="text-align: right;">Original:　</TH>
      <TD>
      <img src = "./storage/<%=oldfile%>" style="max-width: 400px; height: auto;"> 
     
      </TD>
    </TR>
    
    <TR>
      <TH style="text-align: right;">Change:　</TH>
      <TD>
        <label class="btn btn-success">
       <input type='file' name='picturename'  style="display: none;">Input File
       </label>
      </TD>
    </TR>
    
  </TABLE>
  
<br>
  <DIV class='bottom' align="center">
    <input type='submit' value='Change'  class="btn btn-success">
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