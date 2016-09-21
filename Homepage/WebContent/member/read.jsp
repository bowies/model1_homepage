<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="member.*,utility.*"%>
<jsp:useBean id="dao" class="member.MemberDAO" />
<% 
    //관리자 회원목록에서 이름을 클릭하고 올때
String id = request.getParameter("id");
 
    //일반사용자가 로그인후 나의정보를 클릭하고 올때
    if(id==null){
        id = (String)session.getAttribute("id");
    }
    
    MemberDTO dto = dao.read(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=id%>'s Information!</title>


<script type="text/javascript">
function deleteM(id,oldfile){
if(confirm("Are you sure?<br>Please think about it!")){
var url = "deleteForm.jsp";
url = url +"?id="+id;
url = url +"&oldfile="+oldfile;
 
location.href=url;
 
}
 
}
function updateFile(id,oldfile){
var url ="updateFileForm.jsp"
url = url + "?id="+id;
url = url + "&oldfile="+oldfile;
 
location.href=url;
}
</script>
</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
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


	<DIV class="title" align="center">
		<h1><%=dto.getMembername() %>'s Information!
		</h1>
	</DIV>

<br>
	<DIV style="text-align: center;">
		<img src="./storage/<%=dto.getPicturename()%>" style="max-width: 400px; height: auto;"><!-- ★ -->
	</DIV>
	
	<br>
	<TABLE style="margin: 0 auto; line-height: 3.3em;">
		<TR>
			<TH style="text-align: right;">ID:　</TH>
			<TD><%=dto.getId() %></TD>
		</TR>
		<tr>
			<th style="text-align: right;">Name:　</th>
			<td><%=dto.getMembername() %></td>
		</tr>
		<tr>
			<th style="text-align: right;">Phone:　</th>
			<td><%=dto.getPhone() %></td>
		</tr>
		<tr>
			<th style="text-align: right;">Email:　</th>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<th style="text-align: right;">Zip Code:　</th>
			<td><%=dto.getZipcode() %></td>
		</tr>
		<tr>
			<th style="text-align: right;">Address:　</th>
			<td><%=dto.getAddress1() %> <br> <%=Utility.nullCheck(dto.getAddress2()) %>
			</td>
		</tr>
		<tr>
			<th style="text-align: right;">Job:　</th>
			<td>Job Code:　<%=dto.getJob() %> (<%=Utility.getCodeValue(dto.getJob() )%>)
			</td>
		</tr>
		<tr>
			<th style="text-align: right;">Join Date:　</th>
			<td><%=dto.getJoindate()%></td>
		</tr>
	</TABLE>
	<br>

	<DIV class='bottom' align="center">
		<h4>Change Zone!</h4>
		<br> <input type='button' value='Info'
			onclick="location.href='updateForm.jsp?id=<%=dto.getId()%>'"  class="btn btn-success">
		<input type='button' value='Picure'
			onclick="updateFile('<%=dto.getId()%>','<%=dto.getPicturename()%>')"  class="btn btn-success">
		<input type='button' value="Password"
			onclick="location.href='updatePWForm.jsp?id=<%=dto.getId()%>'"  class="btn btn-success">
		<input type='button' value='Unsubscribe'
			onclick="deleteM('<%=dto.getId()%>','<%=dto.getPicturename()%>')"  class="btn btn-primary">

	</DIV>


	<br>
	<br>
	<br>
	<br>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
