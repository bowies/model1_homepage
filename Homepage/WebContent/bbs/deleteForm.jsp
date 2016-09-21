<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
	request.setCharacterEncoding("UTF-8");

	int bbsnum = Integer.parseInt(request.getParameter("bbsnum"));

	String col =  request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Delete Page</title> 

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

<DIV class="title" align="center"><h1>Delete</h1></DIV>
 
 <br>
<FORM name='frm' method='POST' action='./deleteProc.jsp'>
<input type = "hidden" name="bbsnum" value="<%=bbsnum%>">
<input type = "hidden" name="col" value="<%=col%>">
<input type = "hidden" name="word" value="<%=word%>">
<input type = "hidden" name="nowPage" value="<%=nowPage%>">
  <TABLE style="margin: 0 auto;line-height: 3.3em;">
    <TR>
      <TH>Password:　</TH>
      <TD><input type = "password" name = "password" class="form-control"></TD>
    </TR>
  </TABLE>
 <br><br>
  <DIV class='bottom'  align="center">
    <input type='submit' value='Send'  class="btn btn-success">
    <input type='button' value='Cancel' onclick="history.back() "  class="btn btn-primary">
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