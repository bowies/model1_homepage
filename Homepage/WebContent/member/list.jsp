<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="member.*,java.util.*,utility.*"%>
<jsp:useBean id="dao" class="member.MemberDAO" />

<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
	String id = (String) session.getAttribute("id");
	//검색관련
	String col = Utility.nullCheck(request.getParameter("col"));
	String word = Utility.nullCheck(request.getParameter("word"));

	if (col.equals("total"))
		word = "";

	//paging 관련
	int nowPage = 1; //현재페이지
	int recordPerPage = 5; //한페이지당 보여줄 레코드 갯수
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}

	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	int total = dao.total(col, word);

	String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>



</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<% if (id==null){ %>
     <script>location.href ="<%=root%>/member/loginForm.jsp"; </script>
	<%} else if(id.equals("admin")) {%>
	
	

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<DIV class="title" align="center">
		<h1>Member List</h1>
	</DIV>

	<br>
	<DIV class="content" align="center">
		<input type='button' value='Register'
			onclick="location.href='./createForm.jsp'" class="btn btn-primary">

		<br> <br>

	</DIV>
	<div style="margin-left: 33%">
		<FORM method="POST" action="./list.jsp">
			<select name="col" class="form-control"
				style="width: 200px; float: left;">
				<option value="membername"
					<%if (col.equals("membername"))
				out.print("selected='selected'");%>>Name</option>
				<option value="email"
					<%if (col.equals("email"))
				out.print("selected='selected'");%>>Email</option>
				<option value="id"
					<%if (col.equals("id"))
				out.print("selected='selected'");%>>ID</option>
				<option value="total"
					<%if (col.equals("total"))
				out.print("selected='selected'");%>>Total</option>
			</select>&nbsp;&nbsp;<input type="text" name="word" value="<%=word%>"
				class="form-control" style="width: 200px; float: left;"> 
				<input 	type="submit" value="Search" class="btn btn-success" />
		</FORM>
	</div>
	<br>
	<br>

	<%
		List<MemberDTO> list = dao.list(map);

		for (int i = 0; i < list.size(); i++) {
			MemberDTO dto = list.get(i);
	%>
	<h5>
		<TABLE style="margin: 0 auto; line-height: 3.3em;">
			<TR>
				<TD rowspan="6" width="300px" align="center"><IMG
					src='./storage/<%=dto.getPicturename()%>'
					style="max-width: 200px; height: auto;"></TD>

			</TR>
			<TR>
				<TH style="text-align: right;">ID:　</TH>
				<TD width="200px"><A href='./read.jsp?id=<%=dto.getId()%>'><%=dto.getId()%></A></TD>
			</TR>
			<TR>
				<TH style="text-align: right;">Name:　</TH>
				<TD><%=dto.getMembername()%></TD>
			</TR>
			<TR>
				<TH style="text-align: right;">Phone:　</TH>
				<TD><%=dto.getPhone()%></TD>
			</TR>
			<TR>
				<TH style="text-align: right;">Email:　</TH>
				<TD><%=dto.getEmail()%></TD>
			</TR>
			<TR>
				<TH style="text-align: right;">Address:　</TH>
				<TD><%=dto.getAddress1()%> <%
 	if (dto.getAddress2() != null) {
 			out.print(dto.getAddress2());
 		}
 %></TD>
			</TR>

		</TABLE>
	</h5>
	<BR>
	<%
		}
	%>

	<DIV class="bottom">
		<%=paging%>
	</DIV>

	<br>
	<br>
	<br>
	<br>
<%} else if(id!=null){%>
     <script>location.href ="<%=root%>/member/loginForm.jsp"; </script>
<%} %>
	
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>

