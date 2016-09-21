<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.* , bbs.*, utility.*"%>
<%
	request.setCharacterEncoding("utf-8");

%>
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="rdao" class="bbs.ReplyDAO"></jsp:useBean>
<%
	//페이징관련 변수 순언
	int nowPage = 1;//현재페이지- 시작페이지! 1!:>
	if(request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int recordPerPage = 5; //한 페이지당 보여줄 레코드 개수
	

	//이제 paging할거니까 sno랑 eno 계산할거임

	int sno = ((nowPage-1) * recordPerPage)+1; //오 -.-) 신기한것
	int eno = nowPage * recordPerPage;//이건 별로 안 신기함...
	//sno = 시작 남바
	//eno = 끝 남바
	
		
	
	

	
	//검색관련 변수 선언
	String col = Utility.nullCheck(request.getParameter("col"));
	String word = Utility.nullCheck(request.getParameter("word"));	
	
	if(col.equals("total")){
		word = "";
	}
	
	

	Map map = new HashMap();
	map.put("sno", sno);
	map.put("eno", eno);
	map.put("col", col);
	map.put("word", word);
	
	List<BbsDTO> list = dao.list(map);
	
	int total = dao.total(col, word); //totalRecord 때문에...-얘 파라미터를 보쌔여

	String root = request.getContextPath();
	String id = (String) session.getAttribute("id");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Default List!</title>

<script type="text/javascript">
	function read(bbsnum) {
		var url = "read.jsp";
		url += "?bbsnum=" + bbsnum;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		
		
		location.href = url;

	}
	
	
	
</script>

<style type="text/css">

	
	table tr th {
		 text-align: center;
	}
	table tr td {
		 text-align: center;
	}
</style>
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->
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
		<h1>Document List</h1>
	</DIV>


	<DIV class="search"  style="margin-left: 37%">
		<form method="post" action="./list.jsp">
			<select name="col" class="form-control"
				style="width: 100px; float: left;">

				<option value="membername"
				<%if(col.equals("membername"))%> selected
				>Name</option>
				<option value="title"
				<%if(col.equals("title"))%> selected
				>Title</option>
				<option value="content"
				<%if(col.equals("content"))%> selected
				>Contents</option>
				<option value="total"
				<%if(col.equals("total"))%> selected
				>Total</option>
				
			</select> 
			<input type="text" name="word" value="<%=word%>" class="form-control" style="width: 200px; float: left;"> 
			<input type="submit" value="Search" class="btn btn-success" >

		</form>
	</DIV>
	<br>
	<TABLE class='table'  style="margin: 0 auto; line-height: 3.3em; width: 50%" >
	
		<TR>
			<TH width="7%"><h5>Num</h5></TH>
			<TH width="30%"><h5>Title</h5></TH>
			<TH width="15%"><h5>Name</h5></TH>
			<TH width="7%"><h5>View</h5></TH>
			<TH width="20%"><h5>Date</h5></TH>
			<TH width="7%"><h5>Doc</h5></TH>
			<TH width="7%"><h5>Indent</h5></TH>
			<TH width="7%"><h5>Reply</h5></TH>
		</TR>
		
		<%
			if (list.size() == 0) {
		%>
		<TR>
			<TD colspan="8" align="center">There's No Documents!</TD>
		</TR>
		<%
			} else {
				for (int i = 0; i < list.size(); i++) {
					BbsDTO dto = list.get(i);
					int rcount = rdao.rcount(dto.getBbsnum());		
		%>
	
		<TR>
			<TD><%=dto.getBbsnum()%></TD>
			<TD style="text-align: left;">
				
				<%
				out.print("　　");
					for (int j = 0; j < dto.getIndent(); j++) {
								out.print("　");
							}
							if (dto.getIndent() > 0)//답변이있는경우
							{%>
							<img src = "./images/reply.gif">&nbsp;
							<%

							}
				%> <a href="javascript:read('<%=dto.getBbsnum()%>')"><%=dto.getTitle()%>
				<%if(rcount>0){%>
					<span style="color:black;">(<%=rcount %>)</span>
				<%} %>
				</a>
				<%
					if(Utility.compareDay(dto.getListdate().substring(0,10))){
					%>
						<img src = "./images/new.gif">
					
					<%}
				
				%>
				
			</TD>
			<TD><%=dto.getMembername()%></TD>
			<TD><%=dto.getViewcount()%></TD>
			<TD><%=dto.getListdate().substring(0, 10)%></TD>
			<TD><%=dto.getGrpno()%></TD>
			<TD><%=dto.getIndent()%></TD>
			<TD><%=dto.getAnsnum()%></TD>
		</TR>
		<%
			}
		}
		%>

	</TABLE>
	<br>

	<DIV class="bottom" align="center">
	<%=new Paging().paging3(total, nowPage, recordPerPage, col, word) %>
		<br> <br> <input type='button' value='Register'
			onclick="location.href='createForm.jsp'" class="btn btn-success">
	</DIV>
<br>
<br>
<br>
<br>
<%} %>
	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
