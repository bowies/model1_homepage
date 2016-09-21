<%@ page contentType="text/html; charset=UTF-8" %> 
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="rdao" class="bbs.ReplyDAO"/>
<%
	String col =  request.getParameter("col");
	String word = request.getParameter("word");
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	int nPage = Integer.parseInt(request.getParameter("nPage"));
	int bbsnum = Integer.parseInt(request.getParameter("bbsnum"));
	int rnum = Integer.parseInt(request.getParameter("rnum"));
	
	int total = rdao.total(bbsnum);// 댓글전체레코드값을 가져와서
	int totalPage = (int) (Math.ceil((double) total / 3)); // 전체 페이지

	if(rdao.delete(rnum)){
		if (nPage != 1 && nPage == totalPage && total % 3 == 1) {
			// 마지막페이지의 마지막레코드이면(3은 한페이지당보여줄 레코드 갯수)
			nPage = nPage - 1; // 현재의 페이지값에서 1을 빼자
		}
%>		
	<script>
		var url = "./read.jsp";
		url = url + "?bbsnum=<%=bbsnum%>";
		url = url + "&col=<%=col%>";
		url = url + "&word=<%=word%>";
		url = url + "&nowPage=<%=nowPage%>";
		url = url + "&nPage=<%=nPage%>";
		
		location.href = url;
	</script>
<h3>
<%	
	}else{
		out.print("Reply delete Fail!");//나중에 sendRedirect로 error페이지로 이동하게 만들기
	}
%>
</h3>