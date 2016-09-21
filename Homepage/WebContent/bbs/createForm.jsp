<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); 
String membername = (String)request.getSession().getAttribute("membername");
String mypassword = (String)request.getSession().getAttribute("mypassword");
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8">
<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
 </script> 
<title>Create Document!</title> 

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



<DIV class="title" align="center"><h1>Create</h1></DIV>
 

<FORM name='frm' method='POST' action='createProc.jsp'>
<DIV>
  <TABLE style="margin: 0 auto;line-height: 3.3em;"> 
    <TR>
        <TH style="text-align: right;">Name:　</TH>
      	<TD><input type = "text" name = "membername" value=<%=membername%> class="form-control" style="width: 30%;"></TD>
    </TR>
   
    <TR>
      <TH style="text-align: right;">Title:　</TH>
      <TD><input type = "text" name = "title" class="form-control" style="width: 30%;" ></TD>
    </TR>
    <TR>
      <TH></TH>
      <TD><textarea name = "content" class="form-control"></textarea></TD>
    </TR>
    <TR>
      <TH style="text-align: right;">Password:　</TH>
      <TD><input type = "password" name = "password" value=<%=mypassword%> class="form-control" style="width: 30%;" ></TD>
    </TR>
  </TABLE>
  </DIV>
  <br><br>
  <DIV class='bottom'  align="center">
    <input type='submit' value='Send'class="btn btn-success">&nbsp;
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