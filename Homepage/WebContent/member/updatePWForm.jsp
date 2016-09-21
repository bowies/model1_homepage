<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); 
	String id = request.getParameter("id");


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password!</title>
<script>
function inputCheck(f){
	if(f.passwd.value==""){
		alert("Please insert password!");
		f.passwd.focus();
		return false; 
		//onclick으로 하면 리턴만 줘야하고
		//submit으로 하면 return false까지 줘야 한당 :D
	}
	
	if(f.repasswd.value==""){
		alert("Please insert password again!");
		f.repasswd.focus();
		return false;
	}
	
	if(f.passwd.value != f.repasswd.value){
		alert("비밀번호가 같지 않습니다.");
		f.passwd.value=""; //비밀번호가 안 같으면 원래 있던 값을 지워버림! :D
		f.repasswd.value= "";
		f.passwd.focus();
		return false;
	}
	
	
}
</script>


</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<DIV class="title" align="center"><h1>Change Password</h1></DIV>
<br>
	<FORM name='frm' 
	method='POST' 
	action='./updatePWProc.jsp'
	onsubmit = "return inputCheck(this)"
	>
	
		<input type="hidden" name="id" value='<%=id %>'>
		  <TABLE style="margin: 0 auto;line-height: 3.3em;">
			<TR>
				<TH>　　　Password:　</TH>
				<TD><input type ="password" name = "password"   class="form-control" placeholder="password"></TD>
				
				<TD>　Please insert Password.</TD>		
			</TR>
			
			<TR>
				<TH>Password Check:　</TH>
				<TD><input type ="password" name = "repassword" class="form-control" placeholder="password"></TD>
				
				<TD>　Please insert Password again.</TD>		
			</TR>
			
			
			
		</TABLE>
<br>
		<DIV class='bottom' align="center">
			<input type='submit' value='Password Change' class="btn btn-success"> 
		</DIV>
	</FORM>

<br>
<br>
<br>
<br>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
