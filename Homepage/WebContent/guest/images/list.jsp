<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, utility.*, guest.*"%>
<jsp:useBean id="dao" class="guest.GuestDAO"></jsp:useBean>


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
	
	
	
	List<GuestDTO> list = dao.list(map);
	

	int total = dao.total(col, word);


%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="../css/style.css" rel = "stylesheet">
 
<script type="text/javascript">
	function read(guestnum){
		var url = "./read.jsp";
		url += "?guestnum="+guestnum;
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

	<DIV class = 'title'>
		메모 목록</DIV>
	<DIV class = "search">
		<form method="post" action="list.jsp">
			<select	name= "col">
				<option value="title"
				<%if(col.equals("title")) %> selected
				>제목</option>
			
				<option value="guestdate"
				<%if(col.equals("guestdate")) %> selected
				>날짜</option>
				
				<option value="total"
				<%if(col.equals("total")) %> selected
				>전체</option>
			
			</select>
		
			<input type="text" name= "word" value = "<%=word%>">
			<input type="submit" value="검색">
		
		</form>
		
	</DIV>

	<Table>
		<TR>
			<TH>번호</TH>
			<TH>제목</TH>
			<TH>날짜</TH>
			<TH>조회수</TH>
		</TR>

		<%
			if (list.size()==0) {
		%>
		<TR>
			<TD colspan='4'>등록된 메모가 없습니다.</TD>
		</TR>
		<%
			} // end if
			else {
				for(int i = 0; i<list.size(); i++){
					GuestDTO vo = list.get(i);
					//list 안에서 rs.next로 GuestDTO 에다가 저장해줬었음 (희미한 기억)
		%>
		<TR>
			
			<TD><%=vo.getGuestnum()%></TD>
			<TD><a href = "javascript:read('<%=vo.getGuestnum()%>')"><%=vo.getTitle() %></a>
			<%
				if(Utility.compareDay(vo.getGuestdate()))	{
			%>
				<img src="./images/new.gif">				
			<% }%>
			</TD>
			<TD><%=vo.getGuestdate()%></TD>
			<TD><%=vo.getViewcount()%></TD>

		</TR>

		<%
			} //end for
				
			} //end else
		%>
	</Table>

	<DIV class = 'bottom'>
		<input type="button" value='등록' onclick="created()">
	<%= new Paging().paging3(total, nowPage, recordPerPage, col, word) %>
	</DIV>

	<jsp:include page = "/menu/bottom.jsp"/>


</body>
</html>
