<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file ="./ssi.jsp" %>
<%@ page import="java.util.*, utility.*"%>
<jsp:useBean id="dao" class="memo.MemoDAO"></jsp:useBean>


<% request.setCharacterEncoding("UTF-8");
	
	int nowPage = 1;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int recordPerPage = 5;

	int sno = ((nowPage-1)*recordPerPage )+1;
	int eno = nowPage * recordPerPage;
	
	String col = Utility.nullCheck(request.getParameter("col"));
	String word = Utility.nullCheck(request.getParameter("word"));

	if(col.equals("total")) word = "";

	Map map =new HashMap();
	map.put("sno", sno);
	map.put("eno", eno);
	
	map.put("col", col);
	map.put("word", word);
	
	
	
	List<MemoDTO> list = dao.list(map);
	

	int total = dao.total(col, word);

	String root = request.getContextPath();
	String id = (String) session.getAttribute("id");

%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Memo List</title>

<link href="../css/style.css" rel = "stylesheet">
 
<script type="text/javascript">
	function read(memonum){
		var url = "./read.jsp";
		url += "?memonum="+memonum;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		
		location.href = url; //자바스크립트에서 -get 방식- 링크 보내기
		
	}
	
	function created(){
		var url = "./createForm.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		
		location.href = url; //자바스크립트에서 -get 방식- 링크 보내기
		
	}
</script>

</head>
<body>
<jsp:include page = "/menu/top.jsp" />
		<% if (id==null){ %>
     <script>location.href ="<%=root%>/member/loginForm.jsp"; </script>
	<%} else{%>
 <br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


	<DIV class="title" align="center">
		<h1>Memo List</h1>
	</DIV>

		
	
	<br>
	<DIV class="search"  style="margin-left: 37%">
		<form method="post" action="./list.jsp">
			<select name="col" class="form-control"
				style="width: 100px; float: left;">
				<option value="title"
				<%if(col.equals("title")) %> selected
				>Title</option>
				<option value="memodate"
				<%if(col.equals("memodate")) %> selected
				>Date</option>
				
				<option value="total"
				<%if(col.equals("total")) %> selected
				>Total</option>
			
				
				
			</select> 
			<input type="text" name="word" value="<%=word%>" class="form-control" style="width: 200px; float: left;"> 
			<input type="submit" value="Search" class="btn btn-success" >

		</form>
	</DIV>
	<br>
	
	<TABLE class='table'  style="margin: 0 auto; line-height: 3.3em; width: 40%" >
	
		<TR>
		
			<TH><h5>Num</h5></TH>
			<TH><h5>Title</h5></TH>
			<TH><h5>Date</h5></TH>
			<TH><h5>View</h5></TH>
			
		</TR>


		<%
			if (list.size()==0) {
		%>
		<TR>
			<TD colspan='4'>Please create Memo!</TD>
		</TR>
		<%
			} // end if
			else {
				for(int i = 0; i<list.size(); i++){
					MemoDTO vo = list.get(i);
					//list 안에서 rs.next로 MemoDTO 에다가 저장해줬었음 (희미한 기억)
		%>
		<TR>
			
			<TD><%=vo.getMemonum()%></TD>
			<TD><a href = "javascript:read('<%=vo.getMemonum()%>')"><%=vo.getTitle() %></a>
			<%
				if(Utility.compareDay(vo.getMemodate()))	{
			%>
				<img src="./images/new.gif">				
			<% }%>
			</TD>
			<TD><%=vo.getMemodate()%></TD>
			<TD><%=vo.getViewcount()%></TD>

		</TR>

		<%
			} //end for
				
			} //end else
		%>
	</Table>
	<DIV class = 'bottom' align="center">
	<br>
	<%= new Paging().paging3(total, nowPage, recordPerPage, col, word) %>
<br>
		<input type="button" value='Create' onclick="created()"  class="btn btn-success">
	</DIV>
<br>
<br>
<br>
<br>
<%} %>
	<jsp:include page = "/menu/bottom.jsp"/>


</body>
</html>
